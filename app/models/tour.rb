# == Schema Information
#
# Table name: tours
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  subtitle           :string(255)
#  short_description  :text(65535)
#  short_itinerary    :text(65535)
#  itinerary          :text(65535)
#  days               :integer
#  nights             :integer
#  price              :integer
#  place              :boolean          default(FALSE)
#  slug               :string(255)
#  interest_id        :integer
#  created_at         :datetime
#  updated_at         :datetime
#  popularity         :integer          default(0)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Tour < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, :use => :slugged
  
  belongs_to :interest
  
  has_many :reviews, :dependent => :destroy
  has_many :images, :dependent => :destroy
  has_many :quotes, :dependent => :destroy
  has_many :banners
  
  accepts_nested_attributes_for :reviews, :allow_destroy => :true
  accepts_nested_attributes_for :images, :allow_destroy => :true
  
  has_attached_file :image,
                    :styles => { :large => '1016x300>',
                                 :thumb => '260x180>'},
                    :url => "/system/:class/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/system/:class/:id/:style/:basename.:extension"          
                  
  def place=(place)
    self[:place] = place == "yes" ? true : false
  end  
  
end
