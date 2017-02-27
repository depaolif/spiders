class ApplicationController < Sinatra::Base

  configure do
    set :views, "app/views"
    enable :sessions
    set :session_secret, "password_security"
  end

  get "/" do
    @logged_in = logged_in?
    erb :index
  end

  get "/signup" do
    erb :signup
  end

  get "/login" do
    erb :login
  end

  get "/logout" do
    session.clear
    redirect to "/"
  end

  get "/account" do
    if session[:id]
      @spider = Spider.find(session[:id])
    else
      redirect '/nologin'
    end
    erb :account
  end

  get "/nologin" do
    # have page telling user they are not logged in
    erb :nologin
  end

  helpers do
    def logged_in?
      !!session[:id]
    end

    def current_user
      Spider.find(session[:id])
    end
  end

end
