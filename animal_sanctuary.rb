require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('models/animals.rb')
require_relative('models/owners.rb')

#index
get "/" do
  erb( :index )
end

#pet-search
get "/pet-search" do
  erb( :pet_search )
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

#edit-pets
post "/edit-pets" do
  erb( :pet_edit)
end

#all-pets
get "/all-pets" do
  @animals = Animal.all()
  erb( :all_pets)
end

#adopters-search
get "/owner-search" do
  erb( :owner_search)
end

#edit-owners
post "/edit-owners" do
  erb( :edit_owners)
end

#all-owners
get "/all-owners" do
  @owners = Owner.all()
  erb( :all_owners)
end

#successful-introductions
get "/successful-introductions" do
  erb( :successful_introductions)
end
