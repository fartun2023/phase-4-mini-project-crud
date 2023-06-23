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
      spice = Spice.find(params[:id])
      if spice.update(spice_params)
        render json: spice, status: :ok
      else
        render json: { error: "Failed to update spice" }, status: :unprocessable_entity
      end
    end
  
    # DELETE /spices/:id
    def destroy
      spice = Spice.find(params[:id])
      if spice.destroy
        head :no_content
      else
        render json: { error: "Failed to delete spice" }, status: :unprocessable_entity
      end
    end
  
    private
  
    def spice_params
      params.require(:spice).permit(:title, :image, :description, :notes, :rating)
    end
  end