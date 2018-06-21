class ReportWorker
	include Sidekiq::Worker
	sidekiq_options rety: true

	def perform(book_lists)
		data  = string_generator(book_lists)
		return data
	end


	def string_generator(book_lists)
		entries = ""
		book_lists.each { |book_list|
			book_list.courses.each { |course|
				department = course.department
				course_number = course.number
				course.books.each { |book|
					entries += sprintf("%-7s", department) 
					entries += sprintf("%-6d", course_number) 
          entries += sprintf("%-32s", "") # book edition
          entries += sprintf("%-14s", "") # ISBN
          entries += sprintf("%-9s", "") # ISBN INT
          entries += sprintf("%-24s", book.author) 
          entries += sprintf("%-55s", book.title) 
          entries += sprintf("%-5.2f", book.price) 
          entries += sprintf("%-10s", book.publisher) 
      }
        entries += "\n" #creating new line after every entry
    }
}
end
end