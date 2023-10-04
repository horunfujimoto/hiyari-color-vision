class Vision < ApplicationRecord

  belongs_to :member
  belongs_to :post
  has_many :favorites, dependent: :destroy

end
