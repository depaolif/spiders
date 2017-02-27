class CreateSpiders < ActiveRecord::Migration[5.0]
  def change
    create_table :spiders do |t|
      t.string :name
      t.integer :user_id
      t.string :type
      t.string :mood
      t.integer :level
      t.boolean :alive
      t.boolean :status
    end
  end
end
