
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username,
            presence: true,
            length: {maximum: 255},
            uniqueness: { case_sensitive: false },
            format: { with: /\A[a-zA-Z0-9]*\z/,
                      message: "may only contain letters and numbers." }

  has_many :shifts
  #has_many :activities through: :shifts

  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login


  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      # when allowing distinct User records with, e.g., "username" and "UserName"...
      # where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
    else
      where(conditions).first
    end
  end

  #### This is the correct method you override with the code above
  #### def self.find_for_database_authentication(warden_conditions)
  #### end
end
