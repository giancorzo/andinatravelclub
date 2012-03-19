class Medium < ActiveRecord::Base
  
  has_attached_file :content,
                    :url => "/system/:class/:id/:style/:basename.:extension",
                    :path => Andina::Application.config.paperclip_config['server_path'] + "/:class/:id/:style/:basename.:extension"
  
end
