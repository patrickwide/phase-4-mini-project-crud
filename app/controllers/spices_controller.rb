class SpicesController < ApplicationController
    before_action :set_spice, only: [:show, :update, :destroy]
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  
    def index
      spices = Spice.all
      render json: spices
    end
  
    def show
      render json: @spice
    end
  
    def create
      spice = Spice.create(spice_params)
      render json: spice, status: :created
    end
  
    def update
        @spice.update(spice_params)
        render json: @spice
    end
  
    def destroy
      @spice.destroy
      head :no_content
    end
  
    private

    def render_not_found_response
        render json: { error: "Spice not found"}, status: :not_found
    end
  
    def set_spice
      @spice = Spice.find_by(id: params[:id])
    end
  
    def spice_params
      params.permit(:title, :image, :description, :notes, :rating)
    end
end
  