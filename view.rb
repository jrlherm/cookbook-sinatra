class View
  # Display recipes
  def display(recipes)
    recipes.each_with_index do |recipe, index|
      status = recipe.done? ? "[x]" : "[ ]"
      puts "#{index + 1}. #{status} #{recipe.name}"
      puts recipe.description.strip
      puts "Rating : #{recipe.rating} / 5"
      puts "Preptime : #{recipe.prep_time}"
      puts "\n"
    end
  end

  def display_scrapped_results(scrapped_results)
    scrapped_results.each_with_index do |recipe, index|
      puts "#{index + 1} - #{recipe.name} - #{recipe.rating} / 5 - Preptime : #{recipe.prep_time}"
    end
  end

  # Ask name/description for new recipes
  def ask(name_or_desc)
    puts "-------------------------------------------------"
    puts "Give a #{name_or_desc} to your recipe"
    puts "-------------------------------------------------"
    gets.chomp
  end

  # Ask index to delete it
  def ask_index(index)
    puts "-------------------------------------------------"
    puts "What's the index of the recipe you want to delete"
    puts "-------------------------------------------------"
    gets.chomp.to_i - 1
  end

  # Ask keyword you want to search for
  def ask_keyword(keyword)
    puts "-------------------------------------------------"
    puts "What keyword do you wanna use for the search?"
    puts "-------------------------------------------------"
    gets.chomp
  end

  def ask_new_recipe_index
    puts "-------------------------------------------------"
    puts "Which recipe would you like to import? (index)"
    puts "-------------------------------------------------"
    gets.chomp.to_i - 1
  end

  def ask_rating
    puts "-------------------------------------------------"
    puts "What rating do you give to your new recipe?"
    puts "-------------------------------------------------"
    gets.chomp
  end

  def ask_prep_time
    puts "-------------------------------------------------"
    puts "How many time is needed to cook this recipe?"
    puts "-------------------------------------------------"
    gets.chomp
  end

  def mark_as_done_index
    puts "-------------------------------------------------"
    puts "Wich recipe would you like to mark as done? (index)"
    puts "-------------------------------------------------"
    gets.chomp.to_i - 1
  end
end
