local PLUGIN = PLUGIN

PLUGIN.name = "HUD modifier"
PLUGIN.desc = "You can change the HUD in game with a slider."
PLUGIN.author = "Usuariozombie"

--The BAR_HEIGHT number changes bar size, if it is high then bars will be bigger

if CLIENT then

    ix.option.Add("HudScale", ix.type.number, 7, {
        category = "HUD Bar Size",
        min = 7,
        max = 14,
        OnChanged = function (oldValue, newValue)
            BAR_HEIGHT = newValue
            for _, bar in pairs(ix.gui.bars:GetAll()) do
                bar:SetSize(ix.gui.bars:GetWide(), newValue) --newValue == BAR_HEIGHT
            end
        end
    })

    BAR_HEIGHT = ix.option.Get("HudScale", 7)

end