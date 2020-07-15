# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    validates :email, :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: true
    validates :password, length: { minimum: 5, allow_nil: true }
    after_initialize :ensure_session_token #create instance(.new) => after_initialize => save to database(.save) => before_validation => validate

    attr_reader :password

    # P E R C S

    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end

    #E

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end

    #R

    def reset_session_token!
        self.session_token = User.generate_session_token
        self.save!
        self.session_token
    end

    #P

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    #C

    def check_password?(password)
        password_object = BCrypt::Password.new(self.password_digest)
        password_object.is_password?(password)
    end

    #S

    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)
        if user && user.check_password?(password)
            user
        else 
            nil
        end 
    end
end
