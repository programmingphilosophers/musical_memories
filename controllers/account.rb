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
      @message = 'Your username or password is incorrect'
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

    tempAccount = params[:user_name]
    tempMail = params[:email]
    tempPass = params[:password]

    # There used to be a condition check to see if username was already in database, but it wasn't working for some reason.
    new_user = Account.new
    new_user.user_name = tempAccount
    new_user.email = tempMail
    new_user.password=(tempPass)
    new_user.save

    if new_user.save
      session[:current_user] = new_user
      # return view
      @message = 'Your account was added!'
    else
      erb :registration
    end
    erb :message
  end

  # ---------------
  # I was beginning to code some account functionality. May or may not still have time.
  # ---------------

  get '/account_info' do
    authorization_check
    @user_id = session[:current_user].id
    p "USER OBJECT============="
    p @user_now = Account.where(id: @user_id)

    erb :account_info
  end

  get '/update_account/:id' do
    authorization_check
    p "USER OBJECT==========="
    p@user_now = Account.find(params[:id])
    # @user_now = Account.find(session[:current_user].id)
    erb :update_account
  end

  # ---------------
  # This section not working. I could not find a way for my form to find this method.
  # ---------------

  post '/update_account/:id' do
    authorization_check

    # @user_now = Account.find(params[:id])
    @user_now = Account.find(session[:current_user].id)
    tempPass = params[:password]
    @user_now.password=(tempPass)
    @user_now.save

    if @user_now.save

      @message = 'Your password was updated!'
      redirect '/account_info'
    else
      redirect "/update_account/#{session[:current_user].id}"
    end
    # erb :account_info
  end
end
