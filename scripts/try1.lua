local carpeta = Instance.new("Folder")
carpeta.Name = "Carpetita"
carpeta.Parent = workspace

local bloque = Instance.new("Part")
bloque.Position = Vector3.new(20, 0, 0)
bloque.Size = Vector3.new(28, 2, 28)
bloque.Material = Enum.Material.Plastic
bloque.BrickColor = BrickColor.new("Bright yellow")
bloque.Anchored = true
bloque.Parent = carpeta

