class ScrapeAllrecipesService
  def initialize(keyword)
    @keyword = keyword
  end

  def call
    # TODO: return a list of `Recipes` built from scraping the web.
    # Make HTTP Request to the website with the keyword
    url = "https://www.marmiton.org/recettes/recherche.aspx?aqt=#{@keyword}"
    doc = Nokogiri::HTML(open(url), nil, 'utf-8')

    # Parse & extract the first 5 recipes
    scrapped_results = []
    doc.search('.recipe-card-link').first(5).each do |element|
      title = element.search('.recipe-card__title').text
      description = element.search('.recipe-card__description').text
      rating = element.search('.recipe-card__rating__value').text
      prep_time = element.search('.recipe-card__duration__value').text
      scrapped_results << Recipe.new(title, description, rating, prep_time)
    end
    scrapped_results
  end
end
