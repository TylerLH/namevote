class AddNameIdToComment < ActiveRecord::Migration
  def change
    add_column :comments, :name_id, :integer
  end
end
