class CreateVisions < ActiveRecord::Migration[6.1]
  def change
    create_table :visions do |t|

      t.integer :member_id, null: false
      t.integer :post_id, null: false
      t.datetime :closing_day, null: false
      t.string :improvement, null: false
      t.string :double_check, null: false

      t.timestamps
    end
  end
end
