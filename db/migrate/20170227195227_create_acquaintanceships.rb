class CreateAcquaintanceships < ActiveRecord::Migration[5.0]
  def change
    create_table :acquaintanceships do |t|
      t.integer :spider_id
      t.integer :acquaintance_id
    end
  end
end
