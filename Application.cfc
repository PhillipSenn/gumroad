component {
this.Name = 'gumroad2'
this.dataSource = 'gumroad'
this.SessionManagement = true
this.ScriptProtect = 'all'
this.currentTemplatePath = GetCurrentTemplatePath()
this.directoryFromPath   = GetDirectoryFromPath(this.currentTemplatePath)
this.mappings['/Inc'] = this.directoryFromPath & 'Inc' /* Without a trailing slash */
this.mappings['/com'] = this.directoryFromPath & 'com'

function onApplicationStart() {
	StructDelete(Application,'Chat')
}

function onSessionStart() {
	session.fw.msg = ''
	session.fw.mod = 'label-info'
	session.fw.dataSource = this.dataSource
}

function onRequestStart(LogCFCName) {
	var Usr = {}

	// StructAppend(form,url,false) Uh oh Phil, better be careful if you think url = form
	if (IsDefined('url.onApplicationStart')) {
		onApplicationStart()
		onSessionStart()
	}
	if (IsDefined('url.onSessionStart')) {
		onSessionStart()
	}
	request.fw = Duplicate(session.fw)
	request.fw.name='gumroad'
	request.fw.home = '/gumroad' /* without a trailing slash */
	request.fw.css = true
	if (IsDefined('url.css')) {
		request.fw.css = url.css
	}
	request.fw.js = true
	if (IsDefined('url.js')) {
		request.fw.js = url.js
	}
	request.fw.jQueryUI = 'ui-lightness'
	request.fw.jQueryUI = ''
	request.fw.bootstrap = true
	request.fw.try = false
	if (IsDefined('url.try')) {
		request.fw.try = url.try
	}
	request.fw.navbar = 'navbar-fixed-top' /* none | navbar-fixed-top | navbar-fixed-bottom | navbar-static-top | '' */
	request.fw.container = true
	request.fw.cgiName = Left(cgi.SCRIPT_NAME,Len(cgi.SCRIPT_NAME)-4)
	request.fw.cssName = request.fw.cgiName & '.css'
	request.fw.jsName  = request.fw.cgiName & '.js'
	if (IsDefined('url.logout')) {
		StructDelete(session,'Usr')
	}
	if (IsDefined('url.ID')) {
		Usr = new Index().Login(url.ID)
		if (Usr.recordCount) {
			session.Usr = Duplicate(Usr)
		}
	}
	setting showDebugOutput=false;
	if (IsDefined('session.Usr')) {
		if (session.Usr.isAdmin) {
		} else if (FindNoCase('/Admin/',getPageContext().getRequest().getServletPath())) {
			location(request.fw.home & '/Nedry/Nedry.cfm',false)
		}
		request.StudentPath = request.fw.home & '/Students/' 
			& session.Usr.CourseName
			& '.' & session.Usr.CourseSort
			& '/' & Replace(session.Usr.PersonName,' ','','all')
	} else {
		request.StudentPath = request.fw.home
		request.fw.msg = 'You have been logged out.'
		request.fw.mod = 'label-danger'
		include '/Inc/Login.cfm'
		return false
	}
}

function onRequestEnd(LogCFCName) {
	session.fw.msg = ''
	session.fw.mod = 'label-info' /* 'none', or the Bootstrap modifiers */
}
}
