class User < ActiveRecord::Base

  has_secure_password

  validates_presence_of :password, on: :create

  has_many :posts

  validates :name,
    presence: true,
    length: {maximum: 20}

  validates :email,
    presence: true,
    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create },
    uniqueness: {case_sensitve: false}

  validates :password,
    presence: true,
    :on => :create

  def self.authenticate email, password
    User.find_by_email(email).try(:authenticate, password)
  end

end
