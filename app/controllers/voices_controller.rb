class VoicesController < ApplicationController
  load_and_authorize_resource

  def create
    # 浮动窗口上传
    @voice = Voice.new
    @voice.image = params[:file]
    if @voice.image.blank?
      render json: { ok: false }, status: 400
      return
    end

    @voice.user_id = current_user.id
    if @voice.save
      render json: { ok: true, url: @voice.image.url }
    else
      render json: { ok: false }
    end
  end
end
