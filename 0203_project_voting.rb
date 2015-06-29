# 0203_project_voting.rb

require "./02_project_methods"
require "./gen_voters"
require "./pickup"


class System
	attr_accessor :voterList
	def initialize
		@voterList = []
		@votes = []
		@republicanVote= []
		@democratVote = []
		if question("Do you want to auto load voters? 'Y' or 'N'") == "Y"#question is a method that returns only whatever is in single quotes when it is typed
			gen_people(openNumberQuestion("How many? (200,000 max)",200_000))#Gen_people is a method auto generate people for campagin and openNumberQuestion returns a only a number when it is typed.
		end
		if question("Do you want to auto load politicians? 'Y' or 'N'") == "Y"
			gen_politicians(openNumberQuestion("How many? (50 max)",50))#generates politicians for voting system
		end
		menu
	end

	def menu
		task = question("What would you like to do? 'Create', 'List', 'Update', 'Vote',or 'Exit'")
		case task
			when "Create"
				create #method to start creating a Politician or Person
				displayConfirmation #show that create is finished and return to menu
			when "List"
				list #ask how list should be displayed and shows list
				enterToContinue #prompt to return to menu
				menu
			when "Update"
				updateWhat #method to start the update process
				displayConfirmation
			when "Vote"
				beginPrimary #method to determine who is representing Democrats and Republicans
				beginVote #method to determine if Democrat or Republican wins
				enterToContinue
				menu
			when "Exit"
		end
	end

	def create #ask if you want to create a Politican or Person
		create = question("What would you like to create? 'Politician', or 'Person'")
		case create
			when "Politician" #add_someone creates a specific class of type Person or Politician
				add_Someone("What political side is this politician? 'Democrat', or 'Republican'",Politician)
			when "Person"
				add_Someone("What political side are your views? 'Liberal', 'Conservative', 'Tea party', 'Socialist', or 'Neutral'",Person)
		end
	end

	def add_Someone(string,type)
		name = get_Name(type) #get_Name is a method that returns an array of [FirstName,LastName]
		side = question(string) #Calls the question method with a string for a Politician or Person 
		state = question("What state is this voter? \n\n#{statesList}") #returns a state from the stateList
		@voterList << type.new(name[0],name[1],side,state) #creates a new class of Type Politican or Person and passes it to the @voterList
	end

	def get_Name(type) #method to ask the name and returns an array of first name and last name.
		correct = nil
		until correct == 'Y'
			fName = openQuestion("What is the first name of the #{type}.")
			lName = openQuestion("What is the last name of the #{type}.")
			correct = question("You entered \"#{fName} #{lName}\". Is this correct? 'Y' or 'N'")
		end
		[fName,lName]
	end

	def list(sortLastName = nil,sortBy = 'Name')#By default asks how to sort.  When passed sortLastName it skips the question and sorts by Name
		puts `clear`,"\n"*3
		sortBy = question("How would you like to sort your voter list? 'Name', 'State', or political 'Side'") unless sortLastName
		@voterList.sort! { |a,b| a.sortList(sortBy).downcase <=> b.sortList(sortBy).downcase } #sorts list based of sortBy question
		puts "Last Name, First Name   | Voter Side          | Voter State         | Voter Type","="*86
		@voterList.each do |voter|#calls method to display names
			displayNamesInOrder(voter)
		end
	end

	def sortList(sortBy)
		case sortBy
		when 'Name'
			@lName
		when 'State'
			@State
		when 'Side'
			@Side
		end
	end

	def updateWhat
		puts `clear`
		list('Name')
		puts "\n\n"
		match = nil
		begin
			name = openQuestion("Who do you want to change? Give me 'First Name' 'Last Name'","stay").strip.squeeze(" ")
			@voterList.each_with_index do |voter,index| 
				match = index if name == voter.Name.downcase.capitalize
			end
			puts "\n\nThat name was not found.\n\n" if !match
		end until match
		voter = @voterList[match]
		puts `clear`,"\n\n#{voter.Name} - #{voter.Side} - #{voter.State}\n\n"
		what = question("What do you want to change? 'Name', 'Political side', or 'State'?","stay")
		updateNow(voter,what)
	end

	def updateNow(voter,what)
		case what
		when "Name"
			changeName(voter)
		when "Political side"
			voter.changeViews
		when "State"
			voter.State = question("What state is this voter? \n\n#{statesList}")
		end
	end

	def changeName(voter)
		name = get_Name(voter.voterType)
		voter.fName = name[0]
		voter.lName = name[1]
		voter.Name = "#{name[0]} #{name[1]}"
	end

	def beginPrimary
		puts "-"*55
		puts "-"*55
		@democratCandidates = []
		@republicanCandidates = []
		@democratPrimaryVotes = []
		@republicanPrimaryVotes = []
		@voterList.each {|voter|
			if voter.Side == 'Republican'
				@republicanCandidates << voter.Name
			elsif voter.Side == 'Democrat'
				@democratCandidates << voter.Name
			end
		}
		@voterList.each {|voter| 
			case voter.Side 
			when ('Liberal' || 'Socialist' || 'Democrat')
				@democratPrimaryVotes << @democratCandidates.sample
			when ('Conservative' || 'Tea party' || 'Republican')
				@republicanPrimaryVotes << @republicanCandidates.sample
			end
		}
		@democratPrimaryTally = tally(@democratPrimaryVotes)
		@republicanPrimaryTally = tally(@republicanPrimaryVotes)
		@dTally = 0
		@rTally = 0
		@democratPrimaryTally.each {|name,tallyP|
			if tallyP > @dTally
				@democratPrimaryWinner = name 
				@dTally = tallyP
			end
		}
		@republicanPrimaryTally.each {|name,tallyP|
			if tallyP > @rTally
				@republicanPrimaryWinner = name 
				@rTally = tallyP
			end
		}

		puts "\nDemocrat primary Winner: #{@democratPrimaryWinner}\n"
		puts "\nRepublican primary Winner: #{@republicanPrimaryWinner}\n"
	end

	def beginVote
		@votes = []
		@voterList.each { |voter| getVotes(voter)}
		tallyVotes
	end

	def getVotes (voter)
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

	def addVoter(state,percent)

		if rand(100) < percent 
			@votes << ['Republican',state] 
		else
			@votes << ['Democrat',state]
		end
	end

	def tallyVotes
		@republicanVote = []
		@democratVote = []
		@votes.each { |vote| 
			if vote[0] == 'Democrat'
				@democratVote << vote[1]
			else
				@republicanVote << vote[1]
			end
		}
		@democratVoteTally = tally(@democratVote)
		@republicanVoteTally = tally(@republicanVote)
		republicanWinners = []
		democratWinners = []
		@democratVoteTally.each {|dState,dTally|
			@republicanVoteTally.each {|rState,rTally|
				if (dState == rState && dTally > rTally)
					democratWinners << dState
				elsif (dState == rState && rTally >= dTally)
					republicanWinners << rState
				end
			}
		}
		puts "-"*55
		puts "Democrat Party wins the Electorial Votes for these states:"
		puts "-"*20
		democratWinners.each {|state|
			puts state
		}
		puts "\nRepublican Party wins the Electorial Votes for these states:"
		puts "-"*20
		republicanWinners.each {|state|
			puts state
		}
		puts "-"*55

		puts "Democrat: ",democratElectorials = tallyElectorials(democratWinners),"\n\n"
		puts "Republican: ",republicanElectorials = tallyElectorials(republicanWinners),"\n"
		if democratElectorials > republicanElectorials
			puts "The Democrat Party wins the Electorial vote!\n\n"
			@winner = @democratPrimaryWinner
		else 
			puts "The Republican Party wins the Electorial vote!\n\n"
			@winner = @republicanPrimaryWinner
		end
		puts "-"*55
		puts "\nRepublican = #{@republicanVote.length} votes", "Democrat  = #{@democratVote.length} votes\n"
		print @republicanVote.length > @democratVote.length ? "Republican" : "Democrat"," party wins the popular vote!\n\n"
		puts "-"*55
		puts "#{@winner} is the winner of the election!"
		puts "-"*55
		puts "-"*55

	end

	def tallyElectorials(states)
		electorialCount = 0
		states.each {|state|
			stateElectorials.each {|stateE,electorials|
				if state == stateE
					electorialCount += electorials
				end
			}
		}
		electorialCount
	end

	def tally (votes)
		tally = Hash.new(0)

		votes.each { |vote|
		  tally[vote] += 1
		}
		tally
	end
end

class Politician < System
	attr_accessor :voterType,:fName,:lName, :Side, :Name,:State,:PoliticianList
	@@PoliticianList = []
	def initialize(fName,lName,side,state)
		@voterType = "Politician"
		@fName = fName
		@lName = lName
		@Name = "#{fName} #{lName}"
		@Side = side
		@State = state
		@@PoliticianList << self
	end
	def changeViews#(person)
		@Side = question("What political side are campainging for? 'Republican' or 'Democrat'")
	end
	def self.getPoliticians
		@@PoliticianList
	end
end

class Person < System
	attr_accessor :voterType,:fName,:lName, :Side,:Name,:State,:PeopleList
	@@PeopleList = []
	def initialize(fName,lName,side,state)
		@voterType = "Person"
		@fName = fName
		@lName = lName
		@Name = "#{fName} #{lName}"
		@Side = side
		@State = state
		@@PeopleList << self
	end
	def changeViews#(person)
		@Side = question("What political side are your views? 'Liberal', 'Conservative', 'Tea party', 'Socialist', or 'Neutral'")
	end
	def self.getPeople
		@@PeopleList
	end
end

begin #Loop to restart campaign if you want
campaign = System.new
again = question("Do you want to start a new campagin? 'Y' or 'N'")
end until again == 'N'



