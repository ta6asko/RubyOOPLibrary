class Order
  attr_accessor :book, :reader, :date
  def initialize(date = Time.now)
    @date = date
  end

  def add_book(book)
    @book = book 
  end

  def add_reader(reader)
    @reader = reader
  end
end