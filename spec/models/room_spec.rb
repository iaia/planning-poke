# == Schema Information
#
# Table name: rooms
#
#  id               :bigint           not null, primary key
#  name             :string           not null
#  password_digdest :string           not null
#  uuid             :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_rooms_on_uuid  (uuid) UNIQUE
#
require 'rails_helper'

RSpec.describe Room, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
