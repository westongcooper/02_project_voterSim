# 02_project_methods.rb
Loadtime = 1.5
# ," "*(15-voter.lName.length)
def displayNamesInOrder(voter)
	print voter.lName,", ", voter.fName," "*(23-voter.Name.length),"| ",voter.Side," "*(20-voter.Side.length),"| ",voter.State," "*(20-voter.State.length),"| ",voter.voterType," "*(20-voter.voterType.length),"\n"
end
def question(question,stay = nil)
	puts `clear` if ! stay
	options = question.scan(/'([^']*)'/).flatten
	begin
		answer = ""
		puts question,"\n"
		answer = gets.chomp.downcase.capitalize while answer.empty?
		if options.include? answer
			return answer
		else
			puts `clear`
			puts "Sorry, not valid response\n"
			puts "="*75
		end
	end until question.include? answer
end

def openQuestion(question,stay = nil)
	puts `clear` if ! stay
	begin
		answer = ""
		puts question
		answer = gets.chomp while answer.empty?
		puts `clear` if !stay
		#if answer =~ /\W/ #checks to see if answer includes non letters
			#puts `clear`
			#puts "Please no characters."
			#puts "="*75
			#retry
		#end
		#yORn = question("You entered \"#{answer}\". is that correct? 'Y' or 'N'")
	end #until yORn == 'Y'
	answer.downcase.capitalize
end
def displayConfirmation
	puts "\n"*5,"#{" "*30}Processing!"
	sleep(Loadtime)
	puts "\n"*2,"#{" "*30}Finished!"
	begin
		puts "\n\nPress enter to return to continue"
		continue = gets.chomp
	end until continue
	menu
end
def enterToContinue
			begin
			puts "\n\nPress enter to return to continue"
			continue = gets.chomp
		end until continue
end
def states
statesList = "'Alabama''Alaska''Arizona''Arkansas''California'\n'Colorado''Connecticut''Delaware''District of Columbia''Florida'\n'Georgia''Hawaii''Idaho''Illinois''Indiana''Iowa''Kansas''Kentucky'\n'Louisiana''Maine''Montana''Nebraska''Nevada''New Hampshire'\n'New Jersey''New Mexico''New York''North Carolina''North Dakota''Ohio'\n'Oklahoma''Oregon''Maryland''Massachusetts''Michigan''Minnesota'\n'Mississippi''Missouri''Pennsylvania''Rhode Island''South Carolina'\n'South Dakota''Tennessee''Texas''Utah''Vermont''Virginia''Washington'\n'West Virginia''Wisconsin''Wyoming'"
end
