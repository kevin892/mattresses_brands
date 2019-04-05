class BrandsController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views") }

#get brands home page
  get '/brands' do
    @brands = Brand.all
    erb :"brand/index"
  end
#get brand creation page
  get '/brands/new' do
    erb :"brand/new"
  end
#recieve brand creation and create in database
  post '/brands' do
    @brand = Brand.create(params)
    redirect "/brands"
  end
#find brand and get edit brand  page
  get '/brands/:id/edit' do
    @brand = Brand.find(params[:id])
    erb :"brand/edit"
  end
#get unique/dynamic show page for brand
  get '/brands/:id' do
    @brand = Brand.find(params[:id])
    erb :"brand/show"
  end

#recieve update and update brand name in database
  put "/brands/:id" do
    brand = Brand.find(params[:id])
    brand.update(name: params[:name])
    redirect "/brands"
  end

  #recieve delete and delete from database
  delete "/brands/:id" do
    Brand.destroy(params[:id])
    redirect "/brands"
  end
end
