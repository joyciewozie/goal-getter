# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Destroying all users'
User.destroy_all
puts 'Creating user'
user_one = User.create!(email: "jack@live.com", password: "123456", name: "Jack", gender: "Male", city: "Southampton", age: "25")
user_two = User.create!(email: "rose@live.com", password: "123456", name: "Rose", gender: "Female", city: "Southampton", age: "24")

puts 'Destroying all goals'
Goal.destroy_all
puts 'Creating goal'
goal = Goal.create!(goal_type: "career", name: "Change jobs", description: "I'm bored at work and need a change.", status: "in_progress", user_id: user_one.id)

puts 'Destroying all template_questions'
TemplateQuestion.destroy_all
puts 'Creating template_question'
template_question_one = TemplateQuestion.create!(title: "What type of job are you looking for?", goal_type: "career")
template_question_two = TemplateQuestion.create!(title: "Wha specific roles are you looking for?", goal_type: "career")
template_question_three = TemplateQuestion.create!(title: "What range of compensation package are you looking at?", goal_type: "career")
template_question_four = TemplateQuestion.create!(title: "What size of company are you looking to work for?", goal_type: "career")

puts 'Destroying all answers'
Answer.destroy_all
puts 'Creating answer'
answer_one = Answer.create!(content: "Software Developer", goal_id: goal.id, template_question: template_question_one)
answer_two = Answer.create!(content: "Junior Java Developer", goal_id: goal.id, template_question: template_question_two)
answer_three = Answer.create!(content: "$4,000 to $6,000", goal_id: goal.id, template_question: template_question_three)
answer_four = Answer.create!(content: "50+ employees", goal_id: goal.id, template_question: template_question_four)

puts 'Destroying all highlights'
Highlight.destroy_all
puts 'Creating highlight'
highlight = Highlight.create!(text: "Developer", answer_id: answer_one.id)

puts 'Destroying all collaborators'
Collaborator.destroy_all
puts 'Creating collaborator'
collaborator = Collaborator.create!(goal_id: goal.id, user_id: user_two.id)

puts 'Destroying all comments'
Comment.destroy_all
puts 'Creating comment'
comment = Comment.create!(content: "Great choice!", answer_id: answer_one.id, user_id: user_two.id)
