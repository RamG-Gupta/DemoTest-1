class SessionsController < ApplicationController
  def new

  end

def create
	
	user = User.find_by(email: params[:email])
	if user && user.authenticate(params[:password])
		session[:user_id] = user.id
		render json: {:id => user[:id],response: 200, responsemsg: "success"}
	else
		flash.now.alert = "email or password is invalid"
		render json: {:article => "response code: 400, response message: Bad Request"}
	end
end 
def destroy
	session[:user_id] = nil
	redirect_to users_url, notice: 'logged out'
 
end

begin  
def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    render json: {:user => user,response: 200, responsemsg: "success"}

end
def destroy
	session[:user_id] = nil
	redirect_to users_url, notice: 'logged out'
 
end
end
end
