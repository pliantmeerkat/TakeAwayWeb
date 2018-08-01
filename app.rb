require 'sinatra/base'
require 'sinatra/flash'

class App < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do

  end

end
