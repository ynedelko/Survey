require 'spec_helper'

describe(Quiz) do
  describe('#questions') do
    it('tells which questions belong to the quiz') do
      test_quiz = Quiz.create({:name => "Happiness Survey"})
      test_question1 = Question.create({:question => "Do you eat thirty cheeseburgers a day?", :quiz_id => test_quiz.id})
      test_question2 = Question.create({:question => "Do you own a plethora of scented candles?", :quiz_id => test_quiz.id})
      expect(test_quiz.questions()).to(eq([test_question1, test_question2]))
    end
  end

  it("capitalizes quiz name") do
    quiz = Quiz.create({:name => "happiness quiz"})
    expect(quiz.name()).to(eq("Happiness quiz"))
  end
end
