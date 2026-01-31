class AddMoodLevelToTweets < ActiveRecord::Migration[7.2]
  def change
    add_column :tweets, :mood_level, :string
  end
end
