class Article
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
  field :article_id, type: Integer
  field :title, type: String
  field :description, type: String
  # field :user_id, type: Integer
  
  field :created_at, type: DateTime
  field :updated_at, type: DateTime

  validates_presence_of :article_id, :title, :description, :user_id
  validates_length_of :title, :in => 3..32
  validates_length_of :description, :in => 5..50
end
