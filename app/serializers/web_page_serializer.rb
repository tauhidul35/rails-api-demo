class WebPageSerializer < ActiveModel::Serializer
  attributes :id, :url, :content, :updated_at
end
