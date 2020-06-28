class DestinationsController < ApplicationController

    def index
        @destinations = Destination.all
    end

    def show
        @destination = Destination.find(params[:id])
    end

    def new
        @destination = Destination.new
    end

    def create
        @destination = Destination.new(destination_params)
        if @destination.save
            redirect_to @destination
        else
            flash[:message] = @destination.errors.full_messages
            render :new
        end
    end

    def edit
        @destination = Destination.find(params[:id])
    end

    def update
        @destination = Destination.find(params)
        if @destination.update(destination_params)
            redirect_to @destination
        else
            flash[:message] = @destination.errors.full_messages
            render :edit
        end
    end

    def destroy
        @destination.delete
        redirect_to destinations_path
    end

    def destination_params
        params.require(:destination).permit(:name, :country)
    end

end