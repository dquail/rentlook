require 'test_helper'

class LeaseTest < ActiveSupport::TestCase
  fixtures :properties, :units, :users
  def setup
    @corbella_unit = units(:corbella_bachelor)
    @corbella_unit_existing_lease = leases(:corbella_bachelor_one)
  end

  test "the truth" do
    assert true
  end
  test "invalid empty lease" do
    lease = @corbella_unit.leases.new
    assert !lease.valid?
    assert lease.errors.invalid?(:start_date)
    assert lease.errors.invalid?(:rent_due_date)
    assert lease.errors.invalid?(:auto_incriment_pct)
  end

  test "lease start_date is same as start of another" do
    new_lease = @corbella_unit.leases.new
    new_lease.start_date = @corbella_unit_existing_lease.start_date
    assert new_lease.errors.invalid?(:start_date)

    new_lease.start_date = @corbella_unit_existing_lease.end_date
    assert new_lease.errors.invalid?(:start_date)

    new_lease.start_date = new_lease.start_date - 1.day
    assert new_lease.errors.invalid?(:start_date)
  end

  test "lease start_date is within range of another lease" do
    new_lease = @corbella_unit.leases.new
    new_lease.start_date = @corbella_unit_existing_lease.start_date + 1.day
    assert new_lease.errors.invalid?(:start_date)
  end

  test "lease end_date is start date of another lease" do
    new_lease = @corbella_unit.leases.new
    new_lease.end_date = @corbella_unit_existing_lease.end_date
    assert new_lease.errors.invalid?(:end_date)
  end
  test "lease end_date is within another lease" do
    new_lease = @corbella_unit.leases.new
    new_lease.end_date = @corbella_unit_existing_lease.end_date - 1.day
    assert new_lease.errors.invalid?(:end_date)
  end
  test "lease end_date is end date of another lease" do
    new_lease = @corbella_unit.leases.new
    new_lease.end_date = @corbella_unit_existing_lease.end_date
    assert new_lease.errors.invalid?(:end_date)    
  end
end
