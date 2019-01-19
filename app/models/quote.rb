# frozen_string_literal: true

# Quotes from users
class Quote
  include Mongoid::Document
  field :quote, type: String
  field :author, type: String
  field :author_about, type: String
  field :tags, type: String
  belongs_to :user

  validates :user, presence: true
end
