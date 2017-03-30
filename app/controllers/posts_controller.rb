class PostsController < ApplicationController
	def index
@post = Post.all
render json: {:post=> @post}
end


def create
	@event = Event.find(params[:event_id])
	if @event.blank?
			return render json: {response: 500,msg: "user not found"}
	end
    	@post = @event.posts.create(post_params)
 
		if @post.save!
			render json: {response: 200,msg: "comment Created", post: @post}
		else
			render json: {response: 500,msg: "Event Not Created"}
		end
    
  end
 
 

  private 

def post_params
			params.require(:post).permit(:name,:content,:user_id)

end
end
