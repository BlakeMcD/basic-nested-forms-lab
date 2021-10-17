class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    # Create Stubs
    @recipe.ingredients.build(name: "First Ingredient")
    @recipe.ingredients.build(name: "Second Ingredient")
  end

  def create
    Recipe.create(recipe_params)
    redirect_to recipes_path
  end

  # def title=(title)
  # self.title = params([:recipe][:title])
  # end

  def recipe_params
    params.require(:recipe).permit(
      :title, 
      ingredients_attributes: [:name, :quantity]
    )
  end

end
