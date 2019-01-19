class Api::V1::QuotesController < ApplicationController
  def index
    render json: current_user.quotes
  end

  def create
    Quote.create!(
      author: current_user[:email],
      quote: 'Lorem ipsum dolor sit amet,',
      author_about: 'Lorem ipsum',
      tags: '',
      user_id: current_user[:id]
    )
  end
end
