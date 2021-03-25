class ChapterSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_one :notebook
end
