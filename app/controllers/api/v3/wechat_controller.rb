module Api
  module V3
    class WechatController < Api::V3::ApplicationController
      APP_ID = 'wx911e0fbcba0b24d0'
      APP_SEC = 'a43da892b2a7907e60c90654c3bc9c0b'

      def login_signup
        code = params[:code]
        
        url = "https://api.weixin.qq.com/sns/jscode2session?appid=#{APP_ID}&secret=#{APP_SEC}&js_code=#{params[:jsCode]}&grant_type=authorization_code"

        ret = JSON.parse(RestClient.get url)
        logger.info(ret)
        # logger.info(ret["openid"])

        session_key = Base64.decode64(ret["session_key"])
        iv = Base64.decode64(params[:iv])

        encryptedData = Base64.decode64(params[:encryptedData])

        cipher = OpenSSL::Cipher::AES.new(128, :CBC)
        logger.info ret["session_key"]
        logger.info session_key
        cipher.key = session_key
        cipher.iv = iv

        cipher.decrypt
        plain_text = ""
        plain_text << cipher.update(encryptedData)
        plain_text << cipher.final

        logger.info(plain_text)
      end
    end
  end
end
