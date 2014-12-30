-- 
-- Explanation of chapters:
--
-- Chapters 1-5 are from the textbook
-- Chapter 6 is Forums
-- Chapter 7 is Research Paper
-- Chapter 8 is Programming
-- Chapter 9 is presentation
-- Chapter 10 is Final

set nocount on
set statistics time off
set statistics io off

DECLARE @CatSort Int = (
	SELECT CatSort 
	FROM CatView 
	WHERE CatName='Textbook'
)
DECLARE @Chapter Int = 1
DECLARE @Assignment Int = 1
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment

DECLARE @ActName Varchar(128) = 'Chapter ' + cast(@Chapter as varchar) + ', Word Search'
DECLARE @ActID Int
DECLARE @QuestionID Int

exec ClearAct @ActSort

INSERT INTO Act(ActSort,ActName,ActDesc,ActLink,Questions) VALUES(@ActSort,@ActName
,'These are the terms shown in bold in chapter 1.'
,'WordSearch/WordSearchIntro.cfm'
,20)
SELECT @ActID=SCOPE_IDENTITY()

exec InsertQuestionAnswer @ActID,'app','app',26
exec InsertQuestionAnswer @ActID,'application','application',26
exec InsertQuestionAnswer @ActID,'browser','browser',20
--exec InsertQuestionAnswer @ActID,'communications device','communicationsdevice',29
exec InsertQuestionAnswer @ActID,'computer','computer',4
exec InsertQuestionAnswer @ActID,'desktop','desktop',6
exec InsertQuestionAnswer @ActID,'digital camera','digitalcamera',8
exec InsertQuestionAnswer @ActID,'digital literacy','digitalliteracy',2
exec InsertQuestionAnswer @ActID,'e-book reader','ebookreader',9
exec InsertQuestionAnswer @ActID,'game console','gameconsole',9
exec InsertQuestionAnswer @ActID,'green computing','greencomputing',25
exec InsertQuestionAnswer @ActID,'input device','inputdevice',12
exec InsertQuestionAnswer @ActID,'Internet','Internet',18
exec InsertQuestionAnswer @ActID,'laptop','LAPTOP',4
exec InsertQuestionAnswer @ActID,'mobile device','MOBILEDEVICE',7
exec InsertQuestionAnswer @ActID,'network','NETWORK',30
--exec InsertQuestionAnswer @ActID,'online social network','onlinesocialnetwork',21
exec InsertQuestionAnswer @ActID,'social network','socialnetwork',21
exec InsertQuestionAnswer @ActID,'output device','outputdevice',14
exec InsertQuestionAnswer @ActID,'personal computer','personalcomputer',4
--exec InsertQuestionAnswer @ActID,'portable media player','portablemediaplayer',8
exec InsertQuestionAnswer @ActID,'printer','printer',14
exec InsertQuestionAnswer @ActID,'program','program',25
exec InsertQuestionAnswer @ActID,'search engine','searchengine',21
exec InsertQuestionAnswer @ActID,'server','server',6
exec InsertQuestionAnswer @ActID,'smartphone','smartphone',7
--exec InsertQuestionAnswer @ActID,'social networking site','socialnetworkingsite',21
exec InsertQuestionAnswer @ActID,'software','software',25
exec InsertQuestionAnswer @ActID,'storage device','storagedevice',15
exec InsertQuestionAnswer @ActID,'storage media','storagemedia',15
exec InsertQuestionAnswer @ActID,'sync','sync',32
exec InsertQuestionAnswer @ActID,'synchronize','SYNCHRONIZE',32
exec InsertQuestionAnswer @ActID,'tablet','TABLET',4
exec InsertQuestionAnswer @ActID,'user','user',4
exec InsertQuestionAnswer @ActID,'web','web',19
exec InsertQuestionAnswer @ActID,'web server','webserver',20
exec InsertQuestionAnswer @ActID,'webpage','webpage',19
exec InsertQuestionAnswer @ActID,'website','website',20
--
-- Even though there are more than 20 questions here, only 20 will be selected
-- so each question is worth 5 points.
--
UPDATE Question 
SET Points=5
WHERE Question_ActID=@ActID
UPDATE Answer
SET Answer.AnswerName = UPPER(Answer.AnswerName)
FROM Answer
JOIN AnswerView
ON Answer.AnswerID = AnswerView.AnswerID
WHERE ActID = @ActID


--
-- Attendance
--
DECLARE @Att_ActID Int
DECLARE @AttendanceCatSort Int = (
	SELECT CatSort 
	FROM CatView 
	WHERE CatName='Attendance'
)
DECLARE @AttendanceActSort Int = @AttendanceCatSort + @Chapter*100 + @Assignment
exec PostAttendance @ActID,@QuestionID,@AttendanceActSort,@ActName,@Att_ActID OUTPUT
--
-- Assignments
--
DECLARE @AssignmentStart smalldatetime = (
	SELECT TermStart
	FROM Term
)
DECLARE @AssignmentStop  smalldatetime
SET @AssignmentStop = '11/2/2014 23:59'
exec AddAssignments @ActID,@CatSort,@AssignmentStart,@AssignmentStop
exec AddAssignments @Att_ActID,@AttendanceCatSort,@AssignmentStart,@AssignmentStop
GO
/*
DECLARE @ActID Int
DECLARE @ActSort Int
DECLARE @QuestionID Int
SET @ActSort = 6032 -- 6000 = Final, 30 = Word Search, 2=Chapter 2
exec ClearAct @ActSort
INSERT INTO Act(ActSort,ActName,ActName,Questions) VALUES(@ActSort,'Chapter 1 Secondary Terms','These are the terms shown in italic characters in chapter 1')
SELECT @ActID=SCOPE_IDENTITY()
exec InsertQuestionAnswer @ActID,'backup','',17
exec InsertQuestionAnswer @ActID,'blog','',37
exec InsertQuestionAnswer @ActID,'Bluetooth','',30
exec InsertQuestionAnswer @ActID,'camera phone','',7
exec InsertQuestionAnswer @ActID,'click','',13
exec InsertQuestionAnswer @ActID,'cloud storage','',17
exec InsertQuestionAnswer @ActID,'computer-aided manufacturing','',38
exec InsertQuestionAnswer @ActID,'convergence','',10
exec InsertQuestionAnswer @ActID,'data','',11
exec InsertQuestionAnswer @ActID,'desktop app','',26
exec InsertQuestionAnswer @ActID,'digital divide','',34
exec InsertQuestionAnswer @ActID,'double-click','',13
exec InsertQuestionAnswer @ActID,'double-tap','',5
exec InsertQuestionAnswer @ActID,'downloading','',19
exec InsertQuestionAnswer @ActID,'drag','',5, 13
exec InsertQuestionAnswer @ActID,'earbuds','',9
exec InsertQuestionAnswer @ActID,'e-book','',9
exec InsertQuestionAnswer @ActID,'enterprise user','',39
exec InsertQuestionAnswer @ActID,'e-reader','',9
exec InsertQuestionAnswer @ActID,'e-waste','',24	
exec InsertQuestionAnswer @ActID,'file','',17
exec InsertQuestionAnswer @ActID,'gesture','',5
exec InsertQuestionAnswer @ActID,'hard copy','',14
exec InsertQuestionAnswer @ActID,'hard disk','',15
exec InsertQuestionAnswer @ActID,'hardware','',4
exec InsertQuestionAnswer @ActID,'headset','',13
exec InsertQuestionAnswer @ActID,'home user','',38
exec InsertQuestionAnswer @ActID,'hot spot','',30
exec InsertQuestionAnswer @ActID,'hyperlink','',20
exec InsertQuestionAnswer @ActID,'information','',11
exec InsertQuestionAnswer @ActID,'input','',4
exec InsertQuestionAnswer @ActID,'keyboard','',12
exec InsertQuestionAnswer @ActID,'link','',20
exec InsertQuestionAnswer @ActID,'loads','',27 
exec InsertQuestionAnswer @ActID,'malware','',23
exec InsertQuestionAnswer @ActID,'memory','',15
exec InsertQuestionAnswer @ActID,'memory card','',16
exec InsertQuestionAnswer @ActID,'microphone','',13
exec InsertQuestionAnswer @ActID,'mobile app','',26
exec InsertQuestionAnswer @ActID,'mobile computer','',4	
exec InsertQuestionAnswer @ActID,'mobile user','',38
exec InsertQuestionAnswer @ActID,'mouse','',12
exec InsertQuestionAnswer @ActID,'neural network','',37
exec InsertQuestionAnswer @ActID,'notebook computer','',4
exec InsertQuestionAnswer @ActID,'online','',6
exec InsertQuestionAnswer @ActID,'on-screen keyboard','',5
exec InsertQuestionAnswer @ActID,'operating system','',25
exec InsertQuestionAnswer @ActID,'output','',4
exec InsertQuestionAnswer @ActID,'passphrase','',24
exec InsertQuestionAnswer @ActID,'personal media player','',8
exec InsertQuestionAnswer @ActID,'picture message','',7
exec InsertQuestionAnswer @ActID,'pinch','',5
exec InsertQuestionAnswer @ActID,'podcast','',37
exec InsertQuestionAnswer @ActID,'point','',13
exec InsertQuestionAnswer @ActID,'power user','',39
exec InsertQuestionAnswer @ActID,'press and hold','',5
exec InsertQuestionAnswer @ActID,'printout','',14
exec InsertQuestionAnswer @ActID,'resources','',30
exec InsertQuestionAnswer @ActID,'right-click','',13
exec InsertQuestionAnswer @ActID,'scanner','',13
exec InsertQuestionAnswer @ActID,'slide','',5
exec InsertQuestionAnswer @ActID,'small/home office user','',38
exec InsertQuestionAnswer @ActID,'software developer','',28
exec InsertQuestionAnswer @ActID,'solid-state drive','',16
exec InsertQuestionAnswer @ActID,'source','',32
exec InsertQuestionAnswer @ActID,'streaming','',35
exec InsertQuestionAnswer @ActID,'stretch','',5
exec InsertQuestionAnswer @ActID,'surfing the web','',20
exec InsertQuestionAnswer @ActID,'swipe','',5
exec InsertQuestionAnswer @ActID,'tap','',5
exec InsertQuestionAnswer @ActID,'target','',32
exec InsertQuestionAnswer @ActID,'text message','',7
exec InsertQuestionAnswer @ActID,'touchpad','',12
exec InsertQuestionAnswer @ActID,'USB flash drive','',16
exec InsertQuestionAnswer @ActID,'user interface','',27
exec InsertQuestionAnswer @ActID,'video message','',7
exec InsertQuestionAnswer @ActID,'web app','',26
exec InsertQuestionAnswer @ActID,'webcam','',13
exec InsertQuestionAnswer @ActID,'Wi-Fi','',30
exec InsertQuestionAnswer @ActID,'wiki','',38
*/
GO
DECLARE @CatSort Int = (
	SELECT CatSort 
	FROM CatView 
	WHERE CatName='Textbook'
)
DECLARE @Chapter Int = 2
DECLARE @Assignment Int = 1
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment

DECLARE @ActName Varchar(128) = 'Chapter ' + cast(@Chapter as varchar) + ', Word Search'
DECLARE @ActID Int
DECLARE @QuestionID Int

exec ClearAct @ActSort
INSERT INTO Act(ActSort,ActName,ActDesc,ActLink,Questions) VALUES(@ActSort,@ActName
,'These are the terms shown in bold in chapter 2.'
,'WordSearch/WordSearchIntro.cfm'
,20)
SELECT @ActID=SCOPE_IDENTITY()
exec InsertQuestionAnswer @ActID,'blog','blog',72 -- I'm not using the questionsort yet.
exec InsertQuestionAnswer @ActID,'blogger','blogger',72
exec InsertQuestionAnswer @ActID,'browser','browser',62
exec InsertQuestionAnswer @ActID,'chat','chat',87
exec InsertQuestionAnswer @ActID,'chat room','chatroom',87
exec InsertQuestionAnswer @ActID,'Chrome','chrome',64
exec InsertQuestionAnswer @ActID,'cybercafe','cybercafe',57
exec InsertQuestionAnswer @ActID,'discussion forum','discussionforum',87
exec InsertQuestionAnswer @ActID,'domain name','domainname',60
exec InsertQuestionAnswer @ActID,'e-commerce','ecommerce',77
exec InsertQuestionAnswer @ActID,'email','email',84
exec InsertQuestionAnswer @ActID,'email list','emaillist',86
exec InsertQuestionAnswer @ActID,'email program','emailprogram',84
exec InsertQuestionAnswer @ActID,'emoticons','emoticons',90
exec InsertQuestionAnswer @ActID,'favorites','favorites',63
exec InsertQuestionAnswer @ActID,'Firefox','firefox',64
exec InsertQuestionAnswer @ActID,'FTP','ftp',88
exec InsertQuestionAnswer @ActID,'graphic','graphic',80
exec InsertQuestionAnswer @ActID,'home page','homepage',62
exec InsertQuestionAnswer @ActID,'instant messaging','instantmessaging',86
exec InsertQuestionAnswer @ActID,'Internet','internet',54
exec InsertQuestionAnswer @ActID,'Internet Explorer','InternetExplorer',64
exec InsertQuestionAnswer @ActID,'ISP','ISP',58
exec InsertQuestionAnswer @ActID,'IP address','IPAddress',59
exec InsertQuestionAnswer @ActID,'netiquette','netiquette',90
exec InsertQuestionAnswer @ActID,'online auction','onlineauction',76
--exec InsertQuestionAnswer @ActID,'online social network','onlinesocialnetwork',68
exec InsertQuestionAnswer @ActID,'Opera','opera',64
exec InsertQuestionAnswer @ActID,'pop-up blocker','popupblocker',62
exec InsertQuestionAnswer @ActID,'portal','portal',78
exec InsertQuestionAnswer @ActID,'Safari','safari',64
exec InsertQuestionAnswer @ActID,'search engine','searchengine',67
exec InsertQuestionAnswer @ActID,'social media','socialmedia',90
--exec InsertQuestionAnswer @ActID,'social networking site','socialnetworkingsite',68
exec InsertQuestionAnswer @ActID,'streaming','streaming',73
exec InsertQuestionAnswer @ActID,'tabbed browsing','tabbedbrowsing',62
exec InsertQuestionAnswer @ActID,'user name','username',84
exec InsertQuestionAnswer @ActID,'VR','VR',83
exec InsertQuestionAnswer @ActID,'VoIP','Voip',88
exec InsertQuestionAnswer @ActID,'web','web',61
exec InsertQuestionAnswer @ActID,'web address','webaddress',64
exec InsertQuestionAnswer @ActID,'web publishing','webpublishing',78
exec InsertQuestionAnswer @ActID,'web server','webserver',61
exec InsertQuestionAnswer @ActID,'webpage','webpage',61
exec InsertQuestionAnswer @ActID,'website','website',61
exec InsertQuestionAnswer @ActID,'wiki','wiki',73
exec InsertQuestionAnswer @ActID,'www','www',61
UPDATE Question SET Points=5 WHERE Question_ActID = @ActID
UPDATE Answer
SET Answer.AnswerName = UPPER(Answer.AnswerName)
FROM Answer
JOIN AnswerView
ON Answer.AnswerID = AnswerView.AnswerID
WHERE ActID = @ActID

--
-- Attendance
--
DECLARE @Att_ActID Int
DECLARE @AttendanceCatSort Int = (
	SELECT CatSort 
	FROM CatView 
	WHERE CatName='Attendance'
)
DECLARE @AttendanceActSort Int = @AttendanceCatSort + @Chapter*100 + @Assignment

exec PostAttendance @ActID,@QuestionID,@AttendanceActSort,@ActName,@Att_ActID OUTPUT
--
-- Assignments
--
DECLARE @AssignmentStart smalldatetime
DECLARE @AssignmentStop  smalldatetime

SET @AssignmentStart = '11/3/2014'
SET @AssignmentStop = '11/9/2014 23:59'
exec AddAssignments @ActID,@CatSort,@AssignmentStart,@AssignmentStop
exec AddAssignments @Att_ActID,@AttendanceCatSort,@AssignmentStart,@AssignmentStop
GO
/*
Chapter 2 Secondary
exec InsertQuestionAnswer @ActID,'animation','',81
exec InsertQuestionAnswer @ActID,'anonymous FTP','',88
exec InsertQuestionAnswer @ActID,'Anticybersquatting Consumer
Protection Act','',60
exec InsertQuestionAnswer @ActID,'ARPANET','',54
exec InsertQuestionAnswer @ActID,'Atom','',65
exec InsertQuestionAnswer @ActID,'audio','',81
exec InsertQuestionAnswer @ActID,'bandwidth','',58
exec InsertQuestionAnswer @ActID,'blogosphere','',72
exec InsertQuestionAnswer @ActID,'bookmarks','',63
exec InsertQuestionAnswer @ActID,'bookmarking site','',71
exec InsertQuestionAnswer @ActID,'broadband','',56
exec InsertQuestionAnswer @ActID,'business-to-business','',B2B
e-commerce','',77
exec InsertQuestionAnswer @ActID,'business-to-consumer','',B2C
e-commerce','',77
exec InsertQuestionAnswer @ActID,'cable Internet service','',57
exec InsertQuestionAnswer @ActID,'cache','',62
exec InsertQuestionAnswer @ActID,'ccTLD','',60
exec InsertQuestionAnswer @ActID,'check in','',69
exec InsertQuestionAnswer @ActID,'cloud storage','',65
exec InsertQuestionAnswer @ActID,'consumer-to-consumer','',C2C
e-commerce','',77
exec InsertQuestionAnswer @ActID,'contacts folder','',85
exec InsertQuestionAnswer @ActID,'content management system','',79
exec InsertQuestionAnswer @ActID,'cyberbullying','',90
exec InsertQuestionAnswer @ActID,'dial-up access','',58
exec InsertQuestionAnswer @ActID,'DNS server','',61
exec InsertQuestionAnswer @ActID,'domain name system','',DNS','',61
exec InsertQuestionAnswer @ActID,'dongle','',56
exec InsertQuestionAnswer @ActID,'DSL','',57
exec InsertQuestionAnswer @ActID,'dynamic webpage','',61
exec InsertQuestionAnswer @ActID,'electronic storefront','',75
exec InsertQuestionAnswer @ActID,'e-retail','',75
exec InsertQuestionAnswer @ActID,'extended contacts','',69
exec InsertQuestionAnswer @ActID,'FAQ','',90
exec InsertQuestionAnswer @ActID,'Fiber to the Premises','',FTTP','',57
exec InsertQuestionAnswer @ActID,'fixed wireless','',57
exec InsertQuestionAnswer @ActID,'flames','',90
exec InsertQuestionAnswer @ActID,'flame wars','',90
exec InsertQuestionAnswer @ActID,'friends','',69
exec InsertQuestionAnswer @ActID,'FTP server','',88
exec InsertQuestionAnswer @ActID,'gigabyte','',GB','',58
exec InsertQuestionAnswer @ActID,'GPS','',66
exec InsertQuestionAnswer @ActID,'GPS receiver','',66
exec InsertQuestionAnswer @ActID,'hashtag','',72
exec InsertQuestionAnswer @ActID,'hits','',67
exec InsertQuestionAnswer @ActID,'host','',54
exec InsertQuestionAnswer @ActID,'hot spot','',57
exec InsertQuestionAnswer @ActID,'http','',64
exec InsertQuestionAnswer @ActID,'ICANN','',60
exec InsertQuestionAnswer @ActID,'infographic','',80
exec InsertQuestionAnswer @ActID,'Internet backbone','',59
exec InsertQuestionAnswer @ActID,'JPEG','',81
exec InsertQuestionAnswer @ActID,'keyloggers','',74
exec InsertQuestionAnswer @ActID,'like','',69
exec InsertQuestionAnswer @ActID,'m-commerce','',77
exec InsertQuestionAnswer @ActID,'media player','',82
exec InsertQuestionAnswer @ActID,'media sharing site','',70
exec InsertQuestionAnswer @ActID,'megabyte','',MB','',58
exec InsertQuestionAnswer @ActID,'message board','',87
exec InsertQuestionAnswer @ActID,'microblog','',72
exec InsertQuestionAnswer @ActID,'mobile app','',65
exec InsertQuestionAnswer @ActID,'mobile broadband','',57
exec InsertQuestionAnswer @ActID,'mobile browser','',62
exec InsertQuestionAnswer @ActID,'mobile service provider','',58
exec InsertQuestionAnswer @ActID,'MP3','',82
exec InsertQuestionAnswer @ActID,'multimedia','',79
exec InsertQuestionAnswer @ActID,'news feed','',69
exec InsertQuestionAnswer @ActID,'PDF','',81
exec InsertQuestionAnswer @ActID,'phishing','',62
exec InsertQuestionAnswer @ActID,'phishing filter','',62
exec InsertQuestionAnswer @ActID,'plug-in','',83
exec InsertQuestionAnswer @ActID,'PNG','',81
exec InsertQuestionAnswer @ActID,'pop-up ad','',62
exec InsertQuestionAnswer @ActID,'proxy server','',62
exec InsertQuestionAnswer @ActID,'pull','',65
exec InsertQuestionAnswer @ActID,'real time','',86
exec InsertQuestionAnswer @ActID,'RSS','',65
exec InsertQuestionAnswer @ActID,'satellite Internet service','',57
exec InsertQuestionAnswer @ActID,'search text','',67
exec InsertQuestionAnswer @ActID,'shopping cart','',76
exec InsertQuestionAnswer @ActID,'static webpage','',61
exec InsertQuestionAnswer @ActID,'status update','',69
exec InsertQuestionAnswer @ActID,'subject directory','',68
exec InsertQuestionAnswer @ActID,'subscribe','',86
exec InsertQuestionAnswer @ActID,'tag','',71
exec InsertQuestionAnswer @ActID,'tethering','',57
exec InsertQuestionAnswer @ActID,'thread','',87
exec InsertQuestionAnswer @ActID,'thumbnail','',80
exec InsertQuestionAnswer @ActID,'timeline','',69
exec InsertQuestionAnswer @ActID,'top-level domain','',TLD','',60
exec InsertQuestionAnswer @ActID,'traffic','',59
exec InsertQuestionAnswer @ActID,'unsubscribe','',86
exec InsertQuestionAnswer @ActID,'uploading','',88
exec InsertQuestionAnswer @ActID,'URL','',64
exec InsertQuestionAnswer @ActID,'video','',83
exec InsertQuestionAnswer @ActID,'VR world','',83
exec InsertQuestionAnswer @ActID,'W3C','',56
exec InsertQuestionAnswer @ActID,'wall','',69
exec InsertQuestionAnswer @ActID,'Web 2.0','',62
exec InsertQuestionAnswer @ActID,'web app','',65
exec InsertQuestionAnswer @ActID,'web feed','',65
exec InsertQuestionAnswer @ActID,'web hosting service','',79
exec InsertQuestionAnswer @ActID,'Wi-Fi','',57
exec InsertQuestionAnswer @ActID,'wireless modem','',56
*/
DECLARE @CatSort Int = (
	SELECT CatSort 
	FROM CatView 
	WHERE CatName='Textbook'
)
DECLARE @Chapter Int = 3
DECLARE @Assignment Int = 1
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment

DECLARE @ActName Varchar(128) = 'Chapter ' + cast(@Chapter as varchar) + ', Word Search'
DECLARE @ActID Int
DECLARE @QuestionID Int

exec ClearAct @ActSort

INSERT INTO Act(ActSort,ActName,ActDesc,ActLink,Questions) VALUES(@ActSort,@ActName
,'These are the terms shown in bold in chapter 3.'
,'WordSearch/WordSearchIntro.cfm'
,20)
SELECT @ActID=SCOPE_IDENTITY()

exec InsertQuestionAnswer @ActID,'Bluetooth','Bluetooth',132
exec InsertQuestionAnswer @ActID,'cloud computing','cloudcomputing',116
exec InsertQuestionAnswer @ActID,'computer','computer',104
--exec InsertQuestionAnswer @ActID,'computer vision syndrome','',137
exec InsertQuestionAnswer @ActID,'connector','connector',129
exec InsertQuestionAnswer @ActID,'desktop','desktop',106
exec InsertQuestionAnswer @ActID,'digital camera','digitalcamera',120
exec InsertQuestionAnswer @ActID,'e-book reader','ebookreader',124
--exec InsertQuestionAnswer @ActID,'embedded computer','embedded',126
exec InsertQuestionAnswer @ActID,'embedded','embedded',126
exec InsertQuestionAnswer @ActID,'ergonomics','ergonomics',138
exec InsertQuestionAnswer @ActID,'game console','gameconsole',125
--exec InsertQuestionAnswer @ActID,'handheld computer','handheld',111
exec InsertQuestionAnswer @ActID,'handheld','handheld',111
--exec InsertQuestionAnswer @ActID,'handheld game device','',125
exec InsertQuestionAnswer @ActID,'laptop','laptop',108
--exec InsertQuestionAnswer @ActID,'mobile device','mobile',104
exec InsertQuestionAnswer @ActID,'mobile','mobile',104
exec InsertQuestionAnswer @ActID,'NFC','NFC',133
exec InsertQuestionAnswer @ActID,'overvoltage','overvoltage',135
exec InsertQuestionAnswer @ActID,'pairing','pairing',132
--exec InsertQuestionAnswer @ActID,'personal computer','',104
exec InsertQuestionAnswer @ActID,'port','port',129
--exec InsertQuestionAnswer @ActID,'portable media player','',122
exec InsertQuestionAnswer @ActID,'power surge','powersurge',135
exec InsertQuestionAnswer @ActID,'resolution','resolution',122
exec InsertQuestionAnswer @ActID,'server','server',111
exec InsertQuestionAnswer @ActID,'smartphone','smartphone',117
exec InsertQuestionAnswer @ActID,'surge protector','surgeprotector',135
exec InsertQuestionAnswer @ActID,'tablet','tablet',109
--exec InsertQuestionAnswer @ActID,'technology addiction','',138
exec InsertQuestionAnswer @ActID,'addiction','addiction',138
exec InsertQuestionAnswer @ActID,'undervoltage','undervoltage',135
--exec InsertQuestionAnswer @ActID,'uninterruptible power supply','',135
exec InsertQuestionAnswer @ActID,'uninterruptible','uninterruptible',135
exec InsertQuestionAnswer @ActID,'USB port','USBport',131
exec InsertQuestionAnswer @ActID,'Wi-Fi','wifi',133
UPDATE Question SET Points=5 WHERE Question_ActID = @ActID
UPDATE Answer
SET Answer.AnswerName = UPPER(Answer.AnswerName)
FROM Answer
JOIN AnswerView
ON Answer.AnswerID = AnswerView.AnswerID
WHERE ActID = @ActID

--
-- Attendance
--
DECLARE @Att_ActID Int
DECLARE @AttendanceCatSort Int = (
	SELECT CatSort 
	FROM CatView 
	WHERE CatName='Attendance'
)
DECLARE @AttendanceActSort Int = @AttendanceCatSort + @Chapter*100 + @Assignment

exec PostAttendance @ActID,@QuestionID,@AttendanceActSort,@ActName,@Att_ActID OUTPUT
--
-- Assignments
--
DECLARE @AssignmentStart smalldatetime
DECLARE @AssignmentStop  smalldatetime

SET @AssignmentStart = '11/10/2014'
SET @AssignmentStop = '11/16/2014 23:59'
exec AddAssignments @ActID,@CatSort,@AssignmentStart,@AssignmentStop
exec AddAssignments @Att_ActID,@AttendanceCatSort,@AssignmentStart,@AssignmentStop
GO
/*
Chapter 3, Secondary
exec InsertQuestionAnswer @ActID,'all-in-one desktop','',107
exec InsertQuestionAnswer @ActID,'application server','',111
exec InsertQuestionAnswer @ActID,'ATM','',114
exec InsertQuestionAnswer @ActID,'backup server','',111
exec InsertQuestionAnswer @ActID,'backward compatible','',131
exec InsertQuestionAnswer @ActID,'balance board','',126
exec InsertQuestionAnswer @ActID,'bar code reader','',113
exec InsertQuestionAnswer @ActID,'blackout','',135
exec InsertQuestionAnswer @ActID,'blade server','',112
exec InsertQuestionAnswer @ActID,'Bluetooth wireless port adapter','',132
exec InsertQuestionAnswer @ActID,'brownout','',135
exec InsertQuestionAnswer @ActID,'charge-coupled device','',CCD','',121
exec InsertQuestionAnswer @ActID,'common short code','',CSC','',118
exec InsertQuestionAnswer @ActID,'convertible tablet','',109
exec InsertQuestionAnswer @ActID,'CPU','',106
exec InsertQuestionAnswer @ActID,'CVS','',137
exec InsertQuestionAnswer @ActID,'dance pad','',126
exec InsertQuestionAnswer @ActID,'database server','',111
exec InsertQuestionAnswer @ActID,'discoverable mode','',132
exec InsertQuestionAnswer @ActID,'docking station','',132
exec InsertQuestionAnswer @ActID,'domain name server','',111
exec InsertQuestionAnswer @ActID,'DVD kiosk','',115
exec InsertQuestionAnswer @ActID,'earbuds','',123
exec InsertQuestionAnswer @ActID,'EarPods','',123
exec InsertQuestionAnswer @ActID,'e-book','',124
exec InsertQuestionAnswer @ActID,'enhanced resolution','',122
exec InsertQuestionAnswer @ActID,'e-reader','',124
exec InsertQuestionAnswer @ActID,'fault-tolerant computer','',135
exec InsertQuestionAnswer @ActID,'file server','',111
exec InsertQuestionAnswer @ActID,'fingerprint reader','',134
exec InsertQuestionAnswer @ActID,'FTP server','',111
exec InsertQuestionAnswer @ActID,'game server','',111
exec InsertQuestionAnswer @ActID,'gamepad','',126
exec InsertQuestionAnswer @ActID,'gaming desktop','',107
exec InsertQuestionAnswer @ActID,'home server','',111
exec InsertQuestionAnswer @ActID,'inattentional blindness','',119
exec InsertQuestionAnswer @ActID,'Internet of Things','',128
exec InsertQuestionAnswer @ActID,'jack','',129
exec InsertQuestionAnswer @ActID,'joystick','',126
exec InsertQuestionAnswer @ActID,'kiosk','',115
exec InsertQuestionAnswer @ActID,'list server','',111
exec InsertQuestionAnswer @ActID,'mail server','',111
exec InsertQuestionAnswer @ActID,'mainframe','',112
exec InsertQuestionAnswer @ActID,'media library','',123
exec InsertQuestionAnswer @ActID,'memory','',106
exec InsertQuestionAnswer @ActID,'MMS','',multimedia message service','',119
exec InsertQuestionAnswer @ActID,'mobile computer','',104
exec InsertQuestionAnswer @ActID,'motherboard','',106
exec InsertQuestionAnswer @ActID,'motion-sensing game controller','',126
exec InsertQuestionAnswer @ActID,'near field communications','',133
exec InsertQuestionAnswer @ActID,'network server','',111
exec InsertQuestionAnswer @ActID,'notebook computer','',108
exec InsertQuestionAnswer @ActID,'offline UPS','',136
exec InsertQuestionAnswer @ActID,'online UPS','',136
exec InsertQuestionAnswer @ActID,'on-screen keyboard','',118
exec InsertQuestionAnswer @ActID,'optical resolution','',122
exec InsertQuestionAnswer @ActID,'peripheral device','',104
exec InsertQuestionAnswer @ActID,'personal media player','',122
exec InsertQuestionAnswer @ActID,'phablet','',110
exec InsertQuestionAnswer @ActID,'PIN','',114
exec InsertQuestionAnswer @ActID,'pixel','',122
exec InsertQuestionAnswer @ActID,'point-and-shoot camera','',120
exec InsertQuestionAnswer @ActID,'port replicator','',131
exec InsertQuestionAnswer @ActID,'portable keyboard','',118
exec InsertQuestionAnswer @ActID,'POS terminal','',113
exec InsertQuestionAnswer @ActID,'predictive text input','',118
exec InsertQuestionAnswer @ActID,'print server','',111
exec InsertQuestionAnswer @ActID,'processor','',106
exec InsertQuestionAnswer @ActID,'rack server','',112
exec InsertQuestionAnswer @ActID,'repetitive strain injury','',RSI','',136
exec InsertQuestionAnswer @ActID,'server farm','',112
exec InsertQuestionAnswer @ActID,'server virtualization','',112
exec InsertQuestionAnswer @ActID,'skimmer','',114
exec InsertQuestionAnswer @ActID,'slate tablet','',109
exec InsertQuestionAnswer @ActID,'SLR camera','',120
exec InsertQuestionAnswer @ActID,'Smart TV','',128
exec InsertQuestionAnswer @ActID,'SMS','',short message service','',118
exec InsertQuestionAnswer @ActID,'spike','',135
exec InsertQuestionAnswer @ActID,'standby UPS','',136
exec InsertQuestionAnswer @ActID,'storage server','',111
exec InsertQuestionAnswer @ActID,'stylus','',109
exec InsertQuestionAnswer @ActID,'supercomputer','',113
exec InsertQuestionAnswer @ActID,'surge suppressor','',135
exec InsertQuestionAnswer @ActID,'system unit','',106
exec InsertQuestionAnswer @ActID,'technology overload','',138
exec InsertQuestionAnswer @ActID,'telematics','',127
exec InsertQuestionAnswer @ActID,'terminal','',113
exec InsertQuestionAnswer @ActID,'thin client','',113
exec InsertQuestionAnswer @ActID,'touch-sensitive pad','',123
exec InsertQuestionAnswer @ActID,'tower','',106
exec InsertQuestionAnswer @ActID,'tower server','',112
exec InsertQuestionAnswer @ActID,'ultrabook','',109
exec InsertQuestionAnswer @ActID,'USB hub','',131
exec InsertQuestionAnswer @ActID,'virtual keyboard','',118
exec InsertQuestionAnswer @ActID,'virtualization','',112
exec InsertQuestionAnswer @ActID,'visual voice mail','',119
exec InsertQuestionAnswer @ActID,'voice mail','',119
exec InsertQuestionAnswer @ActID,'web server','',111
exec InsertQuestionAnswer @ActID,'wheel','',126
exec InsertQuestionAnswer @ActID,'workstation','',107
*/
GO
DECLARE @CatSort Int = (
	SELECT CatSort 
	FROM CatView 
	WHERE CatName='Textbook'
)
DECLARE @Chapter Int = 4
DECLARE @Assignment Int = 1
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment

DECLARE @ActName Varchar(128) = 'Chapter ' + cast(@Chapter as varchar) + ', Word Search'
DECLARE @ActID Int
DECLARE @QuestionID Int

exec ClearAct @ActSort

INSERT INTO Act(ActSort,ActName,ActDesc,ActLink,Questions) VALUES(@ActSort,@ActName
,'These are the terms shown in bold in chapter 4.'
,'WordSearch/WordSearchIntro.cfm'
,20)
SELECT @ActID=SCOPE_IDENTITY()

--exec InsertQuestionAnswer @ActID,'accounting software','',164
exec InsertQuestionAnswer @ActID,'accounting','accounting',164
--exec InsertQuestionAnswer @ActID,'adware remover','',182
exec InsertQuestionAnswer @ActID,'adware','adware',182
--exec InsertQuestionAnswer @ActID,'anti-spam program','',183
exec InsertQuestionAnswer @ActID,'anti-spam','antispam',183
--exec InsertQuestionAnswer @ActID,'antivirus program','',181
exec InsertQuestionAnswer @ActID,'antivirus','antivirus',181
exec InsertQuestionAnswer @ActID,'app','app',152
exec InsertQuestionAnswer @ActID,'application','application',152
--exec InsertQuestionAnswer @ActID,'audio editing software','',173
exec InsertQuestionAnswer @ActID,'audio','audio',173
--exec InsertQuestionAnswer @ActID,'backup tool','',188
exec InsertQuestionAnswer @ActID,'backup','backup',188
--exec InsertQuestionAnswer @ActID,'calendar and contact management software','',163
exec InsertQuestionAnswer @ActID,'clip art','clipart',159
exec InsertQuestionAnswer @ActID,'image gallery','imagegallery',173
--exec InsertQuestionAnswer @ActID,'computer-aided design','',170
exec InsertQuestionAnswer @ActID,'database','database',162
--exec InsertQuestionAnswer @ActID,'database software','',162
exec InsertQuestionAnswer @ActID,'defragmenting','defragmenting',186
--exec InsertQuestionAnswer @ActID,'desktop publishing software','',170
--exec InsertQuestionAnswer @ActID,'disc burning software','',176
exec InsertQuestionAnswer @ActID,'disc','disc',176
--exec InsertQuestionAnswer @ActID,'disk cleanup','',186
exec InsertQuestionAnswer @ActID,'disk','disk',186
--exec InsertQuestionAnswer @ActID,'disk defragmenter','',186
--exec InsertQuestionAnswer @ActID,'document management software','',166
--exec InsertQuestionAnswer @ActID,'file compression tool','',187
exec InsertQuestionAnswer @ActID,'compression','compression',187
--exec InsertQuestionAnswer @ActID,'file manager','',183
exec InsertQuestionAnswer @ActID,'folder','folder',184
--exec InsertQuestionAnswer @ActID,'image editing software','',171
--exec InsertQuestionAnswer @ActID,'image viewer','',185
--exec InsertQuestionAnswer @ActID,'legal software','',166
exec InsertQuestionAnswer @ActID,'media player','mediaplayer',175
--exec InsertQuestionAnswer @ActID,'multimedia authoring software','',174
exec InsertQuestionAnswer @ActID,'multimedia','multimedia',174
--exec InsertQuestionAnswer @ActID,'note taking software','',162
--exec InsertQuestionAnswer @ActID,'paint software','',171
exec InsertQuestionAnswer @ActID,'paint','paint',171
--exec InsertQuestionAnswer @ActID,'PC maintenance tool','',188
exec InsertQuestionAnswer @ActID,'PDF','PDF',167
--exec InsertQuestionAnswer @ActID,'personal finance software','',164
--exec InsertQuestionAnswer @ActID,'personal firewall','',179
exec InsertQuestionAnswer @ActID,'firewall','firewall',179
exec InsertQuestionAnswer @ActID,'phishing','phishing',183
--exec InsertQuestionAnswer @ActID,'phishing filter','',183
--exec InsertQuestionAnswer @ActID,'photo editing software','',171
--exec InsertQuestionAnswer @ActID,'photo management software','',173
--exec InsertQuestionAnswer @ActID,'pop-up blocker','',183
--exec InsertQuestionAnswer @ActID,'presentation software','',160
exec InsertQuestionAnswer @ActID,'program','program',152
--exec InsertQuestionAnswer @ActID,'project management software','',164
--exec InsertQuestionAnswer @ActID,'restore tool','',188
exec InsertQuestionAnswer @ActID,'restore','restore',188
--exec InsertQuestionAnswer @ActID,'screen saver','',187
--exec InsertQuestionAnswer @ActID,'search tool','',184
exec InsertQuestionAnswer @ActID,'software','software',152
--exec InsertQuestionAnswer @ActID,'software suite','',163
exec InsertQuestionAnswer @ActID,'spam','spam',183
--exec InsertQuestionAnswer @ActID,'spreadsheet software','',160
--exec InsertQuestionAnswer @ActID,'spyware remover','',182
--exec InsertQuestionAnswer @ActID,'tax preparation software','',166
exec InsertQuestionAnswer @ActID,'uncompress','uncompress',188
exec InsertQuestionAnswer @ActID,'uninstaller','uninstaller',185
--exec InsertQuestionAnswer @ActID,'video editing software','',173
exec InsertQuestionAnswer @ActID,'video editing','videoediting',173
exec InsertQuestionAnswer @ActID,'virus','virus',180
--exec InsertQuestionAnswer @ActID,'web filtering software','',183
--exec InsertQuestionAnswer @ActID,'website authoring software','',174
--exec InsertQuestionAnswer @ActID,'word processing software','',159
exec InsertQuestionAnswer @ActID,'worksheet','worksheet',160
--exec InsertQuestionAnswer @ActID,'zipped files','',188
exec InsertQuestionAnswer @ActID,'zipped','zipped',188
exec InsertQuestionAnswer @ActID,'QR code','QRCODE',169
UPDATE Question 
SET Points=5
WHERE Question_ActID=@ActID

UPDATE Answer
SET Answer.AnswerName = UPPER(Answer.AnswerName)
FROM Answer
JOIN AnswerView
ON Answer.AnswerID = AnswerView.AnswerID
WHERE ActID = @ActID

--
-- Attendance
--
DECLARE @Att_ActID Int
DECLARE @AttendanceCatSort Int = (
	SELECT CatSort 
	FROM CatView 
	WHERE CatName='Attendance'
)
DECLARE @AttendanceActSort Int = @AttendanceCatSort + @Chapter*100 + @Assignment

exec PostAttendance @ActID,@QuestionID,@AttendanceActSort,@ActName,@Att_ActID OUTPUT
--
-- Assignments
--
DECLARE @AssignmentStart smalldatetime
DECLARE @AssignmentStop  smalldatetime

SET @AssignmentStart = '11/17/2014'
SET @AssignmentStop = '11/30/2014 23:59'
exec AddAssignments @ActID,@CatSort,@AssignmentStart,@AssignmentStop
exec AddAssignments @Att_ActID,@AttendanceCatSort,@AssignmentStart,@AssignmentStop
GO
/*
Chapter 4 Secondary
exec InsertQuestionAnswer @ActID,'adware','',182
exec InsertQuestionAnswer @ActID,'application software','',152
exec InsertQuestionAnswer @ActID,'automatic update','',156
exec InsertQuestionAnswer @ActID,'blog software','',178
exec InsertQuestionAnswer @ActID,'brightness','',172
exec InsertQuestionAnswer @ActID,'clipboard','',157
exec InsertQuestionAnswer @ActID,'compress','',172
exec InsertQuestionAnswer @ActID,'computer-based training','',CBT','',174
exec InsertQuestionAnswer @ActID,'contrast','',172
exec InsertQuestionAnswer @ActID,'cookie','',182
exec InsertQuestionAnswer @ActID,'create','',157
exec InsertQuestionAnswer @ActID,'crop','',172
exec InsertQuestionAnswer @ActID,'custom software','',155
exec InsertQuestionAnswer @ActID,'edit','',157
exec InsertQuestionAnswer @ActID,'e-filing','',166
exec InsertQuestionAnswer @ActID,'font','',158
exec InsertQuestionAnswer @ActID,'font size','',158
exec InsertQuestionAnswer @ActID,'font style','',158
exec InsertQuestionAnswer @ActID,'format','',157
exec InsertQuestionAnswer @ActID,'freeware','',155
exec InsertQuestionAnswer @ActID,'function','',161
exec InsertQuestionAnswer @ActID,'hacker','',179
exec InsertQuestionAnswer @ActID,'hard copy','',158
exec InsertQuestionAnswer @ActID,'home design/landscaping software','',170
exec InsertQuestionAnswer @ActID,'illustration software','',171
exec InsertQuestionAnswer @ActID,'index','',184
exec InsertQuestionAnswer @ActID,'license agreement','',156
exec InsertQuestionAnswer @ActID,'mobile app','',155
exec InsertQuestionAnswer @ActID,'mobile web app','',155
exec InsertQuestionAnswer @ActID,'open source software','',155
exec InsertQuestionAnswer @ActID,'operating system','',152
exec InsertQuestionAnswer @ActID,'payload','',180
exec InsertQuestionAnswer @ActID,'pop-up ad','',183
exec InsertQuestionAnswer @ActID,'print','',158
exec InsertQuestionAnswer @ActID,'product activation','',156
exec InsertQuestionAnswer @ActID,'productivity applications','',157
exec InsertQuestionAnswer @ActID,'public-domain software','',155
exec InsertQuestionAnswer @ActID,'QR code','',169
exec InsertQuestionAnswer @ActID,'QR code reader','',169
exec InsertQuestionAnswer @ActID,'quarantine','',181
exec InsertQuestionAnswer @ActID,'red-eye','',172
exec InsertQuestionAnswer @ActID,'resize','',172
exec InsertQuestionAnswer @ActID,'retail software','',155
exec InsertQuestionAnswer @ActID,'rootkit','',180
exec InsertQuestionAnswer @ActID,'save','',158
exec InsertQuestionAnswer @ActID,'security suite','',179
exec InsertQuestionAnswer @ActID,'shareware','',155
exec InsertQuestionAnswer @ActID,'sharpness','',172
exec InsertQuestionAnswer @ActID,'slide show','',160
exec InsertQuestionAnswer @ActID,'software registration','',156
exec InsertQuestionAnswer @ActID,'spyware','',182
exec InsertQuestionAnswer @ActID,'system software','',152
exec InsertQuestionAnswer @ActID,'toll fraud malware','',182
exec InsertQuestionAnswer @ActID,'tools','',152
exec InsertQuestionAnswer @ActID,'trial version','',155
exec InsertQuestionAnswer @ActID,'trojan horse','',180
exec InsertQuestionAnswer @ActID,'utilities','',152
exec InsertQuestionAnswer @ActID,'virus signature','',182
exec InsertQuestionAnswer @ActID,'web app','',155
exec InsertQuestionAnswer @ActID,'web-based training','',WBT','',174
*/


/*
DECLARE @CatSort Int = (
	SELECT CatSort 
	FROM CatView 
	WHERE CatName='Textbook'
)
DECLARE @Chapter Int = 5
DECLARE @Assignment Int = 1
DECLARE @ActSort Int = @CatSort + @Chapter*100 + @Assignment

DECLARE @ActName Varchar(128) = 'Chapter ' + cast(@Chapter as varchar) + ', Word Search'
DECLARE @ActID Int
DECLARE @QuestionID Int

exec ClearAct @ActSort

INSERT INTO Act(ActSort,ActName,ActDesc,ActLink,Questions) VALUES(@ActSort,@ActName
,'These are the terms shown in bold in chapter 5.'
,'WordSearch/WordSearchIntro.cfm'
,20)
SELECT @ActID=SCOPE_IDENTITY()
exec InsertQuestionAnswer @ActID,'adware','adware',231
exec InsertQuestionAnswer @ActID,'back door','backdoor',207
--exec InsertQuestionAnswer @ActID,'back up','backup',219
exec InsertQuestionAnswer @ActID,'backup','backup',219
--exec InsertQuestionAnswer @ActID,'biometric device','',213
exec InsertQuestionAnswer @ActID,'biometric','biometric',213
exec InsertQuestionAnswer @ActID,'botnet','botnet',206
--exec InsertQuestionAnswer @ActID,'code of conduct','conduct',226
exec InsertQuestionAnswer @ActID,'conduct','conduct',226
--exec InsertQuestionAnswer @ActID,'computer crime','',202
--exec InsertQuestionAnswer @ActID,'computer ethics','',224
--exec InsertQuestionAnswer @ActID,'content filtering','',234
exec InsertQuestionAnswer @ActID,'filtering','filtering',234
exec InsertQuestionAnswer @ActID,'cookie','cookie',229
exec InsertQuestionAnswer @ActID,'cracker','cracker',204
exec InsertQuestionAnswer @ActID,'cybercrime','cybercrime',202
exec InsertQuestionAnswer @ActID,'cyberextortionist','cyberextortionist',204
exec InsertQuestionAnswer @ActID,'cyberterrorist','cyberterrorist',204
exec InsertQuestionAnswer @ActID,'decrypt','decrypt',216
exec InsertQuestionAnswer @ActID,'DoS attack','DoSattack',206
--exec InsertQuestionAnswer @ActID,'digital certificate','',218
--exec InsertQuestionAnswer @ActID,'digital forensics','',214
--exec InsertQuestionAnswer @ActID,'digital security risk','',202
--exec InsertQuestionAnswer @ActID,'digital signature','',218
--exec InsertQuestionAnswer @ActID,'disaster recovery plan','',220
exec InsertQuestionAnswer @ActID,'disaster','disaster',220
exec InsertQuestionAnswer @ActID,'recovery','recovery',220
--exec InsertQuestionAnswer @ActID,'employee monitoring','',233
exec InsertQuestionAnswer @ActID,'monitoring','monitoring',233
exec InsertQuestionAnswer @ActID,'encryption','encryption',216
--exec InsertQuestionAnswer @ActID,'fingerprint reader','',213
exec InsertQuestionAnswer @ActID,'fingerprint','fingerprint',213
exec InsertQuestionAnswer @ActID,'firewall','firewall',208
--exec InsertQuestionAnswer @ActID,'green computing','',226
exec InsertQuestionAnswer @ActID,'hacker','hacker',204
--exec InsertQuestionAnswer @ActID,'information privacy','',227
exec InsertQuestionAnswer @ActID,'privacy','privacy',227
--exec InsertQuestionAnswer @ActID,'information theft','',216
exec InsertQuestionAnswer @ActID,'theft','theft',227
--exec InsertQuestionAnswer @ActID,'license agreement','',215
exec InsertQuestionAnswer @ActID,'license','license',215
exec InsertQuestionAnswer @ActID,'malware','malware',205
--exec InsertQuestionAnswer @ActID,'online security service','',208
exec InsertQuestionAnswer @ActID,'password','password',211
--exec InsertQuestionAnswer @ActID,'personal firewall','',209
exec InsertQuestionAnswer @ActID,'firewall','firewall',209
exec InsertQuestionAnswer @ActID,'phishing','phishing',231
exec InsertQuestionAnswer @ActID,'PIN','PIN',213
exec InsertQuestionAnswer @ActID,'piracy','piracy',215
--exec InsertQuestionAnswer @ActID,'product activation','',215
exec InsertQuestionAnswer @ActID,'activation','activation',215
exec InsertQuestionAnswer @ActID,'restore','restore',219
--exec InsertQuestionAnswer @ActID,'script kiddie','',204
exec InsertQuestionAnswer @ActID,'script','script',204
--exec InsertQuestionAnswer @ActID,'secure site','',218
--exec InsertQuestionAnswer @ActID,'social engineering','',232
--exec InsertQuestionAnswer @ActID,'software piracy','',215
--exec InsertQuestionAnswer @ActID,'software theft','',215
exec InsertQuestionAnswer @ActID,'spoofing','spoofing',207
exec InsertQuestionAnswer @ActID,'spyware','spyware',231
exec InsertQuestionAnswer @ActID,'user name','username',211
--exec InsertQuestionAnswer @ActID,'web filtering software','',234
exec InsertQuestionAnswer @ActID,'web filtering','webfiltering',234
exec InsertQuestionAnswer @ActID,'zombie','zombie',206
UPDATE Question 
SET Points=5
WHERE Question_ActID=@ActID
UPDATE Answer
SET Answer.AnswerName = UPPER(Answer.AnswerName)
FROM Answer
JOIN AnswerView
ON Answer.AnswerID = AnswerView.AnswerID
WHERE ActID = @ActID

--
-- Attendance
--
DECLARE @Att_ActID Int
DECLARE @AttendanceCatSort Int = (
	SELECT CatSort 
	FROM CatView 
	WHERE CatName='Attendance'
)
DECLARE @AttendanceActSort Int = @AttendanceCatSort + @Chapter*100 + @Assignment

exec PostAttendance @ActID,@QuestionID,@AttendanceActSort,@ActName,@Att_ActID OUTPUT
--
-- Assignments
--
DECLARE @AssignmentStart smalldatetime
DECLARE @AssignmentStop  smalldatetime

SET @AssignmentStart = '12/1/2014'
SET @AssignmentStop = '12/7/2014 23:59'
exec AddAssignments @ActID,@CatSort,@AssignmentStart,@AssignmentStop
exec AddAssignments @Att_ActID,@AttendanceCatSort,@AssignmentStart,@AssignmentStop
GO
*/



/*
exec InsertQuestionAnswer @ActID,'acceptable use policy','',AUP','',210
exec InsertQuestionAnswer @ActID,'access control','',211
exec InsertQuestionAnswer @ActID,'adware','',205
exec InsertQuestionAnswer @ActID,'asymmetric key encryption','',217
exec InsertQuestionAnswer @ActID,'audit trail','',211
exec InsertQuestionAnswer @ActID,'biometric payment','',214
exec InsertQuestionAnswer @ActID,'bot','',206
exec InsertQuestionAnswer @ActID,'browsing history','',230
exec InsertQuestionAnswer @ActID,'Business Software Alliance','',BSA','',215
exec InsertQuestionAnswer @ActID,'Caesar cipher','',217
exec InsertQuestionAnswer @ActID,'CAPTCHA','',212
exec InsertQuestionAnswer @ActID,'CERT/CC','',208
exec InsertQuestionAnswer @ActID,'certificate authority','',218
exec InsertQuestionAnswer @ActID,'child','',219
exec InsertQuestionAnswer @ActID,'ciphertext','',216
exec InsertQuestionAnswer @ActID,'clickjacking','',231
exec InsertQuestionAnswer @ActID,'Computer Emergency Response Team Coordination Center','',208
exec InsertQuestionAnswer @ActID,'continuous data protection','',CDP','',220
exec InsertQuestionAnswer @ActID,'copyright','',225
exec InsertQuestionAnswer @ActID,'crimeware','',202
exec InsertQuestionAnswer @ActID,'cyberforensics','',214
exec InsertQuestionAnswer @ActID,'cyberwarfare','',204
exec InsertQuestionAnswer @ActID,'cypher','',216
exec InsertQuestionAnswer @ActID,'differential backup','',220
exec InsertQuestionAnswer @ActID,'digital rights management','',225
exec InsertQuestionAnswer @ActID,'distributed DoS attack','',DDoS attack','',207
exec InsertQuestionAnswer @ActID,'email spoofing','',207
exec InsertQuestionAnswer @ActID,'encryption algorithm','',216
exec InsertQuestionAnswer @ActID,'encryption key','',216
exec InsertQuestionAnswer @ActID,'end-user license agreement','',EULA','',215
exec InsertQuestionAnswer @ActID,'ENERGY STAR program','',226
exec InsertQuestionAnswer @ActID,'face recognition system','',213
exec InsertQuestionAnswer @ActID,'full backup','',220
exec InsertQuestionAnswer @ActID,'grandparent','',219
exec InsertQuestionAnswer @ActID,'hand geometry system','',213
exec InsertQuestionAnswer @ActID,'incremental backup','',220
exec InsertQuestionAnswer @ActID,'intellectual property','',IP','',225
exec InsertQuestionAnswer @ActID,'intellectual property rights','',225
exec InsertQuestionAnswer @ActID,'IP spoofing','',207
exec InsertQuestionAnswer @ActID,'iris recognition system','',214
exec InsertQuestionAnswer @ActID,'keygen','',215
exec InsertQuestionAnswer @ActID,'location sharing','',230
exec InsertQuestionAnswer @ActID,'MAC address','',222
exec InsertQuestionAnswer @ActID,'MAC address control','',222
exec InsertQuestionAnswer @ActID,'macros','',208
exec InsertQuestionAnswer @ActID,'madware','',231
exec InsertQuestionAnswer @ActID,'malicious software','',205
exec InsertQuestionAnswer @ActID,'network license','',216
exec InsertQuestionAnswer @ActID,'off-site','',219
exec InsertQuestionAnswer @ActID,'parent','',219
exec InsertQuestionAnswer @ActID,'passphrase','',212
exec InsertQuestionAnswer @ActID,'payload','',205
exec InsertQuestionAnswer @ActID,'personal identification number','',213
exec InsertQuestionAnswer @ActID,'phishing filter','',231
exec InsertQuestionAnswer @ActID,'plaintext','',216
exec InsertQuestionAnswer @ActID,'power usage effectiveness','',227
exec InsertQuestionAnswer @ActID,'private browsing','',230
exec InsertQuestionAnswer @ActID,'private key encryption','',217
exec InsertQuestionAnswer @ActID,'proxy server','',209
exec InsertQuestionAnswer @ActID,'public key encryption','',217
exec InsertQuestionAnswer @ActID,'rootkit','',205
exec InsertQuestionAnswer @ActID,'selective backup','',220
exec InsertQuestionAnswer @ActID,'session cookie','',229
exec InsertQuestionAnswer @ActID,'signature verification system','',214
exec InsertQuestionAnswer @ActID,'single-user license agreement','',215
exec InsertQuestionAnswer @ActID,'site license','',216
exec InsertQuestionAnswer @ActID,'spyware','',205
exec InsertQuestionAnswer @ActID,'SSID','',222
exec InsertQuestionAnswer @ActID,'symmetric key encryption','',217
exec InsertQuestionAnswer @ActID,'toll fraud','',223
exec InsertQuestionAnswer @ActID,'Trojan horse','',205
exec InsertQuestionAnswer @ActID,'unauthorized access','',210
exec InsertQuestionAnswer @ActID,'unauthorized use','',210
exec InsertQuestionAnswer @ActID,'user ID','',211
exec InsertQuestionAnswer @ActID,'virtual private network','',VPN','',218
exec InsertQuestionAnswer @ActID,'virus','',205
exec InsertQuestionAnswer @ActID,'voice verification system','',213
exec InsertQuestionAnswer @ActID,'worm','',205
exec InsertQuestionAnswer @ActID,'zombie army','',206
*/
select *
from assignment
where Assignment_ActID=@ActID
