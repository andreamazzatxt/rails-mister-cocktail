class DosesController < ApplicationController
  def create
    dose = Dose.new(dose_params)
    dose.cocktail = Cocktail.find(params[:cocktail_id])
    dose.ingredient = ingredient_instance
    dose.save
    redirect_to cocktail_path(dose.cocktail)
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

  def ingredient_instance
    ingredient_id = params.require('dose').permit(:ingredient)[:ingredient]
    Ingredient.find(ingredient_id)
  end
end
