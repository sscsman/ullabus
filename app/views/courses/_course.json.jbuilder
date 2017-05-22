json.extract! course, :id, :coursename, :teacher, :credits, :duration, :weekday, :code, :univ, :dept, :creator, :created_at, :updated_at
json.url course_url(course, format: :json)
