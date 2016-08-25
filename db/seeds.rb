# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

activities = ["Signage", "General Setup", "General Teardown", "Coffee Sale",
              "Food, Beverage, Bake Sale", "Ticket Sales, Raffles, Country Store",
              "Pony Rides", "Face Painting", "Water Play and Bubbles",
              "Treasure Hunt", "Cake Walk", "Dress Up", "Obstacle Course",
              "Penny Toss", "Pocket Person", "Dunk Tank", "Book Sale",
              "Parking Cars", "Photographers", "Runners",
              "Recycling, Compost, Trash Tracker", "Cider Press", "Corn Box",
              "Live Music"]

shifts = [
  [4,6], [9,11], [11,12], [12,1], [1,2], [2,3], [3,5]
]

activities.each do |activity|
  Activity.create([
                    { work_area: activity }
                  ])
end

days = ["October 7th", "October 8th"]

friday = days[0]
saturday = days[1]

