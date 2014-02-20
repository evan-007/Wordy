require 'unirest'

module Aylien


	@key = 'M2sq25zthb1e6XHg6JNmJgS8rZEn7IAM'

	@base = "refactor the url"

	class << self

		def extract(url)
			Unirest::get "https://aylien-text.p.mashape.com/extract?url=#{url}", 
			headers: { 
				"X-Mashape-Authorization" => "#{@key}"
			}
		end

		def summarize(url)
			Unirest::get "https://aylien-text.p.mashape.com/summarize?url=#{url}", 
			headers: { 
				"X-Mashape-Authorization" => "#{@key}"
			}
		end

		def classify(url)
			Unirest::get "https://aylien-text.p.mashape.com/classify?url=#{url}", 
			headers: { 
				"X-Mashape-Authorization" => "#{@key}"
			}
		end

		def concepts(url)
			Unirest::get "https://aylien-text.p.mashape.com/concepts?url=#{url}", 
			headers: { 
				"X-Mashape-Authorization" => "#{@key}"
			}
		end

		def entities(url)
			Unirest::get "https://aylien-text.p.mashape.com/entities?url=#{url}", 
			headers: { 
				"X-Mashape-Authorization" => "#{@key}"
			}
		end

		def hashtags(url)
			Unirest::get "https://aylien-text.p.mashape.com/hashtags?url=#{url}", 
			headers: { 
				"X-Mashape-Authorization" => "#{@key}"
			}
		end

		def language(url)
			Unirest::get "https://aylien-text.p.mashape.com/language?url=#{url}", 
			headers: { 
				"X-Mashape-Authorization" => "#{@key}"
			}
		end

		def sentiment(url)
			Unirest::get "https://aylien-text.p.mashape.com/sentiment?url=#{url}", 
			headers: { 
				"X-Mashape-Authorization" => "#{@key}"
			}
		end
	end
end