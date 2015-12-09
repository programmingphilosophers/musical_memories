class MemoryController < ApplicationController

  def authorization_check
    if session[:current_user] == nil
      redirect :not_authorized
    else
      return true
    end
  end

  #read (list)
  get '/' do
    authorization_check
    @user_id = session[:current_user].id

    @memories = Memory.where(user_id: @user_id)

    erb :read
  end

  get '/list' do
    @memories = Memory.where(user_id: @user_id)
    return @memories.to_json
  end

  #create
  get '/create' do
    authorization_check
    # return view
    erb :create
  end

  post '/create' do
    authorization_check
    @user_id = session[:current_user].id

    @memory = Memory.new(params[:memory])
    @memory.user_id = @user_id
    @memory.save
    if @memory.save
      # return view
      @message = 'You memory was added!'
    end

    erb :message
  end

  #update
  get '/update/:id' do
    authorization_check

    @memory = Memory.find(params[:id])
    # return view
    erb :update
  end

  post '/update' do
    authorization_check

    @memory = Memory.find(params[:id])
    @memory.assign_attributes(params[:memory])
    @memory.save
    if @memory.save
      # return view
      @message = 'You memory was added!'
    end

    erb :message
  end

  #destroy
  get '/destroy/:id' do
    authorization_check

    @memory = Memory.find(params[:id])

    erb :destroy
  end

  post '/destroy' do
    authorization_check

    @memory = Memory.find(params[:id])
    @memory.destroy

    @message = 'You memory was removed!'

    erb :message
  end

end
