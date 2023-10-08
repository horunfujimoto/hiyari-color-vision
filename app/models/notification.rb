class Notification < ApplicationRecord

  # レコードのデフォルトの並び順を降順（新しいものから古いものへ）にする
  default_scope -> { order(created_at: "DESC") }

  # optional: true:は関連付けられたデータがなくても大丈夫！という設定
  belongs_to :post,         optional: true
  belongs_to :comment,      optional: true
  belongs_to :visiter,      class_name: "Member", foreign_key: "visiter_id", optional: true
  belongs_to :visited,      class_name: "Member", foreign_key: "visited_id", optional: true

end
