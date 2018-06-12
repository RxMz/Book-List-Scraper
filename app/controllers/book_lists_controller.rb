class BookListsController < ApplicationController
  before_action :set_book_list, only: [:show, :edit, :update, :destroy]

  # GET /book_lists
  # GET /book_lists.json
  def index
    @book_lists = BookList.all
    string_generator()
    file_generator()
    # render plain: @some_string
    return
    #and return
  end

  def string_generator
    @some_string = ""
    @book_lists.each { |book_list|
      book_list.courses.each { |course|
        dep = course.department
        number = course.number
        course.books.each { |book|
          @some_string += sprintf("%-7s", dep) # department
          @some_string += sprintf("%-6d", number) # course number
          @some_string += sprintf("%-32s", "") # book edition
          @some_string += sprintf("%-14s", "") # ISBN
          @some_string += sprintf("%-9s", "") # ISBN INT
          @some_string += sprintf("%-24s", book.author) # author
          @some_string += sprintf("%-55s", book.title) # book title
          @some_string += sprintf("%4.2f", book.price) # book price
          @some_string += sprintf("%-10s", book.publisher)  # book publisher 
        }
        
        @some_string += "\n"
      }
    }

    #render ''
  end

  def file_generator
    send_data(@some_string, :filename => "textfile.txt")
  end

#This is not the thing needed
def book_record_generator(s)
  department = s[0...7]
  course_number = s[7...13]
  edition = s[13...45]
  isbn = s[45...59]
  isbn_integer = s[49...58]
  author = s[59...83]
  title = s[83...138]
  price = s[138...144]
  unused = s[144...153]
  publisher = s[153...163]
  to_add_in_file = "Department: " + department + "\n"
  to_add_in_file += "Course Number: " + course_number + "\n"
  to_add_in_file += "Edition: " + edition + "\n" 
  to_add_in_file += "ISBN: " + isbn + "\n"
  to_add_in_file += "ISBN (int only): " + isbn_integer + "\n" 
  to_add_in_file += "Author: " + author + "\n" 
  to_add_in_file +=  "Title: " + title + "\n" 
  to_add_in_file += "Price: " + price + "\n" +
  to_add_in_file += "Publisher: " + publisher
  puts to_add_in_file
end

  # GET /book_lists/1
  # GET /book_lists/1.json
  def show
  end

  # GET /book_lists/new
  def new
    @book_list = BookList.new
  end

  # GET /book_lists/1/edit
  def edit
  end

  # POST /book_lists
  # POST /book_lists.json
  def create
    @book_list = BookList.new(book_list_params)

    respond_to do |format|
      if @book_list.save
        format.html { redirect_to @book_list, notice: 'Book list was successfully created.' }
        format.json { render :show, status: :created, location: @book_list }
      else
        format.html { render :new }
        format.json { render json: @book_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_lists/1
  # PATCH/PUT /book_lists/1.json
  def update
    respond_to do |format|
      if @book_list.update(book_list_params)
        format.html { redirect_to @book_list, notice: 'Book list was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_list }
      else
        format.html { render :edit }
        format.json { render json: @book_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_lists/1
  # DELETE /book_lists/1.json
  def destroy
    @book_list.destroy
    respond_to do |format|
      format.html { redirect_to book_lists_url, notice: 'Book list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_list
      @book_list = BookList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_list_params
      params.require(:book_list).permit(:term_id)
    end
  end
