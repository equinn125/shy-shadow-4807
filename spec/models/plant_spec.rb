require 'rails_helper'

RSpec.describe Plant do
  describe 'relationships' do
    it {should have_many :plant_plots}
    it { should have_many(:plots).through(:plant_plots) }
  end

  it 'tests the plant by garden method' do
    garden = Garden.create!(name: 'Erins Garden', organic: true)
    plot_1 = garden.plots.create!(number: 1, size: "small", direction: 'east')
    plot_2 = garden.plots.create!(number: 2, size: "medium", direction: 'west')
    plant_1 = plot_1.plants.create!(name: 'Bell Pepper', description: 'Red bell pepper', days_to_harvest: 300)
    plant_2 = plot_1.plants.create!(name: 'Beet', description: 'Beet Root', days_to_harvest: 70)
    plant_3 = plot_2.plants.create!(name: 'Carrot', description: 'Purple Carrot', days_to_harvest: 110)
    plant_4 = plot_2.plants.create!(name: 'Kale', description: 'Dino Kale', days_to_harvest: 60)
    expect(Plant.plants_by_garden(garden.id)).to eq([plant_1, plant_2, plant_3, plant_4])
  end
  it 'shows all plants that have less than 100 days to harvest' do
    garden = Garden.create!(name: 'Erins Garden', organic: true)
    plot_1 = garden.plots.create!(number: 1, size: "small", direction: 'east')
    plot_2 = garden.plots.create!(number: 2, size: "medium", direction: 'west')
    plant_1 = plot_1.plants.create!(name: 'Bell Pepper', description: 'Red bell pepper', days_to_harvest: 300)
    plant_2 = plot_1.plants.create!(name: 'Beet', description: 'Beet Root', days_to_harvest: 70)
    plant_3 = plot_2.plants.create!(name: 'Carrot', description: 'Purple Carrot', days_to_harvest: 110)
    plant_4 = plot_2.plants.create!(name: 'Kale', description: 'Dino Kale', days_to_harvest: 60)
    expect(Plant.plants_to_harvest).to eq([plant_2, plant_4])
  end
end
