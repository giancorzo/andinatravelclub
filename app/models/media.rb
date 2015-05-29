# == Schema Information
#
# Table name: media
#
#  id                   :integer          not null, primary key
#  description          :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  content_file_name    :string(255)
#  content_content_type :string(255)
#  content_file_size    :integer
#  content_updated_at   :datetime
#

class Media < ActiveRecord::Base
    
  has_attached_file :content,
                    :url => "/system/:class/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/system/:class/:id/:style/:basename.:extension"    
    
end
