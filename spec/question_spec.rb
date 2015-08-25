require 'spec_helper'

describe(Question) do
  describe('#quiz') do
    it("tells which quiz the questions it belongs to") do
      test_quiz = Quiz.create({:name => "Sad Survey"})
      test_question = Question.create({:question => "Do you frown?", :quiz_id => test_quiz.id})
      expect(test_question.quiz()).to(eq(test_quiz))
    end
  end

    it("validates presence of name") do
      question = Question.create({:question => "", :quiz_id => nil})
      expect(question.save()).to(eq(false))
    end

    it("ensures that the question is less than 100 characters long") do
      question = Question.new({:question => "i".*(100), :quiz_id => nil})
      expect(question.save()).to(eq(false))
  end
end
