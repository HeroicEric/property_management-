class BuildingsController < ApplicationController
  def index
    @buildings = Building.all
  end

  def new
    @building = Building.new
    @states = ['MA', 'VA', 'CT']
    @owner = Owner.all.map{ |c| [c.first_name, c.id] }
  end

  def create
    @building = Building.new(building_params)

    if @building.save
      redirect_to owners_path, notice: 'Building Added to Listing'
    else
      @owner = Owner.all.map{ |c| [c.first_name, c.id] }
      render :new
    end
  end

  def show
    @building = Building.find(params[:id]) 
  end

  def destroy
    @building = Building.find(params[:id])
    @building.destroy
    respond_to do |format|
      format.html { redirect_to owners_url, notice: 'Deleted successfully' }
      format.json { head :no_content }
    end
  end

  private

  def building_params
    params.require(:building).permit(:address, :city, :state, :postal_code, :description)
  end
end
