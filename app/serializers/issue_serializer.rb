class IssueSerializer < ActiveModel::Serializer
  attributes :id, :issue_number
  has_many :estimates
end
