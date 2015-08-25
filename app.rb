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
