
--
-- Data
--
INSERT INTO Grade(GradeName,GradeSort) VALUES('A',91)
INSERT INTO Grade(GradeName,GradeSort) VALUES('A-',90)
INSERT INTO Grade(GradeName,GradeSort) VALUES('B',81)
INSERT INTO Grade(GradeName,GradeSort) VALUES('B-',80)
INSERT INTO Grade(GradeName,GradeSort) VALUES('C',71)
INSERT INTO Grade(GradeName,GradeSort) VALUES('C-',70)
INSERT INTO Grade(GradeName,GradeSort) VALUES('D',61)
INSERT INTO Grade(GradeName,GradeSort) VALUES('D-',60)
INSERT INTO Grade(GradeName,GradeSort) VALUES('F',0)
GO
INSERT INTO Cat(CatName,CatSort) VALUES('Attendance',10000)
INSERT INTO Cat(CatName,CatSort) VALUES('Textbook',20000)
INSERT INTO Cat(CatName,CatSort) VALUES('Forums',30000)
INSERT INTO Cat(CatName,CatSort) VALUES('Research Paper',40000)
INSERT INTO Cat(CatName,CatSort) VALUES('Programming',50000)
INSERT INTO Cat(CatName,CatSort) VALUES('Presentation',60000)
INSERT INTO Cat(CatName,CatSort) VALUES('Final',70000)
GO
DECLARE @PersonID Int
DECLARE @TermID Int
DECLARE @CourseID Int
DECLARE @CatID Int

INSERT INTO Person(UsrName,FirstName,PersonName,Email) VALUES('Professor Senn','Phillip','Phillip Senn','Phillip.Senn@my.lr.edu')
SELECT @PersonID = SCOPE_IDENTITY()


INSERT INTO Term(TermName,TermStart,LastDayOfClasses,FinalStart,FinalStop,GradesDueGrad,FinalGradesDue) VALUES(
 'Fall 2014 Mini-Term II'
,'10/16/2014'
,'12/10/2014 23:59'
,'12/12/2014'
,'12/16/2014 23:59'
,'12/17/2014 10:00'
,'12/20/2014 10:00');
SELECT @TermID = Scope_Identity()

set identity_insert Course ON
INSERT INTO Course(CourseID,CourseName,Course_TermID,CourseSort,CourseDesc) VALUES(35,'CSC115',@TermID,35,'Mon Wed 9:00-9:50am')
SELECT @CourseID = SCOPE_IDENTITY()
set identity_insert Course Off

SELECT @CatID = CatID FROM Cat WHERE CatName = 'Attendance'
INSERT INTO Scale(Scale_CourseID,Scale_CatID,ScaleSort) VALUES(@CourseID,@CatID,10)

SELECT @CatID = CatID FROM Cat WHERE CatName = 'Textbook'
INSERT INTO Scale(Scale_CourseID,Scale_CatID,ScaleSort) VALUES(@CourseID,@CatID,25)

SELECT @CatID = CatID FROM Cat WHERE CatName = 'Forums'
INSERT INTO Scale(Scale_CourseID,Scale_CatID,ScaleSort) VALUES(@CourseID,@CatID,20)

SELECT @CatID = CatID FROM Cat WHERE CatName = 'Research Paper'
INSERT INTO Scale(Scale_CourseID,Scale_CatID,ScaleSort) VALUES(@CourseID,@CatID,20)

SELECT @CatID = CatID FROM Cat WHERE CatName = 'Programming'
INSERT INTO Scale(Scale_CourseID,Scale_CatID,ScaleSort) VALUES(@CourseID,@CatID,10)

SELECT @CatID = CatID FROM Cat WHERE CatName = 'Presentation'
INSERT INTO Scale(Scale_CourseID,Scale_CatID,ScaleSort) VALUES(@CourseID,@CatID,5)

SELECT @CatID = CatID FROM Cat WHERE CatName = 'Final'
INSERT INTO Scale(Scale_CourseID,Scale_CatID,ScaleSort) VALUES(@CourseID,@CatID,10)
INSERT INTO Usr(GloballyUniqueIdentifier,Usr_CourseID,Usr_PersonID,isAdmin) VALUES('84DBF84C-F25E-4A41-9074-01295A113080',@CourseID,@PersonID,1)

INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Ammerman','Sara','Sara Ammerman','Sara.Ammerman@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Bales','William','William Bales','William.Bales@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Bishop','Samantha','Samantha Bishop','Samantha.Bishop@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Braxton','Malik','Malik Braxton','Malik.Braxton@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Flueck','Ines','Ines Flueck','Ines.Flueck@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Freeman','Matthew','Matthew Freeman','Matthew.Freeman@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Kessler','Emily','Emily Kessler','Emily.Kessler@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Koncelik','Milissia','Milissia Koncelik','Milissia.Koncelik@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Miller','Averi','Averi Miller','Averi.Miller@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Picado','Pablo','Pablo Picado','Pablo.Picado@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Rawls','Elliot','Elliot Rawls','Elliot.Rawls@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Reed','Keyon','Keyon Reed','Keyon.Reed@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Rhoney','Rebecca','Rebecca Rhoney','Rebecca.Rhoney@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Rollins','Shelby','Shelby Rollins','Shelby.Rollins@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('St Ange','Natania','Natania St Ange','Natania.StAnge@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Stofberg','Lucy','Lucy Stofberg','Lucy.Stofberg@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Sullivan','Matthew','Matthew Sullivan','Matthew.Sullivan@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Wildermuth','Sarra','Sarra Wildermuth','Sarra.Wildermuth@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Wirt','Hannah','Hannah Wirt','Hannah.Wirt@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Woolly','Carter','Carter Woolly','Carter.Woolly@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Young','Tessa','Tessa Young','Tessa.Young@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	

	


set identity_insert Course On
INSERT INTO Course(CourseID,CourseName,Course_TermID,CourseSort,CourseDesc,online) VALUES(71,'CSC115',@TermID,71,'Online',1)
SELECT @CourseID = SCOPE_IDENTITY()
set identity_insert Course Off
SELECT @CatID = CatID FROM Cat WHERE CatName = 'Attendance'
INSERT INTO Scale(Scale_CourseID,Scale_CatID,ScaleSort) VALUES(@CourseID,@CatID,10)

SELECT @CatID = CatID FROM Cat WHERE CatName = 'Textbook'
INSERT INTO Scale(Scale_CourseID,Scale_CatID,ScaleSort) VALUES(@CourseID,@CatID,25)

SELECT @CatID = CatID FROM Cat WHERE CatName = 'Forums'
INSERT INTO Scale(Scale_CourseID,Scale_CatID,ScaleSort) VALUES(@CourseID,@CatID,20)

SELECT @CatID = CatID FROM Cat WHERE CatName = 'Research Paper'
INSERT INTO Scale(Scale_CourseID,Scale_CatID,ScaleSort) VALUES(@CourseID,@CatID,20)

SELECT @CatID = CatID FROM Cat WHERE CatName = 'Programming'
INSERT INTO Scale(Scale_CourseID,Scale_CatID,ScaleSort) VALUES(@CourseID,@CatID,10)

SELECT @CatID = CatID FROM Cat WHERE CatName = 'Presentation'
INSERT INTO Scale(Scale_CourseID,Scale_CatID,ScaleSort) VALUES(@CourseID,@CatID,5)

SELECT @CatID = CatID FROM Cat WHERE CatName = 'Final'
INSERT INTO Scale(Scale_CourseID,Scale_CatID,ScaleSort) VALUES(@CourseID,@CatID,10)
INSERT INTO Usr(GloballyUniqueIdentifier,Usr_CourseID,Usr_PersonID,isAdmin) VALUES('FFD7783E-7413-445A-93EA-8D66CB424BC0',@CourseID,@PersonID,1)

INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Abernethy','Olivia','Olivia Abernethy','Olivia.Abernethy@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Armentrout','Robert','Robert Armentrout','Robert.Armentrout@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Blackman','Renelsa','Renelsa Blackman','Renelsa.Blackman@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Childers','Brandy','Brandy Childers','Brandy.Childers@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Clowney','Courtney','Courtney Clowney','Courtney.Clowney@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Cook','Trevor','Trevor Cook','Trevor.Cook@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Cummins','Damon','Damon Cummins','Damon.Cummins@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Hill','Lauren','Lauren Hill','Lauren.Hill@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Hill','Mary','Mary Hill','Mary.Hill@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Jones','Teonce','Teonce Jones','Teonce.Jones@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Juzwick','Kenady','Kenady Juzwick','Kenady.Juzwick@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('King','Zachary','Zachary King','Zachary.King@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Korn','Amber','Amber Korn','Amber.Korn@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Manning','Bobby','Bobby Manning','Bobby.Manning@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('McCullough','Ranika','Ranika McCullough','Ranika.McCullough@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('O Neil','Aleijah','Aleijah O Neil','Aleijah.ONeil@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Ohmer','Christian','Christian Ohmer','Christian.Ohmer@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Osattin','Holly','Holly Osattin','Holly.Osattin@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Reep','Joseph','Joseph Reep','Joseph.Reep@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Rogers','Dylan','Dylan Rogers','Dylan.Rogers@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Rossner','Christian','Christian Rossner','Christian.Rossner@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Sizemore','Kathryn','Kathryn Sizemore','Kathryn.Sizemore@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Whitson','Landon','Landon Whitson','Landon.Whitson@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Wood','Abaigeal','Abaigeal Wood','Abaigeal.Wood@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Woody','Eric','Eric Woody','Eric.Woody@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Zavala Vazquez','Deisy','Deisy Zavala Vazquez','Deisy.ZavalaVazquez@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())





set identity_insert Course On
INSERT INTO Course(CourseID,CourseName,Course_TermID,CourseSort,CourseDesc,[Online]) VALUES(72,'CSC115',@TermID,72,'Online',1)
SELECT @CourseID = SCOPE_IDENTITY()
set identity_insert Course Off

SELECT @CatID = CatID FROM Cat WHERE CatName = 'Attendance'
INSERT INTO Scale(Scale_CourseID,Scale_CatID,ScaleSort) VALUES(@CourseID,@CatID,10)

SELECT @CatID = CatID FROM Cat WHERE CatName = 'Textbook'
INSERT INTO Scale(Scale_CourseID,Scale_CatID,ScaleSort) VALUES(@CourseID,@CatID,25)

SELECT @CatID = CatID FROM Cat WHERE CatName = 'Forums'
INSERT INTO Scale(Scale_CourseID,Scale_CatID,ScaleSort) VALUES(@CourseID,@CatID,20)

SELECT @CatID = CatID FROM Cat WHERE CatName = 'Research Paper'
INSERT INTO Scale(Scale_CourseID,Scale_CatID,ScaleSort) VALUES(@CourseID,@CatID,20)

SELECT @CatID = CatID FROM Cat WHERE CatName = 'Programming'
INSERT INTO Scale(Scale_CourseID,Scale_CatID,ScaleSort) VALUES(@CourseID,@CatID,10)

SELECT @CatID = CatID FROM Cat WHERE CatName = 'Presentation'
INSERT INTO Scale(Scale_CourseID,Scale_CatID,ScaleSort) VALUES(@CourseID,@CatID,5)

SELECT @CatID = CatID FROM Cat WHERE CatName = 'Final'
INSERT INTO Scale(Scale_CourseID,Scale_CatID,ScaleSort) VALUES(@CourseID,@CatID,10)
INSERT INTO Usr(GloballyUniqueIdentifier,Usr_CourseID,Usr_PersonID,isAdmin) VALUES('932B3252-7385-4D81-8F5E-D8DD26AD37C6',@CourseID,@PersonID,1)

INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Artis','Kai','Kai Artis','Kai.Artis@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Benedetto','Aubriana','Aubriana Benedetto','Aubriana.Benedetto@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Berg-Saether','Bjarne','Bjarne Berg-Saether','Bjarne.BergSaether@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Bradley','Jordan','Jordan Bradley','Jordan.Bradley@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Chapman','Lauren','Lauren Chapman','Lauren.Chapman@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Chavez','Omar','Omar Chavez','Omar.Chavez@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Conway','Kourtney','Kourtney Conway','Kourtney.Conway@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Corrigan','Benjamin','Benjamin Corrigan','Benjamin.Corrigan@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Everly','Bethany','Bethany Everly','Bethany.Everly@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Feronti','Jessica','Jessica Feronti','Jessica.Feronti@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Holmes','Katelynn','Katelynn Holmes','Katelynn.Holmes@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Lett','Collin','Collin Lett','Collin.Lett@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('O Connor','Jacob','Jacob O Connor','Jacob.OConnor@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Salamon','Haylea','Haylea Salamon','Haylea.Salamon@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Schoenig ','Edward','Edward Schoenig ','Edward.Schoenig@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Shaw','Christina','Christina Shaw','Christina.Shaw@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Sicker','Ryan','Ryan Sicker','Ryan.Sicker@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Stacey','Joshua','Joshua Stacey','Joshua.Stacey@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Stewart','Victor','Victor Stewart','Victor.Stewart@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Tate','Aaliyah','Aaliyah Tate','Aaliyah.Tate@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Thilo','Taylor','Taylor Thilo','Taylor.Thilo@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Walker','Brandon','Brandon Walker','Brandon.Walker@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Wenger','Christian','Christian Wenger','Christian.Wenger@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())
	
INSERT INTO Person(LastName,FirstName,PersonName,Email) VALUES('Williams-Harrington','Alexander','Alexander Williams-Harrington','Alex.Harrington@my.lr.edu')
INSERT INTO Usr(Usr_CourseID,Usr_PersonID) VALUES(@CourseID,Scope_Identity())



update person set UsrName=PersonName
WHERE PersonName <> 'Phillip Senn'
update Person set isSenior=1 WHERE PersonName='Brandon Walker'
update Person set isSenior=1 WHERE PersonName='Bobby Manning'


--IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'WrkView'))
--DROP View WrkView
--GO
--CREATE VIEW WrkView AS
--SELECT Wrk.*
--,GuessView.*
--,WrkAnswer.Correct AS Wrk_Correct
--,WrkAnswer.AnswerName AS Wrk_AnswerName
--FROM Wrk
--JOIN GuessView
--ON Wrk_GuessID=GuessID
--JOIN Answer WrkAnswer
--ON Wrk_AnswerID = WrkAnswer.AnswerID
--GO

--IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'HelperView'))
--drop view HelperView
--GO
--CREATE View HelperView AS
--SELECT *
--FROM Helper
--JOIN UsrView
--ON Helper_UsrID = UsrID
--JOIN QuestionView
--ON Helper_QuestionID = QuestionID
--GO

--IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'WordSearchView'))
--DROP View WordSearchView
--GO
--CREATE View WordSearchView AS
--SELECT *
--FROM WordSearch
--JOIN UsrView
--ON WordSearch_UsrID = UsrID
--JOIN ActView
--ON WordSearch_ActID=ActID
--GO
--IF EXISTS(SELECT * FROM sys.synonyms WHERE name = 'W')
--DROP SYNONYM W
--GO
--CREATE SYNONYM W FOR WordSearchView
--GO

--IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'PgmView'))
--DROP View PgmView
--GO
--create View PgmView AS
--SELECT *
--FROM Pgm
--JOIN ActView
--ON Pgm_ActID = ActID
--GO

--DELETE FROM Wrk
--WHERE WrkID IN(
--	SELECT WrkID
--	FROM WrkView
--	WHERE ActSort=@ActSort
--)

