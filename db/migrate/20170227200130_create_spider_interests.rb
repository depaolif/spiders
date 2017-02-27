class CreateSpiderInterests < ActiveRecord::Migration[5.0]
  def change
    create_table :spider_interests do |t|
      t.integer :spider_id
      t.integer :interest_id
    end
  end
end
