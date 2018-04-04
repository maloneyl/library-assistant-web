require "rails_helper"

RSpec.describe Book do
  subject { described_class.new(book_request) }

  let(:book_request) do
    OpenStruct.new(
      library_search_result: OpenStruct.new(
        book: OpenStruct.new(title: "Title", author: "Author", year: "2018", link: "Link")
      ),
      image_url: "Image URL",
      average_rating: "4.04"
    )
  end

  describe "#title" do
    it "returns the title" do
      expect(subject.title).to eq("Title")
    end
  end

  describe "#author" do
    it "returns the author" do
      expect(subject.author).to eq("Author")
    end
  end

  describe "#image_url" do
    it "returns the image_url" do
      expect(subject.image_url).to eq("Image URL")
    end
  end

  describe "#average_rating" do
    it "returns the average rating" do
      expect(subject.average_rating).to eq("4.04")
    end
  end

  describe "#year" do
    it "returns the year" do
      expect(subject.year).to eq("2018")
    end
  end

  describe "#link" do
    it "returns the link" do
      expect(subject.link).to eq("Link")
    end
  end
end
