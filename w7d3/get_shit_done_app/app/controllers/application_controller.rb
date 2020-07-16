class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    # crrlll

    def current_user
        # who is our current user?
        # the session_token(key) is telling find_by this category
        # look for session token that matches the user's session_token
        # .find_by specifies which category
        # .find is always looking for id
        # user = User.find_by
        # if user
        #   do this
        # else
        #   redirect_to
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def require_logged_in!
        # redirect for these two
        redirect_to new_session_url if !logged_in?
    end

    def require_logged_out
        redirect_to users_url if logged_in?
    end

    def login!(user)
        # website sends cookie to user's browser with the session's session token
        session[session_token] = user.reset_session_token!
    end

    def logout!
        # reset current_user's session_token, nilify the session's session_token 
        current_user.reset_session_token! #the session hash in the browser's session_token doesnt match the session session_tokenin our DB
        session[:session_token] = nil #disconnect the connection between browser and user
        current_user = nil 
    end

    def logged_in?
        !!current_user
    end
end
