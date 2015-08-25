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

post('/quizzes') do
  @quizzes = Quiz.all()
  name = params.fetch("name")
  Quiz.create(:name => name)
  Quiz.all()
  erb(:quizzes)
end

get('/quizzes') do
  @quizzes = Quiz.all()
  erb(:quizzes)
end
