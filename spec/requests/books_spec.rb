require "rails_helper"

RSpec.describe "BooksController", type: :request do
  describe "GET /index" do
    before do
      Book.create!(
        title: "Title",
        author: "Author",
        image_url: "Image URL",
        average_rating: "4.04",
        year: "2018",
        link: "Link",
        isbn: "1234567890"
      )
    end

    it "sends an array of book objects" do
      get "/books"

      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)).to eq([
        {
          "title" => "Title",
          "author" => "Author",
          "image_url" => "Image URL",
          "average_rating" => "4.04",
          "year" => "2018",
          "link" => "Link",
          "isbn" => "1234567890"
        }
      ])
    end
  end
end
