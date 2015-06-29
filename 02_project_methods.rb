# 02_project_methods.rb
Loadtime = 1.5
# ," "*(15-voter.lName.length)
def displayNamesInOrder(voter) #method to format the list of people and politicians
	print voter.lName,", ", voter.fName," "*(23-voter.Name.length),"| ",voter.Side," "*(20-voter.Side.length),"| ",voter.State," "*(20-voter.State.length),"| ",voter.voterType," "*(20-voter.voterType.length),"\n"
end

def question(question,stay = nil) #processes string and takes the elements in single quotes as the only options for what can be expected.  The options in 'Single quotes' must start with a capitol letter
	puts `clear` if ! stay #keeps screen from clearing if passed a value for stay
	options = question.scan(/'([^']*)'/).flatten #takes string and extracts items in single quotes
	begin
		answer = "" #initialize answer
		puts question,"\n" #prints passed string with options
		answer = gets.chomp.downcase.capitalize while answer.empty? #Prevents an empty response from ending loop
		if options.include? answer
			return answer #returns the option when it matches
		else
			puts `clear`
			puts "Sorry, not valid response\n"
			puts "="*75
		end
	end until options.include? answer #starts over question if gets.chomp does not match any options
end

def openQuestion(question,stay = nil) #displays question and prevents empty answers
	puts `clear` if ! stay
	begin
		answer = ""
		puts question
		answer = gets.chomp while answer.empty?
		puts `clear` if !stay
	end
	answer.downcase.capitalize#format response for a name
end

def openNumberQuestion(question,number) #method to make sure a number is entered and it is in the expected range
	puts `clear`
	begin
		answer = ""
		puts question
		answer = gets.chomp while answer.empty? #prevents empty response
		puts `clear`
	end until (answer.is_i? && answer.to_i <= number) #is response a number and less than the passed limit 'number'
	answer.to_i#return number response
end

def displayConfirmation #method to display that the process is complete
	puts "\n"*5,"#{" "*30}Processing!"
	sleep(Loadtime)
	puts "\n"*2,"#{" "*30}Finished!"
	begin
		puts "\n\nPress enter to return to continue"
		continue = gets.chomp
	end until continue #when anything is entered it returns to menu
	menu
end

def enterToContinue #Stops until anything is entered.
		begin
			puts "\n\nPress enter to return to continue"
			continue = gets.chomp
		end until continue
end

def statesList #list of states to use as options in openQuestion
	statesList = 	"'Alabama''Alaska''Arizona''Arkansas''California'\n'Colorado''Connecticut''Delaware''District of columbia''Florida'\n'Georgia''Hawaii''Idaho''Illinois''Indiana''Iowa''Kansas''Kentucky'\n'Louisiana''Maine''Montana''Nebraska''Nevada''New hampshire'\n'New jersey''New ,mexico''New york''North carolina''North dakota''Ohio'\n'Oklahoma''Oregon''Maryland''Massachusetts''Michigan''Minnesota'\n'Mississippi''Missouri''Pennsylvania''Rhode island''South carolina'\n'South Dakota''Tennessee''Texas''Utah''Vermont''Virginia''Washington'\n'West virginia''Wisconsin''Wyoming'"
end


def gen_people(number) #generates a number of people based off howmany is passed to method
	completePercent = 0 #initialize percent
	print "\n"*8," "*20,"Loading...\n\n" #center 'loading' on screen
	number.times do |i| #create new person 'number' of times
		@voterList << Person.new(random_fNames, random_lNames, random_Person,random_State) #uses gen_voters.rb to create random person
		complete = ((i/number.to_f*55).to_i)+1 #calculate the percent complete to display stars of the progress
		if completePercent != complete
			print "*" #when percent complete changes it adds a star to screen.
			completePercent = complete 
		end
		#print "*"*(i/number.to_f)
	end
	print "\n"*3," "*20,"  Done!" #display when process is done
	sleep(1)
end

def gen_politicians(number) #generates a number of politicians
	number.times do
		@voterList << Politician.new(random_fNames, random_lNames, random_Politician,random_State) #uses gen_voters.rb to create random politicians
	end
end

class String #add a method to string class to make see if the 'string' is a number
    def is_i?
       !!(self =~ /\A[-+]?[0-9]+\z/)
    end
end
