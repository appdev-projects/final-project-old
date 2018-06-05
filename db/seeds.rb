# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'csv'
csv_text = File.read(Rails.root.join('lib','seeds', 'location_geography.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = LocationGeography.new
  t.location_id = row['city']
  t.geography_id = row['geography']
  t.save
  puts "#{t.location_id}, saved" 
end

require 'csv'
csv_text = File.read(Rails.root.join('lib','seeds', 'location_activity.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = LocationActivity.new
  t.location_id = row['city']
  t.activity_id = row['feature']
  t.feature_rating = row['count']
  t.save
  puts "#{t.location_id}, saved" 
end
