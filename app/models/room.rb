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
class Room < ApplicationRecord
end
