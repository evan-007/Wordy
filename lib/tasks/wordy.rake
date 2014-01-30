task :import_db => :environment do
	require 'csv'
	words = 0 #value is the column in the .csv
	definitions = 1
	CSV.foreach("#{Rails.root}"+"/lib/ngsl-utf8.csv") do |row|
		Word.create(name: row[words], definition: row[definitions])
	end
end

task :db_pos => :environment do
	require 'csv'
	require 'nokogiri'
	require 'open-uri'
	words = 0
	definitions =1
	pos = 2
	@counter = 0
	CSV.foreach("#{Rails.root}"+"/lib/ngsl-utf8.csv") do |row|
		page = Nokogiri::HTML(open('http://dictionary.reference.com/browse/'+"#{row[0]}"))
		newpos = page.xpath('/html/body/div[3]/div[2]/div[2]/center/div/div/div[2]/div[3]/div/div[3]/div/div/div/div/div[2]/div/span').first.text
		row[pos] = newpos
		@counter += 1
		break if @counter > 10
	end
end

task :import_pos => :environment do
	require 'nokogiri'
	require 'open-uri'
	words = Word.all
	words.each do |word|
		page = Nokogiri::HTML(open('http://dictionary.reference.com/browse/'+"#{word.name}"))
		pos =page.xpath('/html/body/div[3]/div[2]/div[2]/center/div/div/div[2]/div[3]/div/div[3]/div/div/div/div/div[2]/div/span').first.text
		word.update(pos: pos)
	end
end

task :import_ipa => :environment do
	require 'nokogiri'
	require 'open-uri'
	words = Word.all
	words.each do |word|
		page = Nokogiri::HTML(open('http://dictionary.reference.com/browse/'+"#{word.name}"))
		ipa = page.xpath('/html/body/div[3]/div[2]/div[2]/center/div/div/div[2]/div[3]/div/div[3]/div/div/div/div/div/span/span[2]/span[2]').text
		word.update(ipa: ipa)
	end
end

task :fake_cats => :environment do
	words = Word.all.each do |word|
		category = Category.first(offset: rand(Category.count))
		word.update(categories: [category,])
	end
end

task :heroku_seed => :environment do
	require 'csv'
	words = 0 #value is the column in the .csv
	definitions = 1
	@counter = 0
	CSV.foreach("#{Rails.root}"+"/lib/ngsl-utf8.csv") do |row|
		Word.create(name: row[words], definition: row[definitions])
		@counter += 1
		if @counter > 25
			exit
		end
	end
end

task :seed_examples => :environment do
end
