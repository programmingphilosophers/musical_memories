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


    erb :'../memories'
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
      redirect '../memories'
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

    tempAccount = params[:user_name]
    tempMail = params[:email]
    tempPass = params[:password]

    if Account.where(user_name: tempAccount) == nil
      new_user = Account.new
      new_user.user_name = tempAccount
      new_user.email = tempMail
      new_user.password=(tempPass)
      new_user.save
    end

    if new_user.save
      session[:current_user] = new_user
      # return view
      @message = 'Your account was added!'
    else
      erb :registration
    end
    erb :message
  end

  get '/account_info' do
    authorization_check
    @user_name = session[:current_user].user_name
    @user_email = session[:current_user].user_email
    erb :account_info
  end

  get '/update_account' do
    authorization_check

    erb :update_account
  end

  post '/update_account' do
    authorization_check

    @user_id = session[:current_user].id
    @user_now = Account.where(id: @user_id)
    @user_now.email = params[:email]
    @user_now.password=(params[:password])
    @user_now.save

    if @user_now.save

      @message = 'Your account was added!'
    end
    erb :account_info
  end
end
