class AddMoodTypeToPerfumes < ActiveRecord::Migration[7.2]
  def change
    add_column :perfumes, :mood_type, :string
  end
end
