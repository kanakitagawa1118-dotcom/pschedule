class AddQuestionToPerfume < ActiveRecord::Migration[7.2]
  def change
    add_column :perfumes, :question, :string
  end
end
