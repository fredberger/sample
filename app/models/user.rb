class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/default-avatar.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  after_create :send_welcome_email

  def admin?
    role == 1
  end

  def short_email
    email.split('@').first
  end

  def send_welcome_email
    MailWorker.perform_async(id)
  end
end
