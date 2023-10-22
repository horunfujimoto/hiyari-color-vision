class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.integer :member_id, null: false
      t.integer :tag_id, null: false
      t.string :title, null: false
      t.string :body, null: false
      t.string :place, null: false
      t.integer :open_status, null: false, default: 0
      t.integer :level_status, null: false, default: 0
      t.datetime :occurrence_at, null: false

      t.timestamps
    end
  end
end
