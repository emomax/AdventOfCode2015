#################
# 	Pieslicer   #
# 	  2015		#
#################

## --- Day 4, task 1: The Ideal Stocking Stuffer ---

# Santa needs help mining some AdventCoins (very similar
# to bitcoins) to use as gifts for all the economically
# forward-thinking little girls and boys.

# To do this, he needs to find MD5 hashes which, in hexadecimal,
# start with at least five zeroes. The input to the MD5 hash
# is some secret key (your puzzle input, given below)
# followed by a number in decimal. To mine AdventCoins,
# you must find Santa the lowest positive number (no
# leading zeroes: 1, 2, 3, ...) that produces such a hash.

# Your puzzle input is [ckczppom].


require 'digest'

# ********** BODY *********** #


privKey = "ckczppom"
hashBeginning = "00000"

answer = 1
while true do
	md5 = Digest::MD5.new
	md5.update privKey + answer.to_s

	if md5.to_s.start_with? (hashBeginning)
		puts "Santas AdventCoin is: " + md5.to_s
		puts "With the answer: " + answer.to_s
		break
	end

	answer = answer + 1
end