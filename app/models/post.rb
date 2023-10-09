class Post < ApplicationRecord

  belongs_to :member
  belongs_to :tag
  has_one :vision, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :tag_id,      presence: :true
  validates :image,       presence: :false
  validates :title,       presence: :true, length: { in: 1..60 }
  validates :body,        presence: :true, length: { in: 1..500 }
  validates :place,       presence: :true

  has_one_attached :image # imageカラムが追記されたかのように扱うことができる
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')# 画像がない場合はimages/no-image.jpgを参照
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def self.search(keyword)
    where(["title LIKE? or body LIKE? or place LIKE?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
  end

  # 通知機能Comment method (create)
  def create_notification_comment!(current_member, comment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    others_comment_ids = Comment.select(:member_id).where(post_id: id).where.not(member_id: current_member.id).distinct #distinctする場合は、selectとしてから
    others_comment_ids.each do |other_comment_id|
      save_notification_comment!(current_member, @comment.id, other_comment_id['member_id'])
    end
    save_notification_comment!(current_member, comment_id, member_id) if others_comment_ids.blank?
  end

  # 通知機能Comment method (save)
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

end
