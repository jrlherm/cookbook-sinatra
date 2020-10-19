require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"

require_relative "cookbook"
require_relative "recipe"

set :bind, '0.0.0.0'

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

# L E T ' S  G O

# Index page
get '/' do
  cookbook = Cookbook.new(File.join(__dir__, 'recipes.csv'))
  @recipes = cookbook.all
  erb :index
end

get '/new' do
  @recipe = param[:recipe]
  erb :new
end

# # About page
# get '/about' do
#   erb :about
# end

# # About subpages
# get '/team/:username' do
#   puts params[:username]
#   "The username is #{params[:username]}"
# end
