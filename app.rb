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

get('/quiz/:id') do
  @quiz = Quiz.find(params.fetch("id").to_i())
  erb(:quiz)
end

post('/quiz/:id') do
  @quiz = Quiz.find(params.fetch("id").to_i())
  question = params.fetch("question")
  quiz_id = params.fetch("quiz_id").to_i()
  Question.create({:question => question, :quiz_id => quiz_id})
  Question.all()
  erb(:quiz)
end

delete('/quiz/:id/delete') do
  @quizzes = Quiz.all()
  @quiz = Quiz.find(params.fetch("id").to_i())
  @quizzes.delete(@quiz)
  erb(:quizzes)
end

get('/question/:id') do
  @question = Question.find(params.fetch("id").to_i())
  erb(:question)
end

delete('/question/:id/delete') do
  @question = Question.find(params.fetch("id").to_i())
  @quiz_id = @question.quiz.id.to_i()
  @quiz = Quiz.find(@quiz_id)
  @question.delete()
  erb(:quiz)
end

patch('/question/:id/update') do
  @question = Question.find(params.fetch("id").to_i())
  update_question = params.fetch("update_question")
  @question.update({:question => update_question})
  erb(:question)
end

patch('/quiz/:id/update') do
  @quiz = Quiz.find(params.fetch("id").to_i())
  update_quiz = params.fetch("update_quiz")
  @quiz.update({:name => update_quiz})
  erb(:quiz)
end
