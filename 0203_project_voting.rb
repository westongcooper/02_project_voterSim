# 0203_project_voting.rb

require "./02_project_methods"
require "./02_project_voters"


class System
	attr_accessor :voterList
	def initialize
		@voterList = []
		add_people if question("Do you want to auto load voters? 'Y' or 'N'") == "Y"
		add_politicians if question("Do you want to auto load politicians? 'Y' or 'N'") == "Y"
		menu
	end
	def menu
		task = question("What would you like to do? 'Create', 'List', 'Update', or 'Vote'")
		case task
			when "Create"
				create
				displayConfirmation
			when "List"
				list
				enterToContinue
				menu
			when "Update"
				updateWhat
				displayConfirmation
			when "Vote"
				beginVote
		end
	end
	def create
		create = question("What would you like to create? 'Polit', or 'Person'")
		case create
			when "Polit"
				add_Someone("What political side is this politician? 'Democrat', or 'Republican'",Politician)
			when "Person"
				add_Someone("What political side are your views? 'Liberal', 'Conservative', 'Tea party', 'Socialist', or 'Neutral'",Person)
		end
	end
	def add_Someone(string,type)
		name = get_Name(type)
		side = question(string)
		state = question("What state is this voter? \n\n#{states}")
		@voterList << type.new(name[0],name[1],side,state)
	end
	def get_Name(type)
		correct = nil
		until correct == 'Y'
			fName = openQuestion("What is the first name of the #{type}.")
			lName = openQuestion("What is the last name of the #{type}.")
			correct = question("You entered \"#{fName} #{lName}\". Is this correct? 'Y' or 'N'")
		end
		[fName,lName]
	end
	def addVoter (voter)
		@voterList << voter
	end
	def list(sortLastName = nil)
		puts `clear`,"\n"*3
		sortBy = question("How would you like to sort your voter list? 'Name', 'State', or political 'Side'") unless sortLastName
		case sortBy
		when 'Name'
			@voterList.sort! { |a,b| a.lName.downcase <=> b.lName.downcase }
		when 'State'
			@voterList.sort! { |a,b| a.State.downcase <=> b.State.downcase }
		when 'Side'
			@voterList.sort! { |a,b| a.Side.downcase <=> b.Side.downcase }
		end
		puts "Last Name, First Name   | Voter Side          | Voter State         | Voter Type","="*86
		@voterList.each do |voter|
			displayNamesInOrder(voter)
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
			voter.State = question("What state is this voter? \n\n#{states}")
		end
	end
	def changeName(voter)
		name = get_Name(voter.voterType)
		voter.fName = name[0]
		voter.lName = name[1]
		voter.Name = "#{name[0]} #{name[1]}"
	end
	#def changeSide(voter)
	#	voter.changeSide
	#end
	def beginVote
		p Politician.getPoliticians
		puts "\n\n"
		p Person.getPeople
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
		puts "\n"*3,"Adding #{@Name} as Politician as a #{@Side}"
		# p self
		@@PoliticianList << self
	end
	def changeViews#(person)
		@Side = question("What political side are campainging for? 'Republican' or 'Democrat'")
	end
	def self.getPoliticians
		@@PoliticianList
	end

	# def inspect
	# 	@Name
	# end
	# def to_s
	# 	@Name
	# end
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
		puts "\n"*3,"Adding #{@Name} as person with #{@Side} views"
		@@PeopleList << self
	end
	def changeViews#(person)
		@Side = question("What political side are your views? 'Liberal', 'Conservative', 'Tea party', 'Socialist', or 'Neutral'")
	end
	def self.getPeople
		@@PeopleList
	end
	# def inspect
	# 	@Name
	# end
	# def to_s
	# 	@Name
	# end
end

# require 'minitest/autorun'

# class TestVoterSim < Minitest::Test
# 	def test_votersim
# 		campaign = System.new
# 	end
# end

campaign = System.new





