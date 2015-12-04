#################
# 	Pieslicer   #
# 	  2015		#
#################

## --- Day 4, task 1: The Ideal Stocking Stuffer ---

# Now find one that starts with six zeroes.


require 'digest'

# ********** BODY *********** #

privKey = "ckczppom"
hashBeginning = "000000"

answer = 1
while true do
	md5 = Digest::MD5.hexdigest(privKey + answer.to_s)

	if md5.to_s.start_with? (hashBeginning)
		puts "Santas AdventCoin is: " + md5.to_s
		puts "With the answer: " + answer.to_s
		break
	end

	answer = answer + 1
end