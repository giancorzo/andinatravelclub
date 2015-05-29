# == Schema Information
#
# Table name: banners
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  subtitle           :string(255)
#  tour_id            :integer
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Banner < ActiveRecord::Base
    
  has_attached_file :image,
                    :styles => { :media => "566x300#",
                                 :thumb => "150x100#"},
                    :url => "/system/:class/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/system/:class/:id/:style/:basename.:extension"
                  
  belongs_to :tour    
    
end
