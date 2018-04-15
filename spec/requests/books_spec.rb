require "rails_helper"

RSpec.describe "BooksController", type: :request do
  describe "GET /index" do
    let(:book_request) do
      OpenStruct.new(
        library_search_result: OpenStruct.new(
          book: OpenStruct.new(title: "Title", author: "Author", year: "2018", link: "Link", isbn: "1234567890")
        ),
        image_url: "Image URL",
        average_rating: "4.04"
      )
    end

    before do
      allow(LibraryAssistant).to receive(:generate_and_process_book_requests).
        with(desired_book_count: 12).and_return([book_request])
    end

    it "sends an array of books" do
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
