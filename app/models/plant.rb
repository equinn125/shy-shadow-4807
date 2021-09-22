class Plant < ApplicationRecord
  has_many :plant_plots, dependent: :destroy
  has_many :plots, through: :plant_plots

  def self.plants_by_garden(garden_id)
    joins(:plots).where('plots.garden_id': garden_id).distinct
  end

  def self.plants_to_harvest
    where('days_to_harvest < ?', 100)
  end
end
