class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|

      t.integer :reporter_id, null: false
      t.integer :reported_id, null: false
      t.integer :post_id
      t.integer :comment_id
      t.integer :reason, null: false
      t.boolean :checked, null: false, default: false

      t.timestamps
    end
  end
end
