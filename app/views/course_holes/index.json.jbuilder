json.array!(@course_holes) do |course_hole|
  json.extract! course_hole, :id, :hole_number, :black_length, :blue_length, :white_length, :red_length, :green_length, :senior_length, :par, :course_id
  json.url course_hole_url(course_hole, format: :json)
end
