class PostsController < ApplicationController
    def index
        @posts = Post.includes(:user)
    end

    def new
        @post = Post.new
        @post.build_daily_question
    end

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            redirect_to posts_path, notice: "学びの振り返りが投稿されました!"
        else
            flash.now[:alert] = @post.errors.full_messages.join(", ")
            render :new, status: :unprocessable_entity
        end
    end

    def show
        @post = Post.find(params[:id])
        @daily_question = @post.daily_question
    end

    private

    def post_params
      params.require(:post).permit(:title, :body, :learning_date, :image, 
      daily_question_attributes: [ :body, :question_answer ])
    end
end
