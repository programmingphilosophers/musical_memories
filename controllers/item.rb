class ItemController < ApplicationController

  def authorization_check
    if session[:current_user] == nil
      redirect :not_authorized
    else
      return true
    end
  end

  #read (list)
  get '/' do
    # 1. get a list of all item models
    # and set it to the @items variable
    authorization_check

    @items = Item.all

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

    @item = Item.new(params[:item])
    @item.whenithappened = Time.now
    @item.save
    if @item.save

      # return view
      @message = 'You item was added!'
    end
    erb :message
  end

  #update
  get '/update/:id' do
    authorization_check

    @item = Item.find(params[:id])
    # return view
    erb :update
  end
  post '/update' do
    authorization_check

    @item = Item.find(params[:id])
    @item.assign_attributes(params[:item])
    @item.whenithappened = Time.now
    @item.save
    # return view
    @message = 'You item was updated!'
    erb :message
  end

  #destroy
  get '/destroy/:id' do
    authorization_check

    @item = Item.find(params[:id])
    # return view
    erb :destroy
  end
  post '/destroy' do
    authorization_check

    @item = Item.find(params[:id])
    @item.destroy
    # return view
    @message = 'You item was removed!'
    erb :message
  end

end
