class BaseUploader < CarrierWave::Uploader::Base
   def store_dir
    dir = model.class.to_s.underscore
    if Setting.upload_provider == "file"
      dir = "uploads/#{dir}"
    end
    dir
  end
end
