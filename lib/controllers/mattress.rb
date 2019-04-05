class MattressesController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views") }

#get mattresses home page
  get '/mattresses' do
    @mattresses = Mattress.all
    erb :"mattress/index"
  end
#get mattress creation page
  get '/mattresses/new' do
    erb :"mattress/new"
  end
#recieve mattress creation and create in database
  post '/mattresses' do
    @mattress = Mattress.create(params)
    redirect "/mattresses"
  end
#find mattress and get edit mattress  page
  get '/mattresses/:id/edit' do
    @mattress = Mattress.find(params[:id])
    erb :"mattress/edit"
  end
#get unique/dynamic show page for mattress
  get '/mattresses/:id' do
    @mattress = Mattress.find(params[:id])
    erb :"mattress/show"
  end

#recieve update and update mattress name in database
  put "/mattresses/:id" do
    mattress = Mattress.find(params[:id])
    mattress.update(model: params[:model], quality: params[:quality])
    redirect "/mattresses"
  end

  #recieve delete and delete mattress from database
  delete "/mattresses/:id" do
    Mattress.destroy(params[:id])
    redirect "/mattresses"
  end
end
