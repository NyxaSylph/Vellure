-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [[ Script name: _Trove, time of decompilation: Mon Aug 11 01:21:06 2025 ]]
local v0 = newproxy();
local v1 = newproxy();
local v2 = {
    "Destroy", 
    "Disconnect", 
    "destroy", 
    "disconnect"
};
local l_RunService_0 = game:GetService("RunService");
local function v9(v4, v5) --[[ Line: 10 ]] --[[ Name: GetObjectCleanupFunction ]]
    -- upvalues: v0 (copy), v1 (copy), v2 (copy)
    local v6 = typeof(v4);
    if v6 == "function" then
        return v0;
    elseif v6 == "thread" then
        return v1;
    elseif v5 then
        return v5;
    elseif v6 == "Instance" then
        return "Destroy";
    elseif v6 == "RBXScriptConnection" then
        return "Disconnect";
    else
        if v6 == "table" then
            for _, v8 in v2 do
                if typeof(v4[v8]) == "function" then
                    return v8;
                end;
            end;
        end;
        error("Failed to get cleanup function for object " .. v6 .. ": " .. tostring(v4), 3);
        return;
    end;
end;
local function _(v10) --[[ Line: 34 ]] --[[ Name: AssertPromiseLike ]]
    if typeof(v10) ~= "table" or typeof(v10.getStatus) ~= "function" or typeof(v10.finally) ~= "function" or typeof(v10.cancel) ~= "function" then
        error("Did not receive a Promise as an argument", 3);
    end;
end;
local function _(v12) --[[ Line: 45 ]] --[[ Name: AssertFutureLike ]]
    if typeof(v12) ~= "table" or typeof(v12.Await) ~= "function" or typeof(v12.After) ~= "function" or typeof(v12.Cancel) ~= "function" then
        error("Did not receive a Future as an argument", 3);
    end;
end;
local v14 = {};
v14.__index = v14;
v14.new = function() --[[ Line: 73 ]] --[[ Name: new ]]
    -- upvalues: v14 (copy)
    local v15 = setmetatable({}, v14);
    v15._objects = {};
    v15._cleaning = false;
    return v15;
end;
v14.Extend = function(v16) --[[ Line: 99 ]] --[[ Name: Extend ]]
    -- upvalues: v14 (copy)
    if v16._cleaning then
        error("Cannot call trove:Extend() while cleaning", 2);
    end;
    return v16:Construct(v14);
end;
v14.Clone = function(v17, v18) --[[ Line: 110 ]] --[[ Name: Clone ]]
    if v17._cleaning then
        error("Cannot call trove:Clone() while cleaning", 2);
    end;
    return v17:Add(v18:Clone());
end;
v14.Construct = function(v19, v20, ...) --[[ Line: 150 ]] --[[ Name: Construct ]]
    if v19._cleaning then
        error("Cannot call trove:Construct() while cleaning", 2);
    end;
    local v21 = nil;
    local v22 = typeof(v20);
    if v22 == "table" then
        v21 = v20.new(...);
    elseif v22 == "function" then
        v21 = v20(...);
    end;
    return v19:Add(v21);
end;
v14.Connect = function(v23, v24, v25) --[[ Line: 179 ]] --[[ Name: Connect ]]
    if v23._cleaning then
        error("Cannot call trove:Connect() while cleaning", 2);
    end;
    return v23:Add(v24:Connect(v25));
end;
v14.Once = function(v26, v27, v28) --[[ Line: 193 ]] --[[ Name: Once ]]
    if v26._cleaning then
        error("Cannot call trove:Once() while cleaning", 2);
    end;
    local v29 = nil;
    v29 = v27:Connect(function(...) --[[ Line: 198 ]]
        -- upvalues: v28 (copy), v29 (ref), v26 (copy)
        v28(...);
        v29:Disconnect();
        v26:_findAndRemoveFromObjects(v29, false);
    end);
    return v26:Add(v29);
end;
v14.BindToRenderStep = function(v30, v31, v32, v33) --[[ Line: 219 ]] --[[ Name: BindToRenderStep ]]
    -- upvalues: l_RunService_0 (copy)
    if v30._cleaning then
        error("Cannot call trove:BindToRenderStep() while cleaning", 2);
    end;
    l_RunService_0:BindToRenderStep(v31, v32, v33);
    v30:Add(function() --[[ Line: 224 ]]
        -- upvalues: l_RunService_0 (ref), v31 (copy)
        l_RunService_0:UnbindFromRenderStep(v31);
    end);
end;
v14.AddPromise = function(v34, v35) --[[ Line: 252 ]] --[[ Name: AddPromise ]]
    if v34._cleaning then
        error("Cannot call trove:AddPromise() while cleaning", 2);
    end;
    if typeof(v35) ~= "table" or typeof(v35.getStatus) ~= "function" or typeof(v35.finally) ~= "function" or typeof(v35.cancel) ~= "function" then
        error("Did not receive a Promise as an argument", 3);
    end;
    if v35:getStatus() == "Started" then
        v35:finally(function() --[[ Line: 258 ]]
            -- upvalues: v34 (copy), v35 (copy)
            if v34._cleaning then
                return;
            else
                v34:_findAndRemoveFromObjects(v35, false);
                return;
            end;
        end);
        v34:Add(v35, "cancel");
    end;
    return v35;
end;
v14.AddFuture = function(v36, v37) --[[ Line: 292 ]] --[[ Name: AddFuture ]]
    if v36._cleaning then
        error("Cannot call trove:AddFuture() while cleaning", 2);
    end;
    if typeof(v37) ~= "table" or typeof(v37.Await) ~= "function" or typeof(v37.After) ~= "function" or typeof(v37.Cancel) ~= "function" then
        error("Did not receive a Future as an argument", 3);
    end;
    if v37:IsPending() then
        v37:After(function() --[[ Line: 298 ]]
            -- upvalues: v36 (copy), v37 (copy)
            if v36._cleaning then
                return;
            else
                v36:_findAndRemoveFromObjects(v37, false);
                return;
            end;
        end);
        v36:Add(v37, "Cancel");
    end;
    return v37;
end;
v14.Add = function(v38, v39, v40) --[[ Line: 357 ]] --[[ Name: Add ]]
    -- upvalues: v9 (copy)
    if v38._cleaning then
        error("Cannot call trove:Add() while cleaning", 2);
    end;
    local v41 = v9(v39, v40);
    table.insert(v38._objects, {
        v39, 
        v41
    });
    return v39;
end;
v14.Remove = function(v42, v43) --[[ Line: 377 ]] --[[ Name: Remove ]]
    if v42._cleaning then
        error("Cannot call trove:Remove() while cleaning", 2);
    end;
    return v42:_findAndRemoveFromObjects(v43, true);
end;
v14.Clean = function(v44) --[[ Line: 390 ]] --[[ Name: Clean ]]
    if v44._cleaning then
        return;
    else
        v44._cleaning = true;
        for _, v46 in v44._objects do
            v44:_cleanupObject(v46[1], v46[2]);
        end;
        table.clear(v44._objects);
        v44._cleaning = false;
        return;
    end;
end;
v14._findAndRemoveFromObjects = function(v47, v48, v49) --[[ Line: 402 ]] --[[ Name: _findAndRemoveFromObjects ]]
    local l__objects_0 = v47._objects;
    for v51, v52 in ipairs(l__objects_0) do
        if v52[1] == v48 then
            local v53 = #l__objects_0;
            l__objects_0[v51] = l__objects_0[v53];
            l__objects_0[v53] = nil;
            if v49 then
                v47:_cleanupObject(v52[1], v52[2]);
            end;
            return true;
        end;
    end;
    return false;
end;
v14._cleanupObject = function(_, v55, v56) --[[ Line: 418 ]] --[[ Name: _cleanupObject ]]
    -- upvalues: v0 (copy), v1 (copy)
    if v56 == v0 then
        v55();
        return;
    elseif v56 == v1 then
        pcall(task.cancel, v55);
        return;
    else
        v55[v56](v55);
        return;
    end;
end;
v14.AttachToInstance = function(v57, v58) --[[ Line: 441 ]] --[[ Name: AttachToInstance ]]
    if v57._cleaning then
        error("Cannot call trove:AttachToInstance() while cleaning", 2);
    elseif not v58:IsDescendantOf(game) then
        error("Instance is not a descendant of the game hierarchy", 2);
    end;
    return v57:Connect(v58.Destroying, function() --[[ Line: 447 ]]
        -- upvalues: v57 (copy)
        v57:Destroy();
    end);
end;
v14.IsCleaning = function(v59) --[[ Line: 453 ]] --[[ Name: IsCleaning ]]
    return v59._cleaning;
end;
v14.Destroy = function(v60) --[[ Line: 460 ]] --[[ Name: Destroy ]]
    v60:Clean();
end;
return v14;
