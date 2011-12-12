class AddPosterIdToPost < ActiveRecord::Migration
  def change
    add_column :posts, :poster_id, :integer
  end
end
