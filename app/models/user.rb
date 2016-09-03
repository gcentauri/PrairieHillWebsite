class User < ActiveRecord::Base
  
  TEMP_EMAIL_PREFIX = 'guest@phill'
  TEMP_EMAIL_REGEX = /\Aguest@phill/
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update
  
  has_many :shifts
  has_many :guests

  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login

  def self.find_for_oauth(auth, signed_in_resource = nil)
    # Get the identity and user if they exist
    identity = Identity.find_for_oauth(auth)

    # If a signed_in_resource is provided it always overrides the existing user
    # to prevent the identity being locked with accidentally created accounts.
    # Note that this may leave zombie accounts (with no associated identity) which
    # can be cleaned up at a later date.
    user = signed_in_resource ? signed_in_resource : identity.user

    # Create the user if needed
    if user.nil?

      # Get the existing user by email if the provider gives us a verified email.
      # If no verified email was provided we assign a temporary email and ask the
      # user to verify it on the next step via UsersController.finish_signup
      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified
      user = User.where(:email => email).first if email

      # Create the user if it's a new registration
      if user.nil?
        # user = User.create!(
        #   confirmed_at: Time.now,
        #   name: auth.extra.raw_info.name,
        #   username: auth.info.nickname || auth.uid,
        #   email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
        #   password: Devise.friendly_token[0,20]
        # )

        user = User.new(
          name: auth.extra.raw_info.name,
          username: auth.info.nickname || auth.uid,
          email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
          password: Devise.friendly_token[0,20],
          confirmed_at: Time.now
        )
        #user.skip_confirmation!
        user.save!
      end
    end

    # Associate the identity with the user if needed
    if identity.user != user
      identity.user = user
      #identity.user.skip_confirmation!
      identity.save!
    end
    user
  end

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end
  
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

  # private
  # def skip_email_confirm
  #   self.skip_confirmation!
  # end

  protected
  def confirmation_required?
    false
  end
end
