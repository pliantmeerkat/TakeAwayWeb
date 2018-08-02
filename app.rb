require 'sinatra/base'
require 'sinatra/flash'
require './model/db_processor'
require './model/menu'
# Main application class
class App < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @menu = Menu.new(DbProcessor.new('TakeAwayWeb_test'))
    @items = @menu.menu
    erb(:index)
  end

  run! if app_file == $PROGRAM_NAME

end
