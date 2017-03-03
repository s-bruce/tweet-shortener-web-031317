def dictionary
	dictionary_hash = {
		hello: "hi",
		to: "2",
		two: "2",
		too: "2",
		for: "4",
		four: "4",
		be: "b",
		you: "u",
		at: "@",
		and: "&"
	}
end

def word_substituter(tweet)
	tweet = tweet.split
	dictionary_hash = dictionary
	dictionary_keys = dictionary_hash.keys

	tweet = tweet.collect do |word|
		if dictionary_keys.include?(word.downcase.to_sym)
			word = dictionary_hash[word.downcase.to_sym]
		else
			word
		end
	end

	tweet = tweet.join(" ")
end

def bulk_tweet_shortener(tweets_array)
	tweets_array.each do |tweet|
		puts word_substituter(tweet)
	end
end

def selective_tweet_shortener(tweet)
	if tweet.length > 140
		word_substituter(tweet)
	else
		tweet
	end
end

def shortened_tweet_truncator(tweet)
	tweet = selective_tweet_shortener(tweet)

	if tweet.length > 140
		tweet = tweet[0..136] + "..."
	else
		tweet
	end
end

