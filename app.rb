require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
also_reload('lib/**/*.rb')
require('./lib/quiz')
require('./lib/question')
require('pg')
require('pry')

get('/') do
  erb(:index)
end

post('/quizzes/new') do
  name = params.fetch("name")
  Quiz.create(:name => name)
  @quizzes = Quiz.all()
  erb(:quizzes)
  # redirect('/quizzes')
end

get('/quizzes') do
  @quizzes = Quiz.all()
  erb(:quizzes)
end

# get('/quiz/:id') do
#   @quiz = Quiz.find(params.fetch("id").to_i())
#   erb(:quiz)
# end

post('/quiz/:id') do
  @quiz = Quiz.find(params.fetch("id").to_i())
  question = params.fetch("question")
  quiz_id = params.fetch("quiz_id").to_i()
  Question.create({:question => question, :quiz_id => quiz_id})
  Question.all()
  erb(:quiz)
end
