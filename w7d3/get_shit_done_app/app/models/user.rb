class User < ApplicationRecord
    validates :username, :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: true
    validates :password, length: {minimum: 6, allow_nil: true}
    # this happens after user.new
    after_initialize :ensure_session_token
    # .new > after_initialize > .save > before_validation > validates
    
    attr_reader :password

    # SPIRE
    # PERCS

    def self.find_by_credentials(username, password)
        # find user
        user = User.find_by(username: username)
        # check if user exists && check if password is correct
            # return user
        # else
            # nil
        user && user.check_password?(password) ? user : nil
        # if user && user.is_password?(password)
        #     user
        # else
        #     nil
        # end
    end

    def password=(password)
        # create a password digest BCrypt, save it as user's password_digest
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def check_password?(password)
        # verify that the BCrypt models obj password == plain text password
        # change password digest to string and verify?

        password_object = BCrypt::Password.new(self.password_digest)
        # check here
        password_object.is_password?(password)
    end

    def reset_session_token!
        # first we assign a session token, save, and then return
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
        self.session_token
    end

    def ensure_session_token
        # used to set the session's token, if session's token doesnt exist we make one
        self.session_token ||= SecureRandom::urlsafe_base64
    end

end
