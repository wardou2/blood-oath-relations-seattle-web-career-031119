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
end
