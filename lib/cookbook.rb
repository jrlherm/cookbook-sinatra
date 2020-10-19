require 'csv'
require_relative 'recipe'
# require_relative 'controller'

class Cookbook
  # attr_reader :csv_file_path

  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    parse_csv
  end

  # Give access to all recipes
  def all
    @recipes
  end

  # Add a recipe
  def add_recipe(recipe)
    # Append new recipe in recipes array
    @recipes << recipe
    store_csv
  end

  # Remove a recipe
  def remove_recipe(index)
    @recipes.delete_at(index)
    store_csv
  end

  def its_done(index)
    @recipes[index].done!
    store_csv
  end

  def parse_csv
    CSV.foreach(@csv_file_path) do |row|
      @recipes << Recipe.new(row[0], row[1], row[2], row[3], row[4] == "true")
    end
  end

  def store_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.rating, recipe.prep_time, recipe.done?]
      end
    end
  end
end
