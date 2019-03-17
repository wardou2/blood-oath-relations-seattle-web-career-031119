class Follower
  attr_accessor :name, :age, :life_motto
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
    current_day = Time.new
    formatted_time = "#{current_day.year}-#{current_day.month}-#{current_day.day}"
    BloodOath.new(cult: cult, follower: self, initiation_date: formatted_time)
  end

  def cults
    BloodOath.all.select {|bloodoath| bloodoath.follower == self}
  end

  def self.of_a_certain_age(search_age)
    self.all.select {|follower| follower.age >= search_age}
  end

end
