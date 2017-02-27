require 'pry'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  configure do
    register Sinatra::ActiveRecordExtension
    set :views, "app/views"
    enable :sessions
    set :session_secret, "password_security"
    use Rack::Flash
  end

  get "/" do
    @logged_in = logged_in?
    erb :index
  end

  get "/signup" do
    erb :signup
  end

  post "/signup" do
    spider = Spider.create(params[:spider])
    if spider.name && spider.spider_type && spider.password && spider.authenticate(params[:spider][:password])
      spider.update(level: 1, alive: true, mood: "happy to be alive")
      session[:id] = spider.id
      redirect to '/newaccount'
    else
      flash[:message] = "A Spider needs a name, password, and type."
      redirect to '/signup'
    end
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
      erb :account
    else
      redirect to '/nologin'
    end
  end

  get "/nologin" do
    # have page telling user they are not logged in
    erb :nologin
  end

  get "/newaccount" do
    @spider = Spider.find(session[:id])
    erb :new_account
  end

  patch "/update/:id" do
    @spider = Spider.find(session[:id])
    found_friend = Spider.find_by(name: params[:spider][:acquaintance])
    binding.pry
    if found_friend
      @spider.acquaintances << found_friend
    elsif params[:spider][:acquaintance] != ""
      # no spider found by that name
      flash[:message] = "We didn't find a spider by that name."
      # add redirect to account, build out account
    end
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
