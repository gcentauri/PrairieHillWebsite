Activity.destroy_all

@activities = [
  "Little Run on the Prairie", "Signage", "Live Music", "General Setup", "General Teardown", "Coffee Sale",
  "Food, Beverage, Bake Sale", "Ticket Sales, Raffles, Country Store",
  "Face Painting", "Water Play and Bubbles",
  "Treasure Hunt", "Cake Walk", "Dress Up", "Bird's Eye View",
  "Penny Toss", "Pocket Person", "Dunk Tank",
  "T-shirt and Book Sale",
  "Parking Cars", "Photographers", "Runners",
  "Recycling, Compost, Trash Tracker", "Cider Press"
]

@activities.each do |activity|
  # if activity == "Ticket Sales, Raffles, Country Store"
  #   Activity.create!([
  #                      {
  #                        work_area: activity,
  #                        comments: "One volunteer per hour should be an adolescent or older elementary student,
  #                                   Setup starts at 8:30am"
  #                      }
  #                    ])
  # elsif activity == "Little Run on the Prairie"
  #   Activity.create!([
  #                      {
  #                        work_area: activity,
  #                        comments: "Setup and Run from 10-11am"
  #                      }
  #                    ])
  # else
    Activity.create!([
                       {
                         work_area: activity
                       }
                     ])
  # end

end

tickets = Activity.where(work_area: 'Ticket Sales, Raffles, Country Store').first

tickets.comments << "One volunteer per hour should be an adolescent or older el student, Setup starts at 8:30am"
#tickets.comments << "Setup starts at 8:30am"
tickets.save!

little_run = Activity.where(work_area: 'Little Run on the Prairie').first

little_run.comments << "Setup and Run from 10-11am"
little_run.save!

p "Created #{Activity.count} activities"

Shift.destroy_all

@times = {
  'Fri 4pm'  => '2016-10-07 16:00:00 UTC',
  'Fri 6pm'  => '2016-10-07 18:00:00 UTC',
  'Sat 9am'  => '2016-10-08 09:00:00 UTC',
  'Sat 9:30am'  => '2016-10-08 09:30:00 UTC',
  'Sat 10am' => '2016-10-08 10:00:00 UTC',
  'Sat 11am' => '2016-10-08 11:00:00 UTC',
  'Sat 11:15am' => '2016-10-08 11:15:00 UTC',
  'Sat 11:30am' => '2016-10-08 11:30:00 UTC',
  'Sat 12pm' => '2016-10-08 12:00:00 UTC',
  'Sat 12:15pm' => '2016-10-08 12:15:00 UTC',
  'Sat 12:30pm' => '2016-10-08 12:30:00 UTC',
  'Sat 1pm'  => '2016-10-08 13:00:00 UTC',
  'Sat 1:15pm'  => '2016-10-08 13:15:00 UTC',
  'Sat 1:30pm'  => '2016-10-08 13:30:00 UTC',
  'Sat 2pm'  => '2016-10-08 14:00:00 UTC',
  'Sat 2:30pm'  => '2016-10-08 14:30:00 UTC',
  'Sat 3pm'  => '2016-10-08 15:00:00 UTC',
  'Sat 5pm'  => '2016-10-08 17:00:00 UTC'
}

shifts = [
  [ 'Fri 4-6',   @times['Fri 4pm' ],  @times['Fri 6pm' ] ],
  [ 'Sat 9-10',   @times['Sat 9am' ],  @times['Sat 10am' ] ],
  [ 'Sat 9-11',  @times['Sat 9am' ],  @times['Sat 11am'] ],
  [ 'Sat 10-11',  @times['Sat 10am' ],  @times['Sat 11am'] ],
  [ 'Sat 11-12', @times['Sat 11am'],  @times['Sat 12pm'] ],
  [ 'Sat 12-1',  @times['Sat 12pm'],  @times['Sat 1pm' ] ],
  [ 'Sat 1-2',   @times['Sat 1pm' ],  @times['Sat 2pm' ] ],
  [ 'Sat 2-3',   @times['Sat 2pm' ],  @times['Sat 3pm' ] ],
  [ 'Sat 3-5',   @times['Sat 3pm' ],  @times['Sat 5pm' ] ]
]

shifts.each do |shift|
  Shift.create!([
                  {
                    nick: shift[0],
                    start_time: shift[1],
                    end_time: shift[2],
                  }
                ])
end

p "Created #{Shift.count} shifts"

# TIMESLOTS

Timeslot.destroy_all

def get_activity_id(name)
  activity = Activity.where(work_area: name).first

  activity.id
end

def get_shift_id(nick)
  shift = Shift.where(nick: nick).first

  shift.id
end

@slots = [

  # Little Run on the Prairie
  ## Friday
  {
    area: "Little Run on the Prairie",
    time: "Fri 4-6",
    num: 1
  },

  ## Saturday
  {
    area: "Little Run on the Prairie",
    time: "Sat 9-11",
    num: 10 }, { area: "Little Run on the Prairie",
                 time: "Sat 3-5",
                 num: 1 },
  
  # Signage
  ## Saturday
  {
    area: "Signage",
    time: "Sat 9-11",
    num: 1 }, { area: "Signage",
                time: "Sat 3-5",
                num: 1
              },

  # Live Music
  {
    area: "Live Music",
    time: "Sat 9-11",
    num: 2 }, { area: "Live Music",
                time: "Sat 3-5",
                num: 2
              },

  # General Setup
  ## Friday
  {
    area: "General Setup",
    time: "Fri 4-6",
    num: 8
  },

  ## Saturday
  {
    area: "General Setup",
    time: "Sat 9-11",
    num: 6
  },

  # General Teardown
  ## Saturday
  {
    area: "General Teardown",
    time: "Sat 3-5",
    num: 8
  },
  
  # Coffee Sale
  ## Saturday
  {
    area: "Coffee Sale",
    time: "Sat 9-11",
    num: 1 }, { area: "Coffee Sale",
                time: "Sat 11-12",
                num: 1 }, { area: "Coffee Sale",
                            time: "Sat 12-1",
                            num: 1 }, { area: "Coffee Sale",
                                        time: "Sat 1-2",
                                        num: 1 }, { area: "Coffee Sale",
                                                    time: "Sat 2-3",
                                                    num: 1 },
  
  # Food, Beverage and Bake Sale
  ## Saturday
  {
    area: "Food, Beverage, Bake Sale",
    time: "Sat 9-11",
    num: 4 }, { area: "Food, Beverage, Bake Sale",
                time: "Sat 11-12",
                num: 5 }, { area: "Food, Beverage, Bake Sale",
                            time: "Sat 12-1",
                            num: 5 }, { area: "Food, Beverage, Bake Sale",
                                        time: "Sat 1-2",
                                        num: 5 }, { area: "Food, Beverage, Bake Sale",
                                                    time: "Sat 2-3",
                                                    num: 4 },{ area: "Food, Beverage, Bake Sale",
                                                               time: "Sat 3-5",
                                                               num: 4 },
  
  # Ticket Sales, Raffles, Country Store
  ## Friday
  {
    area: "Ticket Sales, Raffles, Country Store",
    time: "Fri 4-6",
    num: 1
  },
  
  ## Saturday
  #add variance feature for unique cases (8:30am)
  {
    area: "Ticket Sales, Raffles, Country Store",
    time: "Sat 9-11",
    num: 4 }, { area: "Ticket Sales, Raffles, Country Store",
                time: "Sat 11-12",
                num: 4 }, { area: "Ticket Sales, Raffles, Country Store",
                            time: "Sat 12-1",
                            num: 3 }, { area: "Ticket Sales, Raffles, Country Store",
                                        time: "Sat 1-2",
                                        num: 3 }, { area: "Ticket Sales, Raffles, Country Store",
                                                    time: "Sat 2-3",
                                                    num: 4 }, 

  # Face Painting
  {
    area: "Face Painting",
    time: "Sat 11-12",
    num: 2 }, { area: "Face Painting",
                time: "Sat 12-1",
                num: 2 }, { area: "Face Painting",
                            time: "Sat 1-2",
                            num: 2 }, { area: "Face Painting",
                                        time: "Sat 2-3",
                                        num: 2
                                      },
  
  # Water Play and Bubbles
  {
    area: "Water Play and Bubbles",
    time: "Sat 11-12",
    num: 1 }, { area: "Water Play and Bubbles",
                time: "Sat 12-1",
                num: 1 }, { area: "Water Play and Bubbles",
                            time: "Sat 1-2",
                            num: 1 }, { area: "Water Play and Bubbles",
                                        time: "Sat 2-3",
                                        num: 1
                                      },
  
  # Treasure Hunt
  {
    area: "Treasure Hunt",
    time: "Sat 11-12",
    num: 1 }, { area: "Treasure Hunt",
                time: "Sat 12-1",
                num: 1 }, { area: "Treasure Hunt",
                            time: "Sat 1-2",
                            num: 1 }, { area: "Treasure Hunt",
                                        time: "Sat 2-3",
                                        num: 1
                                      },
  
  # Cake Walk
  {
    area: "Cake Walk",
    time: "Sat 11-12",
    num: 2 }, { area: "Cake Walk",
                time: "Sat 12-1",
                num: 2 }, { area: "Cake Walk",
                            time: "Sat 1-2",
                            num: 2 }, { area: "Cake Walk",
                                        time: "Sat 2-3",
                                        num: 2
                                      },
  
  # Dress Up
  {
    area: "Dress Up",
    time: "Sat 11-12",
    num: 1 }, { area: "Dress Up",
                time: "Sat 12-1",
                num: 1 }, { area: "Dress Up",
                            time: "Sat 1-2",
                            num: 1 }, { area: "Dress Up",
                                        time: "Sat 2-3",
                                        num: 1
                                      },
  
  # Bird's Eye View
  {
    area: "Bird's Eye View",
    time: "Sat 11-12",
    num: 1 }, { area: "Bird's Eye View",
                time: "Sat 12-1",
                num: 1 }, { area: "Bird's Eye View",
                            time: "Sat 1-2",
                            num: 1 }, { area: "Bird's Eye View",
                                        time: "Sat 2-3",
                                        num: 1
                                      },
  
  # Penny Toss
  {
    area: "Penny Toss",
    time: "Sat 11-12",
    num: 1 }, { area: "Penny Toss",
                time: "Sat 12-1",
                num: 1 }, { area: "Penny Toss",
                            time: "Sat 1-2",
                            num: 1 }, { area: "Penny Toss",
                                        time: "Sat 2-3",
                                        num: 1
                                      },
  
  # Pocket Person
  {
    area: "Pocket Person",
    time: "Sat 11-12",
    num: 1 }, { area: "Pocket Person",
                time: "Sat 12-1",
                num: 1 }, { area: "Pocket Person",
                            time: "Sat 1-2",
                            num: 1 }, { area: "Pocket Person",
                                        time: "Sat 2-3",
                                        num: 1
                                      },
  
  # Dunk Tank
  {
    area: "Dunk Tank",
    time: "Sat 11-12",
    num: 2 }, { area: "Dunk Tank",
                time: "Sat 12-1",
                num: 2 }, { area: "Dunk Tank",
                            time: "Sat 1-2",
                            num: 2 }, { area: "Dunk Tank",
                                        time: "Sat 2-3",
                                        num: 2
                                      },
  
  # Tshirt and PH Book Sale ?
  {
    area: "T-shirt and Book Sale",
    time: "Sat 11-12",
    num: 2 }, { area: "T-shirt and Book Sale",
                time: "Sat 12-1",
                num: 2 }, { area: "T-shirt and Book Sale",
                            time: "Sat 1-2",
                            num: 2 }, { area: "T-shirt and Book Sale",
                                        time: "Sat 2-3",
                                        num: 2 }, 


  # Parking Cars
  {
    area: "Parking Cars",
    time: "Sat 9-10",
    num: 2 }, { area: "Parking Cars",
                time: "Sat 10-11",
                num: 3 }, { area: "Parking Cars",
                            time: "Sat 11-12",
                            num: 4 }, { area: "Parking Cars",
                                        time: "Sat 12-1",
                                        num: 4 }, { area: "Parking Cars",
                                                    time: "Sat 1-2",
                                                    num: 4 }, { area: "Parking Cars",
                                                                time: "Sat 2-3",
                                                                num: 3
                                                              },
  
  # Photographers
  {
    area: "Photographers",
    time: "Sat 11-12",
    num: 1 }, { area: "Photographers",
                time: "Sat 12-1",
                num: 1 }, { area: "Photographers",
                            time: "Sat 1-2",
                            num: 1 }, { area: "Photographers",
                                        time: "Sat 2-3",
                                        num: 1
                                      },
  
  # Runners
  {
    area: "Runners",
    time: "Sat 11-12",
    num: 2 }, { area: "Runners",
                time: "Sat 12-1",
                num: 2 }, { area: "Runners",
                            time: "Sat 1-2",
                            num: 2 }, { area: "Runners",
                                        time: "Sat 2-3",
                                        num: 2
                                      },
  
  # Recycling, Compost, Trash Tracker
  {
    area: "Recycling, Compost, Trash Tracker",
    time: "Sat 11-12",
    num: 1 }, { area: "Recycling, Compost, Trash Tracker",
                time: "Sat 12-1",
                num: 1 }, { area: "Recycling, Compost, Trash Tracker",
                            time: "Sat 1-2",
                            num: 1 }, { area: "Recycling, Compost, Trash Tracker",
                                        time: "Sat 2-3",
                                        num: 1
                                      },
  
  # Cider Press
  {
    area: "Cider Press",
    time: "Sat 11-12",
    num: 1 }, { area: "Cider Press",
                time: "Sat 12-1",
                num: 1 }, { area: "Cider Press",
                            time: "Sat 1-2",
                            num: 1 }, { area: "Cider Press",
                                        time: "Sat 2-3",
                                        num: 1 }
]

@slots.each do |slot|

  num = slot[:num]
  area = slot[:area]
  time = slot[:time]

  num.times do
  Timeslot.create!([
                     {
                       activity_id: get_activity_id(area),
                       shift_id: get_shift_id(time),
                       nick: time
                     }
                   ])
  end
end

p "Created #{Timeslot.count} timeslots"

# ARTICLES
Article.destroy_all

Article.create!([
                  {
                    title: "Robinette Farms and Prairie Hill Learning Center",
                    link: "http://www.robinettefarms.com/blog/robinette-farms-and-prairie-hill-learning-center",
                    source: "Robinette Farms",
                    category: "nutrition"
                  },
                  {
                    title: "Spotlight Prairie Hill",
                    link: "http://baandek.org/posts/spotlight-prairie-hill/",
                    source: "Baan Dek",
                    category: "philosophy"
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

p "Created #{Article.count} articles"


