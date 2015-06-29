# 0203_project_voting.rb

require "./02_project_methods"
require "./gen_voters"
require "./pickup"
require "./0203_project_vote_methods"
class System 
end #put this here because System class is a ancestor of Person and Politician.  It game me an error if I required the class Person and Class Politician before I define the System Class
require "./02_project_people&politicians" 


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
		task = question("What would you like to do? 'Create', 'List', 'Update', 'Vote', or 'Exit'")
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
		@voterList.sort! { |a,b| a.sortList(sortBy).downcase <=> b.sortList(sortBy).downcase } #compares consecutive items sorts list based of sortBy question
		puts "Last Name, First Name   | Voter Side          | Voter State         | Voter Type","="*86
		@voterList.each do |voter|#calls method to display names
			displayNamesInOrder(voter)
		end
	end

	def sortList(sortBy) #refactored the list method to determin which way to sort the list
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
		list('Name')#sorts list my Name and displays it
		puts "\n\n"
		match = nil
		begin
			name = openQuestion("Who do you want to change? Give me 'First Name' 'Last Name'","stay").strip.squeeze(" ")#asks what name to change
			@voterList.each_with_index do |voter,index| #scans the voterList to see if what was typed is included in list
				match = index if name == voter.Name.downcase.capitalize
			end
			puts "\n\nThat name was not found.\n\n" if !match
		end until match #loops until a match was found
		voter = @voterList[match] #sets match to voter variable
		puts `clear`,"\n\n#{voter.Name} - #{voter.Side} - #{voter.State}\n\n"
		what = question("What do you want to change? 'Name', 'Political side', or 'State'?","stay") #returns what you want to change
		updateNow(voter,what) #calls updateNow method and sends what needs to be changed and what to change
	end

	def updateNow(voter,what) #arguments: who needs to be changed and what should be changed
		case what
		when "Name"
			changeName(voter) #calls method to change name
		when "Political side"
			voter.changeViews #calls Voter class (Person, or Politician) method to change views
		when "State"
			voter.State = question("What state is this voter? \n\n#{statesList}")#changes state of voter
		end
	end

	def changeName(voter) 
		name = get_Name(voter.voterType) #calls pervious get_name method to change Name
		voter.fName = name[0] #change voter fName
		voter.lName = name[1] #change voter lName
		voter.Name = "#{name[0]} #{name[1]}" #combine fName and Lname to change Name
	end
end

begin #Loop to restart campaign if you want
System.new #intiate the campagin
again = question("Do you want to start a new campagin? 'Y' or 'N'") #new campagin?
end until again == 'N'



