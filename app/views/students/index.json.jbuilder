json.array!(@students) do |student|
  json.extract! student, :id, :institutional_gpa, :institutional_credits, :total_earned_credits, :total_attempted_credits
  json.url student_url(student, format: :json)
end
