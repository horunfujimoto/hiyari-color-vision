class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|

      #必須機能実装後記述

      t.timestamps
    end
  end
end
