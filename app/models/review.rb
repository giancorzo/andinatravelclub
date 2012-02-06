class Review < ActiveRecord::Base
  belongs_to :tour
  
  has_attached_file :avatar,
                    :styles => { :thumb => Andina::Application.config.paperclip_config['90x90'] },  
                    :default_url => Andina::Application.config.paperclip_config['missing_avatar'],
                    :url => "/system/:class/:id/:style/:basename.:extension",
                    :path => Andina::Application.config.paperclip_config['server_path'] + "/:class/:id/:style/:basename.:extension"
                  
  def home=(home)
    self[:home] = home == "yes" ? true : false
  end  
end
