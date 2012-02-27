class Tour < ActiveRecord::Base
  
  belongs_to :interest
  
  has_many :reviews, :dependent => :destroy
  has_many :images, :dependent => :destroy
  has_many :quotes, :dependent => :destroy
  accepts_nested_attributes_for :reviews, :allow_destroy => :true
  accepts_nested_attributes_for :images, :allow_destroy => :true
  
  has_attached_file :image,
                    :styles => { :large => Andina::Application.config.paperclip_config['1016x300'],
                                 :thumb => Andina::Application.config.paperclip_config['260x180']},
                    :url => "/system/:class/:id/:style/:basename.:extension",
                    :path => Andina::Application.config.paperclip_config['server_path'] + "/:class/:id/:style/:basename.:extension"          
                  
  def place=(place)
    self[:place] = place == "yes" ? true : false
  end  
  
end
