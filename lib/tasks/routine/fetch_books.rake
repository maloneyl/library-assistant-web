namespace :routine do
  desc "Generate and process book requests and save resulting books"
  task fetch_books: :environment do
    book_requests = begin
      LibraryAssistant.generate_and_process_book_requests(desired_book_count: 12)
    rescue StandardError => e
      Rails.logger.info e
      []
    end

    return unless book_requests.any?

    Book.delete_all

    book_requests.each do |book_request|
      Book.create!(
        title: book_request.library_search_result.book.title,
        author: book_request.library_search_result.book.author,
        image_url: book_request.image_url,
        average_rating: book_request.average_rating,
        year: book_request.library_search_result.book.year,
        link: book_request.library_search_result.book.link,
        isbn: book_request.library_search_result.book.isbn
      )
    end
  end
end
