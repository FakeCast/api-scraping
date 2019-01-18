class Quote
  include Mongoid::Document
  field :quote, type: String
  field :author, type: String
  field :author_about, type: String
  field :tags, type: String
  belongs_to :user
  #embedded_in :user

  validates :user, presence: true
end
