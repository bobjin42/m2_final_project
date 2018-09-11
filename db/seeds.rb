# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do
User.create({name:Faker::Name.unique.name, password: "a"})
end

Store.create({branch_name: "Queens Branch"})
Store.create({branch_name: "Manhattan Branch"})
Store.create({branch_name: "Long Island Branch"})

10.times do
Pet.create({name:Faker::Dog.unique.name, animal_type:"Dog", breed:Faker::Dog.breed, age:rand(1...10), color:Faker::Color.color_name, store_id:Store.all.sample.id})
end

10.times do
Pet.create({name:Faker::Cat.unique.name, animal_type:"Cat", breed:Faker::Cat.breed, age:rand(1...10), color:Faker::Color.color_name, store_id:Store.all.sample.id})
end

3.times do
Pet.create({name:Faker::Artist.unique.name, animal_type:"Rabbit", breed:"English Lop", age:rand(1...10), color:Faker::Color.color_name, store_id:Store.all.sample.id})
end
3.times do
Pet.create({name:Faker::Artist.unique.name, animal_type:"Rabbit", breed:"Florida White", age:rand(1...10), color:Faker::Color.color_name, store_id:Store.all.sample.id})
end
3.times do
Pet.create({name:Faker::Artist.unique.name, animal_type:"Rabbit", breed:"Holland-Lop", age:rand(1...10), color:Faker::Color.color_name, store_id:Store.all.sample.id})
end

3.times do
Pet.create({name:Faker::Artist.unique.name, animal_type:"Rabbit", breed:"A dwarf rabbit", age:rand(1...10), color:Faker::Color.color_name, store_id:Store.all.sample.id})
end

3.times do
Pet.create({name:Faker::FunnyName.unique.name, animal_type:"Hamster", breed:"Djungarian hamster", age:rand(1...10), color:Faker::Color.color_name, store_id:Store.all.sample.id})
end

3.times do
Pet.create({name:Faker::FunnyName.unique.name, animal_type:"Hamster", breed:"Dwarf Campbells Russian Hamster", age:rand(1...10), color:Faker::Color.color_name, store_id:Store.all.sample.id})
end

3.times do
Pet.create({name:Faker::FunnyName.unique.name, animal_type:"Hamster", breed:"Milk Tea Hamster", age:rand(1...10), color:Faker::Color.color_name, store_id:Store.all.sample.id})
end

3.times do
Pet.create({name:Faker::FunnyName.unique.name, animal_type:"Hamster", breed:"Roborovski Hamster", age:rand(1...10), color:Faker::Color.color_name, store_id:Store.all.sample.id})
end
