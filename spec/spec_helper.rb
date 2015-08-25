ENV['RACK_ENV'] = 'test'

require 'rspec'
require 'pg'
require 'sinatra/activerecord'
require 'quiz'
require 'question'

RSpec.configure do |config|
  config.after(:each) do
    Question.all().each() do |question|
      question.destroy()
    end

    Quiz.all().each() do |quiz|
      quiz.destroy()
    end
  end
end
