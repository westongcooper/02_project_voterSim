





# 02_project_voters.rb
def gen_people
	politics = gen_Politics
	@voterList << Person.new[gen_fNames, genlNames, politics[1],gen_State]
	else
		@voterList << Politician.new[gen_fNames, genlNames, politics[1],gen_State]
	end
end
 
def add_people
	people.each do |person| 
		@voterList << Person.new(person[0],person[1],person[2],person[3])
	end
	people
end
def add_politicians
	politicians = []
	politicians << "Andrew,Olson,Repubican,Virginia".split(",")
	politicians << "Joe,Fuller,Democrat,Alaska".split(",")
	politicians << "Jeremy,Arnold,Democrat,California".split(",")
	politicians << "Shawn,Russell,Repubican,Connecticut".split(",")
	politicians << "Susan,Welch,Repubican,Florida".split(",")
	politicians << "Kathy,Hart,Repubican,Oregon".split(",")
	politicians << "Ralph,Cox,Repubican,Texas".split(",")
	politicians << "Shirley,Owens,Democrat,Missouri".split(",")
	politicians << "Doris,Williamson,Democrat,Missouri".split(",")
	politicians << "Tammy,Payne,Repubican,Florida".split(",")
	politicians << "Tina,Moreno,Democrat,Michigan".split(",")
	politicians << "Diane,Kennedy,Repubican,New Mexico".split(",")
	politicians << "Anne,Nguyen,Democrat,Nebraska".split(",")
	politicians << "Norma,Johnson,Repubican,Texas".split(",")
	politicians << "Karen,Perez,Democrat,Georgia".split(",")
	politicians << "Shawn,Parker,Democrat,Massachusetts".split(",")
	politicians << "Cheryl,Gray,Democrat,New Mexico".split(",")
	politicians << "Betty,Gilbert,Democrat,Ohio".split(",")
	politicians << "Tina,Dean,Democrat,Kansas".split(",")
	politicians << "Wayne,Kennedy,Repubican,Delaware".split(",")
	politicians << "Debra,Ryan,Democrat,Washington".split(",")
	politicians << "Jacqueline,Alexander,Democrat,Virginia".split(",")
	politicians << "Judy,Powell,Democrat,California".split(",")
	politicians << "Arthur,Jenkins,Repubican,Texas".split(",")
	politicians << "Joan,Washington,Repubican,Louisiana".split(",")
	politicians.each do |politician| 
	@voterList << Politician.new(politician[0],politician[1],politician[2],politician[3])
end
end
# p add_people