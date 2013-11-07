# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



Organization.create(name: "1871")

employees = [
  {name: "Roneesh Vashisht", company: "1871", email: "r@e.com", phone: "4693379220", organization_id: 1},
  {name: "Brian Martinek", company: "1871", email: "b@e.com", phone: "4693379410", organization_id: 1},
  {name: "Jeff Lunsford", company: "1871", email: "j@e.com", phone: "4693379887", organization_id: 1},
  {name: "Kelly Livermore", company: "1871", email: "k@e.com", phone: "4693379001", organization_id: 1},
  {name: "Michele Laubenthal", company: "1871", email: "m@e.com", phone: "4693379344", organization_id: 1},
  {name: "Andrew Tardiff", company: "1871", email: "a@e.com", phone: "4693379123", organization_id: 1}
]

employees.each do |employee|
  Employee.create(employee)
end