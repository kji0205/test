<%

	dim a 
	dim b 

	a = 1
	b = eval(a)


	response.write "<br>a :: " & a
	response.write "<br>b :: " & b


	Function fnMobileCheck()

		fnMobileCheck = False
		Dim user_agent, mobile_browser, Regex, match, mobile_agents, mobile_ua, i, size
		user_agent = Request.ServerVariables("HTTP_USER_AGENT")
		mobile_browser = 0
		Set Regex = New RegExp
		With Regex
			.Pattern = "(up.browser|up.link|mmp|symbian|smartphone|midp|wap|phone|windows ce|pda|mobile|mini|palm)"
			.IgnoreCase = True
			.Global = True
		End With
		match = Regex.Test(user_agent)

		If match Then mobile_browser = mobile_browser+1
		If InStr(Request.ServerVariables("HTTP_ACCEPT"), "application/vnd.wap.xhtml+xml") Or Not IsEmpty(Request.ServerVariables("HTTP_X_PROFILE")) Or Not IsEmpty(Request.ServerVariables("HTTP_PROFILE")) Then
			mobile_browser = mobile_browser+1
		end If
		' // Now you're going through the list of devices,
		' // this is an array so as time moves on, just add
		' // more that come to the marketplace into here
		mobile_agents = Array("alcatel", "amoi", "android", "avantgo", "blackberry", "benq", "cell", "cricket", "docomo", "elaine", "htc", "iemobile", "iphone", "ipad", "ipaq", "ipod", "j2me", "java", "midp", "mini", "mmp", "mobi", "motorola", "nec-", "nokia", "palm", "panasonic", "philips", "phone", "sagem", "sharp", "sie-", "smartphone", "sony", "symbian", "t-mobile", "telus", "up\.browser", "up\.link", "vodafone", "wap", "webos", "wireless", "xda", "xoom", "zte")
		size = Ubound(mobile_agents)
		mobile_ua = LCase(Left(user_agent, 4))


		For i = 0 To size
			If mobile_agents(i) = mobile_ua Then
				mobile_browser = mobile_browser+1
				Exit For
			End If
		Next
		

		If mobile_browser>0 then
			fnMobileCheck = true
		Else
			fnMobileCheck = False
		End If

	End Function
%>