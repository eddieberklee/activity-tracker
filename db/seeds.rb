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

titles.each do |t|
  a = Activity.new(:title => t)
  a.save()
end





