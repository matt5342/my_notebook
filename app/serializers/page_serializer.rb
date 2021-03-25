class PageSerializer < ActiveModel::Serializer
  attributes :id, :number, :content
  has_one :chapter
end
