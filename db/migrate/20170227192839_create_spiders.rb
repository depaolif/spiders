class CreateSpiders < ActiveRecord::Migration[5.0]
  def change
    create_table :spiders do |t|
      t.string :name
      t.string :password_digest
      t.string :spider_type
      t.string :mood
      t.integer :level
      t.boolean :alive
      t.boolean :status
    end
  end
end
