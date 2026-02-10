class AddDeadlineToTweets < ActiveRecord::Migration[7.2]
  def change
    add_column :tweets, :deadline, :datetime
  end
end
