# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Destroying all..."
User.destroy_all
Employee.destroy_all
Organization.destroy_all
OrganizationUser.destroy_all
ServiceList.destroy_all
Guest.destroy_all
puts "Destroyed!"

puts "Creating Users..."
u = User.create(email: "r@e.com", password: "1", name: "Roneesh Vashisht")
u2 = User.create(email: "brian@brianmartinek.com", password: "1", name: "Brian Martinek")
puts "Created Users:"
puts u
puts u2

puts "Creating Organization"
o = Organization.create(name: "1871", admin_id: u.id)
puts "Created Organization:"
puts o

puts "Creating OrganizationUser table entries..."
ou1 = OrganizationUser.create(user_id: u.id, organization_id: o.id)
ou2 = OrganizationUser.create(user_id: u2.id, organization_id: o.id)
puts "Created OrganizationUsers"
puts ou1
puts ou2

employees = [
  {name: "Roneesh Vashisht", company: "1871", email: "r@e.com", phone: "4693379220", organization_id: o.id},
  {name: "Brian Martinek", company: "1871", email: "b@e.com", phone: "4693379410", organization_id: o.id},
  {name: "Jeff Lunsford", company: "1871", email: "j@e.com", phone: "4693379887", organization_id: o.id},
  {name: "Kelly Livermore", company: "1871", email: "k@e.com", phone: "4693379001", organization_id: o.id},
  {name: "Michele Laubenthal", company: "1871", email: "m@e.com", phone: "4693379344", organization_id: o.id},
  {name: "Andrew Tardiff", company: "1871", email: "a@e.com", phone: "4693379123", organization_id: o.id}
]

employees.each do |employee|
  e = Employee.create(employee)
  puts "Creating employee: #{e}" 
end

