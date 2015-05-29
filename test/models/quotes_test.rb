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

require 'test_helper'

class QuotesTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
