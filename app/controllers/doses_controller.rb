class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find("cocktail_id")
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
    render :new
    end
  end

  def destroy
    @cocktail =
    @dose = dose.find(params[:id])
    @dose.destroy
    redirect to cocktail_path(@cocktail)
  end
end
