import GUI

View.Set ("graphics:750;600;nobuttonbar")

%declaration
var aboutButton, backButton, bibButton, bibButton2, dutyButton : int
var eduButton, eduwaterlooButton, edumitButton, edusenecaButton : int
var coursewaterlooButton, coursemitButton, coursesenecaButton : int
var employButton, outlookButton, payButton, payONButton, payQCButton : int
var quitButton : int
var ontwages : int
var quebecwages : int
var outlookimage : int
var startupimage : int
var titlefont, subtitlefont : int
%/declaration

%init graphic elements
ontwages := Pic.FileNew ("assets/img/wagesontario.jpg")
quebecwages := Pic.FileNew ("assets/img/wagesquebec.jpg")
outlookimage := Pic.FileNew ("assets/img/marketoutlook.jpg")
startupimage := Pic.FileNew ("assets/img/surrealcomputers.jpg")
subtitlefont := Font.New ("Garamond:16")
titlefont := Font.New ("Garamond:32:bold")
%/init graphic elements

%file opening condensed
procedure getfilecontents (filename : string)
    GUI.SetBackgroundColor (77)
    var fileNum : int
    var line : string
    open : fileNum, filename, get
    if fileNum > 0 then
	loop
	    exit when eof (fileNum)
	    colorback (77)
	    get : fileNum, line : *
	    put line
	end loop
    end if
end getfilecontents
%/file opening condensed

%procedures

procedure hideAll
    GUI.Hide (aboutButton)
    GUI.Hide (backButton)
    GUI.Hide (bibButton)
    GUI.Hide (bibButton2)
    GUI.Hide (coursewaterlooButton)
    GUI.Hide (coursemitButton)
    GUI.Hide (coursesenecaButton)
    GUI.Hide (dutyButton)
    GUI.Hide (eduButton)
    GUI.Hide (eduwaterlooButton)
    GUI.Hide (edumitButton)
    GUI.Hide (edusenecaButton)
    GUI.Hide (employButton)
    GUI.Hide (outlookButton)
    GUI.Hide (payButton)
    GUI.Hide (payONButton)
    GUI.Hide (payQCButton)
    GUI.Hide (quitButton)
    GUI.Refresh
    cls
end hideAll

procedure showAll
    GUI.Show (aboutButton)
    GUI.Show (bibButton)
    GUI.Show (dutyButton)
    GUI.Show (eduButton)
    GUI.Show (employButton)
    GUI.Show (outlookButton)
    GUI.Show (payButton)
    GUI.Show (quitButton)
    GUI.Refresh
end showAll

procedure onlyBack
    GUI.Refresh
    GUI.Show (backButton)
end onlyBack

%further condensing procedure call to avoid repetition
procedure procedurebase
    View.Set ("graphics:1200;600;nobuttonbar")
    GUI.SetPosition (backButton, maxx - 100, GUI.GetY (backButton))
    cls
    hideAll
    onlyBack
end procedurebase
%/further condensing procedure call to avoid repetition

procedure readbib
    procedurebase
    Window.Set (defWinId, "title:Bibliography")
    GUI.SetPosition (bibButton2, maxx - 190, GUI.GetY (bibButton2))
    GUI.Show (bibButton2)
    getfilecontents ("assets/bib/bibliography.txt")
end readbib

procedure readbibpt2
    procedurebase
    Window.Set (defWinId, "title:Bibliography Pt.2")
    getfilecontents ("assets/bib/bibliographypt2.txt")
end readbibpt2

procedure readduties
    procedurebase
    Window.Set (defWinId, "title:Job Duties")
    getfilecontents ("assets/info/duties.txt")
end readduties

procedure toedu
    procedurebase
    View.Set ("graphics:180;300;nobuttonbar")
    GUI.SetPosition (backButton, 45, 10)
    onlyBack
    Window.Set (defWinId, "title:University Programs")
    GUI.SetBackgroundColor (77)
    GUI.SetPosition (eduwaterlooButton, 45, maxy div 2 - 60)
    GUI.SetPosition (edumitButton, 45, maxy div 2 - 10)
    GUI.SetPosition (edusenecaButton, 45, maxy div 2 + 40)
    GUI.Show (eduwaterlooButton)
    GUI.Show (edumitButton)
    GUI.Show (edusenecaButton)
end toedu

procedure readeduwaterloo
    procedurebase
    Window.Set (defWinId, "title:University of Waterloo")
    getfilecontents ("assets/info/edu/waterloo.txt")
    GUI.Show (coursewaterlooButton)
end readeduwaterloo

procedure readedumit
    procedurebase
    Window.Set (defWinId, "title:MIT")
    getfilecontents ("assets/info/edu/mit.txt")
    GUI.Show (coursemitButton)
end readedumit

%general seneca program info
procedure readeduseneca
    procedurebase
    Window.Set (defWinId, "title:Seneca College")
    getfilecontents ("assets/info/edu/seneca.txt")
    GUI.Show (coursesenecaButton)
end readeduseneca

%courses subsection
procedure readwaterloocourses
    procedurebase
    onlyBack
    Window.Set (defWinId, "title:Courses for Waterloo")
    getfilecontents ("assets/info/edu/courses/waterloo.txt")
end readwaterloocourses

procedure readmitcourses
    procedurebase
    onlyBack
    Window.Set (defWinId, "title:Courses for MIT")
    getfilecontents ("assets/info/edu/courses/mit.txt")
end readmitcourses

procedure readsenecacourses
    procedurebase
    onlyBack
    Window.Set (defWinId, "title:Courses for Seneca")
    getfilecontents ("assets/info/edu/courses/seneca.txt")
end readsenecacourses
%/courses subsection

procedure reademploy
    procedurebase
    Window.Set (defWinId, "title:Employment Situation")
    getfilecontents ("assets/info/employment.txt")
end reademploy

procedure readgeneral
    procedurebase
    Window.Set (defWinId, "title:About")
    getfilecontents ("assets/info/general.txt")
end readgeneral

%pay section
procedure topay
    procedurebase
    View.Set ("graphics:180;250;nobuttonbar")
    GUI.SetPosition (backButton, 45, 10)
    onlyBack
    Window.Set (defWinId, "title:Pay")
    GUI.SetBackgroundColor (77)
    GUI.SetPosition (payONButton, 45, 100)
    GUI.SetPosition (payQCButton, 45, 150)
    GUI.Show (payONButton)
    GUI.Show (payQCButton)
end topay

%pay in ontario
procedure readpayont
    procedurebase
    Window.Set (defWinId, "title:Pay in Ontario")
    Font.Draw ("Lowest", maxx div 2 + 120, 550, subtitlefont, black)
    Font.Draw ("Median", maxx div 2 + 220, 550, subtitlefont, black)
    Font.Draw ("Highest", maxx div 2 + 320, 550, subtitlefont, black)
    Font.Draw ("(In CAD)", maxx div 2 + 420, 550, subtitlefont, black)
    Pic.Draw (ontwages, 100, 75, 0)
end readpayont

%quebec pay
procedure readpayquebec
    procedurebase
    Window.Set (defWinId, "title:Pay in Quebec")
    Font.Draw ("Lowest", maxx div 2 + 120, 560, subtitlefont, black)
    Font.Draw ("Median", maxx div 2 + 220, 560, subtitlefont, black)
    Font.Draw ("Highest", maxx div 2 + 320, 560, subtitlefont, black)
    Font.Draw ("(In CAD)", maxx div 2 + 420, 560, subtitlefont, black)
    Pic.Draw (quebecwages, 100, 50, 0)
end readpayquebec

procedure readoutlook
    hideAll
    onlyBack
    Window.Set (defWinId, "title:Market Outlook")
    Pic.Draw (outlookimage, 0, 50, 0)
end readoutlook

procedure startupscreen
    View.Set ("graphics:750;600;nobuttonbar")
    Window.Set (defWinId, "title:Computer Science Careers")
    hideAll
    Pic.Draw (startupimage, 0, 0, 0)
    %x=0;y=0;mode=0
    showAll
    Font.Draw ("Software Engineer", maxx div 4 + 20, maxy - 100, titlefont, yellow)
    Font.Draw ("(NOC 2713)", maxx div 2.5 + 20, maxy - 135, subtitlefont, yellow)
end startupscreen
%/procedures

%GUI elements creation
aboutButton := GUI.CreateButtonFull (10, 10, 90, "About", readgeneral, 30, "^A", false)
backButton := GUI.CreateButtonFull (maxx - 100, 10, 90, "Back", startupscreen, 30, "^K", false)
bibButton := GUI.CreateButtonFull (100, 10, 90, "Bibliography", readbib, 30, "^B", false)
bibButton2 := GUI.CreateButtonFull (maxx - 100, 10, 90, "Pt.2", readbibpt2, 30, "^B", false)

coursewaterlooButton := GUI.CreateButtonFull (10, 10, 90, "Courses", readwaterloocourses, 30, "^C", false)
coursemitButton := GUI.CreateButtonFull (10, 10, 90, "Courses", readmitcourses, 30, "^C", false)
coursesenecaButton := GUI.CreateButtonFull (10, 10, 90, "Courses", readsenecacourses, 30, "^C", false)

dutyButton := GUI.CreateButtonFull (198, 10, 90, "Duties", readduties, 30, "^D", false)

eduButton := GUI.CreateButtonFull (384, 10, 90, "Education", toedu, 30, "^E", false)
eduwaterlooButton := GUI.CreateButtonFull (maxx div 2, maxy div 2 + 50, 90, "Waterloo", readeduwaterloo, 30, "^W", false)
edumitButton := GUI.CreateButtonFull (maxx div 2, maxy div 2 - 10, 90, "MIT", readedumit, 30, "^M", false)
edusenecaButton := GUI.CreateButtonFull (maxx div 2, maxy div 2 - 60, 90, "Seneca", readeduseneca, 30, "^S", false)

employButton := GUI.CreateButtonFull (288, 10, 90, "Employment", reademploy, 30, "^R", false)
outlookButton := GUI.CreateButtonFull (564, 10, 90, "Outlook", readoutlook, 30, "^O", false)

payButton := GUI.CreateButtonFull (474, 10, 90, "Pay", topay, 30, "^P", false)
payONButton := GUI.CreateButtonFull (0, maxy, 90, "Quebec", readpayquebec, 30, "^P", false)
payQCButton := GUI.CreateButtonFull (0, 0, 90, "Ontario", readpayont, 30, "^P", false)
quitButton := GUI.CreateButtonFull (10, maxy - 40, 90, "Quit", GUI.Quit, 30, "^Q", false)

%/GUI elements creation

%actual program
startupscreen
%/actual program

%main program for gui
loop
    exit when GUI.ProcessEvent
end loop
%/main program for gui
