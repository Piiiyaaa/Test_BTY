class PostsController < ApplicationController
    def index
        @posts = Post.includes(:user)
    end

    def new
        @post = Post.new
    end

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            redirect_to posts_path, notice: "Good posts!"
        else
            flash.now[:alert] = "try again"
            render :new, status: :unprocessable_entity
        end
    end

    private

    def post_params
      params.require(:post).permit(:title, :body, :learning_date)
    end
end
