require 'rspec'
require './lib/dealership'

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
end