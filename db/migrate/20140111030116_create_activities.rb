class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.string :color, :default => "FFFFFF"
      t.timestamps
    end
  end
end
