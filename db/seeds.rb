# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create!(name: "furniture", color: "brown")
Category.create!(name: "antiques", color: "grey")
Category.create!(name: "technology", color: "blue")
Category.create!(name: "books", color: "white")
Category.create!(name: "clothing", color: "red")

# Products seeds?
# Also better to wrap this calls to module or class
