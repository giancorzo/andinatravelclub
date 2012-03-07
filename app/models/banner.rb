class Banner < ActiveRecord::Base

  has_attached_file :image,
                    :styles => { :media => Andina::Application.config.paperclip_config['572x300'],
                                 :thumb => Andina::Application.config.paperclip_config['150x100']},
                    :url => "/system/:class/:id/:style/:basename.:extension",
                    :path => Andina::Application.config.paperclip_config['server_path'] + "/:class/:id/:style/:basename.:extension"
                  
  belongs_to :tour
  
end
