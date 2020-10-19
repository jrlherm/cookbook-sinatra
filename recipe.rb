class Recipe
  attr_reader :name, :description, :rating, :prep_time

  def initialize(name, description, rating, prep_time, done = false)
    @name = name
    @description = description
    @rating = rating || 0
    @prep_time = prep_time || "unknown preptime"
    @done = done
  end

  def done?
    return @done
  end

  def done!
    @done = true
  end
end
