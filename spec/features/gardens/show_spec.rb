require 'rails_helper'

RSpec.describe 'the garden show page' do
  before :each do
    @garden = Garden.create!(name: 'Erins Garden', organic: true)
    @plot_1 = @garden.plots.create!(number: 1, size: "small", direction: 'east')
    @plot_2 = @garden.plots.create!(number: 2, size: "medium", direction: 'west')
    @plant_1 = @plot_1.plants.create!(name: 'Bell Pepper', description: 'Red bell pepper', days_to_harvest: 30)
    @plant_2 = @plot_1.plants.create!(name: 'Beet', description: 'Beet Root', days_to_harvest: 70)
    @plant_3 = @plot_2.plants.create!(name: 'Carrot', description: 'Purple Carrot', days_to_harvest: 10)
    @plant_4 = @plot_2.plants.create!(name: 'Kale', description: 'Dino Kale', days_to_harvest: 60)
  end

  it 'shows the garden attribute all its plants and plots' do
    visit "/gardens/#{@garden.id}"
    save_and_open_page
    expect(page).to have_content(@garden.name)
    expect(page).to have_content(@plant_1.name)
    expect(page).to have_content(@plant_2.name)
    expect(page).to have_content(@plant_3.name)
    expect(page).to have_content(@plant_4.name)
  end
end
