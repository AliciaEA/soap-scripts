local carpeta = Instance.new("Folder")
carpeta.Name = "Carpetita"
carpeta.Parent = workspace

local bloque = Instance.new("Part")
bloque.Position = Vector3.new(5, 2, 35)
bloque.Size = Vector3.new(128, 1, 128)
bloque.Material = Enum.Material.Plastic
bloque.BrickColor = BrickColor.new("Bright blue")
bloque.Anchored = true
bloque.Parent = carpeta

local Players = game:GetService("Players")
local NOMBRE = "yaszu"

-- Buscar al jugador sin importar mayúsculas
local jugador = nil
for _, p in ipairs(Players:GetPlayers()) do
	if string.lower(p.Name) == string.lower(NOMBRE) then
		jugador = p
	end
end

if not jugador or not jugador.Character or not jugador.Character:FindFirstChild("Head") then
	bloque.BrickColor = BrickColor.new("Really red")   -- 🔴 no encontró al jugador
	return
end

local cabeza = jugador.Character.Head
local piezas = {}

-- Crea una pieza anclada y guarda dónde va respecto a la cabeza
local function pieza(alto, ancho, subir, color)
	local p = Instance.new("Part")
	p.Shape = Enum.PartType.Cylinder
	p.Size = Vector3.new(alto, ancho, ancho)
	p.BrickColor = BrickColor.new(color)
	p.Material = Enum.Material.SmoothPlastic
	p.Anchored = true
	p.CanCollide = false
	p.Parent = carpeta

	local offset = CFrame.new(0, subir, 0) * CFrame.Angles(0, 0, math.rad(90))
	table.insert(piezas, { parte = p, offset = offset })
end

pieza(0.2, 3, 0.65, "Really black")      -- ala
pieza(0.25, 1.85, 0.9, "Royal purple")   -- cinta
for i = 0, 5 do
	pieza(0.45, 1.8 - i * 0.28, 1.0 + i * 0.4, "Really black")  -- cono
end

bloque.BrickColor = BrickColor.new("Bright yellow")   -- 🟡 sombrero creado

-- Mover el sombrero a la cabeza una y otra vez
while cabeza and cabeza.Parent do
	for _, info in ipairs(piezas) do
		info.parte.CFrame = cabeza.CFrame * info.offset
	end
	task.wait()
end