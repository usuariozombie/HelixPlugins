ATTRIBUTE.name = "Constitution"
ATTRIBUTE.description = "The ability to handle phisical damage."

function ATTRIBUTE:OnSetup(client, value)
	client:SetMaxHealth(ix.config.Get("defaultMaxHealth") + (value * ix.config.Get("constitutionMultiplier")))
end