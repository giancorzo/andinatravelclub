# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  body       :text(65535)
#  preview    :text(65535)
#  popular    :boolean
#  slug       :string(255)
#  account_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base
  extend FriendlyId
  
  friendly_id :title, :use => :slugged
  
  belongs_to :account
end
