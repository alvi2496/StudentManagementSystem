json.messages do
  json.details @response[:message]
  json.status @response[:status]
end
if @response[:status] == 200
  json.semesters @semesters do |semester|
    json.name semester.name
  end
end