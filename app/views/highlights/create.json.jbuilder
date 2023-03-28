# create JSON view
if @highlight.persisted?
  json.content @answer.highlighted_content
else
  json.content @answer.content
end
