class Tour < ActiveRecord::Base
  
  has_many :reviews, :dependent => :destroy
  has_many :images, :dependent => :destroy
  accepts_nested_attributes_for :reviews, :allow_destroy => :true
  accepts_nested_attributes_for :images, :allow_destroy => :true
  
  has_attached_file :image,
                    :styles => { :large => Andina::Application.config.paperclip_config['1170x320'],
                                 :thumb => Andina::Application.config.paperclip_config['260x180']},
                    :url => "/system/:class/:id/:style/:basename.:extension",
                    :path => Andina::Application.config.paperclip_config['server_path'] + "/:class/:id/:style/:basename.:extension"                    
end
