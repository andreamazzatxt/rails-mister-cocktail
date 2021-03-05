class DosesController < ApplicationController
  def create
    unless dose_params[:description] == '' || ingredient_id == ''
      dose = Dose.new(dose_params)
      dose.cocktail = Cocktail.find(params[:cocktail_id])
      dose.ingredient = Ingredient.find(ingredient_id)
      dose.save
    end
    redirect_to cocktail_path(params[:cocktail_id])
  end

  def destroy
    dose = Dose.find(params[:id])
    dose.destroy

    redirect_to cocktail_path(dose.cocktail)
  end

  private

  def dose_params
    params.require('dose').permit(:description)
  end

  def ingredient_id
    params.require('dose').permit(:ingredient)[:ingredient]
  end
end
