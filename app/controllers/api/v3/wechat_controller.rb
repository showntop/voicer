module Api
  module V3
    class WechatController < Api::V3::ApplicationController

      def login
        code = params[:code]
        APP_ID = 'wx911e0fbcba0b24d0'
        APP_SEC = 'a43da892b2a7907e60c90654c3bc9c0b'

        "https://api.weixin.qq.com/sns/jscode2session?appid=APPID&secret=SECRET&js_code=JSCODE&grant_type=authorization_code"


      end
    end
  end
end
