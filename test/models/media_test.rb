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

require 'test_helper'

class MediaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
