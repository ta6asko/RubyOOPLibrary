class Book
  attr_accessor :title, :author
  def initialize(title)
    @title = title
  end

  def add_author(author)
    @author = author
  end
end