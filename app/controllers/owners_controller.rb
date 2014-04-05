class OwnersController < ApplicationController

  def index
    @owners = Owner.all
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)
    if @owner.save
      redirect_to new_owner_path, notice: 'Owner Added to Listing'
    else
      render :new
    end
  end

  def show
    @owner = Owner.find(params[:id])
  end

  def destroy
    @owner = Owner.find(params[:id])
    @owner.destroy
    respond_to do |format|
      format.html { redirect_to owners_url, notice: 'Deleted successfully' }
      format.json { head :no_content }
    end
  end

  private

  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :email, :company_name)
  end
end
