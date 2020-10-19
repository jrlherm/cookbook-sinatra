require_relative 'view'
require_relative 'scrape_allrecipes_service'
require 'open-uri'
require 'nokogiri'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    @view.display(@cookbook.all)
  end

  def create
    name = @view.ask(:name)
    description = @view.ask(:description)
    rating = @view.ask_rating
    prep_time = @view.ask_prep_time
    recipe = Recipe.new(name, description, rating, prep_time)
    @cookbook.add_recipe(recipe)
  end

  def destroy
    @view.display(@cookbook.all)
    index = @view.ask_index(:index)
    @cookbook.remove_recipe(index)
  end

  def scrap_recipes
    # Ask user for a keyword
    keyword = @view.ask_keyword(keyword)
    scrapped_results = ScrapeAllrecipesService.new(keyword).call

    # Display them with index
    @view.display_scrapped_results(scrapped_results)

    # Ask user wich one they want
    user_choice = @view.ask_new_recipe_index
    user_choice = scrapped_results[user_choice]
    # Import it to the cookbook
    @cookbook.add_recipe(user_choice)
  end

  def mark_as_done
    # Display the recipes list
    @view.display(@cookbook.all)
    # Ask user wich recipe he wants to mark as done
    index = @view.mark_as_done_index
    @cookbook.its_done(index)
    # Change the instance value to true
  end
end
