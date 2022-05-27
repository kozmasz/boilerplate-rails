# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create(name: "USD", amount: 50, description: "Description USD", currency: "USD")
Product.create(name: "CAD", amount: 60, description: "Description CAD", currency: "CAD")
Product.create(name: "EUR", amount: 70, description: "Description EUR", currency: "EUR")
Product.create(name: "GBP", amount: 80, description: "Description GBP", currency: "GBP")
