-- Made by @Flames9925 | Edited by @NyxaSylph
repeat task.wait() until game:IsLoaded() and game.Players.LocalPlayer and game.Players.LocalPlayer.Character

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

for _, Conn in getconnections(Players.LocalPlayer.Idled) do
    Conn:Disable()
end

local Loader = {}

Loader.Repository = "https://raw.githubusercontent.com/NyxaSylph/Vellure/main/"
Loader.Files = {
    ["A Universal Time"] = { File = "AUT/Main.lua", CreatorId = 6556072 },
    ["Vox Seas"]         = { File = "VS/Main.lua",  CreatorId = 35566755 },
}

function Loader:LoadByCreatorId(CreatorId)
    for GameName, Data in pairs(self.Files) do
        if Data.CreatorId == CreatorId then
            local Url = ("%s%s"):format(self.Repository, Data.File)
            local Ok, Err = pcall(function()
                return loadstring(game:HttpGet(Url))()
            end)
            if Ok then
                print("✅ Loaded:", GameName)
            else
                warn("❌ Everything went south:", GameName, Err)
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
