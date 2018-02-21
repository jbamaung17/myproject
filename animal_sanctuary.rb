require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry-byebug')
require_relative('models/animals.rb')
require_relative('models/owners.rb')
require_relative('models/adoptions.rb')

#index
get "/" do
  erb( :index )
end

#new
get "/add_pet" do
  erb( :add_pet)
end

#create
post "/add_pet" do
  @animals = Animal.new(params)
  @animals.save()
  redirect "/"
end

#available-pets
get "/available-pets" do
  @animals = Animal.all()
  erb( :available_pets)
end

#veterinary-care
get "/veterinary-care" do
  @animals = Animal.all()
  erb( :vet_care)
end

#all-pets
get "/all-pets" do
  @animals = Animal.all()
  erb( :all_pets)
end

#delete-pet
post "/pet/delete/:id" do
  @animal = Animal.find(params['id'].to_i)
  @animal.destroy()
  redirect "/all-pets"
end

#all-owners
get "/all-owners" do
  @owners = Owner.all()
  erb( :all_owners)
end

#successful-introductions
get "/successful-introductions" do
  @owners = Owner.all()
  @adoptions = Adoption.all()
  erb( :successful_introductions)
end

#add-adoption-page
get "/add-adoption" do
  @animals = Animal.all
  @owners = Owner.all
  erb( :add_adoption)
end

#add-adoption-make
post "/add-adoption" do
  adoption = Adoption.new(params)
  adoption.save()
  animal = Animal.find(params['animal_id'].to_i)
  animal.adopt
  animal.save()
  redirect "/"
end
