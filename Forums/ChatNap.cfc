component {

remote function WhereChatDateTimeGT(ChatDateTime) returnformat='json' {
	local.wakeTime = DateAdd('s',25,now()) // To keep from timing out, we'll post a fresh ajax request every 30 seconds.
	do {
		if (!IsDefined('Application.Chat.DateTime')) return 0
		if (Application.Chat.DateTime > arguments.ChatDateTime) {
			break;
		}
		thread action='sleep' duration=1000;
	} while(now() < local.wakeTime)
	thread action='sleep' duration=Rand()*1000; // Everybody doesn't wake up all at once
	return Application.Chat.DateTime // This can be either a GuessDateTime or a VoteDateTime
}
}
