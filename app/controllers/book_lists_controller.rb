class BookListsController < ApplicationController
  before_action :set_book_list, only: [:show, :edit, :update, :destroy]

  # GET /book_lists
  # GET /book_lists.json
  def index
    @book_lists = BookList.all
    #file_generator
    base_uri = 'https://hvt2-1519495006532.firebaseio.com/'
    @firebase  = Firebase::Client.new(base_uri)
    #@response = @firebase.push("Rishabh", {:counter => 0})
    #@resp =  @response.body
    #@child_key = @resp["name"]
    #string_generator()
    #checker
    string_generator 
    #updater
    #render plain: @child_key
    #render plain: @entries
  end

  # does the same as string_generator
  # given book_list_id ( Integer )

#

# TODO clean up
  def string_generator
    @entries = ""
    counter = 0
    @book_lists.each { |book_list|
      book_list.courses.each { |course|
        department = course.department
        course_number = course.number
        course.books.each { |book|
          @entries += sprintf("%-7s", department) 
          @entries += sprintf("%-6d", course_number) 
          @entries += sprintf("%-32s", "") # book edition
          @entries += sprintf("%-14s", "") # ISBN
          @entries += sprintf("%-9s", "") # ISBN INT
          @entries += sprintf("%-24s", book.author) 
          @entries += sprintf("%-55s", book.title) 
          @entries += sprintf("%-5.2f", book.price) 
          @entries += sprintf("%-10s", book.publisher) 
        }
        @entries += "\n" #creating new line after every entry
        counter+=1; # number of book entries
        sleep(1)
        #checker(counter) #CHANGE THIS
        newchecker(counter)
      }
    }
  end

  def newchecker(to_update)
    @firebase.update('',{
      "Rishabh" => true,
      "Rishabh" => to_update
    })
  end


  def checker(to_update)
    @firebase.update('',{
      "Rishabh/#{@child_key}" => true,
      "Rishabh/#{@child_key}" => to_update
    })
  end



#
  def listener
  end


# 3) make this asynchronously
  def file_generator
    data = ReportWorker.perform_async(@book_lists)
    raise data.inspect
    #render plain: data
    #send_data(data, :filename => "textfile.txt")
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