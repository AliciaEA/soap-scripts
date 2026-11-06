En ServerScriptService, crea un Script llamado CoinService con el siguiente código:

```lua
-- Inicializando servicios y variables
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")

local coinsFolder = Workspace.World.Coins
local coins = coinsFolder:GetChildren()

local COOLDOWN = 10

-- Definiendo el manejador de eventos
local function onCoinTouched(otherPart, coin)
	if coin:GetAttribute("Enabled") then
		local character = otherPart.Parent
		local player = Players:GetPlayerFromCharacter(character)
		if player then
			-- El jugador tocó una moneda
			coin.Transparency = 1
			coin:SetAttribute("Enabled", false)
			print("El jugador recogió la moneda")
			task.wait(COOLDOWN)
			coin.Transparency = 0
			coin:SetAttribute("Enabled", true)
		end
	end
end

-- Configurando oyentes de eventos
for _, coin in coins do
	coin:SetAttribute("Enabled", true)
	coin.Touched:Connect(function(otherPart)
		onCoinTouched(otherPart, coin)
	end)
end
```