# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Park.destroy_all
Resort.destroy_all
Restaurant.destroy_all
Attraction.destroy_all

require 'json'

resorts_resp = RestClient.get('https://touringplans.com/walt-disney-world/resort-dining.json')
resorts_data = JSON.parse(resorts_resp, symbolize_names: true)

mk_resp = RestClient.get('https://touringplans.com/magic-kingdom/attractions.json')
mk_attractions = JSON.parse(mk_resp, symbolize_names: true)

epcot_resp = RestClient.get('https://touringplans.com/epcot/attractions.json')
epcot_attractions = JSON.parse(epcot_resp, symbolize_names: true)

ak_resp = RestClient.get('https://touringplans.com/animal-kingdom/attractions.json')
ak_attractions = JSON.parse(ak_resp, symbolize_names: true)

hs_resp = RestClient.get('https://touringplans.com/hollywood-studios/attractions.json')
hs_attractions = JSON.parse(hs_resp, symbolize_names: true)

mk_dining_resp = RestClient.get('https://touringplans.com/magic-kingdom/dining.json')
mk_dining = JSON.parse(mk_dining_resp, symbolize_names: true).flatten

epcot_dining_resp = RestClient.get('https://touringplans.com/epcot/dining.json')
epcot_dining = JSON.parse(epcot_dining_resp, symbolize_names: true).flatten

ak_dining_resp = RestClient.get('https://touringplans.com/animal-kingdom/dining.json')
ak_dining = JSON.parse(ak_dining_resp, symbolize_names: true).flatten

hs_dining_resp = RestClient.get('https://touringplans.com/hollywood-studios/dining.json')
hs_dining = JSON.parse(hs_dining_resp, symbolize_names: true).flatten


mk = Park.create(name: 'Magic Kingdom')
epcot = Park.create(name: 'Epcot')
ak = Park.create(name: 'Animal Kingdom')
hs = Park.create(name: 'Hollywood Studios')

mk_attractions.each do |attraction|
  mk.attractions.create(name: attraction[:short_name])
end

mk_dining.each do |restaurant|
  mk.restaurants.create(name: restaurant[:name])
end

epcot_attractions.each do |attraction|
  epcot.attractions.create(name: attraction[:short_name])
end

epcot_dining.each do |restaurant|
  epcot.restaurants.create(name: restaurant[:name])
end

ak_attractions.each do |attraction|
  ak.attractions.create(name: attraction[:short_name])
end

ak_dining.each do |restaurant|
  ak.restaurants.create(name: restaurant[:name])
end

hs_attractions.each do |attraction|
  hs.attractions.create(name: attraction[:short_name])
end

hs_dining.each do |restaurant|
  hs.restaurants.create(name: restaurant[:name])
end

resorts_data.each do |resort_data|
  resort = Resort.create(name: resort_data[:name])
  resort_data[:dinings].each do |restaurant_data|
    resort.restaurants.create(name: restaurant_data[:name])
  end
end
