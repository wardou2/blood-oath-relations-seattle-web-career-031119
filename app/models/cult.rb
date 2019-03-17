require "pry"

class Cult
  @@all = []
  attr_reader :name, :location, :founding_year, :slogan, :minimum_age

  def initialize(name:, location:, founding_year:, slogan:, minimum_age:)
    @name = name
    @location = location
    @founding_year = founding_year.to_i
    @slogan = slogan
    @@all << self
    @minimum_age = minimum_age.to_i

  end

  def self.all
    @@all
  end

  def recruit_follower(follower)
    if follower.age >= minimum_age
      current_day = Time.new
      formatted_time = "#{current_day.year}-#{current_day.month}-#{current_day.day}"
      BloodOath.new(cult: self, follower: follower, initiation_date: formatted_time)
    else
      puts "Yer too young feller."
    end
  end

  def bloodoaths
    BloodOath.all.select {|bloodoath| bloodoath.cult == self}
  end

  def followers
    bloodoaths.collect {|bloodoath| bloodoath.follower}
  end

  def cult_population
    followers.count
  end

  def self.find_by_name(search_name)
    self.all.find {|cult| cult.name == search_name}
  end

  def self.find_by_location(search_location)
    self.all.find {|cult| cult.location == search_location}
  end

  def self.find_by_founding_year(search_founding_year)
    self.all.find {|cult| cult.founding_year == search_founding_year}
  end

  def average_age
    age_array = followers.collect {|follower| follower.age}
    (age_array.inject {|sum, age| sum + age}.to_f / cult_population).round(2)
  end

  def my_followers_mottos
    followers.each {|follower| puts follower.life_motto}
  end

  def self.least_popular
    self.all.min_by {|cult| cult.cult_population}
  end

  def self.most_common_location
    location_hash ={}
    self.all.each do |cult|
      if location_hash.has_key?(cult.location)
        location_hash[cult.location] +=1
      else
        location_hash[cult.location] =1
      end
    end
    location_hash.max[0]
  end
end
