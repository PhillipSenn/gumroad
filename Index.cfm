<cfscript>
Assignment = new Index().Assignments()
request.fw.hidden = true
Chat = new Index().Chats()
Pictures = new Index().Pictures()
</cfscript>

<cfoutput>
<cfinclude template="/Inc/html.cfm">
<cfinclude template="/Inc/body.cfm">
<div class="panel panel-primary">
	<div class="panel-heading">
		<a class="panel-toggle" data-toggle="collapse" data-parent="##myPanel" href="##Completed">
			Completed
		</a>
	</div>
	<div id="Completed" class="panel-body collapse">
		<div class="panel-inner">
			<table>
				<thead>
					<tr>
						<th>&nbsp;</th>
						<th colspan="2" class="center">Start</th>
						<th>&nbsp;</th>
						<th colspan="2" class="center">Deadline</th>
						<th></th>
						<th></th>
					</tr>
					<tr>
						<th>Topic</th>
						<th>Day</th>
						<th class="date">Date</th>
						<th>Activity</th>
						<th>Stats</th>
						<th class="date">Date</th>
						<th>&##10003;</th>
					</tr>
				</thead>
				<tbody>
					<cfloop query="Assignment">
						<cfif PctComplete GE 100>
							<tr>
								<td>#CatName#</td>
								<td>#Left(DayofWeekAsString(DayOfWeek(AssignmentStart)),3)#</td>
								<td class="date" 
								data-date="#DateFormat(AssignmentStart,'yyyy-mm-dd')#T#TimeFormat(AssignmentStart,'HH:mm:ss.l')#"
								>#DateFormat(AssignmentStart,"mm/dd")#</td>
								<td>
									<a href="#ActLink#?ActSort=#ActSort#">#ActName#</a>
								</td>
								<td>
									<cfif FindNoCase('Word Search',ActName)
										OR FindNoCase('Crossword',ActName)
										OR FindNoCase('Matching',ActName)
										OR FindNoCase('Fill in the blank',ActName)
										OR FindNoCase('Programming',ActName)>
										<a href="Stats/Stats.cfm?ActSort=#ActSort#">Stats</a>
									</cfif>
								</td>
								<td class="date" 
								data-date="#DateFormat(AssignmentStop,'yyyy-mm-dd')#T#TimeFormat(AssignmentStop,'HH:mm:ss.l')#"
								>
								#DateFormat(AssignmentStop,"mm/dd")#
								</td>
								<!---
								<td class="time"
								data-date="#DateFormat(AssignmentStop,'yyyy-mm-dd')#T#TimeFormat(AssignmentStop,'HH:mm:ss.l')#"
								>
								#TimeFormat(AssignmentStop,'hh:mmtt')#
								</td>
								--->
								<td>
									<cfif FindNoCase("chat room",ActName)>
										#Chat.Earned#
									<cfelseif PctComplete GE 100>
										&##10004;
									<cfelseif Val(NumberComplete)>
										#NumberComplete#/#Questions#
									</cfif>
								</td>
							</tr>
						</cfif>
					</cfloop>
				</tbody>
			</table>
		</div>
	</div>
</div>
<div class="panel panel-default">
	<div class="panel-heading">
		<a class="panel-toggle" data-toggle="collapse" data-parent="##myPanel" href="##ToDo">
		ToDo
		</a>
	</div>
	<div id="ToDo" class="panel-body collapse in">
		<div class="panel-inner">
			<table>
				<thead>
					<tr>
						<th>&nbsp;</th>
						<th colspan="2" class="center">Start</th>
						<th>&nbsp;</th>
						<th colspan="2" class="center">Deadline</th>
					</tr>
					<tr>
						<th>Topic</th>
						<th>Day</th>
						<th class="date">Date</th>
						<th>Activity</th>
						<th class="date">Date</th>
						<th>&##10003;</th>
					</tr>
				</thead>
				<tbody>
					<cfloop query="Assignment">
						<cfif PctComplete LT 100 OR FindNoCase("chat",ActName)>
							<tr>
								<td>#CatName#</td>
								<td>#Left(DayofWeekAsString(DayOfWeek(AssignmentStart)),3)#</td>
								<td class="date" 
								data-date="#DateFormat(AssignmentStart,'yyyy-mm-dd')#T#TimeFormat(AssignmentStart,'HH:mm:ss.l')#"
								>#DateFormat(AssignmentStart,"mm/dd")#</td>
								<td>
									<cfif FindNoCase("chat",ActName)>
										<a href="Forums/ChatIntro.cfm?ActSort=#ActSort#">Chat room</a>
										<!---
										(<a href="Forums/Post.cfm?ActSort=#ActSort#">lite</a>)
										--->
										<!---
										<br><a href="TalkAbout/TalkAbout.cfm">Chat ideas</a>
										<br><a href="Forums/ChatStats.cfm">Chat stats</a>
										<br><a href="Forums/ChatCourse.cfm">Comparison of courses</a>
										--->
									<cfelse>
										<a href="#ActLink#?ActSort=#ActSort#">#ActName#</a>
									</cfif>
								</td>
								<td class="date" 
								data-date="#DateFormat(AssignmentStop,'yyyy-mm-dd')#T#TimeFormat(AssignmentStop,'HH:mm:ss.l')#"
								>
								#DateFormat(AssignmentStop,"mm/dd")#
								</td>
								<!---
								<td class="time"
								data-date="#DateFormat(AssignmentStop,'yyyy-mm-dd')#T#TimeFormat(AssignmentStop,'HH:mm:ss.l')#"
								>
								#TimeFormat(AssignmentStop,'hh:mmtt')#
								</td>
								--->
								<td>
									<cfif FindNoCase("chat room",ActName)>
										#Chat.Earned#
									<cfelseif PctComplete GE 100>
										&##10004;
									<cfelseif Val(NumberComplete)>
										#NumberComplete#/#Questions#
									</cfif>
								</td>
							</tr>
						</cfif>
					</cfloop>
					<!---
					<tr>
						<td>Research</td>
						<td>Mon</td>
						<td class="date">09/01</td>
						<td><a href="MC/Reset.cfm">Reset all 6 quizzes</a></td>
						<td class="date">10/14</td>
						<td colspan="2"></td>
					</tr>
					--->
				</tbody>
			</table>
		</div>
	</div>
</div>
<ul>Todo:
	<li><a href="Monopoly/PositionAbsolute.cfm">Roll the dice and move the player</a></li>
</ul>
<cfinclude template="/Inc/foot.cfm">
<cfinclude template="/Inc/End.cfm">
</cfoutput>