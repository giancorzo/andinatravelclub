# == Schema Information
#
# Table name: tours
#
#  id                :integer          not null, primary key
#  title             :string(255)
#  subtitle          :string(255)
#  short_description :text(65535)
#  short_itinerary   :text(65535)
#  itinerary         :text(65535)
#  days              :integer
#  nights            :integer
#  price             :integer
#  place             :boolean          default(FALSE)
#  slug              :string(255)
#  interest_id       :integer
#  created_at        :datetime
#  updated_at        :datetime
#

class Tour < ActiveRecord::Base
  belongs_to :interest
end
