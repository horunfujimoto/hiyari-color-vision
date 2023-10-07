class Vision < ApplicationRecord

  belongs_to :member
  belongs_to :post
  has_many :favorites, dependent: :destroy

  validates :member_id,     presence: :true
  validates :post_id,       presence: :true
  validates :closing_day,   presence: :true
  validates :improvement,   presence: :true, length: { in: 1..1000 }
  validates :double_check,  presence: :true, length: { in: 1..20 }

end
