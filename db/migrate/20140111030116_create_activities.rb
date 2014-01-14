class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.boolean :checked, :default => false
      t.timestamps
    end
  end
end
