class ApplicationController < Sinatra::Base

  configure do
    set :views, "app/views"
    enable :sessions
    set :session_secret, "password_security"
  end

  get "/" do
    erb :index
  end

  get "/signup" do
    erb :signup
  end

  get "/login" do
    erb :login
  end

  get "/account" do
    if session[:id]
      @user = User.find(session[:id])
    else
      redirect '/nologin'
    end
    erb :account
  end

  get "/nologin" do
    # have page telling user they are not logged in
    erb :nologin
  end

end
