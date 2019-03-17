require "pry"

class Cult
  @@all = []
  attr_accessor :name, :location, :founding_year, :slogan

  def initialize(name:, location:, founding_year:, slogan:)
    @name = name
    @location = location
    @founding_year = founding_year.to_i
    @slogan = slogan
    @@all << self
  end

  def self.all
    @@all
  end

  def recruit_follower(follower)
    current_day = Time.new
    formatted_time = "#{current_day.year}-#{current_day.month}-#{current_day.day}"
    BloodOath.new(cult: self, follower: follower, initiation_date: formatted_time)
  end

  def bloodoaths
    BloodOath.all.select {|bloodoath| bloodoath.cult == self}
  end

  def cult_population
    bloodoaths.count
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
    age_array = bloodoaths.collect {|bloodoath| bloodoath.follower.age}
    (age_array.inject {|sum, age| sum + age}.to_f / cult_population).round(2)
  end

  def my_followers_mottos
    bloodoaths.each {|bloodoath| puts bloodoath.follower.life_motto}
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
