do
	local CLASS = {}
	CLASS.color = Color(255, 255, 175)
	CLASS.format = "%s talks in %s \"%s\""

	function CLASS:GetColor(speaker, text)
		if (LocalPlayer():GetEyeTrace().Entity == speaker) then
			return Color(175, 255, 175)
		end

		return self.color
	end

	function CLASS:CanHear(speaker, listener, info)
	
		local chatRange = ix.config.Get("chatRange", 280)
		local distance = (speaker:GetPos() - listener:GetPos()):LengthSqr()
		
		if (distance <= chatRange*chatRange) then
		
			local flag = listener:GetCharacter():HasFlags(info.lang)
			
			if (!flag) then
				ix.chat.Send(speaker, "noLanguage", "F", false, {listener})
				return false
			end
			
			return true
			
		end
		return false
	end

	function CLASS:OnChatAdd(speaker, text, anonymous, info)
		local lang = ix.flag.list[info.lang].description
		local text = speaker:IsCombine() and string.format("<:: %s ::>", text) or text
		chat.AddText(self.color, string.format(self.format, speaker:Name(), lang, text))
	end

	ix.chat.Register("language", CLASS)
end

do
	local CLASS = {}
	CLASS.color = Color(4, 166, 241)
	CLASS.format = "%s speaks in a language you don't understand."

	function CLASS:GetColor(speaker, text)
		if (LocalPlayer():GetEyeTrace().Entity == speaker) then
			return Color(4, 237, 241)
		end

		return self.color
	end

	function CLASS:CanHear(speaker, listener)
		local chatRange = ix.config.Get("chatRange", 280)

		return (speaker:GetPos() - listener:GetPos()):LengthSqr() <= (chatRange * chatRange)
	end

	function CLASS:OnChatAdd(speaker)
		chat.AddText(self.color, string.format(self.format, speaker:Name()))
	end

	ix.chat.Register("noLanguage", CLASS)
end

