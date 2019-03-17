class Follower
  attr_reader :name, :age, :life_motto
  @@all = []

  def initialize(name:, age:, life_motto:)
    @name = name
    @age = age.to_i
    @life_motto = life_motto
    @@all << self
  end

  def self.all
    @@all
  end

  def join_cult(cult)
    if age >= cult.minimum_age
      current_day = Time.new
      formatted_time = "#{current_day.year}-#{current_day.month}-#{current_day.day}"
      BloodOath.new(cult: cult, follower: self, initiation_date: formatted_time)
    else
      puts "Yer too young dammit!"
    end
  end

  def cults
    bloodoaths = BloodOath.all.select {|bloodoath| bloodoath.follower == self}
    bloodoaths.collect {|bloodoath| bloodoath.cult}
  end

  def self.of_a_certain_age(search_age)
    self.all.select {|follower| follower.age >= search_age}
  end

  def my_cults_slogans
    cults.each {|cult| puts cult.slogan}
  end

  def self.most_active
    self.all.max_by {|follower| follower.cults.count}
  end

  def self.top_ten
    #iterate over @@all to count number of cults for each follower and store in hash with follower as key
    activity_hash = {}
    self.all.each {|follower| activity_hash[follower] = follower.cults.count}
    #sort by the values of the hash, which is the count of cults. returns from smallest to largest so must reverse
    sorted_arr = activity_hash.sort_by {|key, value| value}.reverse
    return_arr = sorted_arr.collect {|value_arr| value_arr[0]}
    if return_arr.length > 10
      return_arr[0...10]
    else
      return_arr
    end
  end

  def fellow_cult_members
    fellow_members = cults.collect {|cult| cult.followers}.flatten.uniq
    fellow_members.delete(self)
    fellow_members
  end

end
