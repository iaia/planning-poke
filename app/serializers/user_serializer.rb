# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  room_id    :bigint
#
class UserSerializer < ActiveModel::Serializer
  attributes :name
end
