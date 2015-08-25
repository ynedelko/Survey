class Question < ActiveRecord::Base
  validates(:question, {:presence => true, :length => {:maximum => 99}})
  belongs_to(:quiz)
end
