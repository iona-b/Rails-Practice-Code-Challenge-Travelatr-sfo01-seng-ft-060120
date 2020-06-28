class BloggersController < ApplicationController

    def index
        @bloggers = Blogger.all
    end

    def show
        @blogger = Blogger.find(params[:id])
    end

    def new
        @blogger = Blogger.new
    end

    def create
        @blogger = Blogger.new(blogger_params)
        if @blogger.save
            redirect_to @blogger
        else
            flash[:message] = @blogger.errors.full_messages
            render :new
        end
    end

    def edit
        @blogger = Blogger.find(params[:id])
    end

    def update
        @blogger = Blogger.find(params[:id])
        if @blogger.update(blogger_params)
            redirect_to @blogger
        else
            flash[:message] = @bloggers.errors.full_messages
            render :edit
        end
    end

    def destroy
        @blogger = Blogger.find(params[:id])
        @blogger.delete
        redirect_to bloggers_path
    end

    def blogger_params
        params.require(:blogger).permit(:name, :bio, :age)
    end

end