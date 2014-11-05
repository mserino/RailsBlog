class AddItaliandescriptionToPost < ActiveRecord::Migration
  def change
    add_column :posts, :italiandescription, :text
  end
end
