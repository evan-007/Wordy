task :import_db => :environment do
	require 'csv'
	words = 0 #value is the column in the .csv
	definitions = 1
	CSV.foreach("#{Rails.root}"+"/lib/ngsl-utf8.csv") do |row|
		Word.create(name: row[words], definition: row[definitions])
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