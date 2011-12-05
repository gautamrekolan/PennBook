class AddNameToInterest < ActiveRecord::Migration
  def change
    add_column :interests, :interest, :string
  end
end
