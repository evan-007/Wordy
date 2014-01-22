# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
categories = Category.create([ { name: 'Beginner'}, {name: 'Intermediate'}, {name: 'Advanced'}
	])


require 'csv'
words = 0 #value is the column in the .csv
definitions = 1
@counter = 0
CSV.foreach("#{Rails.root}"+"/lib/ngsl-utf8.csv") do |row|
	Word.create(name: row[words], definition: row[definitions])
	@counter += 1
	if @counter > 60
		exit
	end
end

