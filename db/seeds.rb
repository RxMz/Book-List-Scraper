# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  term = Term.create!(term_code: 1185, term_description: 'Spring 2018')

  book_list = BookList.create!(id: 4, term: term) unless BookList.exists? id: 4

  course_acc_605 = Course.create!(book_list: book_list, instructors: 'Jones, Alyssa', sections: '001', department: 'ACC', number: 605, term: 2)
  acc_book = Book.create!(course: course_acc_605, author: 'LI COCKFIELD WILKIE', title: 'INTERNATIONAL TAXATION IN CANADA 3ED', sku: 9780433475675, price: 140.00, stock: 3, reqopt: 1)

  course_acc_606 = Course.create!(book_list: book_list, instructors: 'Jones, Alyssa', sections: '002', department: 'ACC', number: 606, term: 2)
  acc_book = Book.create!(course: course_acc_606, author: 'NOBES ET AL', title: 'CANADA VALUATION SERVICE - 2018 STUDENT ED', sku: 9780779880942, price: 173.00, stock: 47, reqopt: 1)
end


