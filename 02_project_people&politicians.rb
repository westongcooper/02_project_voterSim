# 02_project_people&politicians.rb
class Politician < System #A class for each Politician
	attr_accessor :voterType,:fName,:lName, :Side, :Name,:State,:PoliticianList
	@@PoliticianList = []
	def initialize(fName,lName,side,state)
		@voterType = "Politician"
		@fName = fName
		@lName = lName
		@Name = "#{fName} #{lName}"
		@Side = side
		@State = state
		@@PoliticianList << self #Moves created politician to an array to store each
	end
	def changeViews#special method to refactor the create/update method for politicians
		@Side = question("What political side are campainging for? 'Republican' or 'Democrat'")
	end

	def self.getPoliticians #returns the list of politicians
		@@PoliticianList 
	end
end

class Person < System #A class for each voter
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

	def changeViews #special method to refactor the create/update method for a person
		@Side = question("What political side are your views? 'Liberal', 'Conservative', 'Tea party', 'Socialist', or 'Neutral'")
	end
	def self.getPeople
		@@PeopleList #returns the list of people
	end
end