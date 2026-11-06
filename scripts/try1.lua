local carpeta = Instance.new("Folder")
carpeta.Name = "Carpetita"
carpeta.Parent = workspace

local bloque = Instance.new("Part")
bloque.Position = Vector3.new(5,2,35)
bloque.Size = Vector3.new(128, 1, 128)   
bloque.Material = Enum.Material.Plastic
bloque.BrickColor = BrickColor.new("Bright blue")
bloque.Anchored = true
bloque.Parent = carpeta

local Players = game:GetService("Players")
local InsertService = game:GetService("InsertService")

local NOMBRE = "Yaszu"
local ID_SOMBRERO = 18860971203

local jugador = Players:FindFirstChild(NOMBRE)
if not jugador or not jugador.Character then
	print("No encontré a " .. NOMBRE)
	return
end

local ok, modelo = pcall(function()
	return InsertService:LoadAsset(ID_SOMBRERO)
end)

if ok and modelo then
	local accesorio = modelo:FindFirstChildOfClass("Accessory")
	local humanoide = jugador.Character:FindFirstChildOfClass("Humanoid")
	if accesorio and humanoide then
		humanoide:AddAccessory(accesorio)
		print("¡Sombrero puesto!")
	else
		print("El modelo no trae un accesorio")
	end
else
	print("No se pudo cargar el sombrero: " .. tostring(modelo))
end