class AccountController < ApplicationController

  def authorization_check
    if session[:current_user] == nil
      redirect :portal
    else
      return true
    end
  end

  get '/portal' do
    erb :portal
  end

  get '/' do
    authorization_check
    @user_name = session[:current_user].user_name
    erb :portal
   #  erb :'../memories'
  end

  get '/login' do
    erb :login
  end

  post '/enter' do
    tempAccount = params[:user_name]
    tempPass = params[:password]
    user = Account.authenticate(tempAccount, tempPass)

    if user
      session[:current_user] = user
      @message = 'Welcome back!'
      redirect '/memories'
    else
      @message = 'Your password or account is incorrect'
      erb :login
    end
  end

  get '/logout' do
    authorization_check
    session[:current_user] = nil
    redirect '/'
  end

  get '/registration' do
    # return view
    erb :registration
  end

  post '/register' do
    # 2. Check the `params` hash and
    # the create view. Notice the keys
    # being passed in along with the values.
    # Take these values and create a *new*
    # instance of your memory model.
    # Assign it to a variable called @memory
    # update the attributes withn the values
    # from params. Then save it!
    tempAccount = params[:user_name]
    tempMail = params[:email]
    tempPass = params[:password]
    new_user = Account.new
    new_user.user_name = tempAccount
    new_user.email = tempMail
    new_user.password=(tempPass)
    new_user.save

    if new_user.save
      session[:current_user] = new_user
      # return view
      @message = 'Your account was added!'
    end
    erb :message
  end
end
