# 0203_project_voting.rb

require "./02_project_methods"


class System
	attr_accessor :voterList
	@@voterList = []
	def initialize
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
				endterToContinue
			when "Update"
				update
				displayConfirmation
			when "Vote"
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
		p type.new(name[0],name[1],side)
		#p self.Politician.PoliticianList
	end
	def get_Name(type)
		p "get name"
		correct = nil
		until correct == 'Y'
			fName = openQuestion("What is the first name of the #{type}.")
			lName = openQuestion("What is the last name of the #{type}.")
			correct = question("You entered \"#{fName} #{lName}\". Is this correct? 'Y' or 'N'")
		end
		[fName,lName]
	end
	def addVoter (voter)
		@@voterList << voter
	end
	def list
		puts `clear`
		@@voterList.each do |voter|
			print "#{voter.voterType}, #{voter.Name}, #{voter.Side}\n"
		end
	end
	def updateWhat
		puts `clear`
		list
		puts "\n\n"
		match = nil
		begin
			name = openQuestion("Who do you want to change?","stay")
			@@voterList.each_with_index do |voter,index| 
				match = index if name == voter.Name.downcase.capitalize
			end
			puts "\n\nThat name was not found.\n\n" if !match
		end until match
		voter = @@voterList[match]
		puts `clear`,"\n\n#{voter.Name} - #{voter.Side}\n\n"
		what = question("What do you want to change? 'Name' or 'Political side'?","stay")
		updateNow(voter,what)
	end
	def updateNow(voter,what)
		p voter
		case what
		when "Name"
			changeName(voter)
			# @@voterList[match].Name = getName(voterType)
			# @@voterList[match] = change
		when "Political side"
			voter.changeViews
			p @@voterList
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
	def Vote
	end
end

class Voter

end
class Politician < System
	attr_accessor :voterType,:fName,:lName, :Side, :Name,:PoliticianList
	@@PoliticianList = []
	def initialize(fName,lName,side)
		@voterType = "Politician"
		@fName = fName
		@lName = lName
		@Name = "#{fName} #{lName}"
		@Side = side
		puts "\n"*3,"Adding #{@Name} as Politician as a #{@Side}"
		# p self
		@@PoliticianList << self
		addVoter(self)
	end
	def changeSide

	end
	# def inspect
	# 	@Name
	# end
	# def to_s
	# 	@Name
	# end
end

class Person < System
	attr_accessor :voterType,:fName,:lName, :Side,:Name,:PeopleList
	@@PeopleList = []
	def initialize(fName,lName,side)
		@voterType = "Person"
		@fName = fName
		@lName = lName
		@Name = "#{fName} #{lName}"
		@Side = side
		puts "\n"*3,"Adding #{@Name} as person with #{@Side} views"
		@@PeopleList << self
		addVoter(self)
	end
	def changeViews
		@Side = question("What political side are your views? 'Liberal', 'Conservative', 'Tea party', 'Socialist', or 'Neutral'")
		p @@PeopleList
	end
	# def inspect
	# 	@Name
	# end
	# def to_s
	# 	@Name
	# end
end
# class Liberal < Person
# end
# class Conservative < Person
# end
# class Tea_Party < Person
# end
# class Socialist < Person
# end
# class Neutral < Person
# end

def test
#politicians = Politician.new
#people = Person.new
campaign = System.new
end
test