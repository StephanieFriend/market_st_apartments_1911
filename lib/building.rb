class Building

  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(new_unit)
    @units << new_unit
  end

  # def average_rent
  #   unit_rent = @units.find_all do |unit|
  #     unit[:monthly_rent]
  #   end
  #   (unit_rent.sum / 2).round(1)
  # end

  def renter_with_highest_rent
    
  end
end
