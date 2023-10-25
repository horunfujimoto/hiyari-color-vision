class Vision < ApplicationRecord

  belongs_to :member
  belongs_to :post
  has_many :favorites, dependent: :destroy

  validates :member_id,     presence: :true
  validates :post_id,       presence: :true
  validates :improvement,   presence: :true, length: { in: 1..1200 }
  validates :closing_day,   presence: :true
  validates :double_check,  presence: :true, length: { in: 1..20 }

  #引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べ存在していればtrue
  def favorited_by?(member)
    favorites.exists?(member_id: member.id)
  end

end
