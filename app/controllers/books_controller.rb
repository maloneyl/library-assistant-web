class BooksController < ApplicationController
  def index
    @books = book_requests.map { |book_request| Book.new(book_request) }
  end

  private

  def book_requests
    begin
      Rails.cache.fetch("book_requests", expires_in: book_requests_cache_expires_in) do
        LibraryAssistant.generate_and_process_book_requests(desired_book_count: 12)
      end
    rescue StandardError => e
      Rails.logger.info e
      []
    end
  end

  def book_requests_cache_expires_in
    return 1.hour unless ENV["BOOK_REQUESTS_CACHE_MINUTES"]

    ENV["BOOK_REQUESTS_CACHE_MINUTES"].to_i.minutes
  end
end
