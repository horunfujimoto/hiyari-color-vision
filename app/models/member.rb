class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name,      presence: true
  validates :email,             presence: true
  validates :encrypted_password,presence: true
  validates :company_password,  presence: true

  has_many :posts, dependent: :destroy
  has_many :visions, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :record_pdfs, dependent: :destroy

  # 通知機能
  # 外部キーを設定することで、memberモデルのidカラムが、Notificationモデルのvisitor_idとvisited_idと関連付けられる
  has_many :active_notifications,  class_name: "Notification", foreign_key: "visiter_id", dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy

  #会員ステータス
  enum is_active: { active: 0, banned: 1, inactive: 2 }

  def active_for_authentication?
   super && (is_active == 'active')
  end

  #ゲストログイン機能
  GUEST_MEMBER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_MEMBER_EMAIL) do |member|
      member.password = SecureRandom.urlsafe_base64
      member.name = "guest member"
      member.company_password = "000000"
      member.company_password_confirmation = "000000"
      member.industry = "業界"
      member.company = "会社"

    end
  end

  def guest_member?
    email == GUEST_MEMBER_EMAIL
  end

  # #停止機能
  # after_update :schedule_status_update, if: :status_changed_to_1?
  # def status_changed_to_1?
  #   status_changed? && is_active == 1
  # end

  # def schedule_status_update
  #   UpdateStatusJob.set(wait: 1.minute).perform_later(self)
  # end

end
