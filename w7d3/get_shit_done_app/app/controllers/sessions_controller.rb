class SessionsController < ApplicationController

    def new
        render :new
    end
    
    def create
        user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if user
            login!(user)
            redirect_to users_url
        else
            # someone entered the username and password and couldnt log in
            flash[:error] = ['wrong information, get your facts to get shit done! TRY AGAIN!']
            redirect_to new_session_url
        end
                    #   new_session GET    /session/new(.:format)                                                                   sessions#new

    end

    def destroy
        if logged_in?
            logout!
        end
        redirect_to new_session_url
    end
end
