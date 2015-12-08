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

    @memories = Memory.all

    # return view
    erb :read
  end

  #create
  get '/create' do
    authorization_check
    # return view
    erb :create
  end

  post '/create' do
    authorization_check

    @memory = Memory.new(params[:memory])
    @memory.save
    # if @memory.save
    #
    #   # return view
    #   @message = 'You memory was added!'
    # end
    erb :create_memory
  end

  get '/create_memory' do
    authorization_check
    @memory = Memory.find(params[:id])
    # return view
    erb :create_memory
  end

  post '/create_memory' do
    authorization_check
    @memory = Memory.find(params[:id])
    @memory.whenithappened = Time.now
    @memory.assign_attributes(params[:memory])

    @message = 'Your memory was created!'
    erb :read
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
    @memory.whenithappened = Time.now
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
