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
follower4 = Follower.new(name: "lkj", age: 57, life_motto: "a")
follower5 = Follower.new(name: "lkj", age: 57, life_motto: "a")
follower6 = Follower.new(name: "lkj", age: 57, life_motto: "a")
follower7 = Follower.new(name: "lkj", age: 57, life_motto: "a")
follower8 = Follower.new(name: "lkj", age: 57, life_motto: "a")
follower9 = Follower.new(name: "lkj", age: 57, life_motto: "a")
follower10 = Follower.new(name: "lkj", age: 57, life_motto: "a")
follower11 = Follower.new(name: "lkj", age: 57, life_motto: "a")


cult1 = Cult.new(name: 'Kooolieeohohoh', location: "middle america", slogan: "we like poop", founding_year: 2013 )
cult2 = Cult.new(name: 'cool cult2', location: 'nowhere', slogan: "ahhh help", founding_year: '2000')
cult3 = Cult.new(name: 'cool cult3', location: 'nowhere', slogan: "ahhh help", founding_year: '2000')
cult4 = Cult.new(name: 'cool cult4', location: 'nowhere', slogan: "ahhh help", founding_year: '2000')
cult5 = Cult.new(name: 'cool cult5', location: 'nowhere', slogan: "ahhh help", founding_year: '2000')

# cult1.recruit_follower(follower1)
# cult1.recruit_follower(follower2)
# cult1.recruit_follower(follower3)

follower1.join_cult(cult1)
follower2.join_cult(cult2)
follower2.join_cult(cult3)
follower2.join_cult(cult2)
follower3.join_cult(cult1)
follower3.join_cult(cult2)
follower4.join_cult(cult1)
follower5.join_cult(cult1)
follower6.join_cult(cult1)
follower7.join_cult(cult1)
follower8.join_cult(cult1)
follower9.join_cult(cult1)
follower10.join_cult(cult1)
follower11.join_cult(cult1)


somebloodoath = BloodOath.new(cult: cult1, follower: follower2, initiation_date: "02-02-1980")

# cult2.recruit_follower(follower2)
# cult2.recruit_follower(follower3)

Cult.find_by_name("cool cult")
Follower.top_ten

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
