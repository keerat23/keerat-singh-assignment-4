class BookCollectionController < ApplicationController

  def home
    flash[:alert] = params[:message]
    @books = Book.all
  end

  def add

    @genres = ["Fiction", "Non-Fiction", "Science Fiction", "Mystery", "Historical Fiction",
              "Fantasy", "Horror Fiction", "Biography", "Thriller", "Poetry"]
    @genres = @genres.sort

    @years = []
    (1900..2020).each do |y|
      @years << y.to_s
    end

    @months = ["January", "February", "March", "April", "May", "June", "July", "August", "September",
                "October", "November", "December"]

    @days = []
    (1..31).each do |d|
      @days << d.to_s
    end


    title = params[:title]
    author = params[:author]
    genre = params[:genre]
    price = params[:price]
    published_year = params[:published_year]
    published_month = params[:published_month]
    published_day = params[:published_day]
    published_date = "#{published_month} #{published_day} #{published_year}"

    if title != nil
      book = Book. new
      book.title = title
      if author != nil
        book.author = author
      end
      if genre != nil
        book.genre = genre
      end
      if price != nil
        price = price.to_i
        book.price = price
      end
      if published_date != nil
        book.published_date = published_date
      end
      book.save
      redirect_to action: "home", message: "Added new book to collection"
    end
  end

  def update
    @genres = ["Fiction", "Non-Fiction", "Science Fiction", "Mystery", "Historical Fiction",
      "Fantasy", "Horror Fiction", "Biography", "Thriller", "Poetry"]
    @genres = @genres.sort

    @years = []
    (1900..2020).each do |y|
      @years << y.to_s
    end

    @months = ["January", "February", "March", "April", "May", "June", "July", "August", "September",
        "October", "November", "December"]

    @days = []
    (1..31).each do |d|
      @days << d.to_s
    end
    @id = params[:id]
    @title = params[:title]
    @author = params[:author]
    @genre = params[:genre]
    @price = params[:price]
    @published_year = params[:published_year]
    @published_month = params[:published_month]
    @published_day = params[:published_day]
    if @title != nil
      book = Book.find_by_id(@id)
      book.title = @title
      if @author != nil
        book.author = @author
      end
      if @genre != nil
        book.genre = @genre
      end
      if @price != nil
        book.price = @price.to_i
      end
      book.published_date = "#{@published_month} #{@published_day} #{@published_year}"
      book.save
      redirect_to action: "home", message: "Updated Successfully"
    else
      book = Book.find_by_id(@id)
      @title = book.title
      @author = book.author
      @genre = book.genre
      @price = book.price.to_s
      @published_date = book.published_date
      extracted_date = @published_date.split(/[" "]/)
      @published_month = extracted_date[0]
      @published_day = extracted_date[1]
      @published_year = extracted_date[2]
    end
  end

  def details
    book = Book.find_by_id(params[:id])
    @title = book.title
    @author = book.author
    @genre = book.genre
    @price = book.price.to_s
    @published_date = book.published_date
  end

  def delete
    @id = params[:id]
    book = Book.find_by_id(@id)
    @title = book.title
    if params[:decision] == "yes"
      book.destroy
      redirect_to action: "home", message: "Book deleted from collection successfully"
    end
  end
end
