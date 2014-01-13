# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

titles = ["Interview Studying", "Android Development", "Gym", "Diary Writing", "Reading",
          "Guitar", "Coding Katas", "Ruby on Rails", "Django"]

# If you only want 8 activities so it shows the plus button:
titles = titles[0..-2]
colors = ["1ABC9C", "2ECC71", "3498DB", "9B59B6", "344495E", "F1C40F", "E67E22", "E74C3C", "95A5A6"]

titles.each do |t|
  a = Activity.new(:title => t)
  a.color = colors[rand(colors.length)]
  a.save()
end





