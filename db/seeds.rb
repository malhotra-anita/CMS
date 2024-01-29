# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Roles

administrator_role = Role.create(name: 'Administrator')
manager_role = Role.create(name: 'Manager')
puts 'Roles seeded successfully.'

#Users
admin_user = User.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password', role: administrator_role)
manager_user = User.create(email: 'manager@example.com', password: 'password', password_confirmation: 'password', role: manager_role)
puts 'Users seeded successfully.'

