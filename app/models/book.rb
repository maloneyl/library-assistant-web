class Book
  def initialize(book_request)
    @book_request = book_request
  end

  def title
    @book_request.library_search_result.book.title
  end

  def author
    @book_request.library_search_result.book.author
  end

  def image_url
    @book_request.image_url
  end

  def average_rating
    @book_request.average_rating
  end

  def year
    @book_request.library_search_result.book.year
  end

  def link
    @book_request.library_search_result.book.link
  end
end
