class Building

  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(new_unit)
    @units << new_unit
  end

#each_key is a hash method...need to get out of an array first
  def average_rent
    unit_rent = @units.each_key do |unit, value|
      unit[:monthly_rent]
    end
    (unit_rent.sum / 2).round(1)
  end

#only need the values of monthly_rent
  def renter_with_highest_rent
    units.map {|unit| unit.values[1]}
  end

  def annual_breakdown
    year_rent = @units.find_all {|unit, values| unit[:monthly_rent]}
    #find the highest rent
    #associate that with a user
    #iterate?
    #get the name and the rent * 12 into a new hash
    anual_rent = (year_rent.max) * 12
    user_name = @units.name
  end
end
