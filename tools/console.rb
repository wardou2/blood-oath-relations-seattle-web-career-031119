require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
follower1 = Follower.new(name: "dogu", age: 97, life_motto: "shosat")
follower2 = Follower.new(name: "adf", age: 12, life_motto: "t")
follower3 = Follower.new(name: "lkj", age: 57, life_motto: "a")

cult1 = Cult.new(name: 'Kooolieeohohoh', location: "middle america", slogan: "we like poop", founding_year: 2013 )
cult2 = Cult.new(name: 'cool cult', location: 'nowhere', slogan: "ahhh help", founding_year: '2000')

# cult1.recruit_follower(follower1)
# cult1.recruit_follower(follower2)
# cult1.recruit_follower(follower3)

follower1.join_cult(cult1)
follower1.join_cult(cult2)
follower2.join_cult(cult2)
somebloodoath = BloodOath.new(cult: cult1, follower: follower2, initiation_date: "02-02-1980")

# cult2.recruit_follower(follower2)
# cult2.recruit_follower(follower3)

Cult.find_by_name("cool cult")


binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
