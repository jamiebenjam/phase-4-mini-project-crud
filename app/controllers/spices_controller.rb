class SpicesController < ApplicationController
    before_action :find_spice, only: [:update, :destroy]
    
    #index
    def index
        render json: Spice.all
    end

    #post
    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    #patch
    def update
        @spice.update(spice_params)
        render json: @spice
    end

    #destroy
    def destroy
        @spice.destroy
        head :no_content
    end    

    private

    def find_spice
        @spice = Spice.find(params[:id])
    end

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

end
