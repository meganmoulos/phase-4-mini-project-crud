class SpicesController < ApplicationController
    # GET /spices
    def index
        spices = Spice.all
        render json: spices
    end

    # POST /spices
    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    # PATCH /spices/:id
    def update
        spice = find_spice
        if spice
            spice.update(spice_params)
            render json: spice
        else
            error_handle
        end
    end
    
    # DELETE /spices/:id
    def destroy
        spice = find_spice
        if spice
            spice.destroy
            head :no_content
        else
            error_handle
        end
    end

    def find_spice
        Spice.find_by(id: params[:id])
    end

    def error_handle
        render json: {error: "Spice not found"}, status: :not_found
    end
    private 

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
end
