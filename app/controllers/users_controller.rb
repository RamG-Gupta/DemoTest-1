class UsersController < ApplicationController
	def index
        @users = User.all
         render json: {:user => @users}
    end

def new
	@user = User.new
end

def create
	@user = User.new(user_params)
	if @user.save!
        UserMailer.signup_confirmation(@user).deliver_now
		# session[:user_id] = user.id
		#redirect_to  sessions_new_url
		render json: { :user => @user,response: 200, responsemsg: "success"}
	else
		render json: { responsecode: 400, responsemessage: "Bad Request"}
    end
    
end

def update
        user = User.find(params[:id])

    if user.update(user_params)

            render json: {responsecode: 200, responsemessage: "Successfull"}
             
    else
            render json: {responsecode: 400, responsemessage: "Bad Request"}
    end
end


def destroy
    user = User.find(params[:id])
    if user.destroy
           render json: {responsecode: 200, responsemessage: "Successfull"}
    else
           render json: {responsecode: 400, responsemessage: "Bad Request"}
    end
end


def forget_password
@user = User.find_by_email("email@email.com")
    if @user.present?
    @user.send_reset_password_instructions
    render :text => "updated"
    else
         render :text => "no such email"
    end
end


private

def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :dob, :state, :country,:image)
end


end
