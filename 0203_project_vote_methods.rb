# 0203_project_vote_methods.rb
class System
	def beginPrimary
		puts "-"*55
		puts "-"*55
		@democratCandidates = [] #holds all democrat candidates for primary election
		@republicanCandidates = [] #holds all republican candidates for primary election
		@democratPrimaryVotes = [] #holds votes for democrat primary candidates
		@republicanPrimaryVotes = [] #holds votes for republican primary candidates
		Politician.getPoliticians.each {|voter| #scans Politicians for and puts them in the appropriate array
			if voter.Side == 'Republican'
				@republicanCandidates << voter.Name
			elsif voter.Side == 'Democrat'
				@democratCandidates << voter.Name
			end
		}
		@voterList.each {|voter| #scans all voters and randomly selects a primary candidate and puts them in the correct array
			case voter.Side 
			when ('Liberal' || 'Socialist' || 'Democrat')
				@democratPrimaryVotes << @democratCandidates.sample
			when ('Conservative' || 'Tea party' || 'Republican')
				@republicanPrimaryVotes << @republicanCandidates.sample
			end
		}
		@democratPrimaryTally = tally(@democratPrimaryVotes) #calls 'tally' method with array. returns a new hash with the number of times each element appears in that array.
		@republicanPrimaryTally = tally(@republicanPrimaryVotes)
		@dTally = 0 #initialize tally count
		@rTally = 0 #initialize tally count
		@democratPrimaryTally.each {|name,tallyP| # scans the tally Hash it determine which Key has the highest value
			if tallyP > @dTally #if current key has a higher value than the previous (0 at first)
				@democratPrimaryWinner = name #then set name to winner and go onto next object in hash
				@dTally = tallyP #set current high value to compare for the next element
			end
		}
		@republicanPrimaryTally.each {|name,tallyP| # scans the tally Hash it determine which Key has the highest value
			if tallyP > @rTally #if current key has a higher value than the previous (0 at first)
				@republicanPrimaryWinner = name  #then set name to winner and go onto next object in hash
				@rTally = tallyP #set current high value to compare for the next element
			end
		}

		puts "\nDemocrat primary Winner: #{@democratPrimaryWinner}\n" #display Democrat primary winner
		puts "\nRepublican primary Winner: #{@republicanPrimaryWinner}\n" #display Republican primary winner
	end

	def tally (votes) #Scans array for repeating objects and creates an hash of how many times items appear in that array
		tally = Hash.new(0)

		votes.each { |vote|
		  tally[vote] += 1
		}
		tally
	end

	def beginVote
		@votes = [] #array to add the random generated votes and what state they vote from
		@voterList.each { |voter| getVotes(voter)} #scans each voter and passes the voter through method getVotes method 
		tallyVotes
	end

	def getVotes (voter) #takes each vote and passes the state of the vote to the addVoter method with the expected probability
		case voter.Side 
		when 'Liberal'
			addVoter(voter.State,25)
		when 'Conservative'
			addVoter(voter.State,75)
		when 'Tea party'
			addVoter(voter.State,90)
		when 'Socialist'
			addVoter(voter.State,10)
		when 'Neutral'
			addVoter(voter.State,50)
		when 'Republican'
			addVoter(voter.State,100)
		when 'Democrat'
			addVoter(voter.State,0)
		end
	end

	def addVoter(state,percent) #uses the passed probability to determine if the vote is Republican or Democrat
		if rand(100) < percent 
			@votes << ['Republican',state] #pushes the votes to the @votes array
		else
			@votes << ['Democrat',state]
		end
	end

	def tallyVotes #Takes the votes array and calculates how many votes of each state
		@republicanVote = []
		@democratVote = []
		@votes.each { |vote| #scans each vote and seperates the Democrat vote and the Republican vote.
			if vote[0] == 'Democrat' #puts the 2nd element of each vote array into seperate arrays for republican and democrat
				@democratVote << vote[1] 
			else
				@republicanVote << vote[1]
			end
		}
		@democratVoteTally = tally(@democratVote) #sends the array of states for the republican vote through the tally method to count them
		@republicanVoteTally = tally(@republicanVote) #sends the array of states for the democrat vote through the tally method to count them
		republicanWinners = []
		democratWinners = []
		@democratVoteTally.each {|dState,dTally| #scans democrat hash of states with vote count
			@republicanVoteTally.each {|rState,rTally| #for each democrat vote it compares to the republican vote
				if (dState == rState && dTally > rTally) #compares the count of votes for each state puts the state in the winner variable
					democratWinners << dState
				elsif (dState == rState && rTally >= dTally) 
					republicanWinners << rState
				end
			}
		}
		puts "-"*55
		puts "Democrat Party wins the Electorial Votes for these states:"
		puts "-"*20
		democratWinners.each {|state| #Prints the democrat winners
			puts state
		}
		puts "\nRepublican Party wins the Electorial Votes for these states:"
		puts "-"*20
		republicanWinners.each {|state| #prints the republican winners
			puts state
		}
		puts "-"*55

		puts "Democrat: ",democratElectorials = tallyElectorials(democratWinners),"\n\n" #sends all winning states to tallyElectorials method to cound them.
		puts "Republican: ",republicanElectorials = tallyElectorials(republicanWinners),"\n"
		if democratElectorials > republicanElectorials #assigns the winner to a variable and displays results
			puts "The Democrat Party wins the Electorial vote!\n\n"
			@winner = @democratPrimaryWinner 
		else 
			puts "The Republican Party wins the Electorial vote!\n\n"
			@winner = @republicanPrimaryWinner
		end
		puts "-"*55
		puts "\nRepublican = #{@republicanVote.length} votes", "Democrat  = #{@democratVote.length} votes\n" #Displays how many votes each party gets
		print @republicanVote.length > @democratVote.length ? "Republican" : "Democrat"," party wins the popular vote!\n\n" #Displays the winner of the popular vote
		puts "-"*55
		puts "#{@winner} is the winner of the election!" #Yeah! a winner!
		puts "-"*55
		puts "-"*55

	end

	def tallyElectorials(states) # takes an array of states and compares to the hash of states + electorials
		electorialCount = 0
		states.each {|state|
			stateElectorials.each {|stateE,electorials| #for each state in array it adds the corresponding electorial votes 
				if state == stateE
					electorialCount += electorials
				end
			}
		}
		electorialCount #sends the total electorial votes back to calculate the winner.
	end
end