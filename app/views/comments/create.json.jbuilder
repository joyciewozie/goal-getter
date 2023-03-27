# create JSON view
if @comment.persisted?
  # key: json.fom, value: render(...)
  json.form render(partial: "comments/form", formats: :html, locals: {goal: @goal, insight: @insight, comment: Comment.new, answer: @answer})
  # key: json.donkey_item / inserted_item
  json.donkey_item render(partial: "comments/comment", formats: :html, locals: {comment: @comment})
else
  json.form render(partial: "comments/form", formats: :html, locals: {goal: @goal, insight: @insight, comment: @comment, answer: @answer})
end

# {
#   "form" => "<form> <input></form>"
#   "insert_item" => "<p>This is my comment</p>"
# }
