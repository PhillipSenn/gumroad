<cfscript>
StudentPath = request.fw.home & '/Students/' 
	& Paper.CourseName
	& '.' & Paper.CourseSort
	& '/' & Replace(Paper.PersonName,' ','','all')
</cfscript>
