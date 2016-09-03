# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Activity.destroy_all

activities = ["Signage", "General Setup", "General Teardown", "Coffee Sale",
              "Food, Beverage, Bake Sale", "Ticket Sales, Raffles, Country Store",
              "Pony Rides", "Face Painting", "Water Play and Bubbles",
              "Treasure Hunt", "Cake Walk", "Dress Up", "Bird's Eye View",
              "Penny Toss", "Pocket Person", "Dunk Tank",
              "Older Elementary and Adolescent Booth", "Tshirt and PH Book Sale",
              "Parking Cars", "Photographers", "Runners",
              "Recycling, Compost, Trash Tracker", "Cider Press", "Corn Box",
              "Live Music"]

activities.each do |activity|
  Activity.create!([
                    {
                      work_area: activity
                    }
                  ])
end

p "Created #{Activity.count} activities"

Article.destroy_all

Article.create!([
                  {
                    title: "Robinette Farms and Prairie Hill Learning Center",
                    link: "http://www.robinettefarms.com/blog/robinette-farms-and-prairie-hill-learning-center",
                    source: "Robinette Farms",
                    category: "nutrition"
                  },
                  {
                    title:"Alternative Education Gives Future Startups a Head Start" ,
                    link: "http://www.nebraskaentrepreneurship.com/postarchive/alternative-education-gives-future-startups-a-head-start/" ,
                    source: "Nebraska Entrepeneurship",
                    category: "innovation"
                  },
                  {
                    title: "Excellence in Education: Prairie Hill Art",
                    link: "http://www.klkntv.com/story/32523880/excellence-in-education-prairie-hill-art",
                    source: "KLKN-TV",
                    category: "freedom, innovation"
                  },
                  {
                    title: "Excellence in Education: Prairie Hill Learning Center",
                    link: "http://www.klkntv.com/story/32507524/excellence-in-education-prairie-hill-learning-center",
                    source: "KLKN-TV",
                    category: "philosophy"
                  },
                  {
                    title: "Food Life: At this school, students prepare what they eat",
                    link: "http://journalstar.com/lifestyles/food-and-cooking/food-life-at-this-school-students-prepare-what-they-eat/article_0daf3405-0c9d-5ca1-b493-b1ca8cf24940.html",
                    source: "Journal Star",
                    category: "nutrition"
                  },
                  {
                    title: "Fair Gives City Kids a Taste of Country Life",
                    link: "http://journalstar.com/news/local/education/fair-gives-city-kids-a-taste-of-country-life/article_c042ed11-8e6d-5fa1-bfb6-351614d69e8b.html",
                    source: "Journal Star",
                    category: "philosophy, freedom, tradition"
                  },
                  {
                    title: "Prairie Hill teacher learning Spanish in Mexico",
                    link: "http://journalstar.com/news/local/education/prairie-hill-teacher-learning-spanish-in-mexico-lps-summer-school/article_13fcebc3-13d5-5876-a495-15b43dc9de12.html",
                    source: "Journal Star",
                    category: "philosophy, innovation, staff"
                  },
                  {
                    title: "Prairie Hill teacher returns form arctic expedition",
                    link: "http://journalstar.com/lifestyles/prairie-hill-teacher-returns-from-arctic-expedition/article_cd3a3640-0d7b-5d4a-859f-b1f2990b9b3e.html",
                    source: "Journal Star",
                    category: "staff, innovation, community"
                  },
                  {
                    title: "Raising Green Kids is more about lifestyle than teaching",
                    link: "http://journalstar.com/lifestyles/family/raising-green-kids-is-more-about-lifestyle-than-teaching/article_c1d799b7-4068-5ea0-95ae-a43e8da364fe.html",
                    source: "Journal Star",
                    category: "philosophy"
                  },
                  {
                    title: "Dexter Drbal to Receive Eagle Scout Award",
                    link: "http://journalstar.com/niche/neighborhood-extra/kids-and-classrooms/dexter-drbal-to-receive-eagle-scout-award/article_edd96b9d-52f8-54d2-9318-611a434698c9.html",
                    source: "Journal Star",
                    category: "community"
                  },
                  {
                    title: "Prairie Hill installs wind turbine",
                    link: "http://journalstar.com/news/local/govt-and-politics/article_4e3946c5-f551-507f-8962-4238d46bf221.html",
                    source: "Journal Star",
                    category: "innovation, community"
                  },
                  {
                    title: "School's Historic Barn Gets an Update",
                    link: "http://journalstar.com/news/local/education/school-s-historic-barn-gets-an-update/article_1612e200-9b85-55fe-b86a-ee4d2ff475ea.html",
                    source: "Journal Star",
                    category: "innovation, tradition"
                  },
                  {
                    title: "Solar Examples",
                    link: "http://www.nebraskansforsolar.org/solarexamples/",
                    source: "Nebraskans for Solar",
                    category: "innovation"
                  },
                  {
                    title: "Strawbale Building Registry",
                    link: "http://sbregistry.sustainablesources.com/search.straw?RID=739",
                    source: "Sustainable Sources",
                    category: "innovation, philosophy"
                  }
                ])
