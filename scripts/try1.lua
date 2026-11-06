local carpeta = Instance.new("Folder")
carpeta.Name = "Carpetita"
carpeta.Parent = workspace




local Players = game:GetService("Players")
local InsertService = game:GetService("InsertService")

local NOMBRE = "yaszu"
local ID_SOMBRERO = 18860971203

-- Buscar al jugador sin importar mayúsculas
local jugador = nil
for _, p in ipairs(Players:GetPlayers()) do
	if string.lower(p.Name) == string.lower(NOMBRE) then
		jugador = p
	end
end

if not jugador or not jugador.Character then
	bloque.BrickColor = BrickColor.new("Really red")   -- 🔴 no encontró al jugador
	return
end

local personaje = jugador.Character
local humanoide = personaje:FindFirstChildOfClass("Humanoid")
local cabeza = personaje:FindFirstChild("Head")

-- Intento 1: sombrero del catálogo
local ok, modelo = pcall(function()
	return InsertService:LoadAsset(ID_SOMBRERO)
end)

if ok and modelo then
	local accesorio = modelo:FindFirstChildOfClass("Accessory")
	if accesorio and humanoide then
		humanoide:AddAccessory(accesorio)
		bloque.BrickColor = BrickColor.new("Lime green")   -- 🟢 sombrero del catálogo puesto
		return
	end
end

-- Intento 2: construir el sombrero con bloques
local sombrero = Instance.new("Model")
sombrero.Name = "WitchHat"

local function pieza(alto, ancho, subir, color)
	local p = Instance.new("Part")
	p.Shape = Enum.PartType.Cylinder
	p.Size = Vector3.new(alto, ancho, ancho)
	p.CFrame = cabeza.CFrame * CFrame.new(0, subir, 0) * CFrame.Angles(0, 0, math.rad(90))
	p.BrickColor = BrickColor.new(color)
	p.Material = Enum.Material.SmoothPlastic
	p.Anchored = false
	p.CanCollide = false
	p.Massless = true
	p.Parent = sombrero

	local pegar = Instance.new("WeldConstraint")
	pegar.Part0 = cabeza
	pegar.Part1 = p
	pegar.Parent = p
end

pieza(0.2, 3, 0.65, "Really black")      -- ala
pieza(0.25, 1.85, 0.9, "Royal purple")   -- cinta
for i = 0, 5 do
	pieza(0.45, 1.8 - i * 0.28, 1.0 + i * 0.4, "Really black")  -- cono
end

sombrero.Parent = personaje
bloque.BrickColor = BrickColor.new("Bright yellow")   -- 🟡 sombrero hecho con bloques