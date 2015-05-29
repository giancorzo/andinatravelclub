# == Schema Information
#
# Table name: images
#
#  id                 :integer          not null, primary key
#  description        :string(255)
#  tour_id            :integer
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Image < ActiveRecord::Base
  
  has_attached_file :image,
                    :styles => { :media => "150x120#",
                                 :big => "510x300#"},
                    :url => "/system/:class/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/system/:class/:id/:style/:basename.:extension"    
                    
  belongs_to :tour                    
                    
end
