ATTRIBUTE.name = "Agility"
ATTRIBUTE.description = "The ability to run and move faster."

function ATTRIBUTE:OnSetup(client, value)
	client:SetRunSpeed(ix.config.Get("runSpeed") + (value * ix.config.Get("agilityMultiplier")))
end
