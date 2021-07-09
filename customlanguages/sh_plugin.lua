local PLUGIN = PLUGIN
PLUGIN.name = "Custom Languages"
PLUGIN.author = "Usuariozombie"
PLUGIN.description = "A simple way to add custom languages by editing this file."

function AddLanguage(langName, langFlag)
	ix.flag.Add(
		langFlag,
		langName,
		function(client, bGiven)
		end
	)

	ix.command.Add(
		langName:sub(1, 4),
		{
			arguments = {
				ix.type.text
			},
			description = "Speaks " .. langName,
			OnRun = function(self, client, text)
				local character = client:GetCharacter()

				if (character:HasFlags(langFlag)) then
					ix.chat.Send(client, "language", text, false, nil, {["lang"] = langFlag})
				else
					client:Notify("You can't recognise that language.")
				end
			end
		}
	)
end

AddLanguage("Chinese", "C")
AddLanguage("Spanish", "S")
AddLanguage("French", "F")
AddLanguage("Arabic", "A")
AddLanguage("Russian", "R")
AddLanguage("Portuguese", "P")

ix.util.Include("sh_schema.lua")
