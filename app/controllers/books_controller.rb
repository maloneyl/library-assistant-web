class BooksController < ApplicationController
  def index
    render json: Array.new(10, book)
  end

  private

  def book
    {
      title: "The Martian",
      author: "Andy Weir",
      link: "https://capitadiscovery.co.uk/islington/items/872958",
      image_url: "https://images.gr-assets.com/books/1413706054l/18007564.jpg"
    }
  end
end
