# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
categories = Category.create([ { name: 'Beginner'}, {name: 'Intermediate'}, {name: 'Advanced'}
	])

lists = List.create([ {name: 'Beginner', id: 1}, { name: 'Intermediate', id: 2}, {name: 'Advanced', id: 3}  ])


require 'csv'
words = 0 #value is the column in the .csv
definitions = 1
@counter = 0
CSV.foreach("#{Rails.root}"+"/lib/ngsl-utf8.csv") do |row|
	category = Category.first(offset: rand(Category.count))
	Word.create(name: row[words], definition: row[definitions], categories: [category,])
	@counter += 1
	if @counter > 60
		exit
	end
end

Word.all.each do |word|  #why doesn't this work as a seed task, but works in rails console?
	if word.categories.first.id == 1
		Wordlist.create(list_id: 1, word_id: word.id)
	elsif word.categories.first.id == 2
		Wordlist.create(list_id: 2, word_id: word.id)
	elsif word.categories.first.id == 3
		Wordlist.create(list_id: 3, word_id: word_id)
	end
end
