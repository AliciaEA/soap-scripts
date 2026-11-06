local carpeta = Instance.new("Folder")
carpeta.Name = "Carpetita"
carpeta.Parent = workspace

local bloque = Instance.new("Part")
bloque.Position = Vector3.new(5,40,15)
bloque.Size = Vector3.new(5, 2, 10)   
bloque.Material = Enum.Material.Plastic
bloque.BrickColor = BrickColor.new("Bright green")
bloque.Anchored = true
bloque.Parent = carpeta