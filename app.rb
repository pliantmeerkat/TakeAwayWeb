require 'sinatra/base'
require 'sinatra/flash'
require './model/db_processor'
require './model/menu'
require './model/order'
# Main application class
class App < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  before do
    @order = Order.instance
  end

  get '/' do
    @order = Order.create
    redirect('/menu')
  end

  get '/menu' do
    @menu = Menu.new(DbProcessor.new)
    @items = @menu.menu
    erb(:index)
  end

  post '/add' do
    @order.add_item_to_list(name: params.values.join, price: params.keys.join.to_i)
    redirect('/menu')
  end

  run! if app_file == $PROGRAM_NAME

end
