class AddANameToInterest < ActiveRecord::Migration
  def change
    add_column :interests, :name, :string
  end
end
