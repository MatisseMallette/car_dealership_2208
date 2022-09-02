require 'rspec'
require './lib/dealership'
require './lib/car'

RSpec.describe Dealership do
  before(:each) do
    @dealership = Dealership.new("Acme Auto", "123 Main Street")
  end

  it 'exists' do
    expect(@dealership).to be_an_instance_of(Dealership)
  end

  it 'has readable attributes' do
    expect(@dealership.inventory).to be_an_instance_of(Array)
    expect(@dealership.inventory_count).to eq(0)
  end

  it 'can add car to inventory' do 
    new_car1 = Car.new("Toyota Prius", 1000, 48)
    new_car2 = Car.new("Ford Mustang", 1500, 36)
    @dealership.add_car(new_car1)
    @dealership.add_car(new_car2)
    expect(@dealership.inventory_count).to eq(2)
  end
end