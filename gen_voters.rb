require "./pickup"
def random_fNames #picks random first name
%w{Scott Matthew Terry Betty Cheryl Harry Dennis Thomas Adam Arthur Maria Martin Howard Jane Russell Kathryn Judy Shirley Johnny Alice Christina Dennis Bonnie Jeffrey Dennis Larry Shirley Fred Diane Antonio Carl Willie Julie Deborah Steven Paula Janet Brenda Annie Betty Michelle Ralph Roger Diane Carolyn Roy Terry Jacqueline Jessica Anna Lisa Jerry Annie Matthew Nancy Carlos Jeffrey Samuel Virginia Katherine Todd Christine Maria Brandon Jeffrey Cheryl Karen Todd Diana Jeremy Brenda Anne Jessica Carlos Mary Joan Angela Debra Joshua Terry Ernest Norma Julie Frank Philip Margaret Nancy Jose Marilyn David Jean Margaret Theresa Brenda Paul Fred Barbara Julie Craig Roger Deborah Nancy Charles Daniel Brian William Patrick Judy Sharon Gary Jose Phyllis Matthew Steve Heather Phillip Nancy Eurandome Steve Janet Stephanie Amy Paul John Aaron Jennifer Jane Diana Donna Beverly Joseph Jean George Wanda Patrick Daniel Larry Marie Jimmy Kathleen Andrew Patricia Jeffrey Annie Raymond Daniel Rebecca Jean Adam Phyllis Mark Joyce Todd Amanda Charles Nicholas Cheryl Ernest Rachel Brian Teresa Jesse Jason Jason Lisa George Antonio Christopher Chris Sharon Charles Deborah Gregory Kathleen Judith Louise Paul Karen Joshua Joan Debra Gary Nancy Terry Stephanie Ann Roger Elizabeth Eric Rachel Laura Janet Tammy Doris Judy Frances Benjamin James Sandra Russell Michelle Timothy Katherine Beverly Annie Brian Gary Randy Clarence Tammy Anne Julia Juan Gerald Kimberly Sarah Jane Amy Anne Bonnie Ryan Doris Janet Ronald Alan Walter Gerald Jeremy Thomas Eurandome Sarah Judith Jimmy Chris Jennifer Daniel Joyce Roger George Paul Keith Jacqueline Martha Patricia Sandra Dorothy Catherine George Ronald Carlos Rachel Patricia Beverly Jessica Brandon Rebecca Sara Willie Elizabeth Julia Douglas Gerald Maria Carl Maria Nancy Larry Jessica Annie Lois Sharon Nicholas Benjamin Ruby Craig Phillip Rose Joan Eurandome Joshua Jeremy Katherine Howard Christina Heather Chris Janice Michael Martin Dennis Janet Gerald Debra Deborah Sharon Anne Melissa Donald Bruce Adam Phillip Gary Ryan Joyce Diana Roy Samuel Margaret Sandra Jane Clarence Brian Raymond Wayne Nancy Jesse Judith Earl Lawrence Lillian Shawn Joan Lisa Richard Sandra Johnny Phillip Gloria Charles Clarence Patricia John Anne Alan Ernest Norma Irene Julia Phyllis Howard Arthur Gregory Antonio Sarah Ryan Julia Phyllis Judith Kathleen Doris Benjamin Ann Kathy Linda Amanda Elizabeth Lawrence Marie Judith Sara Phyllis Lisa Wanda Ryan Amy Gary Pamela Jason Joseph Joan Paula Wanda Frances Kathleen Harold Steve Craig Michelle Marie Harry Ruth Barbara Jacqueline Jeffrey Rebecca Jesse Richard Jesse Raymond Tammy Donna Rebecca Karen Gregory Cheryl Joe Eric George Lillian Bonnie Justin Lois Frances Lawrence Sarah Jennifer Lois Joseph Michelle Kathleen Theresa Harry Ryan Chris Steven Johnny Jessica Antonio Jason Charles Kimberly Brandon Shawn Willie Ashley Chris Joan Cheryl Ashley Jeremy Ernest Justin Randy Martha Craig Laura Joan Helen Jeffrey Mildred Anthony Kathleen Ryan Janet Michelle William Jennifer Diana Jessica Paul Cynthia Sharon Frances Anna Charles Ralph Katherine Tina Steve Juan Rachel Thomas Joshua James Eurandome Tina Chris Justin Margaret Ann Kimberly Phyllis Ralph Joseph Albert Roger Jimmy Rachel Maria Kimberly Chris Bobby Jesse Willie Jose Carlos Marilyn Craig Brandon Frances Cheryl Joshua Jack Eric Frank Larry Rebecca Barbara Alice Jason Mark Julia Kathleen Aaron Timothy Michael Edward Marie Russell Kathy Helen Terry Wayne Gary Lawrence Donald Anthony Thomas Patricia Jennifer Andrew Walter Gerald Lawrence Jonathan Donald Kathy Craig Gloria Shawn Earl Kathy Alice Wayne Samuel Laura Judy Kenneth Jonathan Ralph Teresa Henry Diane Aaron Barbara Cheryl Lois Carol Gerald Catherine Rose Randy Earl Albert Joshua George Julie Kelly Louise Henry Robin Anthony Anna Carl Deborah Jacqueline Scott Julia Timothy Shirley Gary Lillian Shawn Rachel Ernest Jeremy Ann Theresa Jean Joan Nancy Jeffrey William Brenda Diana Theresa Alan Billy Eurandome Mary Thomas Kathy Billy Ann Lois Laura Jean Wayne Kenneth Lori Kevin Karen Jose Earl Randy Donna Jimmy Rebecca Phyllis Wanda Anna Harry Joshua Denise Samuel Jessica Eric Emily Norma Sarah Jason Raymond Norma Rachel Willie Carlos Mildred James Amy Russell Mark Rose Edward Amy Elizabeth Jane Diana Mildred Jerry Anthony Amanda Craig Jeffrey Howard Louis Joshua Ryan Mary Ruth Steve Phillip Ryan Phillip Craig Doris Lori Bruce Sandra Ashley Theresa Laura Earl Amy Rachel Ashley Sean Virginia Douglas Dennis Nicholas Ronald Denise Shirley Theresa Daniel Katherine Sandra Gregory Kimberly Kathy Lillian Johnny Frances Ruth Phyllis Katherine Maria Theresa Arthur Paul Michael Rachel Earl Johnny Brandon Ann Robert Linda Earl Frances Dorothy Tammy Carolyn Christine Julia Kevin Sharon Peter Keith Carl Marie Carolyn David Katherine Jennifer Justin Marilyn Terry Wayne Jeremy Timothy Gary Anna Frank Joyce Mildred Evelyn Todd Lisa Henry Ernest Ronald Rebecca Albert Kevin Terry Albert Dorothy Earl Norma Norma George Gloria Justin Tammy Brandon Katherine Kathy Lawrence Dorothy Andrew Lillian Russell Roger Douglas Timothy Stephanie Lisa Douglas Larry Peter Anthony Cynthia Deborah Carl Rose Kathy Rose Adam Arthur Raymond Jacqueline Jane Jimmy Jane Tammy Ruth Ryan Nicole Lois Kathleen Martin Lawrence Alan Victor Joan Raymond Dorothy Donald Peter Ashley Martin Carlos Jennifer Michelle Jane Joan Donald Susan Theresa Bonnie Christopher Katherine Richard Deborah Anthony Wanda Robert Gary Ruth Laura Jimmy Pamela Randy Christina Frances Douglas Paula Shawn Earl Emily Frank Terry Anna Philip Donna Nicole Mark Tammy Theresa Jacqueline Justin Jerry Rose Randy Andrew Jose Earl Henry Ruby Barbara Victor Gregory Keith Steven Jessica Christina Ralph Rachel Rose Alice Kathleen Michelle Brandon Raymond Antonio Benjamin Christine Charles Margaret Matthew Kathy Helen Fred Earl Terry Daniel Martha Janet Eurandome John Justin Kevin Tina Gregory Timothy Johnny Daniel Gerald Tammy Anna Wanda Rachel Carlos Angela Brian Randy Joe Lisa Jerry Willie Tina Kathleen Beverly Bonnie James Catherine Anne Joshua Carolyn Joyce Jimmy Carolyn Maria Aaron Ryan Marilyn Joseph Bonnie Dorothy Angela Donald Helen Janet Peter Christina Catherine Albert Johnny Jeffrey Judith Annie Benjamin Ann Edward Linda Marie Richard Roy Frank Frank Wanda Theresa Teresa Nicole Jean Jean Kathryn Scott Roy Daniel Nancy Wayne Aaron Anna Sarah Keith Wayne Adam Debra Teresa Johnny Melissa Brian Ronald Earl Samuel Russell Paula Jason Bonnie Christine Andrea Patricia Louis Charles Marie Bruce Harold Melissa Douglas Rebecca Matthew Beverly Ann Christine Earl Theresa Gary Gary Lois Martha Jack Katherine Shawn Cynthia Frank Maria Louise Edward Andrew Martha Kathryn Jose Mark Brandon Ruby Lori Christopher Carlos }.sample
end

def random_lNames #picks random last name
%w{ Taylor Lynch Chapman Carpenter Bailey Kelley Wheeler Montgomery Gonzales Green Carter Snyder Jenkins Hall Stone Thomas Ray Bell Hayes Arnold Burns Graham Thompson Henry Fisher Boyd Flores Webb Kim Marshall Palmer Montgomery Murray Franklin Dunn Chapman Hansen Oliver Ryan Olson Hart Rogers Johnston Murphy Richardson Fox Coleman Peterson Cooper Stevens Mason Crawford Howard Parker Campbell Garrett Taylor Woods Ellis Wallace Gutierrez Dean Jackson Dean Marshall Carpenter Walker Watson Palmer Perez Smith Hernandez Castillo Gibson Miller Rogers Schmidt Martinez Fox Cruz Taylor Hansen Young Peterson Ellis Bishop Price Fox Torres Elliott Sullivan Bennett Richards Gordon Garrett Rivera Hamilton Evans Simmons Rice George Knight Daniels Clark Marshall Castillo Lee Banks Hawkins Smith Hughes Martinez Price Wagner Alexander Rodriguez Williams Baker Medina Knight Moreno Holmes Long Wilson Grant Vasquez Dixon Reed Dixon Davis Garrett Carter Gutierrez Williamson Lynch Hamilton Brooks Powell Morrison Ortiz Williams Thomas Long King Frazier Franklin Burns Morgan Rice Rose Flores Edwards Brown Franklin Myers Watson Day Sims Lawrence Jenkins Thompson Watkins Ruiz Wright Hernandez Miller Warren Graham Warren Jacobs Bishop Moreno Mitchell Carroll Reid Duncan Kelley Harper Garza Wagner Ward Arnold Dixon Cook Arnold Chapman Reyes Brooks Scott Burke Snyder Mitchell Larson Gutierrez Bowman Gutierrez Wells Fernandez Bradley Foster Martin Butler Evans Ellis Williams Lee Freeman Willis Perez Carpenter Coleman Kelley Wilson Diaz Hunter Fowler Foster Stanley Lynch Lawson Arnold Sanders Johnston Parker Owens Nguyen Hamilton Mason Schmidt Pierce Cook Burton Day Sullivan Edwards Harvey Jordan Ramirez Perkins Franklin Holmes Bennett Wilson Collins Cunningham Warren Cunningham Chavez Murphy Diaz Welch Franklin Black Hicks Wilson Matthews Rivera Edwards Brown Moore Adams Lawson Bishop Lynch Johnson Larson Powell Perry Jenkins Edwards Rodriguez Palmer Holmes Hayes Davis Rice Romero Hawkins Jacobs Stewart Phillips Lawrence Martinez Andrews Martin Peterson Peterson Andrews Clark Burke Cunningham Scott Mendoza Grant Lewis Gordon Lane Ramirez Freeman Day Hansen Stephens Miller Russell Spencer West Rose Wallace Wells Robertson Lane Ford White Cruz Black Garza Owens Walker Hughes Rice Coleman Sanders Greene Chapman Hayes Green Turner Montgomery Dixon Butler Mcdonald Mills Burke Fowler Morrison Arnold Perez Williams Henderson Sims Berry Fernandez Olson Gomez Holmes James Mills Elliott Kelley Edwards Pierce Nichols Bailey Grant Ortiz Wright Carpenter Gonzales Chavez Collins Jones Lane Pierce Gonzales Ruiz Franklin Ray Dixon Mccoy Robertson Shaw Garrett Robertson Hansen Butler Alexander Holmes Reyes Coleman James Boyd Bailey Spencer Frazier Gonzalez Dixon Moore Fowler Fernandez Harris Martin Davis James Mccoy Moore Welch Edwards Fields Wood Carroll Shaw Stephens Hanson Black Morrison Stanley King Cook Medina Owens Carr Nichols Coleman Elliott Harrison Scott Williams Stevens Hudson Hunter Sanchez Lawrence Johnston Gordon Phillips Stone Mason Hudson Jacobs Washington Reed Rice Dixon Andrews Murray Henderson Coleman Cooper Thomas Richards Collins Harvey Gray Wagner Welch Cole Matthews Butler Cooper Watkins Jordan Ford Rose Fox Perez Harvey Powell Peters Wright Clark Kelley Allen Williamson Berry Nichols Dunn Willis Stevens Patterson Willis Chapman Hughes Henderson Morales Rose Ford Diaz Anderson George Murray Carter Olson Stewart Henderson Ryan Wells Cole Andrews Perry Cox Hawkins Butler Webb Day Green Morris Mason Carter Ramos Freeman Murphy Ramirez Chavez Howard Lee Nichols Riley Hart Mccoy Carroll Rivera Lawrence Black Roberts Price Ward Cox Mendoza Ramirez Alexander Payne Rivera Williams Roberts Carr Ortiz Perry Howard Thomas Marshall James Robinson George Stewart Willis Fuller Williamson Thompson Mills Gonzalez Martinez Young Wallace Austin Williams Green Stanley Gordon Gomez Wright Bradley Murphy Morgan Mcdonald Ferguson Gonzales Patterson Torres Allen Vasquez Davis Ellis Mccoy Harrison Montgomery Bennett Lopez Williams Perez Porter Coleman Wright Frazier Rogers Harvey Lawrence Washington Dunn Johnston Reid Bell Wheeler Ferguson Washington Alvarez Gomez Gordon Wheeler Bennett Carr James Riley Ramirez Boyd Mills Crawford Larson King Wood Campbell Bishop Snyder Carter Warren Murray Harris Palmer Crawford Berry Morris Henderson Burke Perkins Bishop Knight Matthews Gray Fields White Cunningham Russell Mccoy Stephens Carr Robertson Murphy Walker Adams Lynch Lee Diaz Murphy James Washington Gibson Hamilton Morales Carr Rivera Fox Richardson Peterson George Cox Perez Fields Miller Rodriguez Reynolds Gardner Matthews Ramos Stevens Marshall Day Robertson Henry Nichols Torres Wilson Spencer Berry Hansen Moreno Cox Warren Carroll Jacobs Green Wilson Cole Lee Moore Murphy Young Gomez Robinson Spencer Bryant Owens Garza Tucker Bishop Daniels Cox Carpenter Jacobs Griffin Cruz Peterson Simpson Larson Harvey Williams Day Stewart Dean Morrison Parker Ford Gardner Robinson Reed James Hicks Turner Ray Garcia Lewis Ryan Fernandez Holmes Gibson Jenkins Dunn Garcia Burton Armstrong Butler Simmons Weaver Bradley Ruiz Stephens Griffin Powell Freeman Harris Gardner Murray Ward Simmons Reynolds Dunn Andrews Dunn Castillo Cooper Wallace Hamilton Jones Stewart Hill Sanchez Jacobs Baker Knight Black Thompson West Kim Rose Ray Gibson Grant Hawkins Stanley Stewart Hicks Greene Bradley Snyder Welch Harrison Lopez Jacobs Moore Nichols Tucker Williams Wilson Adams Porter Garrett Sullivan Robertson Morgan Lopez James Payne Mitchell Bowman Young Howard Hansen Lane Ryan Burns Castillo Nguyen Green Hamilton Ramos Howard Adams Palmer Cooper Morris Rice Bishop Riley Wilson Turner Mendoza Ross Owens Adams Bailey Austin Burton Gordon Moreno Olson Walker Phillips Campbell Hudson Burns Frazier Martinez Moreno Gordon Boyd Spencer Welch Williams Martinez West Hicks Lawson King Hughes Andrews Bell Smith Greene Riley Williamson Lynch Sanders Turner Ramos Dean Henderson Fields Harvey Alvarez Johnson Peters Rice Day Lawson Spencer Johnston Wilson Oliver Hernandez Rodriguez Dixon Stephens Hernandez Tucker Rivera Flores Bowman Lawson Gomez Reid Ramirez Gordon Watson Ford Nguyen Rivera Jackson Anderson Wheeler Nelson Hansen Garza Grant Richards Rogers Lewis Bradley Hansen Gardner Harris Rose Hall Hudson Knight Morales Allen Wallace Watson Bowman Harrison Banks Bennett Frazier Nelson Ray Sullivan Lane Garrett Owens Vasquez Cole Jacobs Lee Walker Jones Arnold Peterson Duncan Evans Jenkins Mendoza Welch Black Ray Bradley Morales Patterson Jackson Olson Martinez Ryan Sanders Robinson Richardson Wells Harris Day Cole Allen Wright Stephens Thomas Garza Lane Hall West Shaw Kelly Graham Wright Stevens Gibson Ryan Lynch Hicks Garcia Wright Robertson Burns Peterson Reid Carpenter Carter Jones Brooks Diaz Lawson Romero Baker Berry King Morrison Jacobs Grant Franklin Nichols Bell Wells Larson Daniels Brooks Bradley Boyd Knight Holmes Adams Oliver Stanley Mcdonald Williams Andrews Brooks Griffin Hunter Cruz Simmons Grant Hamilton Bishop Morgan King Wood }.sample
end

def stateElectorials #hash to calculate electorial votes
{"Alabama"=> 9, "Alaska"=> 3, "Arizona"=> 11, "Arkansas"=> 6 , "California"=> 55, "Colorado"=> 9, "Connecticut"=> 7, "Delaware"=> 3, "District of Columbia"=> 3, "Florida"=>29 , "Georgia"=> 16, "Hawaii"=> 4, "Idaho"=> 4, "Illinois"=> 20, "Indiana"=> 11, "Iowa"=> 6, "Kansas"=> 6, "Kentucky"=> 8, "Louisiana"=> 8, "Maine"=> 4, "Maryland"=>10 , "Massachusetts"=> 11, "Michigan"=> 16, "Minnesota"=>10 , "Mississippi"=> 6, "Missouri"=> 10, "Montana"=> 3, "Nebraska"=> 5, "Nevada"=> 6, "New Hampshire"=> 4, "New Jersey"=> 14, "New Mexico"=> 5, "New York"=> 29, "North Carolina"=> 15, "North Dakota"=> 3, "Ohio"=> 18, "Oklahoma"=> 7, "Oregon"=> 7, "Pennsylvania"=> 20, "Rhode Island"=> 4, "South Carolina"=> 9, "South Dakota"=> 3, "Tennessee"=> 11, "Texas"=> 38, "Utah"=> 6, "Vermont"=> 3, "Virginia"=> 13, "Washington"=> 12, "West Virginia"=> 5, "Wisconsin"=> 10, "Wyoming"=>3}
end

def random_Politician #pick random political side for each politician created
	['Republican', 'Democrat'].sample 
end

def random_Person #pick random political view for created person
	['Liberal', 'Conservative', 'Tea party', 'Socialist', 'Neutral'].sample
end

def random_State #numbers are based off 2012 voting statistics.  Lists the percent that created the person/politician will be a specific state
states = { Alabama:	2_074_338.0	/ 129_085_403,
	Alaska: 300_495.0	/ 129_085_403,
	Arizona:	2_299_254.0	/ 129_085_403,
	Arkansas:	1_069_468.0	/ 129_085_403,
	California:	13_038_547.0	/ 129_085_403,
	Colorado:	2_569_520.0	/ 129_085_403,
	Connecticut:	1_558_960.0	/ 129_085_403,
	Delaware: 413_921.0	/ 129_085_403,
	District_of_Columbia: 293_764.0	/ 129_085_403,
	Florida:	8_474_179.0	/ 129_085_403,
	Georgia:	3_900_050.0	/ 129_085_403,
	Hawaii: 434_697.0	/ 129_085_403,
	Idaho: 652_274.0	/ 129_085_403,
	Illinois:	5_242_014.0	/ 129_085_403,
	Indiana:	2_624_534.0	/ 129_085_403,
	Iowa:	1_582_180.0	/ 129_085_403,
	Kansas:	1_159_971.0	/ 129_085_403,
	Kentucky:	1_797_212.0	/ 129_085_403,
	Louisiana:	1_994_065.0	/ 129_085_403,
	Maine: 713_180.0	/ 129_085_403,
	Maryland:	2_707_327.0	/ 129_085_403,
	Massachusetts:	3_167_767.0	/ 129_085_403,
	Michigan:	4_730_961.0	/ 129_085_403,
	Minnesota:	2_936_561.0	/ 129_085_403,
	Mississippi:	1_285_584.0	/ 129_085_403,
	Missouri:	2_757_323.0	/ 129_085_403,
	Montana: 484_048.0	/ 129_085_403,
	Nebraska: 794_379.0	/ 129_085_403,
	Nevada:	1_014_918.0	/ 129_085_403,
	New_Hampshire: 710_972.0	/ 129_085_403,
	New_Jersey:	3_640_292.0	/ 129_085_403,
	New_Mexico: 783_758.0	/ 129_085_403,
	New_York:	7_081_159.0	/ 129_085_403,
	North_Carolina:	4_505_372.0	/ 129_085_403,
	North_Dakota: 322_627.0	/ 129_085_403,
	Ohio:	5_580_840.0	/ 129_085_403,
	Oklahoma:	1_334_872.0	/ 129_085_403,
	Oregon:	1_789_270.0	/ 129_085_403,
	Pennsylvania:	5_753_670.0	/ 129_085_403,
	Rhode_Island: 446_049.0	/ 129_085_403,
	South_Carolina:	1_964_118.0	/ 129_085_403,
	South_Dakota: 363_815.0	/ 129_085_403,
	Tennessee:	2_458_577.0	/ 129_085_403,
	Texas:	7_993_851.0	/ 129_085_403,
	Utah:	1_017_440.0	/ 129_085_403,
	Vermont: 299_290.0	/ 129_085_403,
	Virginia:	3_854_489.0	/ 129_085_403,
	Washington:	3_125_516.0	/ 129_085_403,
	West_Virginia: 670_438.0	/ 129_085_403,
	Wisconsin:	3_068_434.0	/ 129_085_403,
	Wyoming: 249_061.0	/ 129_085_403}
 randomstate = Pickup.new(states) #creates new Pickup instance to select just one state based off probability in hash
 randomstate.pick.to_s.gsub("_"," ") # .pick method selects one state from new Pickup instance.
end 

