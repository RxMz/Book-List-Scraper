json.extract! course, :id, :instructors, :sections, :department, :number, :term, :booklist_id, :created_at, :updated_at
json.url course_url(course, format: :json)
