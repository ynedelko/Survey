class CreateQuestions < ActiveRecord::Migration
  def change
    create_table(:questions) do |t|
      t.column(:question, :string)
      t.column(:quiz_id, :int)

      t.timestamps()
    end
  end
end
