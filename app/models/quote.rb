class Quote < ActiveRecord::Base
  belongs_to :tour
  
  validates :days, :presence   => true
  validates :name, :presence   => true
  validates :city, :presence   => true
  validates :phone, :presence  => true
  validates :email, :presence  => true
  
end
