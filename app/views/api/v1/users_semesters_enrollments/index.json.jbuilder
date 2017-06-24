json.messages do
  json.details @response[:message]
  json.status @response[:status]
end
if @response[:status] == 200
  json.semesters @semesters do |semester|
    json.id semester.id
    json.name semester.name
    json.is_completed semester.is_completed == 1 ? true : false
  end
end