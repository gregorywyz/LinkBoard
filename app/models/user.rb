class User < ActiveRecord::Base

  has_secure_password

  validates_presence_of :password, on: :create

  has_many :posts

  validates :name,
    presence: true,
    length: {maximum: 20}

  validates :email,
    presence: true,
    # email: ,
    uniqueness: {case_sensitve: false}

  validates :password,
    presence: true

  def self.authenticate email, password
    User.find_by_email(email).try(:authenticate, password)
  end

end
