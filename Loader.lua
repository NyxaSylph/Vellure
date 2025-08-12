-- Made by @Flames9925 | Edited by @NyxaSylph
repeat task.wait() until game:IsLoaded() and game.Players.LocalPlayer and game.Players.LocalPlayer.Character

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

for i,v in getconnections(Players.LocalPlayer.Idled) do
    v:Disable()
end

local Loader = {}

Loader.Repository = "https://raw.githubusercontent.com/NyxaSylph/Vellure/refs/heads/main/"
Loader.Files = {
    ["A Universal Time"] = {
        File = "AUT/Main.lua",
        CreatorId = 6556072
    },
    ["Vox Seas"] = {
        File = "VS/Main.lua", 
        CreatorId = 35566755
    }
}

function Loader:LoadByCreatorId(creatorId)
    for GameName, Data in pairs(self.Files) do
        if Data.CreatorId == creatorId then
            local url = self.Repository .. Data.File
            local success, result = pcall(function()
                return loadstring(game:HttpGet(url))()
            end)
            
            if success then
                print("✅ Loaded:", GameName)
            else
                warn("❌ Everything went south :", GameName, result)
            end
            return
        end
    end
    warn([[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣄⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀
⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀
⠀⠀⠀⢠⣿⣿⣿⣿⣿⡿⠛⠉⠉⠉⠉⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀
⠀⠀⠀⣾⣿⣿⣿⣿⣿⣷⣤⣀⠀⠀⣀⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀
⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀
⠀⠀⣿⣿⣿⠛⢿⣿⣿⡿⠟⠋⠉⠉⠙⠻⢿⣿⣿⡿⠛⣿⣿⣿⣿⣿⣿⡇
⠀⢸⣿⣿⣿⠀⠀⠈⠁⠀⢀⣴⣿⣿⣦⡀⠀⠈⠁⠀⠀⣿⣿⣿⣿⣿⣿⣿
⠀⣸⣿⣿⣿⣄⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⣠⣿⣿⣿⣿⣿⣿⣿
⠀⣿⣿⣿⣿⣿⣷⣤⣴⣿⣿⣿⣿⣿⣿⣿⣿⣦⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿
⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿

    UNSUPPORTED GAME - CLOWN DETECTED 🤡
    ]])
end

Loader:LoadByCreatorId(game.CreatorId)

return Loader
