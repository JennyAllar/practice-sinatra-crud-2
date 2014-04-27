require 'sinatra/base'

class Application < Sinatra::Application

  def initialize(app=nil)
    super(app)

    # initialize any other instance variables for you
    # application below this comment. One example would be repositories
    # to store things in a database.

  end

  get '/' do
    erb :index, locals: {array_of_bikes: DB[:bikes].to_a}

  end

  get '/bikes/new' do
    erb :"bikes/new"
  end

  post '/bikes' do
    DB[:bikes].insert(brand: params[:brand], model: params[:model], year_made: params[:year_made])
    redirect '/'
  end
end