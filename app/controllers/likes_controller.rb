class LikesController < ApplicationController
	def index
	@likes = Like.all
	#render json: {like: @like}
end	

def create

@event = Event.find(params[:event_id])

if @event.blank?
			return render json: {response: 500,msg: "user not found"}
end	

@like = @event.likes.create(like_params)

 if @like.save!
			render json: {response: 200,msg: "liked", like: @like}
		else
			render json: {response: 500,msg: "Event Not liked"}
		end
end

def index_post

@like = Like.all
render json: {like: @like}
end


def create_post
@post = Post.find(params[:post_id])

if @post.blank?
			return render json: {response: 500,msg: "post not found"}
end	

@like = @post.likes.create(like_params)

 if @like.save!
			render json: {response: 200,msg: "liked", like: @like}
		else
			render json: {response: 500,msg: "post not like"}
		end
end
 private

    def like_params
      params.require(:like).permit(:status,:user_id)
    end


end
