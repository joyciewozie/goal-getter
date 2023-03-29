# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Clearing previous data'
Comment.destroy_all
Collaborator.destroy_all
Highlight.destroy_all
Answer.destroy_all
TemplateQuestion.destroy_all
Insight.destroy_all
Goal.destroy_all
User.destroy_all

puts 'Creating user'
user_one = User.create!(email: "jack@live.com", password: "123456", name: "Jack", gender: "Male", city: "Southampton", age: "25")
user_one.photo.attach(io: File.open("app/assets/images/blankprofilepics/profilepic3.jpg"), filename: "image-#{Time.now.strftime("%s%L")}.png")
user_two = User.create!(email: "rose@live.com", password: "123456", name: "Rose", gender: "Female", city: "Southampton", age: "24")
user_two.photo.attach(io: File.open("app/assets/images/blankprofilepics/profilepic4.jpg"), filename: "image-#{Time.now.strftime("%s%L")}.png")
user_three = User.create!(email: "caledon@live.com", password: "123456", name: "Caledon", gender: "Male", city: "Southampton", age: "25")
user_three.photo.attach(io: File.open("app/assets/images/blankprofilepics/profilepic1.jpg"), filename: "image-#{Time.now.strftime("%s%L")}.png")
user_four = User.create!(email: "brock@live.com", password: "123456", name: "Brock", gender: "Male", city: "Southampton", age: "30")
user_four.photo.attach(io: File.open("app/assets/images/blankprofilepics/profilepic2.jpg"), filename: "image-#{Time.now.strftime("%s%L")}.png")
user_five = User.create!(email: "margaret@live.com", password: "123456", name: "Margaret", gender: "Female", city: "Southampton", age: "35")
user_five.photo.attach(io: File.open("app/assets/images/blankprofilepics/profilepic6.jpg"), filename: "image-#{Time.now.strftime("%s%L")}.png")
user_six = User.create!(email: "edward@live.com", password: "123456", name: "Edward John Smith", gender: "Male", city: "Southampton", age: "50")
user_six.photo.attach(io: File.open("app/assets/images/blankprofilepics/profilepic5.jpg"), filename: "image-#{Time.now.strftime("%s%L")}.png")

puts 'Creating goal'
goal = Goal.create!(goal_type: "career", name: "Change jobs", description: "I'm bored at work and want to increase my income.", status: "in_progress", user_id: user_one.id)
goal.photo.attach(io: URI.open(Unsplash::Photo.random(count: 1, query: "career", orientation: "landscape")[0].urls.regular), filename: "image-#{Time.now.strftime("%s%L")}.png")
goal_two = Goal.create!(goal_type: "health", name: "Get swole", description: "Add 50 ibs of lean mass.", status: "in_progress", user_id: user_one.id)
goal_two.photo.attach(io: URI.open(Unsplash::Photo.random(count: 1, query: "health", orientation: "landscape")[0].urls.regular), filename: "image-#{Time.now.strftime("%s%L")}.png")

puts 'Creating insight'
insight_one = Insight.create!(name: "Job search", summary: "Narrowing down the job search be filtering roles and companies", goal_id: goal.id)
insight_one.photo.attach(io: URI.open(Unsplash::Photo.random(count: 1, query: "Job search", orientation: "landscape")[0].urls.regular), filename: "image-#{Time.now.strftime("%s%L")}.png")
insight_two = Insight.create!(name: "Trading bot", summary: "Earn passive income by using a DCA trading bot", goal_id: goal.id)
insight_two.photo.attach(io: URI.open(Unsplash::Photo.random(count: 1, query: "stock trading", orientation: "landscape")[0].urls.regular), filename: "image-#{Time.now.strftime("%s%L")}.png")
insight_three = Insight.create!(name: "Rent out spare room", summary: "Rent out spare room for extra income", goal_id: goal.id)
insight_three.photo.attach(io: URI.open(Unsplash::Photo.random(count: 1, query: "Rental property", orientation: "landscape")[0].urls.regular), filename: "image-#{Time.now.strftime("%s%L")}.png")

puts 'Creating template_question'
template_question_one = TemplateQuestion.create!(title: "Why do you want a change?", goal_type: "career")
template_question_two = TemplateQuestion.create!(title: "Why are you looking for this change?", goal_type: "career")
template_question_three = TemplateQuestion.create!(title: "What is holding you back?", goal_type: "career")
template_question_four = TemplateQuestion.create!(title: "What will happen if your change succeeds?", goal_type: "career")
template_question_five = TemplateQuestion.create!(title: "Why do you think the problem has occurred?", goal_type: "health")
template_question_six = TemplateQuestion.create!(title: "What do you think is the possible impact of the problem on your life?", goal_type: "health")
template_question_seven = TemplateQuestion.create!(title: "How do you think you can change the problem one step at a time?", goal_type: "health")
template_question_eight = TemplateQuestion.create!(title: "What do you think are the potential hurdles in your way of problem-solving?", goal_type: "health")

puts 'Creating answer'
answer_one = Answer.create!(content: "Because talking to dumb people every day make me hate humanity", insight_id: insight_one.id, template_question: template_question_one)
answer_two = Answer.create!(content: "I want a new role. I want a new team. I fucking hate what I am doing right now. No intellectual stimulation. Mentally and emotionally draining.", insight_id: insight_one.id, template_question: template_question_two)
answer_three = Answer.create!(content: "I am scared to ask my boss for a transfer. What if she fires me? I don’t want to end up on the streets.", insight_id: insight_one.id, template_question: template_question_three)
answer_four = Answer.create!(content: "I can stop paying my therapist. Everyday will be a ‘high’ for me. I don’t need alcohol. I will be high on life.", insight_id: insight_one.id, template_question: template_question_four)
answer_five = Answer.create!(content: "Ran out of funds to DCA", insight_id: insight_two.id, template_question: template_question_five)
answer_six = Answer.create!(content: "Impact is limited to the trading account, unable make other trades while funds are held up in trade.", insight_id: insight_two.id, template_question: template_question_six)
answer_seven = Answer.create!(content: "Make the signal for opening the position more strick. Lower the entry buy volume so each trade uses less funds", insight_id: insight_two.id, template_question: template_question_seven)
answer_eight = Answer.create!(content: "If the signal is too strict, the bot may not open much trades.", insight_id: insight_two.id, template_question: template_question_eight)

puts 'Creating highlight'
highlight = Highlight.create!(text: "talking to dumb people", goal_id: goal.id, answer_id: answer_one.id)

puts 'Creating collaborator'
collaborator_two = Collaborator.create!(goal: goal, user: user_two, accepted: true)
collaborator_three = Collaborator.create!(goal: goal, user: user_three, accepted: true)
collaborator_four = Collaborator.create!(goal: goal, user: user_four)

puts 'Creating comment'
comment = Comment.create!(content: "Great choice!", answer_id: answer_one.id, user_id: user_two.id)
