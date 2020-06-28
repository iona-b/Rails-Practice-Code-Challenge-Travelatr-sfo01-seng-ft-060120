class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to @post
        else
            flash[:message] = @post.errors.full_messages
            render :new
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params)
        if @post.update(post_params)
            redirect_to @post
        else
            flash[:message] = @post.errors.full_messages
            render :edit
        end
    end

    def like
        @post = Post.find(params[:id])
        num_likes = @post.likes +=1
        if @post.update(likes: num_likes)
            redirect_to @post
        else
            render @post
        end
    end

    def destroy
        @post.delete
        redirect_to posts_path
    end

    def post_params
        params.require(:post).permit(:title, :content, :blogger_id, :destination_id, :likes)
    end
    
end