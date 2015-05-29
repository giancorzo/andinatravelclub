# == Schema Information
#
# Table name: accounts
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  email          :string(255)      not null
#  crypt_password :string(255)      not null
#  salt           :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
