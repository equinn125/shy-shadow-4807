class Plot < ApplicationRecord
  belongs_to :garden
  has_many :plant_plots, dependent: :destroy
  has_many :plants, through: :plant_plots

  def plants_to_harvest
    plants.where('days_to_harvest <?', 100)
  end
end
