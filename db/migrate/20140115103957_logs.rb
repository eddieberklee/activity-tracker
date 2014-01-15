class Logs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :activity_id
      t.boolean :checked, :default => false

      t.timestamps
    end
  end
end
