# == Schema Information
#
# Table name: quotes
#
#  id           :integer          not null, primary key
#  travel_type  :string(255)
#  days         :integer
#  travel_time  :date
#  name         :string(255)
#  country      :string(255)
#  city         :string(255)
#  phone        :string(255)
#  email        :string(255)
#  payment_type :string(255)
#  comments     :string(255)
#  adults       :integer
#  childs       :integer
#  age          :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Quotes < ActiveRecord::Base
  belongs_to :tour
  
  validates :days, :presence   => true
  validates :name, :presence   => true
  validates :city, :presence   => true
  validates :phone, :presence  => true
  validates :email, :presence  => true    
end
