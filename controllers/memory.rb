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
    # 1. get a list of all memory models
    # and set it to the @memories variable
    authorization_check

    @user_id = session[:current_user].id

    @memories = Memory.where(user_id: @user_id)

    # return view
    erb :read
  end

  #create
  get '/create' do
    authorization_check

    @user_id = session[:current_user].id

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
    redirect '/memories/create_memory'
  end

  get '/create_memory' do
    authorization_check

    @user_id = session[:current_user].id
    @memory = Memory.where(user_id: @user_id, is_new: true)
    erb :create_memory
  end

  post '/create_memory' do
    binding.pry
    authorization_check

    # @memory.whenithappened = Time.now
    # @memory = Memory.new(params[:memory])
    @user_id = session[:current_user].id
    @memory = Memory.where(user_id: @user_id, is_new: true)

    @memory.update_attributes(params[:memory])
    binding.pry
    @memory.is_new = 'false'
    @memory.save
    if @memory.save

      # return view
      @message = 'Your memory was added!'
      erb :message
    end
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
    @memory.update_attributes(params[:memory])
    # @memory.whenithappened = Time.now
    @memory.save
    # return view
    @message = 'Your memory was updated!'
    erb :message
  end

  #destroy
  get '/destroy/:id' do
    authorization_check

    @memory = Memory.find(params[:id])
    # return view
    erb :destroy
  end
  post '/destroy' do
    authorization_check

    @memory = Memory.find(params[:id])
    @memory.destroy
    # return view
    @message = 'You memory was removed!'
    erb :message
  end

end
