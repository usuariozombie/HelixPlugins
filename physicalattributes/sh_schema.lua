ix.chat.Register("rollstat", {
	format = "** %s rolls a D %s dice and the result is %s of 20.",
	color = Color(155, 111, 176),
	CanHear = ix.config.Get("chatRange", 280),
	deadCanChat = true,
	OnChatAdd = function(self, speaker, text, bAnonymous, data)
		chat.AddText(self.color, string.format(self.format,
			speaker:GetName(), data.attribute, text, data.max or 100
		))
		end
	})
	
ix.chat.Register("roll", {
	format = "** %s rolls a dice and the result is %s of 20.",
	color = Color(155, 111, 176),
	CanHear = ix.config.Get("chatRange", 280),
	deadCanChat = true,
	OnChatAdd = function(self, speaker, text, bAnonymous, data)
		chat.AddText(self.color, string.format(self.format,
			speaker:GetName(), text, data.max or 20
		))
		end
	})