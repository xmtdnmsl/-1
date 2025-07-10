local Players = game:GetService("Players")

-- 白名单用户名列表
local Whitelist = {
    "dfjbrjgduhv", -- 替换为实际的用户名
    "222",
    "333"
}

-- 获取执行脚本的玩家
local LocalPlayer = Players.LocalPlayer

-- 检查玩家用户名是否在白名单中
local function checkWhitelist(player)
    for _, username in ipairs(Whitelist) do
        if player.Name == username then
            return true
        end
    end
    return false
end

-- 主逻辑
if LocalPlayer then
    if checkWhitelist(LocalPlayer) then
        print("通过：玩家 " .. LocalPlayer.Name .. " 在白名单中")------通过白名单，执行的代码
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xmtdnmsl/-1/refs/heads/main/dididj.lua"))()
    else
        -- 踢出玩家并显示原因
        LocalPlayer:Kick("不在白名单内")------未通过白名单，执行的代码
    end
else
    warn("无法获取玩家信息")
end