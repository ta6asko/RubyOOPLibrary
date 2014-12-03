require 'yaml'
require_relative 'author.rb'
require_relative 'reader.rb'
require_relative 'book.rb'
require_relative 'order.rb'

class Library
  attr_accessor :books, :orders, :readers, :authors
  def initialize file
    @books, @orders, @readers, @authors = [], [], [], []
    get_all_data(file)
  end

  def add_book book
    @books << book
  end

  def add_order order
    @orders << order
  end

  def add_reader reader
    @readers << reader
  end

  def add_author author 
    @authors << author
  end

  def most_active_reader
    hash = @orders.inject(Hash.new(0)) do |count, order| 
      count[order.reader.name] += 1 
      count
    end
    reader = hash.max_by { |key, value| value }.first
    puts "most active reader: #{reader}"
  end

  def hash_with_books_count
    @hash = @orders.inject(Hash.new(0)) do |count, order| 
      count[order.book.title] += 1 
      count
    end
  end

  def most_popular_book
    hash_with_books_count
    book = @hash.max_by { |key, value| value }.first
    puts "most popular book: #{book}"
  end

  def readers_one_of_the_three_most_popular_books
    books = {}
    hash_with_books_count
    @hash.max_by { |key, value| books[key] = value }
    3.times { |i| puts "#{i+1} most poplar book: #{books.keys[i]}, have: #{books.values[i]} reader(s)" }
    puts "----------------------------------------------------------"    
  end

  def save_all_data file 
    File.open(file, "w") { |file| file.puts(self.to_yaml) }
  end

  def get_all_data file
    @read =  File.open(file) { |f| YAML::load( f ) }
    @books = @read.books
    @orders = @read.orders
    @readers = @read.readers
    @authors = @read.authors
  end
end

library = Library.new('data.yaml')
# library.save_all_data('data.yaml')
puts "----------------------------------------------------------"
puts library.most_active_reader
puts "----------------------------------------------------------"
puts library.most_popular_book
puts "----------------------------------------------------------"
puts library.readers_one_of_the_three_most_popular_books









