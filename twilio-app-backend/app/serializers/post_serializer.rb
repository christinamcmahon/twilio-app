class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :date_time, :content, :img, :user_id, :likes
end
