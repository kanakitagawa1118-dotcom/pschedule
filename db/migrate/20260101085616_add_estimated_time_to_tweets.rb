class AddEstimatedTimeToTweets < ActiveRecord::Migration[7.2]
  def change
    add_column :tweets, :estimated_time, :integer
  end
end
