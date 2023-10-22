class Post < ApplicationRecord

  belongs_to :member
  belongs_to :tag
  has_one :vision, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :title,       presence: :true, length: { in: 1..60 }
  validates :body,        presence: :true, length: { in: 1..500 }
  validates :image,       presence: :false
  validates :place,       presence: :true
  validates :tag_id,      presence: :true

  has_one_attached :image # imageカラムが追記されたかのように扱うことができる
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')# 画像がない場合はimages/no-image.jpgを参照
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  # 検索機能
  def self.search(keyword)
    where(["title LIKE? or body LIKE? or place LIKE?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
  end

  # 投稿主にコメントがついたことを通知する
  def create_notification_comment!(current_member, comment)
    save_notification_comment!(current_member, comment.id, comment.post.member_id)
  end

  # コメントメソッド
  def save_notification_comment!(current_member, comment_id, visited_id)
    notice = current_member.active_notifications.new(
      post_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: "comment"
    )
    if notice.visiter_id == notice.visited_id
      notice.checked = true
    end
    notice.save if notice.valid?
  end

  enum open_status: { disclosure: 0, unopened: 1, full_disclosure: 2 }
  enum level_status: { mild: 0, moderate: 1, severe: 2 }

  # 並び替え・フィルター
  scope :latest, -> { order(created_at: :desc) }  # 登録新しい順
  scope :old, -> { order(created_at: :asc) }      # 登録古い順
  scope :level_low, -> { order(level_statuses: :desc) }   # 軽度
  scope :level_middle, -> { order(level_statuses: :desc) } # 中等度
  scope :level_high, -> { order(level_statuses: :desc) } # 重度
  scope :vision_presence, -> { joins(:vision).distinct } # 改善案がある
  scope :vision_absence, -> { left_joins(:vision).where(visions: { id: nil }) }# 改善案がない

end
