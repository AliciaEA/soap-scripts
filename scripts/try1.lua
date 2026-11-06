local carpeta = Instance.new("Folder")
carpeta.Name = "Carpetita"
carpeta.Parent = workspace

local bloque = Instance.new("Part")
bloque.Position = Vector3.new(0,15,15)
bloque.Size = Vector3.new(10, 1, 10)   
bloque.Material = Enum.Material.Plastic
bloque.BrickColor = BrickColor.new("Bright red")
bloque.Anchored = true
bloque.Parent = carpeta