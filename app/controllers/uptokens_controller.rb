class UptokensController < ApplicationController

  def get
    # 浮动窗口上传
    # require 'qiniu'
    # 构建鉴权对象
    Qiniu.establish_connection! access_key: Setting.upload_access_id,
                                secret_key: Setting.upload_access_secret
    # 要上传的空间
    bucket = Setting.upload_bucket
    # 上传到七牛后保存的文件名
    # key = 'my-ruby-logo.png'
    # 构建上传策略，上传策略的更多参数请参照 http://developer.qiniu.com/article/developer/security/put-policy.html
    put_policy = Qiniu::Auth::PutPolicy.new(
        bucket, # 存储空间
        nil,    # 指定上传的资源名，如果传入 nil，就表示不指定资源名，将使用默认的资源名
        3600    # token 过期时间，默认为 3600 秒，即 1 小时
    )
    # 生成上传 Token
    uptoken = Qiniu::Auth.generate_uptoken(put_policy)

    render json: { ok: true, token: uptoken, domain: Setting.bucket_domain }
  end
end
