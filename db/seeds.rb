require_relative("../models/animals.rb")
require_relative("../models/owners.rb")
require_relative("../models/adoptions.rb")
require("pry-byebug")

Animal.delete_all()
Owner.delete_all()

animal1 = Animal.new({
  "name" => "Duke",
  "gender" => "male",
  "admission_date" => "12 September 2017",
  "status" => "adopted",
  "species" => "dog",
  "breed" => "american bulldog"
  })

  animal1.save()

animal2 = Animal.new({
  "name" => "Bumble",
  "gender" => "male",
  "admission_date" => "19 November 2017",
  "status" => "adopted",
  "species" => "cat",
  "breed" => "domestic short hair"
  })

  animal2.save()

animal3 = Animal.new({
  "name" => "Angus",
  "gender" => "male",
  "admission_date" => "2 January 2018",
  "status" => "veterinary care",
  "species" => "snake",
  "breed" => "cornsnake"
})

  animal3.save()

animal4 = Animal.new({
  "name" => "Daisy",
  "gender" => "female",
  "admission_date" => "14 February 2018",
  "status" => "adopted",
  "species" => "rabbit",
  "breed" => "cross breed"
})

  animal4.save()

animal5 = Animal.new({
  "name" => "Bob",
  "gender" => "male",
  "admission_date" => "23 March 2017",
  "status" => "available",
  "species" => "snake",
  "breed" => "royal python"
})

  animal5.save()

owner1 = Owner.new({
  "name" => "Milan Kundera",
  "address" => "42 Redburn, Bonhill, G83 4PX",
  "telephone_number" => "07899384628"
  })

  owner1.save()

owner2 = Owner.new({
  "name" => "Phil McCracken",
  "address" => "123 Fake Street, Renton, G82 9BT",
  "telephone_number" => "07221347425"
  })

  owner2.save()

owner3 = Owner.new({
  "name" => "Pat McGroin",
  "address" => "123 Cocksburn Street, Echelfechan, EH13 9TY",
  "telephone_number" => "07389750097"
  })

  owner3.save()

adoption1 = Adoption.new({
  "animal_id" => animal1.id,
  "owner_id" => owner3.id
  })

  adoption1.save()

binding.pry
nil
