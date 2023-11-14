class Report < ApplicationRecord

  # 通報者を示す関連付け
  belongs_to :reporter, class_name: "Member", foreign_key: "reporter_id"
  # 通報対象を示す関連付け
  belongs_to :reported, class_name: "Member", foreign_key: "reported_id"
  # 通報対象のコンテンツ関連付け
  belongs_to :post,         optional: true
  belongs_to :comment,      optional: true

  # 通報理由の列挙型（Enum）
  enum reason: {
    malicious_expression: 0,      # 悪意のある表現
    inappropriate_content: 1,     # 不適切なコンテンツ
    misinformation: 2,            # 誤った情報
    commercial_purposes: 3,       # 商業目的
    spam: 4,                      # スパム
    other: 5                      # その他
  }
  validates :reason, inclusion: { in: Report.reasons.keys }

end
