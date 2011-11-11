class CreateNames < ActiveRecord::Migration
  def change
    create_table :names do |t|
      t.string :name
      t.integer :votes, { :default => 0 }
      t.string :status, { :default => 'active'}

      t.timestamps
    end
  end
end
