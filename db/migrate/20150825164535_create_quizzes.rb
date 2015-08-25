class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table(:quizzes) do |t|
      t.column(:name, :string)

      t.timestamps()
    end
  end
end
