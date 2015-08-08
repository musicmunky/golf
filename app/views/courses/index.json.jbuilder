json.array!(@courses) do |course|
  json.extract! course, :id, :name, :address1, :address2, :address3, :city, :state, :zip, :course_type_id
  json.url course_url(course, format: :json)
end
