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

  it 'can be asked if it has an inventory' do
    new_dealership = Dealership.new("Shmacme Shmauto", "321 Niam Drive")
    expect(new_dealership.has_inventory?).to eq(false)
    new_car = Car.new("Tesla Cybertruck", 9001, 60)
    new_dealership.add_car(new_car)
    expect(new_dealership.has_inventory?).to eq(true)
  end

  it 'can provide average price of car' do 
    new_dealership = Dealership.new("Another Dealership", "123 ABC Drive")
    new_dealership.add_car(Car.new("Tesla Cybertruck", 1000, 10))
    new_dealership.add_car(Car.new("Nissan Juke", 500, 10))
    expect(new_dealership.average_price_of_car).to eq(7500)
  end

  it 'can provide list of cars based on make' do
    new_dealership = Dealership.new("Bob's Used Autos", "Sparta")
    new_dealership.add_car(Car.new("Tesla Tesla", 1000, 10))
    new_dealership.add_car(Car.new("Tesla Cybertruck", 1000, 10))
    new_dealership.add_car(Car.new("Nissan Juke", 1, 1))
    expect(new_dealership.cars_by_make("Tesla")[0].model).to eq("Tesla")
    expect(new_dealership.cars_by_make("Tesla")[1].model).to eq("Cybertruck")
    expect(new_dealership.cars_by_make("Tesla").length).to eq(2)
  end

  it 'can provide details' do
    new_dealership = Dealership.new("Bob's Used Autos", "Sparta")
    new_dealership.add_car(Car.new("Tesla Tesla", 1000, 10))
    new_dealership.add_car(Car.new("Tesla Cybertruck", 1000, 10))
    new_dealership.add_car(Car.new("Nissan Juke", 1, 1))
    new_dealership_details = new_dealership.details
    expect(new_dealership_details["total_value"]).to eq(20001)
    expect(new_dealership_details["address"]).to eq("Sparta")
  end

  it 'can provide a list of cars sorted by price' do
    new_dealership = Dealership.new("Bob's Used Autos", "Sparta")
    new_dealership.add_car(Car.new("Tesla Tesla", 1000, 10))
    new_dealership.add_car(Car.new("Nissan Juke", 100, 10))
    new_dealership.add_car(Car.new("Tesla Cybertruck", 500, 10))
    expect(new_dealership.cars_sorted_by_price[0].model).to eq("Juke")
    expect(new_dealership.cars_sorted_by_price[1].model).to eq("Cybertruck")
    expect(new_dealership.cars_sorted_by_price[2].model).to eq("Tesla")
  end
end