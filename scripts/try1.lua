local carpeta = Instance.new("Folder")
carpeta.Name = "Carpetita"
carpeta.Parent = workspace

local bloque = Instance.new("Part")
bloque.Position = Vector3.new(5,2,35)
bloque.Size = Vector3.new(5, 5, 10)   
bloque.Material = Enum.Material.Plastic
bloque.BrickColor = BrickColor.new("Bright blue")
bloque.Anchored = true
bloque.Parent = carpeta