# create JSON view
if @comment.persisted?
  json.form render(partial: "comments/form", formats: :html, locals: {goal: @goal, insight: @insight, comment:})
  json.insert_item render(partial: "insights/comment", formats: :html, locals: {comment: @comment})
else
  json.form render(partial: "comments/form", formats: :html, locals: {goal: @goal, insight: @insight, comment:})
end
