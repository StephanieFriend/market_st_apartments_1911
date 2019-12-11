require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'
require './lib/apartment'
require './lib/building'

class BuildingTest < Minitest::Test

  def test_is_exists
    building = Building.new

    assert_instance_of Building, building
  end

  def test_building_starts_with_no_units
    building = Building.new

    assert_equal [], building.units
  end

  def test_building_can_add_units
    building = Building.new
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})

    building.add_unit(unit1)
    building.add_unit(unit2)

    assert_equal [unit1, unit2], building.units
  end

  def test_it_can_calculate_average_rent
    skip
    building = Building.new
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})

    building.add_unit(unit1)
    building.add_unit(unit2)

    assert_equal 1099.5, building.average_rent
  end

  def test_it_can_show_renter_with_highest_rent
    skip
    building = Building.new
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 1, bedrooms: 2})
    unit3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})
    unit4 = Apartment.new({number: "D4", monthly_rent: 1500, bathrooms: 3, bedrooms: 2})
    renter1 = Renter.new("Spencer")

    building.add_unit(unit1)
    building.add_unit(unit2)
    building.add_unit(unit3)

    unit2.add_renter(renter1)

    assert_equal renter1, building.renter_with_highest_rent

    renter2 = Renter.new("Jessie")

    unit1.add_renter(renter2)

    assert_equal renter2, building.renter_with_highest_rent

    renter2 = Renter.new("Max")

    unit3.add_renter(renter3)

    assert_equal renter2, building.renter_with_highest_rent
  end

  def test_anual_breakout_of_rent
    building = Building.new
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    unit3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})
    renter1 = Renter.new("Spencer")

    building.add_unit(unit1)
    building.add_unit(unit2)
    building.add_unit(unit3)
    unit2.add_renter(renter1)

    assert_equal {"Spencer" => 11988}, building.annual_breakdown

    renter2 = Renter.new("Jessie")

    unit1.add_renter(renter2)

    assert_equal {"Jessie" => 14400, "Spencer" => 11988}, building.annual_breakdown
  end
end
