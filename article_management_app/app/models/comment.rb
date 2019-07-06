class Comment
  include Mongoid::Document
  field :comment_id, type: String
  field :description, type: String
  validates_presence_of :comment_id, :description
  belongs_to :user
end
