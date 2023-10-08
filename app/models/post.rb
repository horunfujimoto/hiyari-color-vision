class Post < ApplicationRecord

  belongs_to :member
  belongs_to :tag
  has_one :vision, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :tag_id,      presence: :true
  validates :image,       presence: :false
  validates :title,       presence: :true, length: { in: 1..60 }
  validates :body,        presence: :true, length: { in: 1..500 }
  validates :place,       presence: :true

  has_one_attached :image #imageカラムが追記されたかのように扱うことができる
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')# 画像がない場合はimages/no-image.jpgを参照
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  enum open_status: { disclosure: 0, unopened: 1, full_disclosure: 2 }
  enum level_status: { mild: 0, moderate: 1, severe: 2 }

end
