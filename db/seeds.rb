# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do
User.create({name:Faker::Name.unique.name, password: "a", email: "aaa"})
end

Store.create({branch_name: "Queens Branch"})
Store.create({branch_name: "Manhattan Branch"})
Store.create({branch_name: "Long Island Branch"})
gender=["male","female"]
rabbit_breed=["English Lop","Holland-Lop","A dwarf rabbit","Florida White"]
hamster_breed=["Djungarian hamster","Dwarf Campbells Russian Hamster","Milk Tea Hamster","Roborovski Hamster"]
for i in 1..33
Pet.create!({name:Faker::Dog.name,image:"dog_#{i}.jpg", animal_type:"Dog", breed:Faker::Dog.breed, age:rand(1...10), gender:gender.sample, store_id:Store.all.sample.id})
end

for i in 1..46
Pet.create!({name:Faker::Cat.name,image:"cat_#{i}.jpg",animal_type:"Cat", breed:Faker::Cat.breed, age:rand(1...10), gender:gender.sample, store_id:Store.all.sample.id})
end

for i in 1..18
Pet.create!({name:Faker::Artist.name,image:"rabbit_#{i}.jpg", animal_type:"Rabbit", breed:rabbit_breed.sample, age:rand(1...10), gender:gender.sample, store_id:Store.all.sample.id})
end

for i in 1..13
Pet.create!({name:Faker::FunnyName.name,image:"hamster_#{i}.jpg", animal_type:"Hamster", breed:hamster_breed.sample, age:rand(1...10), gender:gender.sample, store_id:Store.all.sample.id})
end
