class Comment < ApplicationRecord

  belongs_to :member
  belongs_to :post
  has_many :notifications, dependent: :destroy
  has_many :reports, dependent: :destroy

  validates :comment,       presence: :true

end
