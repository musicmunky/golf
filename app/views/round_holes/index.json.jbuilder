json.array!(@round_holes) do |round_hole|
  json.extract! round_hole, :id, :round_id, :course_hole_id, :score, :putts
  json.url round_hole_url(round_hole, format: :json)
end
