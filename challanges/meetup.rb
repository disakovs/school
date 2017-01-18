require 'date'

class Meetup 
  OCCURANCE_IN_MONTH = {
        :first          => 0,
        :second         => 1,
        :third          => 2,
        :fourth         => 3,
        :last           => -1,
    }.freeze
    
  def initialize(month, year)
    @month = Date.new(year, month, 1)..Date.new(year, month, -1)
  end
  
  def day(day_name, place)
    return @month.select { |day| day.send("#{day_name}?") && day.mday.between?(13, 19) }[0] if place == :teenth
    @month.select { |day| day.send("#{day_name}?")}[OCCURANCE_IN_MONTH[place]]
  end
end



p Meetup.new(5, 2013).day(:monday, :teenth)
    