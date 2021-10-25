class MakeDescriptionUniqueuOnSubreddits < ActiveRecord::Migration[6.1]
  def change
    add_index :subreddits, :name, unique: true
  end
end
