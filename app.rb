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

  get '/order' do
    @processed_order = @order.item_list
    erb(:order)
  end

  get '/menu-maker' do
    erb(:menu_maker)
  end

  post '/add' do
    @order.add_item_to_list(name: params.values.join, price: params.keys.join.to_i)
    redirect('/menu')
  end

  post '/remove' do
    @order.rm_item_from_list(name: params.values.join, price: params.keys.join.to_i)
    redirect('/menu')
  end

  post '/order_place' do
    redirect('/order')
  end

  run! if app_file == $PROGRAM_NAME

end
