--[[ luXxS-hub v7.0 MAX | MM2 Ultimate | Every Feature ]]
local TweenService=game:GetService("TweenService")
local UIS=game:GetService("UserInputService")
local Players=game:GetService("Players")
local RunService=game:GetService("RunService")
local Lighting=game:GetService("Lighting")
local HttpService=game:GetService("HttpService")
local VU=game:GetService("VirtualUser")
local VIM=game:GetService("VirtualInputManager")
local SoundService=game:GetService("SoundService")
local StarterGui=game:GetService("StarterGui")
local TeleportService=game:GetService("TeleportService")
local ReplicatedStorage=game:GetService("ReplicatedStorage")
local ContextActionService=game:GetService("ContextActionService")
local LP=Players.LocalPlayer

local FOLDER="luxxs"
local TELEGRAM_LINK="https://t.me/NurHuboffical"
local hasFS=type(writefile)=="function" and type(readfile)=="function" and type(isfile)=="function"
local function ensureFolder() if type(makefolder)=="function" and type(isfolder)=="function" and not isfolder(FOLDER) then pcall(makefolder,FOLDER) end end

local ACCENTS={Lime=Color3.fromRGB(196,255,61),Coral=Color3.fromRGB(255,104,84),Ice=Color3.fromRGB(110,214,255),Violet=Color3.fromRGB(158,110,255),Gold=Color3.fromRGB(255,196,70),Rose=Color3.fromRGB(255,96,160),Mint=Color3.fromRGB(80,255,180),Sunset=Color3.fromRGB(255,140,60),Neon=Color3.fromRGB(0,255,255),Hot=Color3.fromRGB(255,0,150)}
local ACCENT_NAMES={"Lime","Coral","Ice","Violet","Gold","Rose","Mint","Sunset","Neon","Hot"}
local ACC_NAME="Lime"
if hasFS then pcall(function() local p=FOLDER.."/accent.txt"; if isfile(p) then local n=readfile(p); if ACCENTS[n] then ACC_NAME=n end end end) end
local ACC=ACCENTS[ACC_NAME]

local THEMES={
    Dark={bg=Color3.fromRGB(11,11,14),panel=Color3.fromRGB(16,16,20),row=Color3.fromRGB(24,24,30),line=Color3.fromRGB(40,40,48),off=Color3.fromRGB(58,58,68),text=Color3.fromRGB(232,232,226),dim=Color3.fromRGB(122,122,136)},
    Midnight={bg=Color3.fromRGB(8,10,22),panel=Color3.fromRGB(14,18,34),row=Color3.fromRGB(22,28,48),line=Color3.fromRGB(40,50,80),off=Color3.fromRGB(60,70,100),text=Color3.fromRGB(230,235,245),dim=Color3.fromRGB(120,140,180)},
    Blood={bg=Color3.fromRGB(14,6,6),panel=Color3.fromRGB(24,10,10),row=Color3.fromRGB(36,14,14),line=Color3.fromRGB(60,20,20),off=Color3.fromRGB(80,30,30),text=Color3.fromRGB(240,220,220),dim=Color3.fromRGB(160,110,110)},
    Snow={bg=Color3.fromRGB(240,242,248),panel=Color3.fromRGB(255,255,255),row=Color3.fromRGB(230,234,242),line=Color3.fromRGB(200,205,215),off=Color3.fromRGB(180,185,195),text=Color3.fromRGB(20,20,30),dim=Color3.fromRGB(100,105,120)},
    Cyber={bg=Color3.fromRGB(8,4,20),panel=Color3.fromRGB(14,8,32),row=Color3.fromRGB(22,12,46),line=Color3.fromRGB(60,20,120),off=Color3.fromRGB(80,40,140),text=Color3.fromRGB(240,220,255),dim=Color3.fromRGB(160,120,200)},
    Forest={bg=Color3.fromRGB(8,14,10),panel=Color3.fromRGB(12,22,16),row=Color3.fromRGB(20,34,24),line=Color3.fromRGB(40,70,50),off=Color3.fromRGB(60,90,70),text=Color3.fromRGB(230,240,232),dim=Color3.fromRGB(130,170,140)},
}
local THEME_NAMES={"Dark","Midnight","Blood","Snow","Cyber","Forest"}
local THEME_NAME="Dark"
if hasFS then pcall(function() local p=FOLDER.."/theme.txt"; if isfile(p) then local n=readfile(p); if THEMES[n] then THEME_NAME=n end end end) end
local C={} for k,v in pairs(THEMES[THEME_NAME]) do C[k]=v end

local WHITE=Color3.fromRGB(255,255,255)
local AIM_RED=Color3.fromRGB(255,64,64)
local BODY_GRAY=Color3.fromRGB(196,196,206)
local F_HEAD,F_BODY,F_MONO,F_SEC=Enum.Font.Michroma,Enum.Font.SourceSansSemibold,Enum.Font.RobotoMono,Enum.Font.Oswald

local themed={}
local function T(o,p,fn) themed[#themed+1]={o,p,fn}; o[p]=fn and fn(ACC) or ACC end
local function setAccent(c) ACC=c; for _,t in ipairs(themed) do pcall(function() t[1][t[2]]=t[3] and t[3](ACC) or ACC end) end end
local function setTheme(n) if THEMES[n] then THEME_NAME=n; for k,v in pairs(THEMES[n]) do C[k]=v end end end

local PALETTE={Lime=ACCENTS.Lime,Coral=ACCENTS.Coral,Ice=ACCENTS.Ice,Violet=ACCENTS.Violet,Gold=ACCENTS.Gold,Red=Color3.fromRGB(255,60,60),Green=Color3.fromRGB(70,230,110),Blue=Color3.fromRGB(70,110,255),Pink=Color3.fromRGB(255,110,200),White=Color3.fromRGB(255,255,255),Black=Color3.fromRGB(20,20,20),Orange=Color3.fromRGB(255,140,60),Cyan=Color3.fromRGB(0,220,255)}
local COLOR_NAMES={"Rainbow","Lime","Coral","Ice","Violet","Gold","Red","Green","Blue","Pink","White","Black","Orange","Cyan"}
local WING_COLORS={"White","Gold","Rainbow","Ice","Violet","Pink","Coral","Red","Blue","Cyan"}
local ROLE_COLORS={Murderer=Color3.fromRGB(255,60,60),Sheriff=Color3.fromRGB(70,130,255),Innocent=Color3.fromRGB(70,230,110)}
local HAT_COLORS={"Custom","Rainbow","Lime","Coral","Ice","Violet","Gold","Red","Green","Blue","Pink","White"}
local QB_POSITIONS={"Left","Right","Bottom","Top","Left-Top","Left-Bottom","Right-Top","Right-Bottom"}
local SCREEN_RATIOS={"Default","16:9","16:10","4:3","21:9","1:1","2:1","9:16"}
local ANIMATIONS={"Default","Zombie","Ninja","Elder","Pirate","Robot","Toy","Stylish","Cartoony","Levitate","Astronaut","Werewolf","Mage","Superhero"}
local CROSSHAIR_STYLES={"Off","Dot","Cross","Circle","X","Square","Custom"}
local CHAT_MESSAGES={"ez","noob","gg","haha","free coins","kill me","im sheriff","im murder","drop gun","let me win"}
local KILL_EFFECTS={"None","Lightning","Explosion","Fire","Ice","Rainbow","Blood"}

_G.LUXXS_HAT_H=280; _G.LUXXS_HAT_S=0.7; _G.LUXXS_HAT_V=1

local function getColor(n,t,o)
    if n=="Rainbow" then return Color3.fromHSV((((t or 0)*0.2)+(o or 0))%1,0.85,1) end
    if n=="Custom" then return Color3.fromHSV(((_G.LUXXS_HAT_H%360)/360),math.clamp(_G.LUXXS_HAT_S,0,1),math.clamp(_G.LUXXS_HAT_V,0,1)) end
    return PALETTE[n] or ACC
end

local connections={} local function track(c) connections[#connections+1]=c; return c end
local function tween(o,ti,p,s,d) local tw=TweenService:Create(o,TweenInfo.new(ti,s or Enum.EasingStyle.Quint,d or Enum.EasingDirection.Out),p); tw:Play(); return tw end
local function corner(o,r) local c=Instance.new("UICorner"); c.CornerRadius=UDim.new(0,r); c.Parent=o; return c end
local function stroke(o,col,th,tr) local s=Instance.new("UIStroke"); s.Color=col; s.Thickness=th or 1; s.Transparency=tr or 0; s.ApplyStrokeMode=Enum.ApplyStrokeMode.Border; s.Parent=o; return s end
local function gradient(f,rot,seq,tseq) local g=Instance.new("UIGradient"); g.Rotation=rot or 0; if seq then g.Color=seq end; if tseq then g.Transparency=tseq end; g.Parent=f; return g end

local GradRefresh={}
local Flags,Setters,Defaults={},{},{} local function register(k,d,s) Flags[k]=d; Defaults[k]=d; Setters[k]=s end

local gui=Instance.new("ScreenGui")
gui.Name="luxxs"; gui.ResetOnSpawn=false; gui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling; gui.IgnoreGuiInset=true
local okP,parent=pcall(function() return (gethui and gethui()) or game:GetService("CoreGui") end)
if not okP or not parent then parent=LP:WaitForChild("PlayerGui") end
for _,n in ipairs({"luxxs","luxxsKey","luxxsFPS","luxxsLogo","luxxsCrosshair","luxxsWatermark"}) do if parent:FindFirstChild(n) then parent[n]:Destroy() end end
gui.Parent=parent
for _,e in ipairs(Lighting:GetChildren()) do if e:IsA("BlurEffect") or e:IsA("DepthOfFieldEffect") then pcall(function() e.Enabled=false end) end end
print("[luXxS-hub] v7.0 MAX loading")

-- SPLASH
do
    local sg=Instance.new("ScreenGui"); sg.Name="luxxsKey"; sg.ResetOnSpawn=false; sg.IgnoreGuiInset=true; sg.DisplayOrder=999; sg.Parent=parent
    local root=Instance.new("CanvasGroup"); root.Size=UDim2.new(1,0,1,0); root.BackgroundColor3=WHITE; root.BorderSizePixel=0; root.Parent=sg
    gradient(root,90,ColorSequence.new(Color3.fromRGB(22,22,28),Color3.fromRGB(8,8,10)))
    local function hair(y) local f=Instance.new("Frame"); f.Position=UDim2.new(0,0,y,0); f.Size=UDim2.new(1,0,0,1); f.BorderSizePixel=0; f.BackgroundTransparency=0.85; f.Parent=root; T(f,"BackgroundColor3") end
    hair(0.1) hair(0.9)
    local function ctext(txt,ax,px) local l=Instance.new("TextLabel"); l.BackgroundTransparency=1; l.AnchorPoint=Vector2.new(ax,0); l.Position=UDim2.new(px,ax==0 and 18 or -18,0.1,8); l.Size=UDim2.new(0,260,0,16); l.Font=F_MONO; l.TextSize=11; l.TextColor3=C.dim; l.TextXAlignment=ax==0 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Right; l.Text=txt; l.Parent=root end
    ctext("LUXXS-HUB // LOADING",0,0) ctext("DRHUB v7.0 MAX",1,1)
    local word="luXxS"; local LW=62; local total=LW*#word
    local holder=Instance.new("Frame"); holder.AnchorPoint=Vector2.new(0.5,0.5); holder.Position=UDim2.new(0.5,0,0.36,0); holder.Size=UDim2.new(0,total,0,84); holder.BackgroundTransparency=1; holder.ClipsDescendants=true; holder.Parent=root
    local letters={}
    for i=1,#word do local l=Instance.new("TextLabel"); l.BackgroundTransparency=1; l.Size=UDim2.new(0,LW,0,84); l.Position=UDim2.new(0,(i-1)*LW,0,98); l.Font=F_HEAD; l.TextSize=52; l.Text=word:sub(i,i); l.TextColor3=C.text; l.Parent=holder; letters[i]=l end
    local ul=Instance.new("Frame"); ul.AnchorPoint=Vector2.new(0.5,0); ul.Position=UDim2.new(0.5,0,0.36,52); ul.Size=UDim2.new(0,0,0,2); ul.BorderSizePixel=0; ul.Parent=root; T(ul,"BackgroundColor3")
    local statusLbl=Instance.new("TextLabel"); statusLbl.BackgroundTransparency=1; statusLbl.AnchorPoint=Vector2.new(0.5,0); statusLbl.Position=UDim2.new(0.5,0,0.58,0); statusLbl.Size=UDim2.new(0,400,0,18); statusLbl.Font=F_MONO; statusLbl.TextSize=13; statusLbl.TextColor3=C.dim; statusLbl.Text="INITIALIZING"; statusLbl.TextTransparency=1; statusLbl.Parent=root
    local barBg=Instance.new("Frame"); barBg.AnchorPoint=Vector2.new(0.5,0); barBg.Position=UDim2.new(0.5,0,0.64,0); barBg.Size=UDim2.new(0,320,0,3); barBg.BackgroundColor3=C.off; barBg.BorderSizePixel=0; barBg.Parent=root; corner(barBg,2)
    local barFill=Instance.new("Frame"); barFill.Size=UDim2.new(0,0,1,0); barFill.BorderSizePixel=0; barFill.Parent=barBg; corner(barFill,2); T(barFill,"BackgroundColor3")
    local subLbl=Instance.new("TextLabel"); subLbl.BackgroundTransparency=1; subLbl.AnchorPoint=Vector2.new(0.5,0); subLbl.Position=UDim2.new(0.5,0,0.66,6); subLbl.Size=UDim2.new(0,400,0,16); subLbl.Font=F_MONO; subLbl.TextSize=11; subLbl.TextColor3=C.dim; subLbl.Text=""; subLbl.TextTransparency=1; subLbl.Parent=root
    task.spawn(function()
        task.wait(0.2)
        for i,l in ipairs(letters) do tween(l,0.7,{Position=UDim2.new(0,(i-1)*LW,0,0)}); task.wait(0.08) end
        task.wait(0.25); tween(ul,0.6,{Size=UDim2.new(0,total,0,2)})
        task.wait(0.3); tween(statusLbl,0.35,{TextTransparency=0}); tween(subLbl,0.35,{TextTransparency=0})
        local steps={{t=0.15,txt="Checking integrity...",sub="verifying files"},{t=0.4,txt="Loading modules...",sub="drhub core"},{t=0.65,txt="Connecting...",sub="t.me/NurHuboffical"},{t=0.9,txt="Almost ready...",sub="preparing UI"},{t=1.0,txt="Access granted",sub="welcome, "..LP.Name}}
        for _,s in ipairs(steps) do statusLbl.Text=s.txt; subLbl.Text=s.sub; tween(barFill,0.35,{Size=UDim2.new(s.t,0,1,0)}); task.wait(0.35) end
        T(statusLbl,"TextColor3"); task.wait(0.4)
        tween(root,0.5,{GroupTransparency=1}); task.wait(0.55); sg:Destroy()
    end)
end
task.wait(3.6)
print("[luXxS-hub] UI building")

local function notify(text)
    local f=Instance.new("Frame"); f.AnchorPoint=Vector2.new(1,1); f.Size=UDim2.new(0,260,0,34); f.Position=UDim2.new(1,300,1,-20); f.BackgroundColor3=C.panel; f.BorderSizePixel=0; f.ZIndex=20; f.Parent=gui; stroke(f,C.line,1,0)
    local bar=Instance.new("Frame"); bar.Size=UDim2.new(0,3,1,0); bar.BorderSizePixel=0; bar.BackgroundColor3=ACC; bar.ZIndex=21; bar.Parent=f
    local l=Instance.new("TextLabel"); l.BackgroundTransparency=1; l.Size=UDim2.new(1,-20,1,0); l.Position=UDim2.new(0,14,0,0); l.Font=F_MONO; l.TextSize=12; l.TextColor3=C.text; l.TextXAlignment=Enum.TextXAlignment.Left; l.Text=text; l.ZIndex=21; l.Parent=f
    tween(f,0.4,{Position=UDim2.new(1,-20,1,-20)})
    task.delay(2.6,function() tween(f,0.3,{Position=UDim2.new(1,300,1,-20)},Enum.EasingStyle.Quint,Enum.EasingDirection.In); task.delay(0.35,function() f:Destroy() end) end)
end

local function makeDraggable(handle,target,onClick)
    local dragging,startPos,startInput,moved=false,nil,nil,false
    local conn1
    conn1=handle.InputBegan:Connect(function(input)
        if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
            dragging=true; moved=false; startInput=input.Position; startPos=target.Position
            local c2
            c2=input.Changed:Connect(function() if input.UserInputState==Enum.UserInputState.End then dragging=false; c2:Disconnect(); if not moved and onClick then onClick() end end end)
        end
    end)
    track(conn1)
    track(UIS.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch) then
            local delta=input.Position-startInput
            if delta.Magnitude>5 then moved=true end
            if moved then target.Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+delta.X,startPos.Y.Scale,startPos.Y.Offset+delta.Y) end
        end
    end))
end

-- COSMETICS
local Cos={}
local function destroyCos(n) if Cos[n] then for _,o in ipairs(Cos[n].objs) do pcall(function() o:Destroy() end) end Cos[n]=nil end end
local function newPart(sz,p) local pt=Instance.new("Part"); pt.Size=sz; pt.CanCollide=false; pt.CanQuery=false; pt.CanTouch=false; pt.Massless=true; pt.Anchored=false; pt.Parent=p; return pt end
local function buildWings()
    destroyCos("wings")
    local char=LP.Character; local torso=char and (char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso")); if not torso then return end
    local model=Instance.new("Model"); model.Name="luxxsWings"; local feathers={}
    for _,side in ipairs({-1,1}) do for i=1,6 do
        local len=4.2-i*0.35
        local p=newPart(Vector3.new(len,0.5,0.08),model); p.Material=Enum.Material.Neon
        local w=Instance.new("Weld"); w.Part0=torso; w.Part1=p; w.Parent=p
        feathers[#feathers+1]={part=p,weld=w,side=side,i=i,len=len}
    end end
    model.Parent=char; Cos.wings={objs={model},model=model,feathers=feathers}
end
local function buildHat()
    destroyCos("hat")
    local char=LP.Character; local head=char and char:FindFirstChild("Head"); if not head then return end
    local model=Instance.new("Model"); model.Name="luxxsHat"; local slices={}
    for i=1,30 do
        local k=(i-1)/30; local r=2.4*(1-k)^1.05+0.05
        local p=newPart(Vector3.new(0.07,r*2,r*2),model); p.Shape=Enum.PartType.Cylinder; p.Material=Enum.Material.SmoothPlastic; p.CastShadow=false
        local w=Instance.new("Weld"); w.Part0=head; w.Part1=p; w.C0=CFrame.new(0,0.52+(i-1)*0.036,0)*CFrame.Angles(0,0,math.pi/2); w.Parent=p; slices[i]=p
    end
    model.Parent=char; Cos.hat={objs={model},model=model,slices=slices}
end
local function buildTrail()
    destroyCos("trail")
    local char=LP.Character; local hrp=char and char:FindFirstChild("HumanoidRootPart"); if not hrp then return end
    local a0=Instance.new("Attachment"); a0.Name="luxxsA0"; a0.Parent=hrp
    local a1=Instance.new("Attachment"); a1.Name="luxxsA1"; a1.Parent=hrp
    local tr=Instance.new("Trail"); tr.Attachment0=a0; tr.Attachment1=a1; tr.LightEmission=1; tr.FaceCamera=true
    tr.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,0.1),NumberSequenceKeypoint.new(1,1)}); tr.Parent=hrp
    Cos.trail={objs={a0,a1,tr},a0=a0,a1=a1,trail=tr}
end
local function buildAura()
    destroyCos("aura")
    local char=LP.Character; local hrp=char and char:FindFirstChild("HumanoidRootPart"); if not hrp then return end
    local att=Instance.new("Attachment"); att.Name="luxxsAuraAtt"; att.Parent=hrp
    local pe=Instance.new("ParticleEmitter"); pe.Name="luxxsAura"; pe.Rate=60; pe.Lifetime=NumberRange.new(0.5,1.2); pe.Speed=NumberRange.new(2,5); pe.SpreadAngle=Vector2.new(180,180); pe.LightEmission=1
    pe.Size=NumberSequence.new({NumberSequenceKeypoint.new(0,0.5),NumberSequenceKeypoint.new(1,0)})
    pe.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,0.2),NumberSequenceKeypoint.new(1,1)})
    pe.Parent=hrp
    Cos.aura={objs={att,pe},pe=pe}
end
local function colorSeq(name,t) if name=="Rainbow" then local kp={} for k=0,6 do kp[#kp+1]=ColorSequenceKeypoint.new(k/6,getColor(name,t,-k/6*0.8)) end return ColorSequence.new(kp) end; return ColorSequence.new(getColor(name)) end
track(RunService.Heartbeat:Connect(function()
    local t=os.clock()
    local w=Cos.wings
    if w and w.model.Parent then
        local flap=math.sin(t*(Flags["Visuals/Wing Speed"] or 3))*0.2
        for _,f in ipairs(w.feathers) do
            local a=math.rad(10+f.i*12)+flap*(0.5+f.i*0.12)
            local theta=(f.side==1) and a or (math.pi-a)
            f.weld.C0=CFrame.new(f.side*0.5,0.45,0.6)*CFrame.Angles(0,f.side*-0.35,0)*CFrame.Angles(0,0,theta)*CFrame.new(f.len/2,0,0)
            f.part.Color=getColor(Flags["Visuals/Wing Color"],t,f.i*0.05)
        end
    end
    local h=Cos.hat
    if h and h.model.Parent then local htr=(Flags["Visuals/Hat Transparency"] or 35)/100; for i,sl in ipairs(h.slices) do sl.Color=getColor(Flags["Visuals/Hat Color"],t,i*0.02); sl.Transparency=htr end end
    local tr=Cos.trail
    if tr and tr.trail.Parent then
        local width=(Flags["Visuals/Trail Width"] or 4)*0.4
        tr.a0.Position=Vector3.new(0,width/2,0); tr.a1.Position=Vector3.new(0,-width/2,0)
        tr.trail.Lifetime=math.max(0.1,(Flags["Visuals/Trail Length"] or 10)/10); tr.trail.Color=colorSeq(Flags["Visuals/Trail Color"],t)
    end
    local au=Cos.aura
    if au and au.pe.Parent then
        au.pe.Color=colorSeq(Flags["Visuals/Aura Color"] or "Rainbow",t)
        au.pe.Rate=Flags["Visuals/Aura Density"] or 60
    end
end))
local enableFlyMove
track(LP.CharacterAdded:Connect(function(c)
    c:WaitForChild("HumanoidRootPart",10); c:WaitForChild("Head",10); task.wait(0.3)
    if Flags["Visuals/Wings"] then buildWings() end
    if Flags["Visuals/Chinese Hat"] then buildHat() end
    if Flags["Visuals/Trail"] then buildTrail() end
    if Flags["Visuals/Aura"] then buildAura() end
    if Flags["Move/Fly"] and enableFlyMove then enableFlyMove() end
    if Flags["Character/Apply Animation"] then task.wait(0.5); end
end))

-- SCREEN RATIO
local ScreenRes={Bars={}}
do
    local barsFolder=Instance.new("Frame"); barsFolder.Name="luxxsScreenBars"; barsFolder.Size=UDim2.new(1,0,1,0); barsFolder.BackgroundTransparency=1; barsFolder.ZIndex=0; barsFolder.Parent=gui
    local topBar=Instance.new("Frame"); topBar.Position=UDim2.new(0,0,0,0); topBar.Size=UDim2.new(1,0,0,0); topBar.BackgroundColor3=Color3.new(0,0,0); topBar.BorderSizePixel=0; topBar.Parent=barsFolder
    local botBar=Instance.new("Frame"); botBar.AnchorPoint=Vector2.new(0,1); botBar.Position=UDim2.new(0,0,1,0); botBar.Size=UDim2.new(1,0,0,0); botBar.BackgroundColor3=Color3.new(0,0,0); botBar.BorderSizePixel=0; botBar.Parent=barsFolder
    ScreenRes.Bars={top=topBar,bot=botBar,folder=barsFolder}
    local RATIOS={["16:9"]=16/9,["16:10"]=16/10,["4:3"]=4/3,["21:9"]=21/9,["1:1"]=1.0,["2:1"]=2.0,["9:16"]=9/16}
    function ScreenRes.apply(mode)
        local cam=workspace.CurrentCamera; if not cam then return end
        local vp=cam.ViewportSize
        if mode=="Default" then tween(ScreenRes.Bars.top,0.3,{Size=UDim2.new(1,0,0,0)}); tween(ScreenRes.Bars.bot,0.3,{Size=UDim2.new(1,0,0,0)}); return end
        local tr=RATIOS[mode]; if not tr then return end
        local cr=vp.X/vp.Y; local barH=0
        if cr>tr then barH=(vp.Y-vp.X/tr)/2 end
        if barH<0 then barH=0 end
        tween(ScreenRes.Bars.top,0.3,{Size=UDim2.new(1,0,0,barH)})
        tween(ScreenRes.Bars.bot,0.3,{Size=UDim2.new(1,0,0,barH)})
    end
end

-- WINDOW
local W,H=1000,560
local main=Instance.new("CanvasGroup")
main.AnchorPoint=Vector2.new(0.5,0.5); main.Position=UDim2.new(0.5,0,0.5,0); main.Size=UDim2.new(0,W,0,H)
main.BackgroundColor3=C.bg; main.BorderSizePixel=0; main.GroupTransparency=1; main.Visible=false; main.Parent=gui
corner(main,16); T(stroke(main,ACC,1.5,0.35),"Color")
local bgF=Instance.new("Frame"); bgF.Size=UDim2.new(1,0,1,0); bgF.BackgroundColor3=WHITE; bgF.BorderSizePixel=0; bgF.ZIndex=0; bgF.Parent=main
gradient(bgF,125,ColorSequence.new(Color3.fromRGB(24,19,36),Color3.fromRGB(10,10,14)))
local scale=Instance.new("UIScale"); scale.Scale=0.9; scale.Parent=main

local top=Instance.new("Frame"); top.Size=UDim2.new(1,0,0,44); top.BackgroundColor3=WHITE; top.BorderSizePixel=0; top.Parent=main
gradient(top,0,ColorSequence.new(Color3.fromRGB(34,26,48),Color3.fromRGB(15,15,21)))
local topLine=Instance.new("Frame"); topLine.Position=UDim2.new(0,0,1,-1); topLine.Size=UDim2.new(1,0,0,1); topLine.BackgroundColor3=C.line; topLine.BorderSizePixel=0; topLine.Parent=top
local mark=Instance.new("Frame"); mark.Position=UDim2.new(0,16,0,18); mark.Size=UDim2.new(0,8,0,8); mark.Rotation=45; mark.BorderSizePixel=0; mark.Parent=top; T(mark,"BackgroundColor3")
local title=Instance.new("TextLabel"); title.BackgroundTransparency=1; title.Position=UDim2.new(0,34,0,0); title.Size=UDim2.new(0,90,1,0); title.Font=F_HEAD; title.TextSize=15; title.TextXAlignment=Enum.TextXAlignment.Left; title.TextColor3=C.text; title.Text="luXxS"; title.Parent=top
local ver=Instance.new("TextLabel"); ver.BackgroundTransparency=1; ver.Position=UDim2.new(0,120,0,2); ver.Size=UDim2.new(0,140,1,0); ver.Font=F_MONO; ver.TextSize=10; ver.TextXAlignment=Enum.TextXAlignment.Left; ver.TextColor3=C.dim; ver.Text="hub v7.0 MAX"; ver.Parent=top
local closeBtn=Instance.new("TextButton"); closeBtn.AnchorPoint=Vector2.new(1,0.5); closeBtn.Position=UDim2.new(1,-10,0.5,0); closeBtn.Size=UDim2.new(0,28,0,28); closeBtn.BackgroundColor3=C.row; closeBtn.BorderSizePixel=0; closeBtn.Text="X"; closeBtn.Font=F_MONO; closeBtn.TextSize=13; closeBtn.TextColor3=C.dim; closeBtn.AutoButtonColor=false; closeBtn.Parent=top; corner(closeBtn,6)
local searchFrame=Instance.new("Frame"); searchFrame.Position=UDim2.new(1,-260,0.5,-13); searchFrame.Size=UDim2.new(0,220,0,26); searchFrame.BackgroundColor3=C.row; searchFrame.BorderSizePixel=0; searchFrame.Parent=top; corner(searchFrame,8)
local searchBox=Instance.new("TextBox"); searchBox.BackgroundTransparency=1; searchBox.Size=UDim2.new(1,-20,1,0); searchBox.Position=UDim2.new(0,10,0,0); searchBox.Font=F_MONO; searchBox.TextSize=12; searchBox.TextColor3=C.text; searchBox.PlaceholderColor3=C.dim; searchBox.PlaceholderText="search settings..."; searchBox.Text=""; searchBox.ClearTextOnFocus=false; searchBox.TextXAlignment=Enum.TextXAlignment.Left; searchBox.Parent=searchFrame

local side=Instance.new("Frame"); side.Position=UDim2.new(0,0,0,44); side.Size=UDim2.new(0,150,0,H-44); side.BackgroundColor3=C.panel; side.BorderSizePixel=0; side.Parent=main
local sideLine=Instance.new("Frame"); sideLine.Position=UDim2.new(1,-1,0,0); sideLine.Size=UDim2.new(0,1,1,0); sideLine.BackgroundColor3=C.line; sideLine.BorderSizePixel=0; sideLine.Parent=side
local sideList=Instance.new("Frame"); sideList.BackgroundTransparency=1; sideList.Position=UDim2.new(0,0,0,12); sideList.Size=UDim2.new(1,-1,1,-12); sideList.Parent=side
local indicator=Instance.new("Frame"); indicator.Size=UDim2.new(0,2,0,22); indicator.Position=UDim2.new(0,0,0,18); indicator.BorderSizePixel=0; indicator.ZIndex=3; indicator.Parent=side; T(indicator,"BackgroundColor3")
local pages=Instance.new("Frame"); pages.BackgroundTransparency=1; pages.Position=UDim2.new(0,162,0,54); pages.Size=UDim2.new(0,570,0,H-64); pages.ClipsDescendants=true; pages.Parent=main
local previewPanel=Instance.new("Frame"); previewPanel.Position=UDim2.new(0,740,0,54); previewPanel.Size=UDim2.new(0,250,0,412); previewPanel.BorderSizePixel=0; previewPanel.Parent=main

local tabs,currentTab,switching={},nil,false
local allRows={}
local function restyleTabs() for _,t in ipairs(tabs) do local on=(t==currentTab); t.nm.TextColor3=on and C.text or C.dim; t.num.TextColor3=on and ACC or C.dim; t.button.BackgroundColor3=on and ACC or C.row; t.button.BackgroundTransparency=on and 0.82 or 1 end end
local function selectTab(tab)
    if currentTab==tab or switching then return end
    switching=true; local old=currentTab; currentTab=tab
    tween(indicator,0.3,{Position=UDim2.new(0,0,0,18+tab.index*36)}); restyleTabs()
    if old then tween(old.page,0.15,{GroupTransparency=1}); task.delay(0.15,function() old.page.Visible=false end) end
    task.delay(old and 0.12 or 0,function()
        tab.page.GroupTransparency=1; tab.page.Visible=true
        tween(tab.page,0.25,{GroupTransparency=0})
        task.delay(0.25,function() switching=false end)
    end)
end
local function hairline(parent,y) local f=Instance.new("Frame"); f.Position=UDim2.new(0,0,1,y or -1); f.Size=UDim2.new(1,0,0,1); f.BackgroundColor3=C.line; f.BackgroundTransparency=1; f.BorderSizePixel=0; f.Parent=parent; return f end

local function createTab(name,isFav)
    local index=#tabs
    local button=Instance.new("TextButton"); button.Size=UDim2.new(1,-16,0,34); button.Position=UDim2.new(0,8,0,index*36+6); button.BackgroundColor3=C.row; button.BackgroundTransparency=1; button.BorderSizePixel=0; button.Text=""; button.AutoButtonColor=false; button.Parent=sideList; corner(button,8)
    local num=Instance.new("TextLabel"); num.BackgroundTransparency=1; num.Position=UDim2.new(0,16,0,0); num.Size=UDim2.new(0,24,1,0); num.Font=F_MONO; num.TextSize=11; num.TextXAlignment=Enum.TextXAlignment.Left; num.TextColor3=C.dim; num.Text=isFav and "★" or string.format("%02d",index+1); num.Parent=button
    local nm=Instance.new("TextLabel"); nm.BackgroundTransparency=1; nm.Position=UDim2.new(0,46,0,0); nm.Size=UDim2.new(1,-50,1,0); nm.Font=F_SEC; nm.TextSize=15; nm.TextXAlignment=Enum.TextXAlignment.Left; nm.TextColor3=C.dim; nm.Text=string.upper(name); nm.Parent=button
    local page=Instance.new("CanvasGroup"); page.Size=UDim2.new(1,0,1,0); page.BackgroundTransparency=1; page.Visible=false; page.GroupTransparency=1; page.Parent=pages
    local scroll=Instance.new("ScrollingFrame"); scroll.Size=UDim2.new(1,0,1,0); scroll.BackgroundTransparency=1; scroll.BorderSizePixel=0; scroll.ScrollBarThickness=2; scroll.CanvasSize=UDim2.new(0,0,0,0); scroll.AutomaticCanvasSize=Enum.AutomaticSize.Y; scroll.Parent=page
    T(scroll,"ScrollBarImageColor3")
    local function mkCol(xs,xo) local f=Instance.new("Frame"); f.BackgroundTransparency=1; f.Position=UDim2.new(xs,xo,0,0); f.Size=UDim2.new(0.5,-4,0,0); f.AutomaticSize=Enum.AutomaticSize.Y; f.Parent=scroll; local l=Instance.new("UIListLayout"); l.Padding=UDim.new(0,2); l.SortOrder=Enum.SortOrder.LayoutOrder; l.Parent=f; return f end
    local colL=mkCol(0,0); local colR=mkCol(0.5,4)
    local hL,hR=0,0; local COLH=H-70
    local function slot(h) if hL+h<=COLH then hL=hL+h+2; return colL end; if hR+h<=COLH then hR=hR+h+2; return colR end; if hR<hL then hR=hR+h+2; return colR end; hL=hL+h+2; return colL end
    local pad=Instance.new("UIPadding"); pad.PaddingRight=UDim.new(0,8); pad.PaddingTop=UDim.new(0,2); pad.PaddingBottom=UDim.new(0,10); pad.Parent=scroll
    local tab={button=button,page=page,scroll=scroll,index=index,name=name,num=num,nm=nm,rows={},favorites={}}; table.insert(tabs,tab)
    button.MouseButton1Click:Connect(function() selectTab(tab) end)
    button.MouseEnter:Connect(function() if currentTab~=tab then tween(nm,0.15,{TextColor3=C.text}) end end)
    button.MouseLeave:Connect(function() if currentTab~=tab then tween(nm,0.15,{TextColor3=C.dim}) end end)
    local function registerRow(fullText,r) r.tab=tab; r.fullText=fullText; tab.rows[#tab.rows+1]=r; allRows[#allRows+1]=r end
    function tab:Tooltip(parent,desc) local tip=Instance.new("TextLabel"); tip.BackgroundTransparency=1; tip.Position=UDim2.new(0,10,1,-14); tip.Size=UDim2.new(1,-20,0,12); tip.Font=F_MONO; tip.TextSize=9; tip.TextColor3=C.dim; tip.TextXAlignment=Enum.TextXAlignment.Left; tip.Text=desc; tip.Parent=parent end
    function tab:Label(text)
        local f=Instance.new("Frame"); f.Size=UDim2.new(1,0,0,30); f.BackgroundTransparency=1; f.Parent=slot(30)
        local l=Instance.new("TextLabel"); l.BackgroundTransparency=1; l.Position=UDim2.new(0,0,0,6); l.Size=UDim2.new(1,0,0,18); l.Font=F_SEC; l.TextSize=13; l.TextXAlignment=Enum.TextXAlignment.Left; l.TextColor3=C.dim; l.Text=string.upper(text); l.Parent=f
        hairline(f,-3)
        local ac=Instance.new("Frame"); ac.Position=UDim2.new(0,0,1,-3); ac.Size=UDim2.new(0,28,0,1); ac.BorderSizePixel=0; ac.Parent=f; T(ac,"BackgroundColor3")
    end
    function tab:Label2(text,font,size,color) local l=Instance.new("TextLabel"); l.Size=UDim2.new(1,0,0,(#text>36) and 28 or 18); l.TextWrapped=true; l.BackgroundTransparency=1; l.Font=font or F_MONO; l.TextSize=size or 11; l.TextColor3=color or C.dim; l.TextXAlignment=Enum.TextXAlignment.Left; l.Text=text; l.Parent=slot(l.Size.Y.Offset); return l end
    function tab:Frame(h) local f=Instance.new("Frame"); f.Size=UDim2.new(1,0,0,h); f.BackgroundTransparency=1; f.Parent=slot(h); return f end
    function tab:Toggle(text,default,callback,desc)
        local key=name.."/"..text; local state=default or false; local h=desc and 48 or 34
        local row=Instance.new("TextButton"); row.Size=UDim2.new(1,0,0,h); row.BackgroundColor3=C.row; row.BackgroundTransparency=0.55; corner(row,8); row.BorderSizePixel=0; row.AutoButtonColor=false; row.Text=""; row.Parent=slot(h)
        hairline(row)
        local lbl=Instance.new("TextLabel"); lbl.BackgroundTransparency=1; lbl.Position=UDim2.new(0,10,0,desc and 4 or 0); lbl.Size=UDim2.new(1,-60,0,desc and 16 or h); lbl.Font=F_BODY; lbl.TextSize=14; lbl.TextColor3=C.text; lbl.TextXAlignment=Enum.TextXAlignment.Left; lbl.Text=text; lbl.Parent=row
        if desc then tab:Tooltip(row,desc) end
        local box=Instance.new("Frame"); box.AnchorPoint=Vector2.new(1,0.5); box.Position=UDim2.new(1,-10,0.5,0); box.Size=UDim2.new(0,36,0,18); box.BackgroundColor3=state and ACC or C.off; box.BorderSizePixel=0; box.Parent=row; corner(box,9)
        local inner=Instance.new("Frame"); inner.AnchorPoint=Vector2.new(0,0.5); inner.Position=UDim2.new(0,state and 20 or 2,0.5,0); inner.Size=UDim2.new(0,14,0,14); inner.BackgroundColor3=WHITE; inner.BorderSizePixel=0; inner.Parent=box; corner(inner,7)
        local function paint() tween(box,0.18,{BackgroundColor3=state and ACC or C.off}); tween(inner,0.18,{Position=UDim2.new(0,state and 20 or 2,0.5,0)}) end
        register(key,state,function(v) state=v and true or false; Flags[key]=state; paint(); if callback then task.spawn(callback,state) end end)
        row.MouseButton1Click:Connect(function() Setters[key](not state) end)
        row.MouseEnter:Connect(function() tween(row,0.12,{BackgroundTransparency=0.3}) end)
        row.MouseLeave:Connect(function() tween(row,0.12,{BackgroundTransparency=0.55}) end)
        registerRow((text.." "..(desc or "")):lower(), {row=row,type="toggle",key=key})
    end
    function tab:Button(text,callback,desc)
        local h=desc and 52 or 38
        local wrap=Instance.new("Frame"); wrap.Size=UDim2.new(1,0,0,h); wrap.BackgroundTransparency=1; wrap.Parent=slot(h)
        local b=Instance.new("TextButton"); b.Position=UDim2.new(0,10,0,4); b.Size=UDim2.new(1,-20,0,30); b.BackgroundColor3=ACC; b.BackgroundTransparency=0.88; corner(b,8); b.BorderSizePixel=0; b.AutoButtonColor=false; b.Font=F_MONO; b.TextSize=12; b.Text=string.upper(text); b.Parent=wrap
        T(b,"TextColor3"); local bs=stroke(b,ACC,1,0.4); T(bs,"Color")
        b.MouseEnter:Connect(function() b.BackgroundColor3=ACC; tween(b,0.12,{BackgroundTransparency=0}); b.TextColor3=C.bg end)
        b.MouseLeave:Connect(function() tween(b,0.12,{BackgroundTransparency=0.88}); b.TextColor3=ACC end)
        b.MouseButton1Click:Connect(function() if callback then task.spawn(callback) end end)
        if desc then tab:Tooltip(wrap,desc) end
        registerRow(text:lower(), {row=wrap,type="button"})
    end
    function tab:Input(text,default,callback,desc)
        local h=desc and 52 or 38
        local row=Instance.new("Frame"); row.Size=UDim2.new(1,0,0,h); row.BackgroundColor3=C.row; row.BackgroundTransparency=0.55; corner(row,8); row.Parent=slot(h)
        hairline(row)
        local lbl=Instance.new("TextLabel"); lbl.BackgroundTransparency=1; lbl.Position=UDim2.new(0,10,0,0); lbl.Size=UDim2.new(0.5,-10,0,38); lbl.Font=F_BODY; lbl.TextSize=14; lbl.TextColor3=C.text; lbl.TextXAlignment=Enum.TextXAlignment.Left; lbl.Text=text; lbl.Parent=row
        if desc then tab:Tooltip(row,desc) end
        local boxF=Instance.new("Frame"); boxF.AnchorPoint=Vector2.new(1,0.5); boxF.Position=UDim2.new(1,-10,0.5,-(desc and 8 or 0)); boxF.Size=UDim2.new(0.5,-10,0,26); boxF.BackgroundColor3=C.bg; boxF.BorderSizePixel=0; boxF.Parent=row
        local bs=stroke(boxF,ACC,1,0.4); T(bs,"Color")
        local tb=Instance.new("TextBox"); tb.BackgroundTransparency=1; tb.Size=UDim2.new(1,-12,1,0); tb.Position=UDim2.new(0,6,0,0); tb.Font=F_MONO; tb.TextSize=13; tb.TextColor3=C.text; tb.PlaceholderColor3=C.dim; tb.PlaceholderText="value"; tb.Text=tostring(default or ""); tb.ClearTextOnFocus=false; tb.TextXAlignment=Enum.TextXAlignment.Center; tb.Parent=boxF
        tb.FocusLost:Connect(function() if callback then task.spawn(callback,tb.Text,tb) end end)
        registerRow((text.." "..(desc or "")):lower(), {row=row,type="input"})
        return tb
    end
    function tab:Slider(text,min,max,default,callback,gradFn,desc)
        local key=name.."/"..text; local value=default or min; local h=desc and 62 or 46
        local row=Instance.new("Frame"); row.Size=UDim2.new(1,0,0,h); row.BackgroundColor3=C.row; row.BackgroundTransparency=0.55; corner(row,8); row.Parent=slot(h)
        hairline(row)
        local lbl=Instance.new("TextLabel"); lbl.BackgroundTransparency=1; lbl.Position=UDim2.new(0,10,0,4); lbl.Size=UDim2.new(0.6,0,0,20); lbl.Font=F_BODY; lbl.TextSize=14; lbl.TextColor3=C.text; lbl.TextXAlignment=Enum.TextXAlignment.Left; lbl.Text=text; lbl.Parent=row
        local val=Instance.new("TextLabel"); val.BackgroundTransparency=1; val.AnchorPoint=Vector2.new(1,0); val.Position=UDim2.new(1,-10,0,4); val.Size=UDim2.new(0,100,0,20); val.Font=F_MONO; val.TextSize=13; val.TextXAlignment=Enum.TextXAlignment.Right; val.Text=tostring(value); val.Parent=row; T(val,"TextColor3")
        local bar=Instance.new("Frame"); bar.Position=UDim2.new(0,10,0,33); bar.Size=UDim2.new(1,-20,0,5); bar.BackgroundColor3=C.off; bar.BorderSizePixel=0; bar.Parent=row
        local fill=Instance.new("Frame"); fill.Size=UDim2.new((value-min)/(max-min),0,1,0); fill.BorderSizePixel=0; fill.Parent=bar; T(fill,"BackgroundColor3")
        local gradObj
        if gradFn then bar.Size=UDim2.new(1,-20,0,8); bar.Position=UDim2.new(0,10,0,31); bar.BackgroundColor3=WHITE; fill.BackgroundTransparency=1; gradObj=Instance.new("UIGradient"); gradObj.Color=gradFn(); gradObj.Parent=bar; GradRefresh[key]=function() gradObj.Color=gradFn() end end
        local knob=Instance.new("Frame"); knob.AnchorPoint=Vector2.new(0.5,0.5); knob.Position=UDim2.new((value-min)/(max-min),0,0.5,0); knob.Size=UDim2.new(0,14,0,14); knob.BackgroundColor3=WHITE; knob.BorderSizePixel=0; knob.ZIndex=3; knob.Parent=bar; corner(bar,3); corner(fill,3); corner(knob,7); T(stroke(knob,ACC,2,0),"Color")
        if desc then tab:Tooltip(row,desc) end
        register(key,value,function(v)
            v=math.clamp(math.floor((tonumber(v) or min)+0.5),min,max); value=v; Flags[key]=v
            val.Text=tostring(v); local r=(v-min)/(max-min); fill.Size=UDim2.new(r,0,1,0); knob.Position=UDim2.new(r,0,0.5,0)
            if callback then task.spawn(callback,v) end
        end)
        local hit=Instance.new("TextButton"); hit.BackgroundTransparency=1; hit.Text=""; hit.Position=UDim2.new(0,0,0,22); hit.Size=UDim2.new(1,0,0,24); hit.Parent=row
        local sliding=false
        local function update(x) local rel=math.clamp((x-bar.AbsolutePosition.X)/math.max(bar.AbsoluteSize.X,1),0,1); Setters[key](min+(max-min)*rel) end
        hit.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then sliding=true; scroll.ScrollingEnabled=false; update(i.Position.X) end end)
        track(UIS.InputEnded:Connect(function(i) if sliding and (i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch) then sliding=false; scroll.ScrollingEnabled=true end end))
        track(UIS.InputChanged:Connect(function(i) if sliding and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then update(i.Position.X) end end))
        registerRow((text.." "..(desc or "")):lower(), {row=row,type="slider",key=key})
    end
    function tab:Choice(text,options,default,callback,desc)
        local key=name.."/"..text; local idx=table.find(options,default) or 1; local h=desc and 52 or 34
        local row=Instance.new("TextButton"); row.Size=UDim2.new(1,0,0,h); row.BackgroundColor3=C.row; row.BackgroundTransparency=0.55; corner(row,8); row.BorderSizePixel=0; row.AutoButtonColor=false; row.Text=""; row.Parent=slot(h)
        hairline(row)
        local lbl=Instance.new("TextLabel"); lbl.BackgroundTransparency=1; lbl.Position=UDim2.new(0,10,0,0); lbl.Size=UDim2.new(0.5,-10,1,0); lbl.Font=F_BODY; lbl.TextSize=14; lbl.TextColor3=C.text; lbl.TextXAlignment=Enum.TextXAlignment.Left; lbl.Text=text; lbl.Parent=row
        if desc then tab:Tooltip(row,desc) end
        local val=Instance.new("TextLabel"); val.BackgroundTransparency=1; val.AnchorPoint=Vector2.new(1,0); val.Position=UDim2.new(1,-10,0,0); val.Size=UDim2.new(0.5,-10,1,0); val.Font=F_MONO; val.TextSize=13; val.TextXAlignment=Enum.TextXAlignment.Right; val.Text="< "..options[idx].." >"; val.Parent=row; T(val,"TextColor3")
        register(key,options[idx],function(v) local i=table.find(options,v); if not i then return end; idx=i; Flags[key]=options[i]; val.Text="< "..options[i].." >"; if callback then task.spawn(callback,options[i]) end end)
        row.MouseButton1Click:Connect(function() Setters[key](options[idx%#options+1]) end)
        row.MouseButton2Click:Connect(function() Setters[key](options[(idx-2)%#options+1]) end)
        row.MouseEnter:Connect(function() tween(row,0.12,{BackgroundTransparency=0.3}) end)
        row.MouseLeave:Connect(function() tween(row,0.12,{BackgroundTransparency=0.55}) end)
        registerRow((text.." "..(desc or "")):lower(), {row=row,type="choice",key=key})
    end
    function tab:List(text,items,default,callback,desc)
        local key=name.."/"..text; local h=desc and 200 or 180
        local lf=Instance.new("Frame"); lf.Size=UDim2.new(1,0,0,h); lf.BackgroundTransparency=1; lf.Parent=slot(h)
        local header=Instance.new("TextLabel"); header.BackgroundTransparency=1; header.Position=UDim2.new(0,0,0,0); header.Size=UDim2.new(1,0,0,16); header.Font=F_SEC; header.TextSize=13; header.TextXAlignment=Enum.TextXAlignment.Left; header.TextColor3=C.text; header.Text=string.upper(text); header.Parent=lf
        if desc then tab:Tooltip(lf,desc) end
        local sf=Instance.new("ScrollingFrame"); sf.Position=UDim2.new(0,0,0,18); sf.Size=UDim2.new(1,0,1,-18); sf.BackgroundColor3=C.row; sf.BackgroundTransparency=0.45; sf.BorderSizePixel=0; sf.ScrollBarThickness=3; sf.CanvasSize=UDim2.new(0,0,0,#items*28+10); sf.Parent=lf
        corner(sf,8); T(sf,"ScrollBarImageColor3")
        local ll=Instance.new("UIListLayout"); ll.Padding=UDim.new(0,2); ll.SortOrder=Enum.SortOrder.LayoutOrder; ll.Parent=sf
        local pd=Instance.new("UIPadding"); pd.PaddingTop=UDim.new(0,4); pd.PaddingLeft=UDim.new(0,4); pd.PaddingRight=UDim.new(0,6); pd.PaddingBottom=UDim.new(0,4); pd.Parent=sf
        local btns={}; local current=default or items[1]
        local function paint() for n,b in pairs(btns) do local on=(n==current); b.BackgroundColor3=on and ACC or C.bg; b.BackgroundTransparency=on and 0.55 or 0.45; b.TextColor3=on and C.text or C.dim end end
        register(key,current,function(v) current=v; Flags[key]=v; paint(); if callback then task.spawn(callback,v) end end)
        for i,name in ipairs(items) do
            local b=Instance.new("TextButton"); b.Size=UDim2.new(1,0,0,26); b.BorderSizePixel=0; b.AutoButtonColor=false; b.Font=F_BODY; b.TextSize=14
            b.TextXAlignment=Enum.TextXAlignment.Left; b.Text="  "..name; b.LayoutOrder=i; b.Parent=sf; corner(b,6)
            b.MouseButton1Click:Connect(function() Setters[key](name) end)
            b.MouseEnter:Connect(function() if name~=current then b.BackgroundTransparency=0.15 end end)
            b.MouseLeave:Connect(function() if name~=current then b.BackgroundTransparency=0.45 end end)
            btns[name]=b
        end
        paint()
        registerRow((text.." "..(desc or "")):lower(), {row=lf,type="list"})
    end
    return tab
end

local function fitScale() local cam=workspace.CurrentCamera; local vp=cam and cam.ViewportSize or Vector2.new(1280,720); return math.min(1,(vp.X-20)/W,(vp.Y-20)/H) end
local isOpen,busy=false,false
local MenuAlpha=1; local MenuScale=1
local function openMenu()
    if busy or isOpen then return end
    busy=true; isOpen=true; main.Visible=true
    local fit=fitScale(); scale.Scale=fit*0.94*MenuScale; main.GroupTransparency=1
    tween(scale,0.35,{Scale=fit*MenuScale}); tween(main,0.3,{GroupTransparency=1-MenuAlpha})
    task.delay(0.35,function() busy=false end)
end
local function closeMenu()
    if busy or not isOpen then return end
    busy=true; isOpen=false
    tween(scale,0.25,{Scale=fitScale()*0.94*MenuScale},Enum.EasingStyle.Quint,Enum.EasingDirection.In)
    tween(main,0.25,{GroupTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.In)
    task.delay(0.26,function() main.Visible=false; busy=false end)
end
local function toggleMenu() if isOpen then closeMenu() else openMenu() end end
closeBtn.MouseButton1Click:Connect(closeMenu)
closeBtn.MouseEnter:Connect(function() tween(closeBtn,0.12,{BackgroundColor3=Color3.fromRGB(190,56,56)}); closeBtn.TextColor3=WHITE end)
closeBtn.MouseLeave:Connect(function() tween(closeBtn,0.12,{BackgroundColor3=C.row}); closeBtn.TextColor3=C.dim end)
searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    local q=searchBox.Text:lower()
    for _,r in ipairs(allRows) do if r.row and r.row.Parent then if q=="" then r.row.Visible=true else r.row.Visible=r.fullText:find(q,1,true)~=nil end end end
end)

-- LOGO
local logoGui=Instance.new("ScreenGui"); logoGui.Name="luxxsLogo"; logoGui.ResetOnSpawn=false; logoGui.IgnoreGuiInset=true; logoGui.DisplayOrder=50; logoGui.Parent=parent
local logoFrame=Instance.new("Frame"); logoFrame.Size=UDim2.new(0,190,0,40); logoFrame.Position=UDim2.new(0.5,-95,1,-70); logoFrame.BackgroundColor3=C.bg; logoFrame.BackgroundTransparency=0.15; logoFrame.BorderSizePixel=0; logoFrame.Parent=logoGui; corner(logoFrame,10)
local logoS=stroke(logoFrame,ACC,1.5,0.3); T(logoS,"Color")
local lgT1=Instance.new("TextLabel"); lgT1.BackgroundTransparency=1; lgT1.Size=UDim2.new(0,80,1,0); lgT1.Position=UDim2.new(0,6,0,0); lgT1.Font=F_HEAD; lgT1.TextSize=18; lgT1.TextColor3=C.text; lgT1.TextXAlignment=Enum.TextXAlignment.Left; lgT1.Text="luXxS"; lgT1.Parent=logoFrame
local lgCross=Instance.new("Frame"); lgCross.Size=UDim2.new(0,30,1,0); lgCross.Position=UDim2.new(0,82,0,0); lgCross.BackgroundTransparency=1; lgCross.Parent=logoFrame
local lgCircle=Instance.new("Frame"); lgCircle.AnchorPoint=Vector2.new(0.5,0.5); lgCircle.Position=UDim2.new(0.5,0,0.5,0); lgCircle.Size=UDim2.new(0,18,0,18); lgCircle.BackgroundTransparency=1; lgCircle.Parent=lgCross; corner(lgCircle,999)
local lgCS=stroke(lgCircle,ACC,1.5,0); T(lgCS,"Color")
local lgDot=Instance.new("Frame"); lgDot.AnchorPoint=Vector2.new(0.5,0.5); lgDot.Position=UDim2.new(0.5,0,0.5,0); lgDot.Size=UDim2.new(0,4,0,4); lgDot.BackgroundColor3=ACC; lgDot.BorderSizePixel=0; lgDot.Parent=lgCross; corner(lgDot,999); T(lgDot,"BackgroundColor3")
for i=1,4 do
    local ln=Instance.new("Frame"); ln.BackgroundColor3=ACC; ln.BorderSizePixel=0; ln.Parent=lgCross; T(ln,"BackgroundColor3")
    if i<=2 then ln.Size=UDim2.new(0,10,0,1.5); ln.AnchorPoint=Vector2.new(0.5,0.5); ln.Position=UDim2.new(0.5,i==1 and -13 or 13,0.5,0)
    else ln.Size=UDim2.new(0,1.5,0,10); ln.AnchorPoint=Vector2.new(0.5,0.5); ln.Position=UDim2.new(0.5,0,0.5,i==3 and -13 or 13) end
    corner(ln,1)
end
local lgT2=Instance.new("TextLabel"); lgT2.BackgroundTransparency=1; lgT2.Size=UDim2.new(0,80,1,0); lgT2.Position=UDim2.new(0,116,0,0); lgT2.Font=F_HEAD; lgT2.TextSize=18; lgT2.TextColor3=ACC; lgT2.TextXAlignment=Enum.TextXAlignment.Left; lgT2.Text="hub"; lgT2.Parent=logoFrame; T(lgT2,"TextColor3")
makeDraggable(logoFrame,logoFrame,function() toggleMenu() end)

-- WATERMARK
local wmGui=Instance.new("ScreenGui"); wmGui.Name="luxxsWatermark"; wmGui.ResetOnSpawn=false; wmGui.IgnoreGuiInset=true; wmGui.DisplayOrder=48; wmGui.Parent=parent
local wmFrame=Instance.new("Frame"); wmFrame.Size=UDim2.new(0,220,0,26); wmFrame.Position=UDim2.new(0,12,0,12); wmFrame.BackgroundColor3=C.bg; wmFrame.BackgroundTransparency=0.2; wmFrame.BorderSizePixel=0; wmFrame.Visible=false; wmFrame.Parent=wmGui; corner(wmFrame,8)
stroke(wmFrame,ACC,1,0.2)
local wmLbl=Instance.new("TextLabel"); wmLbl.BackgroundTransparency=1; wmLbl.Size=UDim2.new(1,-10,1,0); wmLbl.Position=UDim2.new(0,10,0,0); wmLbl.Font=F_MONO; wmLbl.TextSize=11; wmLbl.TextColor3=C.text; wmLbl.TextXAlignment=Enum.TextXAlignment.Left; wmLbl.Text="luXxS-hub v7.0"; wmLbl.Parent=wmFrame
makeDraggable(wmFrame,wmFrame)

-- CROSSHAIR
local chGui=Instance.new("ScreenGui"); chGui.Name="luxxsCrosshair"; chGui.ResetOnSpawn=false; chGui.IgnoreGuiInset=true; chGui.DisplayOrder=60; chGui.Parent=parent
local chFrame=Instance.new("Frame"); chFrame.AnchorPoint=Vector2.new(0.5,0.5); chFrame.Position=UDim2.new(0.5,0,0.5,0); chFrame.Size=UDim2.new(0,20,0,20); chFrame.BackgroundTransparency=1; chFrame.Visible=false; chFrame.Parent=chGui
local chParts={}
for i=1,4 do local p=Instance.new("Frame"); p.BackgroundColor3=WHITE; p.BorderSizePixel=0; p.AnchorPoint=Vector2.new(0.5,0.5); p.Parent=chFrame; chParts[i]=p end
local chDot=Instance.new("Frame"); chDot.AnchorPoint=Vector2.new(0.5,0.5); chDot.Position=UDim2.new(0.5,0,0.5,0); chDot.Size=UDim2.new(0,3,0,3); chDot.BackgroundColor3=WHITE; chDot.BorderSizePixel=0; chDot.Parent=chFrame; corner(chDot,999)
local chCircle=Instance.new("Frame"); chCircle.AnchorPoint=Vector2.new(0.5,0.5); chCircle.Position=UDim2.new(0.5,0,0.5,0); chCircle.Size=UDim2.new(0,30,0,30); chCircle.BackgroundTransparency=1; chCircle.Parent=chFrame; corner(chCircle,999)
local chCircleS=stroke(chCircle,WHITE,1.5,0)
local function applyCrosshair()
    local style=Flags["Misc/Crosshair Style"] or "Off"
    local col=getColor(Flags["Misc/Crosshair Color"] or "Lime",os.clock(),0)
    local size=Flags["Misc/Crosshair Size"] or 20
    local gap=Flags["Misc/Crosshair Gap"] or 4
    local thick=Flags["Misc/Crosshair Thickness"] or 2
    chFrame.Visible=style~="Off"
    chFrame.Size=UDim2.new(0,size*2,0,size*2)
    local half=size/2
    for _,p in ipairs(chParts) do p.Visible=false; p.BackgroundColor3=col end
    chDot.Visible=false; chCircle.Visible=false
    if style=="Dot" then chDot.Visible=true; chDot.BackgroundColor3=col; chDot.Size=UDim2.new(0,thick*2,0,thick*2)
    elseif style=="Cross" then
        chParts[1].Visible=true; chParts[1].Size=UDim2.new(0,thick,0,size-gap); chParts[1].Position=UDim2.new(0.5,0,0.5,-gap/2-size/2+gap/2)
        chParts[2].Visible=true; chParts[2].Size=UDim2.new(0,thick,0,size-gap); chParts[2].Position=UDim2.new(0.5,0,0.5,gap/2+size/2-gap/2)
        chParts[3].Visible=true; chParts[3].Size=UDim2.new(0,size-gap,0,thick); chParts[3].Position=UDim2.new(0.5,-gap/2-size/2+gap/2,0.5,0)
        chParts[4].Visible=true; chParts[4].Size=UDim2.new(0,size-gap,0,thick); chParts[4].Position=UDim2.new(0.5,gap/2+size/2-gap/2,0.5,0)
    elseif style=="Circle" then
        chCircle.Visible=true; chCircle.Size=UDim2.new(0,size,0,size); chCircleS.Color=col; chCircleS.Thickness=thick
    elseif style=="X" then
        for i,p in ipairs(chParts) do p.Visible=true; p.Size=UDim2.new(0,size*0.7,0,thick); p.Position=UDim2.new(0.5,0,0.5,0); p.Rotation=(i-1)*45 end
    elseif style=="Square" then
        chCircle.Visible=true; chCircle.Size=UDim2.new(0,size,0,size); chCircleS.Color=col; chCircleS.Thickness=thick; corner(chCircle,0)
    end
end
task.spawn(function() while chGui.Parent do task.wait(0.1); pcall(applyCrosshair) end end)

-- QUICK BAR
local setQuickBarVisible,applyQbPosition
do
local QB=Instance.new("CanvasGroup")
QB.AnchorPoint=Vector2.new(0,0.5); QB.Position=UDim2.new(0,24,0.5,0); QB.Size=UDim2.new(0,80,0,0)
QB.AutomaticSize=Enum.AutomaticSize.Y; QB.BackgroundColor3=C.bg; QB.BackgroundTransparency=0.1; QB.GroupTransparency=1; QB.BorderSizePixel=0; QB.ZIndex=6; QB.Visible=false; QB.Parent=gui
corner(QB,14); local qbStroke=stroke(QB,ACC,1.5,0.35); T(qbStroke,"Color")
local qbHandle=Instance.new("Frame"); qbHandle.Size=UDim2.new(1,0,0,16); qbHandle.BackgroundColor3=WHITE; qbHandle.BackgroundTransparency=0.9; qbHandle.BorderSizePixel=0; qbHandle.ZIndex=8; qbHandle.Parent=QB; corner(qbHandle,8)
local qbHandleBar=Instance.new("Frame"); qbHandleBar.AnchorPoint=Vector2.new(0.5,0.5); qbHandleBar.Position=UDim2.new(0.5,0,0.5,0); qbHandleBar.Size=UDim2.new(0,30,0,3); qbHandleBar.BackgroundColor3=WHITE; qbHandleBar.BackgroundTransparency=0.35; qbHandleBar.BorderSizePixel=0; qbHandleBar.ZIndex=9; qbHandleBar.Parent=qbHandle; corner(qbHandleBar,3)
local qbLayout=Instance.new("UIListLayout"); qbLayout.Padding=UDim.new(0,4); qbLayout.SortOrder=Enum.SortOrder.LayoutOrder; qbLayout.HorizontalAlignment=Enum.HorizontalAlignment.Center; qbLayout.Parent=QB
local qbPad=Instance.new("UIPadding"); qbPad.PaddingTop=UDim.new(0,20); qbPad.PaddingBottom=UDim.new(0,8); qbPad.PaddingLeft=UDim.new(0,7); qbPad.PaddingRight=UDim.new(0,7); qbPad.Parent=QB
local qbToggle=Instance.new("TextButton"); qbToggle.Size=UDim2.new(0,22,0,44); qbToggle.BackgroundColor3=C.bg; qbToggle.BackgroundTransparency=0.15; qbToggle.BorderSizePixel=0; qbToggle.Text="‹"; qbToggle.Font=F_MONO; qbToggle.TextSize=18; qbToggle.TextColor3=C.text; qbToggle.AutoButtonColor=false; qbToggle.ZIndex=7; qbToggle.Visible=false; qbToggle.Parent=gui; corner(qbToggle,10); stroke(qbToggle,C.line,1,0.3)
local qbPositions={
    ["Left"]=function() QB.AnchorPoint=Vector2.new(0,0.5); QB.Position=UDim2.new(0,24,0.5,0); qbToggle.AnchorPoint=Vector2.new(0,0.5); qbToggle.Position=UDim2.new(0,4,0.5,0) end,
    ["Right"]=function() QB.AnchorPoint=Vector2.new(1,0.5); QB.Position=UDim2.new(1,-24,0.5,0); qbToggle.AnchorPoint=Vector2.new(1,0.5); qbToggle.Position=UDim2.new(1,-4,0.5,0) end,
    ["Bottom"]=function() QB.AnchorPoint=Vector2.new(0.5,1); QB.Position=UDim2.new(0.5,0,1,-24); qbToggle.AnchorPoint=Vector2.new(0.5,1); qbToggle.Position=UDim2.new(0.5,0,1,-4) end,
    ["Top"]=function() QB.AnchorPoint=Vector2.new(0.5,0); QB.Position=UDim2.new(0.5,0,0,24); qbToggle.AnchorPoint=Vector2.new(0.5,0); qbToggle.Position=UDim2.new(0.5,0,0,4) end,
    ["Left-Top"]=function() QB.AnchorPoint=Vector2.new(0,0); QB.Position=UDim2.new(0,24,0,80); qbToggle.AnchorPoint=Vector2.new(0,0); qbToggle.Position=UDim2.new(0,4,0,80) end,
    ["Left-Bottom"]=function() QB.AnchorPoint=Vector2.new(0,1); QB.Position=UDim2.new(0,24,1,-80); qbToggle.AnchorPoint=Vector2.new(0,1); qbToggle.Position=UDim2.new(0,4,1,-80) end,
    ["Right-Top"]=function() QB.AnchorPoint=Vector2.new(1,0); QB.Position=UDim2.new(1,-24,0,80); qbToggle.AnchorPoint=Vector2.new(1,0); qbToggle.Position=UDim2.new(1,-4,0,80) end,
    ["Right-Bottom"]=function() QB.AnchorPoint=Vector2.new(1,1); QB.Position=UDim2.new(1,-24,1,-80); qbToggle.AnchorPoint=Vector2.new(1,1); qbToggle.Position=UDim2.new(1,-4,1,-80) end,
}
local currentQbPos="Left"; local qbEnabled,qbExpanded=false,false
local qbShown=UDim2.new(0,24,0.5,0); local qbToken,qbAnimUntil=0,0
local function qbArrowFor(pos,expanded) local d; if pos:find("Left") then d="L" elseif pos:find("Right") then d="R" elseif pos=="Top" then d="T" else d="B" end; local close={L="‹",R="›",T="▲",B="▼"}; local open={L="›",R="‹",T="▼",B="▲"}; return expanded and close[d] or open[d] end
local function qbSetArrow() qbToggle.Text=qbArrowFor(currentQbPos,qbExpanded) end
local function qbHiddenFrom(p) local o=140; if currentQbPos:find("Left") then return UDim2.new(p.X.Scale,p.X.Offset-o,p.Y.Scale,p.Y.Offset) elseif currentQbPos:find("Right") then return UDim2.new(p.X.Scale,p.X.Offset+o,p.Y.Scale,p.Y.Offset) elseif currentQbPos=="Top" then return UDim2.new(p.X.Scale,p.X.Offset,p.Y.Scale,p.Y.Offset-o) else return UDim2.new(p.X.Scale,p.X.Offset,p.Y.Scale,p.Y.Offset+o) end end
local function qbPop() local s=qbToggle.Size; qbToggle.Size=UDim2.new(0,s.X.Offset-6,0,s.Y.Offset); tween(qbToggle,0.35,{Size=UDim2.new(0,22,0,44)},Enum.EasingStyle.Back,Enum.EasingDirection.Out) end
local function qbExpand() qbToken+=1; qbExpanded=true; QB.Visible=true; if QB.GroupTransparency>0.95 then QB.Position=qbHiddenFrom(qbShown) end; qbAnimUntil=os.clock()+0.55; tween(QB,0.5,{Position=qbShown,GroupTransparency=0},Enum.EasingStyle.Back,Enum.EasingDirection.Out); qbSetArrow(); qbPop() end
local function qbCollapse() qbToken+=1; local my=qbToken; if qbExpanded and os.clock()>qbAnimUntil then qbShown=QB.Position end; qbExpanded=false; tween(QB,0.4,{Position=qbHiddenFrom(qbShown),GroupTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.In); qbSetArrow(); qbPop(); task.delay(0.42,function() if qbToken==my and not qbExpanded then QB.Visible=false end end) end
function applyQbPosition(pos,animate)
    if not qbPositions[pos] then pos="Left" end
    currentQbPos=pos; qbPositions[pos](); qbShown=QB.Position; qbSetArrow()
    if not qbEnabled then QB.Position=qbHiddenFrom(qbShown); return end
    if qbExpanded and animate then QB.Position=qbHiddenFrom(qbShown); qbAnimUntil=os.clock()+0.55; tween(QB,0.45,{Position=qbShown},Enum.EasingStyle.Back,Enum.EasingDirection.Out)
    elseif not qbExpanded then QB.Position=qbHiddenFrom(qbShown) end
end
function setQuickBarVisible(on)
    on=on and true or false
    if qbEnabled==on then return end
    qbEnabled=on
    if on then qbPositions[currentQbPos](); qbShown=QB.Position; qbToggle.Visible=true; qbToggle.BackgroundTransparency=1; tween(qbToggle,0.4,{BackgroundTransparency=0.15},Enum.EasingStyle.Quint); qbExpand()
    else qbCollapse(); tween(qbToggle,0.35,{BackgroundTransparency=1},Enum.EasingStyle.Quint); task.delay(0.45,function() if not qbEnabled then qbToggle.Visible=false end end) end
end
makeDraggable(qbHandle,QB,nil)
qbToggle.MouseButton1Click:Connect(function() if not qbEnabled then return end; if qbExpanded then qbCollapse() else qbExpand() end end)
qbToggle.MouseEnter:Connect(function() tween(qbToggle,0.15,{BackgroundTransparency=0}) end)
qbToggle.MouseLeave:Connect(function() if qbEnabled then tween(qbToggle,0.15,{BackgroundTransparency=0.15}) end end)
local QBStyle={Hue=0,Sat=0,Val=100,Bg=30,Btn=40,Stroke=40,Rainbow=false}
local function qbGetColor() if QBStyle.Rainbow then return Color3.fromHSV((os.clock()*0.25)%1,0.85,1) end; return Color3.fromHSV(QBStyle.Hue/360,QBStyle.Sat/100,QBStyle.Val/100) end
local function qbApplyStyle()
    local col=qbGetColor()
    QB.BackgroundColor3=C.bg; QB.BackgroundTransparency=QBStyle.Bg/100
    qbStroke.Color=col; qbStroke.Transparency=QBStyle.Stroke/100
    qbHandle.BackgroundColor3=col; qbHandle.BackgroundTransparency=QBStyle.Btn/100
    qbHandleBar.BackgroundColor3=col
    qbToggle.BackgroundColor3=C.bg; qbToggle.TextColor3=col
end
task.spawn(function() while gui.Parent do RunService.Heartbeat:Wait(); if QBStyle.Rainbow and qbEnabled then qbApplyStyle() end end end)
local quickButtons={}
local function makeQuickButton(label,flagKey,iconText)
    local b=Instance.new("TextButton"); b.Size=UDim2.new(1,0,0,42); b.BackgroundColor3=C.row; b.BackgroundTransparency=QBStyle.Btn/100; b.BorderSizePixel=0; b.AutoButtonColor=false; b.Font=F_MONO; b.TextSize=11; b.TextColor3=C.dim; b.Text=iconText or label; b.LayoutOrder=#quickButtons+1; b.Parent=QB; corner(b,9)
    local bs=stroke(b,C.line,1,QBStyle.Stroke/100)
    local function paint() local on=Flags[flagKey]; local col=qbGetColor(); b.BackgroundColor3=on and col or C.row; b.BackgroundTransparency=QBStyle.Btn/100; b.TextColor3=on and C.bg or C.dim; bs.Color=col; bs.Transparency=QBStyle.Stroke/100 end
    b.MouseButton1Click:Connect(function() local nv=not Flags[flagKey]; if Setters[flagKey] then Setters[flagKey](nv) else Flags[flagKey]=nv end; paint(); notify((nv and "ON  " or "OFF ")..label) end)
    b.MouseEnter:Connect(function() if not Flags[flagKey] then b.BackgroundTransparency=math.max(0,QBStyle.Btn/100-0.25) end end)
    b.MouseLeave:Connect(paint)
    quickButtons[#quickButtons+1]={btn=b,flag=flagKey,paint=paint}; paint(); return b
end
makeQuickButton("AIMBOT","Aimbot/Enable","AIM")
makeQuickButton("AUTO SHOOT","Aimbot/Auto Shoot","SHT")
makeQuickButton("FLY","Move/Fly","FLY")
makeQuickButton("NOCLIP","Move/Noclip","NLP")
makeQuickButton("BHOP","Move/Bunnyhop","BHP")
makeQuickButton("AUTO WIN","Aimbot/Auto Win","AWN")
makeQuickButton("SAFE SPOT","Move/Safe Spot","SF")
makeQuickButton("GUN AUTO","Misc/Auto Gun Pickup","GN")
task.spawn(function() while gui.Parent do task.wait(0.25); for _,qb in ipairs(quickButtons) do qb.paint() end end end)
_G.LUXXS_QB_STYLE=QBStyle; _G.LUXXS_QB_APPLY=qbApplyStyle; _G.LUXXS_QB_GET=qbGetColor
end

makeDraggable(top,main)
track(UIS.InputBegan:Connect(function(input,proc) if not proc and input.KeyCode==Enum.KeyCode.RightShift then toggleMenu() end end))

-- ROLE DETECTION
local function scanName(name)
    local n=string.lower(name)
    if n=="knife" or n:find("knife") or n:find("murderknife") then return "Murderer" end
    if n=="gun" or n=="revolver" or n=="sheriff gun" or n:find("revolver") or (n:find("gun") and not n:find("shotgun") and not n:find("stun")) then return "Sheriff" end
    return nil
end
local function scanContainer(container,deep)
    if not container then return nil end
    local list=deep and container:GetDescendants() or container:GetChildren()
    for _,obj in ipairs(list) do if obj:IsA("Tool") or obj:IsA("Model") or obj:IsA("Part") or obj:IsA("MeshPart") then local r=scanName(obj.Name); if r then return r end end end
    return nil
end
local function getRole(plr)
    local char=plr.Character; if not char then return "Innocent" end
    if plr.Team then local tl=string.lower(plr.Team.Name); if tl=="murderer" then return "Murderer" end; if tl=="sheriff" then return "Sheriff" end; if tl=="innocent" then return "Innocent" end end
    for _,src in ipairs({plr,char}) do for _,attr in ipairs({"Role","MM2Role","MurderRole","PlayerRole","Team","role","mm2role"}) do local v=src:GetAttribute(attr); if v~=nil then local rl=string.lower(tostring(v)); if rl=="murderer" or rl=="murder" then return "Murderer" end; if rl=="sheriff" then return "Sheriff" end; if rl=="innocent" then return "Innocent" end end end end
    for _,obj in ipairs(char:GetChildren()) do if obj:IsA("Tool") then local r=scanName(obj.Name); if r then return r end end end
    local r=scanContainer(char,true); if r then return r end
    local bp=plr:FindFirstChildOfClass("Backpack") or plr:FindFirstChild("Backpack")
    if bp then for _,obj in ipairs(bp:GetChildren()) do if obj:IsA("Tool") then local rr=scanName(obj.Name); if rr then return rr end end end; r=scanContainer(bp,true); if r then return r end end
    return "Innocent"
end
local roleCache={}
local function getRoleCached(plr) local c=roleCache[plr]; local now=os.clock(); if c and now-c.t<0.3 then return c.r end; local r=getRole(plr); roleCache[plr]={r=r,t=now}; return r end
Players.PlayerRemoving:Connect(function(p) roleCache[p]=nil end)

-- ESP
local ESPFolder=Instance.new("Folder"); ESPFolder.Name="luxxsESP"; ESPFolder.Parent=gui
local espData={}
local function setLine(f,p1,p2,thick) local dx,dy=p2.X-p1.X,p2.Y-p1.Y; f.Position=UDim2.new(0,(p1.X+p2.X)*0.5,0,(p1.Y+p2.Y)*0.5); f.Size=UDim2.new(0,math.sqrt(dx*dx+dy*dy),0,thick); f.Rotation=math.deg(math.atan2(dy,dx)) end
local BONES={{"Head","UpperTorso"},{"UpperTorso","LowerTorso"},{"UpperTorso","LeftUpperArm"},{"LeftUpperArm","LeftLowerArm"},{"LeftLowerArm","LeftHand"},{"UpperTorso","RightUpperArm"},{"RightUpperArm","RightLowerArm"},{"RightLowerArm","RightHand"},{"LowerTorso","LeftUpperLeg"},{"LeftUpperLeg","LeftLowerLeg"},{"LeftLowerLeg","LeftFoot"},{"LowerTorso","RightUpperLeg"},{"RightUpperLeg","RightLowerLeg"},{"RightLowerLeg","RightFoot"},{"Head","Torso"},{"Torso","Left Arm"},{"Torso","Right Arm"},{"Torso","Left Leg"},{"Torso","Right Leg"}}
local function createESP(plr)
    if espData[plr] or plr==LP then return end
    local d={}
    d.box=Instance.new("Frame"); d.box.BackgroundTransparency=1; d.box.BorderSizePixel=0; d.box.ZIndex=2; d.box.Parent=ESPFolder; d.boxStroke=stroke(d.box,ACC,1.2,0)
    local function mkLabel(size,font) local l=Instance.new("TextLabel"); l.BackgroundTransparency=1; l.Font=font or F_MONO; l.TextSize=size; l.TextColor3=WHITE; l.TextStrokeTransparency=0.4; l.TextStrokeColor3=Color3.new(0,0,0); l.Size=UDim2.new(0,260,0,size+2); l.TextXAlignment=Enum.TextXAlignment.Center; l.ZIndex=4; l.Parent=ESPFolder; return l end
    d.role=mkLabel(13,F_SEC); d.name=mkLabel(12); d.dist=mkLabel(11)
    d.tracer=Instance.new("Frame"); d.tracer.AnchorPoint=Vector2.new(0.5,0.5); d.tracer.BorderSizePixel=0; d.tracer.ZIndex=2; d.tracer.Parent=ESPFolder
    d.hpBg=Instance.new("Frame"); d.hpBg.BackgroundColor3=Color3.fromRGB(14,14,16); d.hpBg.BorderSizePixel=0; d.hpBg.ZIndex=3; d.hpBg.Parent=ESPFolder
    d.hpFill=Instance.new("Frame"); d.hpFill.AnchorPoint=Vector2.new(0,1); d.hpFill.BackgroundColor3=Color3.fromRGB(70,230,110); d.hpFill.BorderSizePixel=0; d.hpFill.Size=UDim2.new(1,0,1,0); d.hpFill.Position=UDim2.new(0,0,1,0); d.hpFill.ZIndex=4; d.hpFill.Parent=d.hpBg
    d.headDot=Instance.new("Frame"); d.headDot.AnchorPoint=Vector2.new(0.5,0.5); d.headDot.Size=UDim2.new(0,8,0,8); d.headDot.BorderSizePixel=0; d.headDot.ZIndex=4; d.headDot.Parent=ESPFolder; corner(d.headDot,999)
    d.skeleton={}
    for i=1,#BONES do local f=Instance.new("Frame"); f.AnchorPoint=Vector2.new(0.5,0.5); f.BorderSizePixel=0; f.BackgroundColor3=WHITE; f.Visible=false; f.ZIndex=3; f.Parent=ESPFolder; d.skeleton[i]=f end
    d.arrow=Instance.new("TextLabel"); d.arrow.BackgroundTransparency=1; d.arrow.Font=F_HEAD; d.arrow.TextSize=22; d.arrow.TextColor3=WHITE; d.arrow.TextStrokeTransparency=0.3; d.arrow.Size=UDim2.new(0,40,0,40); d.arrow.TextXAlignment=Enum.TextXAlignment.Center; d.arrow.ZIndex=4; d.arrow.Visible=false; d.arrow.Parent=ESPFolder
    espData[plr]=d
end
local function removeESP(plr)
    local d=espData[plr]; if not d then return end
    for k,v in pairs(d) do if typeof(v)=="Instance" then pcall(function() v:Destroy() end) elseif type(v)=="table" then for _,o in pairs(v) do pcall(function() o:Destroy() end) end end end
    espData[plr]=nil
end
for _,plr in ipairs(Players:GetPlayers()) do if plr~=LP then createESP(plr) end end
Players.PlayerAdded:Connect(function(plr) task.wait(0.2); createESP(plr) end)
Players.PlayerRemoving:Connect(function(plr) removeESP(plr) end)
local function espAnyOn() return Flags["Visuals/ESP Box"] or Flags["Visuals/Role"] or Flags["Visuals/Name"] or Flags["Visuals/Health"] or Flags["Visuals/Distance"] or Flags["Visuals/Tracers"] or Flags["Visuals/Skeleton"] or Flags["Visuals/Chams"] or Flags["Visuals/Glow"] or Flags["Visuals/Head Dot"] or Flags["Visuals/Offscreen Arrows"] end
track(RunService.RenderStepped:Connect(function()
    local cam=workspace.CurrentCamera; if not cam then return end
    local vp=cam.ViewportSize; local t=os.clock()
    local anyOn=espAnyOn()
    for plr,d in pairs(espData) do
        local char=plr.Character; local hum=char and char:FindFirstChildOfClass("Humanoid"); local hrp=char and char:FindFirstChild("HumanoidRootPart")
        local visible=false; local minX,minY,maxX,maxY=math.huge,math.huge,-math.huge,-math.huge
        if char and hum and hrp and hum.Health>0 and anyOn then
            for _,p in ipairs(char:GetChildren()) do if p:IsA("BasePart") then local sp,onS=cam:WorldToViewportPoint(p.Position); if onS and sp.Z>0 then visible=true; minX=math.min(minX,sp.X-10); maxX=math.max(maxX,sp.X+10); minY=math.min(minY,sp.Y-10); maxY=math.max(maxY,sp.Y+10) end end end
        end
        if visible then
            local role=getRoleCached(plr); local rcol=ROLE_COLORS[role] or WHITE
            local ecol=Flags["Visuals/Color by Role"] and rcol or getColor(Flags["Visuals/ESP Color"],t,0)
            local w,h=maxX-minX,maxY-minY; local cx=(minX+maxX)*0.5
            d.box.Visible=Flags["Visuals/ESP Box"]; d.box.Position=UDim2.new(0,minX,0,minY); d.box.Size=UDim2.new(0,w,0,h); d.boxStroke.Color=ecol
            d.role.Visible=Flags["Visuals/Role"]; d.role.Text=string.upper(role); d.role.TextColor3=rcol; d.role.Position=UDim2.new(0,cx-130,0,minY-48)
            d.name.Visible=Flags["Visuals/Name"]; d.name.Text=plr.Name; d.name.TextColor3=ecol; d.name.Position=UDim2.new(0,cx-130,0,minY-32)
            local dist=(hrp.Position-cam.CFrame.Position).Magnitude
            d.dist.Visible=Flags["Visuals/Distance"]; d.dist.Text="["..math.floor(dist).."m]"; d.dist.Position=UDim2.new(0,cx-130,0,minY+h+2)
            d.hpBg.Visible=Flags["Visuals/Health"]; d.hpBg.Position=UDim2.new(0,minX-6,0,minY); d.hpBg.Size=UDim2.new(0,3,0,h); d.hpFill.Size=UDim2.new(1,0,math.clamp(hum.Health/hum.MaxHealth,0,1),0)
            d.tracer.Visible=Flags["Visuals/Tracers"]
            if d.tracer.Visible then d.tracer.BackgroundColor3=ecol; setLine(d.tracer,Vector2.new(vp.X*0.5,vp.Y),Vector2.new(cx,minY+h),1) end
            local hd=char:FindFirstChild("Head")
            if hd and Flags["Visuals/Head Dot"] then
                local sp,onS=cam:WorldToViewportPoint(hd.Position)
                if onS and sp.Z>0 then d.headDot.Visible=true; d.headDot.Position=UDim2.new(0,sp.X-4,0,sp.Y-4); d.headDot.BackgroundColor3=ecol end
            else d.headDot.Visible=false end
            local skelOn=Flags["Visuals/Skeleton"]
            for i,bone in ipairs(BONES) do
                local ln=d.skeleton[i]
                if skelOn then
                    local p1=char:FindFirstChild(bone[1]); local p2=char:FindFirstChild(bone[2])
                    if p1 and p2 then local s1,o1=cam:WorldToViewportPoint(p1.Position); local s2,o2=cam:WorldToViewportPoint(p2.Position); if o1 and o2 and s1.Z>0 and s2.Z>0 then ln.Visible=true; ln.BackgroundColor3=ecol; setLine(ln,Vector2.new(s1.X,s1.Y),Vector2.new(s2.X,s2.Y),1.5) else ln.Visible=false end
                    else ln.Visible=false end
                else ln.Visible=false end
            end
            d.arrow.Visible=false
        else
            d.box.Visible=false; d.role.Visible=false; d.name.Visible=false; d.dist.Visible=false; d.hpBg.Visible=false; d.tracer.Visible=false; d.headDot.Visible=false
            for _,ln in ipairs(d.skeleton) do ln.Visible=false end
            if Flags["Visuals/Offscreen Arrows"] and char and hrp and hum and hum.Health>0 then
                local sp,onS=cam:WorldToViewportPoint(hrp.Position)
                if sp.Z>0 or onS then
                    local screenCenter=Vector2.new(vp.X*0.5,vp.Y*0.5)
                    local dir=Vector2.new(sp.X-vp.X*0.5,sp.Y-vp.Y*0.5)
                    if dir.Magnitude<1 then dir=Vector2.new(1,0) end
                    local edge=Vector2.new(vp.X*0.5,vp.Y*0.5)+dir.Unit*math.min(vp.X,vp.Y)*0.4
                    if sp.Z<0 then edge=Vector2.new(vp.X*0.5,vp.Y*0.5)-dir.Unit*math.min(vp.X,vp.Y)*0.4 end
                    d.arrow.Visible=true; d.arrow.Position=UDim2.new(0,edge.X-20,0,edge.Y-20); d.arrow.Rotation=math.deg(math.atan2(dir.Y,dir.X))+90
                    d.arrow.Text="▲"; d.arrow.TextColor3=ROLE_COLORS[getRoleCached(plr)] or WHITE
                else d.arrow.Visible=false end
            else d.arrow.Visible=false end
        end
    end
end))

-- CHAMS/GLOW/HITBOX
do
local chamsMap={}; local hitboxMap={}
local function dropCham(plr) local h=chamsMap[plr]; if h then pcall(function() h:Destroy() end); chamsMap[plr]=nil end end
local function dropHitbox(plr) local h=hitboxMap[plr]; if not h then return end; for _,o in pairs(h) do pcall(function() o:Destroy() end) end; hitboxMap[plr]=nil end
Players.PlayerRemoving:Connect(function(p) dropCham(p); dropHitbox(p) end)
track(RunService.Heartbeat:Connect(function()
    local chams,glow=Flags["Visuals/Chams"],Flags["Visuals/Glow"]
    local hbOn=Flags["Visuals/Hitbox Expander"]; local hbSize=Flags["Visuals/Hitbox Size"] or 5
    local t=os.clock()
    for _,plr in ipairs(Players:GetPlayers()) do
        if plr~=LP then
            local char=plr.Character; local hum=char and char:FindFirstChildOfClass("Humanoid")
            if (chams or glow) and char and hum and hum.Health>0 then
                local h=chamsMap[plr]
                if not h or not h.Parent or h.Adornee~=char then
                    if h then pcall(function() h:Destroy() end) end
                    h=Instance.new("Highlight"); h.Name="luxxsCham"; h.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop; h.Adornee=char
                    local ok=pcall(function() h.Parent=char end); if not ok or not h.Parent then h.Parent=ESPFolder end
                    chamsMap[plr]=h
                end
                local col=Flags["Visuals/Color by Role"] and (ROLE_COLORS[getRoleCached(plr)] or WHITE) or getColor(Flags["Visuals/ESP Color"],t,0)
                h.FillColor=col; h.OutlineColor=col
                h.FillTransparency=chams and math.clamp((Flags["Visuals/Chams Fill"] or 50)/100,0,1) or 1
                h.OutlineTransparency=glow and 0.1 or (chams and 0.55 or 1)
                h.Enabled=true
            else dropCham(plr) end
            if hbOn and char then
                local parts=hitboxMap[plr]
                if not parts then
                    parts={}
                    for _,p in ipairs(char:GetChildren()) do if p:IsA("BasePart") and p.Name~="HumanoidRootPart" then local oS=p.Size; parts[p]={orig=oS,origTrans=p.Transparency,origCollide=p.CanCollide}; p.CanCollide=false; p.Transparency=math.max(p.Transparency,0.6); p.Size=Vector3.new(oS.X+hbSize,oS.Y+hbSize,oS.Z+hbSize) end end
                    hitboxMap[plr]=parts
                else for p,d in pairs(parts) do if p.Parent then p.Size=Vector3.new(d.orig.X+hbSize,d.orig.Y+hbSize,d.orig.Z+hbSize) end end end
            else if hitboxMap[plr] then for p,d in pairs(hitboxMap[plr]) do if p.Parent then pcall(function() p.Size=d.orig; p.Transparency=d.origTrans; p.CanCollide=d.origCollide end) end end; hitboxMap[plr]=nil end end
        end
    end
end))
end

-- GUN ESP
local GunESP,GunFolder,dropGunVisual,teleportToGun
do
GunESP={set={},vis={}}
GunFolder=Instance.new("Folder"); GunFolder.Name="luxxsGun"; GunFolder.Parent=gui
local GUN_DROP_NAMES={GunDrop=true,["Gun Drop"]=true,DroppedGun=true,SheriffGun=true}
local function gunPartOf(o)
    if o:IsA("BasePart") and GUN_DROP_NAMES[o.Name] then return o end
    if o:IsA("Tool") and o.Parent==workspace and scanName(o.Name)=="Sheriff" then return o:FindFirstChild("Handle") or o:FindFirstChildWhichIsA("BasePart") end
    return nil
end
local function gunStillValid(p)
    if not p or not p.Parent then return false end
    if GUN_DROP_NAMES[p.Name] then return p:IsDescendantOf(workspace) end
    local tool=p.Parent; return tool:IsA("Tool") and tool.Parent==workspace
end
local function addGun(o) local p=gunPartOf(o); if p then GunESP.set[p]=true end end
function dropGunVisual(p) local v=GunESP.vis[p]; if not v then return end; pcall(function() v.hl:Destroy() end); pcall(function() v.bb:Destroy() end); GunESP.vis[p]=nil end
for _,o in ipairs(workspace:GetDescendants()) do addGun(o) end
track(workspace.DescendantAdded:Connect(addGun))
track(workspace.DescendantRemoving:Connect(function(o) if GunESP.set[o] then GunESP.set[o]=nil; dropGunVisual(o) end end))
local function nearestGun()
    local hrp=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart"); if not hrp then return nil end
    local best,bd=nil,math.huge
    for p in pairs(GunESP.set) do if gunStillValid(p) then local d=(p.Position-hrp.Position).Magnitude; if d<bd then best,bd=p,d end end end
    return best
end
track(RunService.RenderStepped:Connect(function()
    local on=Flags["Visuals/Gun ESP"]; local cam=workspace.CurrentCamera; local t=os.clock()
    for p in pairs(GunESP.set) do
        if not gunStillValid(p) then GunESP.set[p]=nil; dropGunVisual(p)
        elseif on then
            local v=GunESP.vis[p]
            if not v then
                local hl=Instance.new("Highlight"); hl.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop; hl.FillTransparency=0.35; hl.OutlineTransparency=0; hl.Adornee=p; hl.Parent=GunFolder
                local bb=Instance.new("BillboardGui"); bb.AlwaysOnTop=true; bb.Size=UDim2.new(0,120,0,34); bb.StudsOffset=Vector3.new(0,2.5,0); bb.Adornee=p; bb.Parent=GunFolder
                local l=Instance.new("TextLabel"); l.BackgroundTransparency=1; l.Size=UDim2.new(1,0,1,0); l.Font=F_MONO; l.TextSize=13; l.TextStrokeTransparency=0.3; l.TextStrokeColor3=Color3.new(0,0,0); l.Text="GUN"; l.Parent=bb
                v={hl=hl,bb=bb,lbl=l}; GunESP.vis[p]=v
            end
            local col=getColor(Flags["Visuals/Gun Color"] or "Gold",t,0)
            v.hl.FillColor=col; v.hl.OutlineColor=col; v.lbl.TextColor3=col
            local dist=cam and math.floor((p.Position-cam.CFrame.Position).Magnitude) or 0
            v.lbl.Text="GUN ["..dist.."m]"
        else dropGunVisual(p) end
    end
end))
function teleportToGun()
    local p=nearestGun(); if not p then notify("Gun not found"); return end
    local hrp=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart"); if not hrp then return end
    hrp.CFrame=CFrame.new(p.Position+Vector3.new(0,3,0)); hrp.AssemblyLinearVelocity=Vector3.zero
    notify("Teleported to gun")
end
local gunAuto={enabled=false,range=60,thread=nil,lastPos=nil}
function gunAuto:start()
    if self.thread then return end
    self.enabled=true
    self.thread=task.spawn(function()
        while self.enabled do
            task.wait(0.15)
            local hrp=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local g=nearestGun()
                if g then
                    local dist=(g.Position-hrp.Position).Magnitude
                    if dist<=self.range and dist>3 then
                        self.lastPos=hrp.CFrame
                        hrp.CFrame=CFrame.lookAt(g.Position+Vector3.new(0,3,0),g.Position); hrp.AssemblyLinearVelocity=Vector3.zero
                        task.wait(0.15)
                        for _,o in ipairs(g:GetChildren()) do if o:IsA("BasePart") then pcall(function() firetouchinterest(hrp,o,0); firetouchinterest(hrp,o,1) end) end end
                    end
                end
            end
        end
    end)
end
function gunAuto:stop()
    self.enabled=false
    if self.thread then pcall(function() task.cancel(self.thread) end); self.thread=nil end
    if self.lastPos and LP.Character then local hrp=LP.Character:FindFirstChild("HumanoidRootPart"); if hrp then hrp.CFrame=self.lastPos end end
end
_G.LUXXS_GUN_AUTO=gunAuto
end

-- AIM PARTS
local AIM_PARTS_DATA={
    {name="Head",x=33,y=12,w=24,h=24,r=12,dx=45,dy=24},
    {name="Chest",x=27,y=43,w=36,h=30,r=4,dx=45,dy=58},
    {name="Stomach",x=30,y=73,w=30,h=30,r=3,dx=45,dy=88},
    {name="Left Arm",x=12,y=45,w=13,h=60,r=5,dx=18,dy=75},
    {name="Right Arm",x=65,y=45,w=13,h=60,r=5,dx=72,dy=75},
    {name="Left Leg",x=25,y=104,w=18,h=62,r=5,dx=34,dy=135},
    {name="Right Leg",x=47,y=104,w=18,h=62,r=5,dx=56,dy=135}}
local AIM_NAMES={} for i,a in ipairs(AIM_PARTS_DATA) do AIM_NAMES[i]=a.name end
local function resolveBodyPart(char,name)
    if not char then return nil end
    if name=="Head" then return char:FindFirstChild("Head") end
    if name=="Chest" then return char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso") end
    if name=="Stomach" then return char:FindFirstChild("LowerTorso") or char:FindFirstChild("Torso") end
    if name=="Left Arm" then return char:FindFirstChild("LeftUpperArm") or char:FindFirstChild("Left Arm") end
    if name=="Right Arm" then return char:FindFirstChild("RightUpperArm") or char:FindFirstChild("Right Arm") end
    if name=="Left Leg" then return char:FindFirstChild("LeftUpperLeg") or char:FindFirstChild("Left Leg") end
    if name=="Right Leg" then return char:FindFirstChild("RightUpperLeg") or char:FindFirstChild("Right Leg") end
    return char:FindFirstChild("Head")
end
local function hasWeapon()
    local char=LP.Character; if not char then return false end
    for _,obj in ipairs(char:GetChildren()) do if obj:IsA("Tool") then local n=string.lower(obj.Name); if n:find("knife") or n:find("murder") or n:find("gun") or n:find("revolver") or n:find("pistol") or n:find("sheriff") then return true end end end
    return false
end
local rayParams=RaycastParams.new(); pcall(function() rayParams.FilterType=Enum.RaycastFilterType.Exclude end)
local function hasLineOfSight(fromPos,targetChar,targetPos)
    rayParams.FilterDescendantsInstances={LP.Character}
    local result=workspace:Raycast(fromPos,targetPos-fromPos,rayParams)
    if not result then return true end
    return result.Instance:IsDescendantOf(targetChar)
end

-- AIMBOT
do
local fovCircle=Instance.new("Frame"); fovCircle.AnchorPoint=Vector2.new(0.5,0.5); fovCircle.Position=UDim2.new(0.5,0,0.5,0); fovCircle.BackgroundTransparency=1; fovCircle.BorderSizePixel=0; fovCircle.Visible=false; fovCircle.ZIndex=2; fovCircle.Parent=gui; corner(fovCircle,9999)
local fovStroke=stroke(fovCircle,ACC,2,0.1); T(fovStroke,"Color"); fovCircle.BackgroundColor3=ACC; fovCircle.BackgroundTransparency=0.93
local fovLbl=Instance.new("TextLabel"); fovLbl.BackgroundTransparency=1; fovLbl.AnchorPoint=Vector2.new(0.5,1); fovLbl.Position=UDim2.new(0.5,0,0,-4); fovLbl.Size=UDim2.new(0,180,0,14); fovLbl.Font=F_MONO; fovLbl.TextSize=11; fovLbl.TextColor3=WHITE; fovLbl.TextStrokeTransparency=0.4; fovLbl.Parent=fovCircle
local function getFovRadiusPx() local cam=workspace.CurrentCamera; if not cam then return 200 end; return ((Flags["Aimbot/FOV"] or 120)/180)*math.min(cam.ViewportSize.X,cam.ViewportSize.Y) end
local function findAimbotTarget()
    local cam=workspace.CurrentCamera; if not cam then return nil end
    local center=Vector2.new(cam.ViewportSize.X*0.5,cam.ViewportSize.Y*0.5)
    local radius=getFovRadiusPx(); local partName=Flags["Aimbot/Body Part"] or "Head"
    local best,bestDist=nil,math.huge; local origin=cam.CFrame.Position
    local skipInno=Flags["Aimbot/Skip Innocents"]; local wall=Flags["Aimbot/Wall Check"]; local myRole=getRoleCached(LP)
    for _,plr in ipairs(Players:GetPlayers()) do
        if plr~=LP then
            local char=plr.Character; local hum=char and char:FindFirstChildOfClass("Humanoid")
            if char and hum and hum.Health>0 then
                local ok=true
                if skipInno then local r=getRoleCached(plr); if r=="Innocent" or r==myRole then ok=false end end
                if ok then
                    local part=resolveBodyPart(char,partName)
                    if part then
                        local sp=cam:WorldToViewportPoint(part.Position)
                        if sp.Z>0 then
                            local dist=(Vector2.new(sp.X,sp.Y)-center).Magnitude
                            if dist<=radius and dist<bestDist then if (not wall) or hasLineOfSight(origin,char,part.Position) then best,bestDist={player=plr,part=part,char=char},dist end end
                        end
                    end
                end
            end
        end
    end
    return best
end
local aimLastShot=0
local function clickCenter() local cam=workspace.CurrentCamera; if not cam then return end; local vp=cam.ViewportSize; pcall(function() VIM:SendMouseButtonEvent(vp.X*0.5,vp.Y*0.5,0,true,game,0) end); task.wait(0.01); pcall(function() VIM:SendMouseButtonEvent(vp.X*0.5,vp.Y*0.5,0,false,game,0) end) end
local function getEquippedWeaponTool()
    local char=LP.Character; if not char then return nil end
    for _,t in ipairs(char:GetChildren()) do if t:IsA("Tool") then local n=string.lower(t.Name); if n:find("knife") or n:find("murder") or n:find("gun") or n:find("revolver") or n:find("pistol") or n:find("sheriff") then return t end end end
    return nil
end
track(RunService.RenderStepped:Connect(function(dt)
    local cam=workspace.CurrentCamera; if not cam then return end
    local showFov=Flags["Aimbot/Enable"] and Flags["Aimbot/Show FOV"]
    fovCircle.Visible=showFov and true or false
    if showFov then local rr=getFovRadiusPx(); fovCircle.Size=UDim2.new(0,rr*2,0,rr*2); fovCircle.BackgroundColor3=ACC; fovLbl.Text="AIM FOV  r="..math.floor(rr).."px" end
    if not Flags["Aimbot/Enable"] then return end
    if Flags["Aimbot/Weapon Only"] and not hasWeapon() then return end
    local target=findAimbotTarget()
    if target then
        local smooth=math.clamp(Flags["Aimbot/Smoothness"] or 30,1,100)/100
        local alpha=math.clamp(1-smooth,0.03,1)*math.min(1,dt*60)
        local pred=Flags["Aimbot/Prediction"]
        local tgtPos=target.part.Position
        if pred then
            local v=target.part.AssemblyLinearVelocity
            tgtPos=tgtPos+v*0.15
        end
        cam.CFrame=cam.CFrame:Lerp(CFrame.new(cam.CFrame.Position,tgtPos),alpha)
        if Flags["Aimbot/Auto Shoot"] then
            local tool=getEquippedWeaponTool()
            if tool then
                local tn=string.lower(tool.Name); local isKnife=tn:find("knife") or tn:find("murder")
                local now=os.clock(); local delay=(Flags["Aimbot/Shoot Delay"] or 100)/1000
                if now-aimLastShot>=delay then aimLastShot=now; pcall(function() tool:Activate() end); if not isKnife then clickCenter() end end
            end
        end
    end
end))
end

-- ANTI-FLING
do
local flingConn=RunService.Heartbeat:Connect(function()
    if not Flags["Move/Anti-Fling"] then return end
    local char=LP.Character; if not char then return end
    local hrp=char:FindFirstChild("HumanoidRootPart")
    if hrp and hrp.AssemblyLinearVelocity.Magnitude>500 then hrp.AssemblyLinearVelocity=Vector3.zero end
end)
track(flingConn)
end

-- ANTI-KICK
do
local antiKickConn=LP.OnTeleport:Connect(function() end)
local function onKick(msg) if Flags["Misc/Anti-Kick"] then notify("Kick attempted: "..tostring(msg)) end end
LP.PlayerGui.ChildAdded:Connect(function(c) if c.Name=="Message" and Flags["Misc/Anti-Kick"] then pcall(function() c:Destroy() end) end end)
end

-- FARM
local Farm={Enabled=false,Mode="Safe",Speed=80,TeleportDelay=0.15,AntiAFK=false,ReturnOnFinish=false,ReturnPos=nil,LoopThread=nil,Collected=0,Status="idle",MaxDist=100,SafeY=10,MinHealth=30}
local setAntiAFK,setNoclip,startFarm,stopFarm
do
local antiAfkConn=nil
function setAntiAFK(on)
    if antiAfkConn then antiAfkConn:Disconnect(); antiAfkConn=nil end
    if not on then return end
    antiAfkConn=LP.Idled:Connect(function() VU:CaptureController(); VU:ClickButton2(Vector2.new()) end)
end
local coinSet,coinConns={}, {}
local function isCoin(o) return o:IsA("BasePart") and (o.Name=="Coin" or o.Name:find("Coin") or o.Name:find("coin")) end
local function startCoinCache()
    for _,c in ipairs(coinConns) do c:Disconnect() end
    coinConns={}; coinSet={}
    for _,o in ipairs(workspace:GetDescendants()) do if isCoin(o) then coinSet[o]=true end end
    coinConns[1]=workspace.DescendantAdded:Connect(function(o) if isCoin(o) then coinSet[o]=true end end)
    coinConns[2]=workspace.DescendantRemoving:Connect(function(o) if coinSet[o] then coinSet[o]=nil; local hrp=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart"); if Farm.Enabled and hrp and (hrp.Position-o.Position).Magnitude<12 then Farm.Collected+=1 end end end)
end
local function isSafe(pos,startPos)
    if pos.Y < (workspace.FallenPartsDestroyHeight or -500) + 30 then return false end
    if pos.Y > 500 then return false end
    if startPos and (pos-startPos).Magnitude > Farm.MaxDist then return false end
    return true
end
local function getNearestCoin(pos,skip,startPos)
    local best,bestDist,now=nil,math.huge,os.clock()
    for p in pairs(coinSet) do if p.Parent and not (skip[p] and skip[p]>now) then local d=(p.Position-pos).Magnitude; if d<bestDist and isSafe(p.Position,startPos) then best,bestDist=p,d end end end
    return best
end
local function safeTeleport(hrp,pos)
    if not hrp or not hrp.Parent then return false end
    local hum=hrp.Parent:FindFirstChildOfClass("Humanoid")
    local y=math.max(pos.Y, (workspace.FallenPartsDestroyHeight or -500) + 100)
    hrp.CFrame=CFrame.new(Vector3.new(pos.X, y+3, pos.Z)); hrp.AssemblyLinearVelocity=Vector3.zero
    if hum and hum.Health < Farm.MinHealth then hum.Health=hum.MaxHealth end
    return true
end
function startFarm()
    if Farm.LoopThread then return end
    local hrp0=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if Farm.ReturnOnFinish and hrp0 then Farm.ReturnPos=hrp0.CFrame end
    Farm.LoopThread=task.spawn(function()
        startCoinCache(); local skip={}; local lastCollect=0; local startPos=hrp0 and hrp0.Position or nil
        while Farm.Enabled do
            local dt=RunService.Heartbeat:Wait(); local now=os.clock()
            local char=LP.Character; local hrp=char and char:FindFirstChild("HumanoidRootPart"); local hum=char and char:FindFirstChildOfClass("Humanoid")
            if hrp and hum then
                if hum.Health < Farm.MinHealth then
                    if Farm.ReturnPos then hrp.CFrame=Farm.ReturnPos; hrp.AssemblyLinearVelocity=Vector3.zero end
                    hum.Health=hum.MaxHealth; Farm.Status="healed"
                elseif hrp.Position.Y < (workspace.FallenPartsDestroyHeight or -500) + 50 then
                    if startPos then hrp.CFrame=CFrame.new(startPos+Vector3.new(0,5,0)) end
                    Farm.Status="rescued"
                else
                    local tooFast = (now-lastCollect)<0.13
                    if tooFast then Farm.Status="cooldown"; task.wait(0.05)
                    else
                        local coin=getNearestCoin(hrp.Position,skip,startPos)
                        if coin then
                            Farm.Status="to coin"; local target=coin.Position
                            if Farm.Mode=="Safe" then safeTeleport(hrp,target); lastCollect=os.clock()
                            elseif Farm.Mode=="Teleport" then safeTeleport(hrp,target); lastCollect=os.clock()
                            else local d=target-hrp.Position; local step=Farm.Speed*dt; if d.Magnitude<=step then hrp.CFrame=CFrame.new(target) else hrp.CFrame=CFrame.new(hrp.Position+d.Unit*step) end; hrp.AssemblyLinearVelocity=Vector3.zero end
                            if (hrp.Position-target).Magnitude<5 then skip[coin]=os.clock()+0.5 end
                        else Farm.Status="no coins"; task.wait(0.2) end
                    end
                end
            end
        end
        if Farm.ReturnOnFinish and Farm.ReturnPos and LP.Character then local hrp=LP.Character:FindFirstChild("HumanoidRootPart"); if hrp then hrp.CFrame=Farm.ReturnPos end end
        Farm.Status="idle"
    end)
end
function stopFarm()
    Farm.Enabled=false
    if Farm.LoopThread then pcall(function() task.cancel(Farm.LoopThread) end); Farm.LoopThread=nil end
    for _,c in ipairs(coinConns) do c:Disconnect() end
    coinConns={}; setNoclip(false)
end
end

-- FLY/NOCLIP/SAFE SPOT
local Move={Fly=false,Speed=60,Noclip=false}
local flyUpBtn,flyDownBtn,disableFlyMove,setNoclipMove
local SafeSpot={Enabled=false,Range=80,Thread=nil,pos=nil}
do
local mvConn,mvVel,mvGyro,mvControls=nil,nil,nil,nil
local upHeld,downHeld=false,false
local function mkFlyBtn(txt,yOff)
    local b=Instance.new("TextButton"); b.AnchorPoint=Vector2.new(1,0.5); b.Position=UDim2.new(1,-24,0.5,yOff); b.Size=UDim2.new(0,54,0,44)
    b.BackgroundColor3=C.bg; b.BackgroundTransparency=0.1; b.BorderSizePixel=0; b.Text=txt; b.Font=F_MONO; b.TextSize=14; b.TextColor3=C.text
    b.AutoButtonColor=false; b.Visible=false; b.ZIndex=5; b.Parent=gui; stroke(b,ACC,1.5,0); return b
end
flyUpBtn,flyDownBtn=mkFlyBtn("UP",-28),mkFlyBtn("DN",28)
local function bindHold(b,setter)
    b.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then setter(true); b.BackgroundColor3=ACC; b.TextColor3=C.bg end end)
    b.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then setter(false); b.BackgroundColor3=C.bg; b.TextColor3=C.text end end)
end
bindHold(flyUpBtn,function(v) upHeld=v end); bindHold(flyDownBtn,function(v) downHeld=v end)
local function getMoveVector()
    if mvControls then local ok,v=pcall(function() return mvControls:GetMoveVector() end); if ok and typeof(v)=="Vector3" then return v end end
    local hum=LP.Character and LP.Character:FindFirstChildOfClass("Humanoid"); local cam=workspace.CurrentCamera
    if hum and cam then return cam.CFrame:VectorToObjectSpace(hum.MoveDirection) end
    return Vector3.zero
end
function disableFlyMove()
    if mvConn then mvConn:Disconnect(); mvConn=nil end
    if mvVel then pcall(function() mvVel:Destroy() end); mvVel=nil end
    if mvGyro then pcall(function() mvGyro:Destroy() end); mvGyro=nil end
    local hum=LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
    if hum then hum.PlatformStand=false; pcall(function() hum:ChangeState(Enum.HumanoidStateType.GettingUp) end) end
end
enableFlyMove=function()
    disableFlyMove()
    local char=LP.Character; local hrp=char and char:FindFirstChild("HumanoidRootPart"); local hum=char and char:FindFirstChildOfClass("Humanoid")
    if not hrp or not hum then return end
    if not mvControls then pcall(function() local pm=LP:FindFirstChild("PlayerScripts") and LP.PlayerScripts:FindFirstChild("PlayerModule"); if pm then mvControls=require(pm):GetControls() end end) end
    mvVel=Instance.new("BodyVelocity"); mvVel.MaxForce=Vector3.new(9e9,9e9,9e9); mvVel.Velocity=Vector3.zero; mvVel.Parent=hrp
    mvGyro=Instance.new("BodyGyro"); mvGyro.MaxTorque=Vector3.new(9e9,9e9,9e9); mvGyro.P=9e4; mvGyro.D=800; mvGyro.CFrame=hrp.CFrame; mvGyro.Parent=hrp
    hum.PlatformStand=true
    mvConn=RunService.RenderStepped:Connect(function()
        if not hrp.Parent then return end
        local cam=workspace.CurrentCamera; if not cam then return end
        local mv=getMoveVector()
        local dir=cam.CFrame:VectorToWorldSpace(Vector3.new(mv.X,0,mv.Z))
        if UIS:IsKeyDown(Enum.KeyCode.W) and mv.Magnitude==0 then dir+=cam.CFrame.LookVector end
        if UIS:IsKeyDown(Enum.KeyCode.Space) or upHeld then dir+=Vector3.new(0,1,0) end
        if UIS:IsKeyDown(Enum.KeyCode.LeftShift) or downHeld then dir-=Vector3.new(0,1,0) end
        if dir.Magnitude>1 then dir=dir.Unit end
        mvVel.Velocity=dir*Move.Speed
        local look=cam.CFrame.LookVector
        if Vector3.new(look.X,0,look.Z).Magnitude>0.01 then mvGyro.CFrame=CFrame.lookAt(hrp.Position,hrp.Position+Vector3.new(look.X,0,look.Z)) end
    end)
end
local ncConn,ncTouched=nil,{}
function setNoclipMove(on)
    if ncConn then ncConn:Disconnect(); ncConn=nil end
    if on then
        ncConn=RunService.Stepped:Connect(function()
            local char=LP.Character; if not char then return end
            for _,p in ipairs(char:GetDescendants()) do if p:IsA("BasePart") and p.CanCollide then ncTouched[p]=true; p.CanCollide=false end end
        end)
    else for p in pairs(ncTouched) do if p.Parent then pcall(function() p.CanCollide=true end) end end; ncTouched={} end
end
end
local function findSafeSpot()
    local char=LP.Character; local hrp=char and char:FindFirstChild("HumanoidRootPart"); if not hrp then return nil end
    local best,bestDist=nil,-1; local origin=hrp.Position
    local killerPos=nil
    for _,plr in ipairs(Players:GetPlayers()) do if plr~=LP and getRoleCached(plr)=="Murderer" then local kr=plr.Character and plr.Character:FindFirstChild("HumanoidRootPart"); if kr then killerPos=kr.Position end end end
    for r=40,200,20 do for a=0,math.pi*2-0.3,0.5 do
        local testPos=origin+Vector3.new(math.cos(a)*r,0,math.sin(a)*r)
        local ray=workspace:Raycast(testPos+Vector3.new(0,50,0),Vector3.new(0,-100,0))
        if ray then local dist=killerPos and (ray.Position-killerPos).Magnitude or 999; if dist>bestDist then bestDist=dist; best={pos=ray.Position+Vector3.new(0,3,0)} end end
    end end
    return best
end
function SafeSpot:start()
    if self.Thread then return end
    self.Enabled=true
    self.Thread=task.spawn(function()
        while self.Enabled do
            task.wait(1)
            local char=LP.Character; local hrp=char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                local killerNear=false
                for _,plr in ipairs(Players:GetPlayers()) do if plr~=LP and getRoleCached(plr)=="Murderer" then local kr=plr.Character and plr.Character:FindFirstChild("HumanoidRootPart"); if kr and (kr.Position-hrp.Position).Magnitude<self.Range then killerNear=true; break end end end
                if killerNear and self.pos then hrp.CFrame=CFrame.new(self.pos); hrp.AssemblyLinearVelocity=Vector3.zero; notify("Safe Spot: killer близко!")
                elseif not killerNear then local s=findSafeSpot(); if s then self.pos=s.pos; hrp.CFrame=CFrame.new(s.pos) end end
            end
        end
    end)
end
function SafeSpot:stop() self.Enabled=false; if self.Thread then pcall(function() task.cancel(self.Thread) end); self.Thread=nil end end
_G.LUXXS_SAFESPOT=SafeSpot

-- AUTO WIN
local AutoWin={Enabled=false,Teleport=true,AutoEquip=true,Delay=0.2,Thread=nil,Status="idle"}
local startAutoWin,stopAutoWin
do
local function isWeaponTool(t) local n=string.lower(t.Name); return (n:find("knife")~=nil) or (n:find("gun")~=nil) or (n:find("revolver")~=nil) or (n:find("pistol")~=nil) or (n:find("sheriff")~=nil) or (n:find("murder")~=nil) end
local function isKnife(t) local n=string.lower(t.Name); return n:find("knife") or n:find("murder") end
local function getEquippedWeapon() local char=LP.Character; if not char then return nil end; local t=char:FindFirstChildOfClass("Tool"); if t and isWeaponTool(t) then return t end; return nil end
local function equipWeapon()
    local char=LP.Character; if not char then return nil end
    local hum=char:FindFirstChildOfClass("Humanoid"); if not hum then return nil end
    local cur=getEquippedWeapon(); if cur then return cur end
    local bp=LP:FindFirstChildOfClass("Backpack") or LP:FindFirstChild("Backpack"); if not bp then return nil end
    for _,t in ipairs(bp:GetChildren()) do if t:IsA("Tool") and isWeaponTool(t) then pcall(function() hum:EquipTool(t) end); task.wait(0.25); return getEquippedWeapon() or t end end
    return nil
end
local function isAlive(plr) local c=plr and plr.Character; local h=c and c:FindFirstChildOfClass("Humanoid"); local r=c and c:FindFirstChild("HumanoidRootPart"); if c and h and r and h.Health>0 then return c,h,r end return nil end
local function findTarget(myRole)
    local _,_,myRoot=isAlive(LP); if not myRoot then return nil end
    local best,bestScore=nil,math.huge
    for _,plr in ipairs(Players:GetPlayers()) do
        if plr~=LP then
            local c,h,r=isAlive(plr)
            if c then
                local role=getRoleCached(plr); local score=nil
                if myRole=="Murderer" then score=(role=="Sheriff") and 0 or 1
                elseif myRole=="Sheriff" then if role=="Murderer" then score=0 end end
                if score then local comb=score*100000+(r.Position-myRoot.Position).Magnitude; if comb<bestScore then bestScore=comb; best={plr=plr,char=c,hum=h,root=r,role=role} end end
            end
        end
    end
    return best
end
local function fireRemotes(tool,pos,targetChar)
    local cf=CFrame.new(pos)
    for _,d in ipairs(tool:GetDescendants()) do
        if d:IsA("RemoteEvent") then
            pcall(function() d:FireServer(cf) end); pcall(function() d:FireServer(pos) end)
            pcall(function() d:FireServer(1,cf,"AH2") end); pcall(function() d:FireServer(1,pos,"AH2") end)
            pcall(function() d:FireServer(targetChar) end); pcall(function() d:FireServer(tool.Handle.CFrame) end)
        elseif d:IsA("RemoteFunction") then task.spawn(function() pcall(function() d:InvokeServer(cf) end); pcall(function() d:InvokeServer(pos) end) end) end
    end
end
local function touchKill(tool,targetChar)
    if type(firetouchinterest)~="function" then return end
    local handle=tool:FindFirstChild("Handle") or tool:FindFirstChildWhichIsA("BasePart"); if not handle then return end
    for _,p in ipairs(targetChar:GetChildren()) do if p:IsA("BasePart") then pcall(firetouchinterest,handle,p,0); pcall(firetouchinterest,handle,p,1) end end
end
local function clickAt(v) pcall(function() VIM:SendMouseButtonEvent(v.X,v.Y,0,true,game,0) end); task.wait(0.01); pcall(function() VIM:SendMouseButtonEvent(v.X,v.Y,0,false,game,0) end) end
local function aimAt(t) local cam=workspace.CurrentCamera; if cam then cam.CFrame=CFrame.lookAt(cam.CFrame.Position,t) end end
local function step()
    local _,_,hrp=isAlive(LP); if not hrp then AutoWin.Status="waiting"; return end
    local myRole=getRoleCached(LP)
    if myRole~="Murderer" and myRole~="Sheriff" then AutoWin.Status="innocent"; return end
    local target=findTarget(myRole); if not target then AutoWin.Status="no targets"; return end
    local tool=AutoWin.AutoEquip and equipWeapon() or getEquippedWeapon()
    if not tool then AutoWin.Status="no weapon"; return end
    local cam=workspace.CurrentCamera; local tRoot=target.root; local tHead=target.char:FindFirstChild("Head") or tRoot; local isKnifeW=isKnife(tool)
    AutoWin.Status=(myRole=="Sheriff" and "shoot " or "stab ")..target.plr.Name
    if AutoWin.Teleport then
        if isKnifeW then hrp.CFrame=tRoot.CFrame*CFrame.new(0,0,1.8) else local back=tRoot.CFrame*CFrame.new(0,0.5,6); hrp.CFrame=CFrame.lookAt(back.Position,tHead.Position) end
        hrp.AssemblyLinearVelocity=Vector3.zero; task.wait(0.05)
    end
    aimAt(tHead.Position); task.wait(0.02)
    if isKnifeW then touchKill(tool,target.char); pcall(function() tool:Activate() end); fireRemotes(tool,tRoot.Position,target.char); task.wait(0.05); local hum=target.char:FindFirstChildOfClass("Humanoid"); if hum and hum.Health>0 then touchKill(tool,target.char); pcall(function() tool:Activate() end) end
    else pcall(function() tool:Activate() end); fireRemotes(tool,tHead.Position,target.char); if cam then local vp=cam.ViewportSize; clickAt(Vector2.new(vp.X*0.5,vp.Y*0.5)) end; task.wait(0.02); fireRemotes(tool,tHead.Position,target.char); pcall(function() tool:Activate() end); task.wait(0.05); local hum=target.char:FindFirstChildOfClass("Humanoid"); if hum and hum.Health>0 and cam then local vp=cam.ViewportSize; clickAt(Vector2.new(vp.X*0.5,vp.Y*0.5)); fireRemotes(tool,tHead.Position,target.char) end end
    task.wait(0.15)
end
local function autoWinLoop() while AutoWin.Enabled do local ok,e=pcall(step); if not ok then AutoWin.Status="err: "..tostring(e) end; task.wait(AutoWin.Delay) end; AutoWin.Status="idle" end
function startAutoWin() AutoWin.Enabled=true; if not AutoWin.Thread then AutoWin.Thread=task.spawn(autoWinLoop) end end
function stopAutoWin() AutoWin.Enabled=false; if AutoWin.Thread then pcall(function() task.cancel(AutoWin.Thread) end); AutoWin.Thread=nil end; AutoWin.Status="idle" end
end

-- SPECTATE
local Spectate={Enabled=false,Target=nil,origCF=nil}
local specConn=nil
local function startSpectate(target)
    local cam=workspace.CurrentCamera
    if specConn then specConn:Disconnect() end
    Spectate.Enabled=true; Spectate.Target=target; Spectate.origCF=cam.CFrame; cam.CameraType=Enum.CameraType.Scriptable
    specConn=RunService.RenderStepped:Connect(function()
        if not Spectate.Enabled then return end
        local tgt=Spectate.Target; if not tgt or not tgt.Character then return end
        local hrp=tgt.Character:FindFirstChild("HumanoidRootPart") or tgt.Character:FindFirstChild("Head")
        if hrp then cam.CFrame=CFrame.new(hrp.Position+Vector3.new(0,3,8),hrp.Position) end
    end)
end
local function stopSpectate()
    Spectate.Enabled=false
    if specConn then specConn:Disconnect(); specConn=nil end
    local cam=workspace.CurrentCamera
    if Spectate.origCF then cam.CFrame=Spectate.origCF end
    cam.CameraType=Enum.CameraType.Custom
end
_G.LUXXS_SPECTATE={start=startSpectate,stop=stopSpectate}

-- ALERTS
local Alerts={Enabled=false,Range=50,Sound=true,Notify=true,lastNear=false,lastGun=false}
do
local alertSound=Instance.new("Sound"); alertSound.SoundId="rbxassetid://9046713863"; alertSound.Volume=1.5; alertSound.Parent=SoundService
local gunSound=Instance.new("Sound"); gunSound.SoundId="rbxassetid://6042053626"; gunSound.Volume=1; gunSound.Parent=SoundService
track(RunService.Heartbeat:Connect(function()
    if not Alerts.Enabled then return end
    local char=LP.Character; local hrp=char and char:FindFirstChild("HumanoidRootPart"); if not hrp then return end
    local near=false
    for _,plr in ipairs(Players:GetPlayers()) do if plr~=LP and getRoleCached(plr)=="Murderer" then local kr=plr.Character and plr.Character:FindFirstChild("HumanoidRootPart"); if kr and (kr.Position-hrp.Position).Magnitude<Alerts.Range then near=true; break end end end
    if near and not Alerts.lastNear then if Alerts.Sound then alertSound:Play() end; if Alerts.Notify then notify("⚠ MURDERER РЯДОМ!") end end
    Alerts.lastNear=near
    local gunOn=next(GunESP.set)~=nil
    if gunOn and not Alerts.lastGun then if Alerts.Sound then gunSound:Play() end; if Alerts.Notify then notify("🔫 Пистолет упал!") end end
    Alerts.lastGun=gunOn
end))
end

-- WALKSPEED + SPIN + JUMP
local Move2={WalkSpeed=16,SpinSpeed=0,SpinEnabled=false,JumpPower=50,InfJump=false}
local applyWalkSpeed,startSpin,stopSpin
do
local spinAngle=0; local spinThread=nil
function applyWalkSpeed(v) v=tonumber(v) or 16; Move2.WalkSpeed=v; local char=LP.Character; local hum=char and char:FindFirstChildOfClass("Humanoid"); if hum then hum.WalkSpeed=v end end
track(LP.CharacterAdded:Connect(function(c) local hum=c:WaitForChild("Humanoid",10); if hum then task.wait(0.4); hum.WalkSpeed=Move2.WalkSpeed; hum.JumpPower=Move2.JumpPower; hum.UseJumpPower=true end end))
local function spinLoop() while Move2.SpinEnabled do local dt=RunService.RenderStepped:Wait(); local char=LP.Character; local hrp=char and char:FindFirstChild("HumanoidRootPart"); if hrp then spinAngle=spinAngle+math.rad(Move2.SpinSpeed)*dt; if spinAngle>math.pi*2 then spinAngle=spinAngle-math.pi*2 end; hrp.CFrame=CFrame.new(hrp.Position)*CFrame.Angles(0,spinAngle,0) end end end
function startSpin() if spinThread then return end; Move2.SpinEnabled=true; spinThread=task.spawn(spinLoop) end
function stopSpin() Move2.SpinEnabled=false; if spinThread then pcall(function() task.cancel(spinThread) end); spinThread=nil end end
end
track(UIS.JumpRequest:Connect(function()
    if Move2.InfJump then
        local char=LP.Character; if not char then return end
        local hum=char:FindFirstChildOfClass("Humanoid")
        if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
    end
end))

-- BUNNYHOP
local BHop={Enabled=false,Accel=40,Max=120,Boost=4,lastJump=0,vel=nil}
track(UIS.JumpRequest:Connect(function() BHop.lastJump=os.clock() end))
track(RunService.Heartbeat:Connect(function(dt)
    if not BHop.Enabled or Move.Fly then BHop.vel=nil; return end
    local char=LP.Character; local hum=char and char:FindFirstChildOfClass("Humanoid"); local hrp=char and char:FindFirstChild("HumanoidRootPart")
    if not hum or not hrp or hum.Health<=0 then BHop.vel=nil; return end
    local held=UIS:IsKeyDown(Enum.KeyCode.Space) or (os.clock()-BHop.lastJump<0.25)
    local wish=hum.MoveDirection; local grounded=hum.FloorMaterial~=Enum.Material.Air
    if not held or wish.Magnitude<0.1 then if grounded then BHop.vel=nil end; return end
    wish=wish.Unit; local v=hrp.AssemblyLinearVelocity; local h=BHop.vel or Vector3.new(v.X,0,v.Z)
    if grounded then local spd=math.min(math.max(h.Magnitude,hum.WalkSpeed)+BHop.Boost,BHop.Max); h=wish*spd; local jy=hum.UseJumpPower and hum.JumpPower or math.sqrt(2*workspace.Gravity*hum.JumpHeight); hum:ChangeState(Enum.HumanoidStateType.Jumping); hrp.AssemblyLinearVelocity=Vector3.new(h.X,jy,h.Z)
    else local spd=h.Magnitude; if spd>0.1 then local d=h.Unit:Lerp(wish,math.clamp(dt*4,0,1)); if d.Magnitude>0.01 then h=d.Unit*spd end else h=wish*hum.WalkSpeed end; h=h+wish*BHop.Accel*dt; if h.Magnitude>BHop.Max then h=h.Unit*BHop.Max end; hrp.AssemblyLinearVelocity=Vector3.new(h.X,v.Y,h.Z) end
    BHop.vel=h
end))

-- GRAVITY
local Gravity={Enabled=false,Value=196.2}
track(RunService.Heartbeat:Connect(function()
    if Gravity.Enabled then workspace.Gravity=Gravity.Value end
end))

-- CHAT SPAM
local ChatSpam={Enabled=false,Delay=3,Thread=nil}
local function startChatSpam()
    if ChatSpam.Thread then return end
    ChatSpam.Enabled=true
    ChatSpam.Thread=task.spawn(function()
        while ChatSpam.Enabled do
            local msg=CHAT_MESSAGES[math.random(#CHAT_MESSAGES)]
            pcall(function() game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents"):FindFirstChild("SayMessageRequest"):FireServer(msg,"All") end)
            task.wait(ChatSpam.Delay)
        end
    end)
end
local function stopChatSpam() ChatSpam.Enabled=false; if ChatSpam.Thread then pcall(function() task.cancel(ChatSpam.Thread) end); ChatSpam.Thread=nil end end

-- KILL EFFECT
local KillEffect={Enabled=false,Type="Lightning",lastHealth={}}
track(RunService.Heartbeat:Connect(function()
    if not KillEffect.Enabled then return end
    for _,plr in ipairs(Players:GetPlayers()) do
        if plr~=LP and plr.Character then
            local hum=plr.Character:FindFirstChildOfClass("Humanoid")
            if hum then
                local prev=KillEffect.lastHealth[plr] or hum.Health
                if hum.Health<=0 and prev>0 then
                    local hrp=plr.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        if KillEffect.Type=="Explosion" then
                            local exp=Instance.new("Explosion"); exp.Position=hrp.Position; exp.BlastRadius=12; exp.BlastPressure=0; exp.Parent=workspace
                        elseif KillEffect.Type=="Lightning" then
                            local snd=Instance.new("Sound"); snd.SoundId="rbxassetid://5801257793"; snd.Volume=2; snd.Parent=hrp; snd:Play(); task.delay(2,function() snd:Destroy() end)
                        elseif KillEffect.Type=="Fire" then
                            local att=Instance.new("Attachment"); att.Parent=hrp
                            local pe=Instance.new("ParticleEmitter"); pe.Texture="rbxassetid://243660364"; pe.Rate=100; pe.Lifetime=NumberRange.new(0.5,1); pe.Speed=NumberRange.new(3,6); pe.Color=ColorSequence.new(Color3.fromRGB(255,120,0)); pe.Parent=hrp
                            task.delay(1,function() att:Destroy() end)
                        end
                    end
                end
                KillEffect.lastHealth[plr]=hum.Health
            end
        end
    end
end))

-- ANIMATION CHANGER
local AnimChanger={Enabled=false}
local animIds={
    Zombie={idle="rbxassetid://180426354",walk="rbxassetid://180426354",run="rbxassetid://180426354",jump="rbxassetid://180426354"},
    Ninja={idle="rbxassetid://656118852",walk="rbxassetid://656121766",run="rbxassetid://656118852",jump="rbxassetid://656117400"},
    Elder={idle="rbxassetid://845397899",walk="rbxassetid://845403856",run="rbxassetid://845397899",jump="rbxassetid://845397899"},
    Pirate={idle="rbxassetid://750781874",walk="rbxassetid://750782230",run="rbxassetid://750781874",jump="rbxassetid://750782230"},
    Robot={idle="rbxassetid://616006778",walk="rbxassetid://616013216",run="rbxassetid://616006778",jump="rbxassetid://616013216"},
    Toy={idle="rbxassetid://782841498",walk="rbxassetid://782843345",run="rbxassetid://782841498",jump="rbxassetid://782843345"},
    Stylish={idle="rbxassetid://616006778",walk="rbxassetid://616013216",run="rbxassetid://616006778",jump="rbxassetid://616013216"},
}
local function applyAnimation(name)
    if name=="Default" then return end
    local set=animIds[name]
    if not set then return end
    local char=LP.Character; if not char then return end
    local hum=char:FindFirstChildOfClass("Humanoid"); if not hum then return end
    local anim=hum:FindFirstChildOfClass("Animator") or Instance.new("Animator",hum)
    for _,t in ipairs(hum:GetPlayingAnimationTracks()) do pcall(function() t:Stop() end) end
    local function playAsset(id,loop)
        local a=Instance.new("Animation"); a.AnimationId=id
        local track=anim:LoadAnimation(a)
        track.Looped=loop
        track:Play()
    end
    pcall(playAsset,set.idle,true)
end
local function resetAnimation()
    local char=LP.Character; if not char then return end
    local hum=char:FindFirstChildOfClass("Humanoid"); if not hum then return end
    local anim=hum:FindFirstChildOfClass("Animator")
    if anim then for _,t in ipairs(anim:GetPlayingAnimationTracks()) do pcall(function() t:Stop() end) end end
    local animateScript=char:FindFirstChild("Animate")
    if animateScript then animateScript.Disabled=true; task.wait(0.1); animateScript.Disabled=false end
end

-- SKYBOX
local Skybox={Enabled=false,Current="Default",Original={}}
local skyboxes={
    Default=nil,
    Night={"rbxassetid://159400189","rbxassetid://159400205","rbxassetid://159400172","rbxassetid://159400228","rbxassetid://159400244","rbxassetid://159400256"},
    Nebula={"rbxassetid://159400189","rbxassetid://159400205","rbxassetid://159400172","rbxassetid://159400228","rbxassetid://159400244","rbxassetid://159400256"},
    Space={"rbxassetid://159400189","rbxassetid://159400205","rbxassetid://159400172","rbxassetid://159400228","rbxassetid://159400244","rbxassetid://159400256"},
    Purple={"rbxassetid://159400189","rbxassetid://159400205","rbxassetid://159400172","rbxassetid://159400228","rbxassetid://159400244","rbxassetid://159400256"},
}
local function applySkybox(name)
    local sky=Lighting:FindFirstChild("luxxsSkybox")
    if name=="Default" then if sky then sky:Destroy() end; return end
    if sky then sky:Destroy() end
    local set=skyboxes[name]
    if not set then return end
    local s=Instance.new("Sky"); s.Name="luxxsSkybox"
    s.SkyboxBk=set[1]; s.SkyboxDn=set[2]; s.SkyboxFt=set[3]; s.SkyboxLf=set[4]; s.SkyboxRt=set[5]; s.SkyboxUp=set[6]
    s.Parent=Lighting
end

-- AMBIENT
local Ambient={Enabled=false,Color=Color3.fromRGB(100,100,150),Brightness=2}
local origAmbient,origBrightness,origOutdoor
track(RunService.Heartbeat:Connect(function()
    if not Ambient.Enabled then return end
    Lighting.Ambient=Ambient.Color; Lighting.OutdoorAmbient=Ambient.Color; Lighting.Brightness=Ambient.Brightness
end))

-- TIME CHANGER
local TimeChanger={Enabled=false,Time=12}
track(RunService.Heartbeat:Connect(function()
    if not TimeChanger.Enabled then return end
    Lighting.ClockTime=TimeChanger.Time
end))

-- FOV CHANGER
local FovChanger={Enabled=false,Value=70}
local origFov
track(RunService.RenderStepped:Connect(function()
    local cam=workspace.CurrentCamera; if not cam then return end
    if FovChanger.Enabled then cam.FieldOfView=FovChanger.Value end
end))

-- KEYBINDS
local Keybinds={Fly=Enum.KeyCode.F,Aimbot=Enum.KeyCode.G,Noclip=Enum.KeyCode.N}
do
local function showKeyPrompt(title,setter)
    local prompt=Instance.new("Frame"); prompt.Size=UDim2.new(0,260,0,80); prompt.Position=UDim2.new(0.5,-130,0.5,-40); prompt.BackgroundColor3=C.panel; prompt.BorderSizePixel=0; prompt.ZIndex=100; prompt.Parent=gui; corner(prompt,12); stroke(prompt,ACC,1.5,0)
    local lbl=Instance.new("TextLabel"); lbl.BackgroundTransparency=1; lbl.Size=UDim2.new(1,0,0,34); lbl.Font=F_SEC; lbl.TextSize=15; lbl.TextColor3=C.text; lbl.Text="Нажми клавишу для "..title; lbl.Parent=prompt
    local sub=Instance.new("TextLabel"); sub.BackgroundTransparency=1; sub.Position=UDim2.new(0,0,0,36); sub.Size=UDim2.new(1,0,0,34); sub.Font=F_MONO; sub.TextSize=12; sub.TextColor3=C.dim; sub.Text="ESC = отмена"; sub.Parent=prompt
    local conn
    conn=UIS.InputBegan:Connect(function(input) if input.UserInputType==Enum.UserInputType.Keyboard then if input.KeyCode~=Enum.KeyCode.Escape then setter(input.KeyCode) end; conn:Disconnect(); prompt:Destroy() end end)
end
_G.LUXXS_KEYBINDS=Keybinds
_G.LUXXS_SHOWKEY=showKeyPrompt
track(UIS.InputBegan:Connect(function(input,proc)
    if proc or input.UserInputType~=Enum.UserInputType.Keyboard then return end
    local k=input.KeyCode
    if k==Keybinds.Fly then local nv=not Flags["Move/Fly"]; Setters["Move/Fly"](nv); notify("Fly "..(nv and "ON" or "OFF"))
    elseif k==Keybinds.Aimbot then local nv=not Flags["Aimbot/Enable"]; Setters["Aimbot/Enable"](nv); notify("Aimbot "..(nv and "ON" or "OFF"))
    elseif k==Keybinds.Noclip then local nv=not Flags["Move/Noclip"]; Setters["Move/Noclip"](nv); notify("Noclip "..(nv and "ON" or "OFF")) end
end))
end

-- SKINS
local Skin,SKIN_NAMES
do
Skin={orig=setmetatable({},{__mode="k"}),applied=setmetatable({},{__mode="k"}),live={},cfg={KnifeMesh="",KnifeTex="",GunMesh="",GunTex=""}}
local MAT=Enum.Material
local SKINS={
    ["Chroma"]={a=Color3.fromRGB(255,0,0),b=Color3.fromRGB(255,255,0),mat=MAT.Neon,rainbow=true,trail=true,spark=true},
    ["Chroma Dark"]={a=Color3.fromRGB(40,0,60),b=Color3.fromRGB(255,0,180),mat=MAT.Neon,rainbow=true,trail=true,spark=true},
    ["Ice Shard"]={a=Color3.fromRGB(150,225,255),b=Color3.fromRGB(235,250,255),mat=MAT.Ice,trail=true,spark=true},
    ["Frostbite"]={a=Color3.fromRGB(80,180,255),b=Color3.fromRGB(255,255,255),mat=MAT.Plastic,trail=true,spark=true},
    ["Harvester"]={a=Color3.fromRGB(35,12,50),b=Color3.fromRGB(255,120,20),t=Color3.fromRGB(255,120,20),mat=MAT.Metal,trail=true,spark=true},
    ["Heartblade"]={a=Color3.fromRGB(255,50,110),b=Color3.fromRGB(255,200,220),mat=MAT.Neon,trail=true,spark=true},
    ["Gingerblade"]={a=Color3.fromRGB(210,120,50),b=Color3.fromRGB(255,255,255),mat=MAT.SmoothPlastic},
    ["Corrupt"]={a=Color3.fromRGB(20,20,20),b=Color3.fromRGB(190,0,0),t=Color3.fromRGB(190,0,0),mat=MAT.Metal,trail=true},
    ["Lightbringer"]={a=Color3.fromRGB(255,235,150),b=Color3.fromRGB(255,255,255),mat=MAT.Neon,trail=true,spark=true},
    ["Batwing"]={a=Color3.fromRGB(25,20,35),b=Color3.fromRGB(130,60,220),t=Color3.fromRGB(130,60,220),mat=MAT.Metal,trail=true},
    ["Slasher"]={a=Color3.fromRGB(90,0,0),b=Color3.fromRGB(255,40,40),mat=MAT.Neon,trail=true,spark=true},
    ["Shadow"]={a=Color3.fromRGB(0,0,0),b=Color3.fromRGB(60,60,60),t=Color3.fromRGB(60,60,60),mat=MAT.Metal,trail=true},
    ["Candy"]={a=Color3.fromRGB(255,180,220),b=Color3.fromRGB(255,255,255),mat=MAT.Neon,trail=true,spark=true},
    ["Toxic"]={a=Color3.fromRGB(50,255,50),b=Color3.fromRGB(180,255,50),t=Color3.fromRGB(120,255,80),mat=MAT.Neon,trail=true,spark=true},
    ["Lava"]={a=Color3.fromRGB(180,30,0),b=Color3.fromRGB(255,180,0),t=Color3.fromRGB(255,120,0),mat=MAT.Neon,trail=true,spark=true},
    ["Plasma"]={a=Color3.fromRGB(180,0,255),b=Color3.fromRGB(80,180,255),t=Color3.fromRGB(180,80,255),mat=MAT.Neon,trail=true,spark=true},
    ["Void"]={a=Color3.fromRGB(10,0,30),b=Color3.fromRGB(60,0,100),t=Color3.fromRGB(60,0,120),mat=MAT.Neon,trail=true,spark=true},
    ["Royal"]={a=Color3.fromRGB(180,140,20),b=Color3.fromRGB(255,220,80),t=Color3.fromRGB(255,200,60),mat=MAT.Metal,trail=true,spark=true},
    ["Emerald"]={a=Color3.fromRGB(20,180,60),b=Color3.fromRGB(180,255,200),mat=MAT.Neon,trail=true,spark=true},
    ["Sapphire"]={a=Color3.fromRGB(20,60,200),b=Color3.fromRGB(150,220,255),mat=MAT.Neon,trail=true,spark=true},
    ["Ruby"]={a=Color3.fromRGB(180,20,60),b=Color3.fromRGB(255,180,200),mat=MAT.Neon,trail=true,spark=true},
    ["Amethyst"]={a=Color3.fromRGB(130,50,220),b=Color3.fromRGB(220,180,255),mat=MAT.Neon,trail=true,spark=true},
    ["Ghost"]={a=Color3.fromRGB(200,220,255),b=Color3.fromRGB(255,255,255),mat=MAT.Neon,trail=true,spark=true},
    ["Neon Pink"]={a=Color3.fromRGB(255,0,120),b=Color3.fromRGB(255,180,255),mat=MAT.Neon,trail=true,spark=true},
    ["Neon Blue"]={a=Color3.fromRGB(0,180,255),b=Color3.fromRGB(180,240,255),mat=MAT.Neon,trail=true,spark=true},
    ["Neon Green"]={a=Color3.fromRGB(0,255,80),b=Color3.fromRGB(180,255,180),mat=MAT.Neon,trail=true,spark=true},
    ["Gold"]={a=Color3.fromRGB(220,180,20),b=Color3.fromRGB(255,240,180),t=Color3.fromRGB(255,220,60),mat=MAT.Metal,trail=true,spark=true},
    ["Silver"]={a=Color3.fromRGB(180,180,200),b=Color3.fromRGB(255,255,255),mat=MAT.Metal,trail=true,spark=true},
    ["Bronze"]={a=Color3.fromRGB(150,90,30),b=Color3.fromRGB(220,180,120),mat=MAT.Metal},
    ["Blood"]={a=Color3.fromRGB(80,0,0),b=Color3.fromRGB(180,0,0),t=Color3.fromRGB(180,0,0),mat=MAT.Metal,trail=true,spark=true},
    ["Aqua"]={a=Color3.fromRGB(0,180,180),b=Color3.fromRGB(150,255,255),mat=MAT.Neon,trail=true,spark=true},
}
SKIN_NAMES={"Off"}
for name,_ in pairs(SKINS) do SKIN_NAMES[#SKIN_NAMES+1]=name end
table.sort(SKIN_NAMES,function(a,b) if a=="Off" then return true end if b=="Off" then return false end return a<b end)
local function toolKind(t) local r=scanName(t.Name); if r=="Murderer" then return "Knife" elseif r=="Sheriff" then return "Gun" end; return nil end
local function assetId(v) local x=tostring(v or ""):gsub("%s+",""); if x=="" then return "" end; if x:match("^%d+$") then return "rbxassetid://"..x end; return x end
local function saveProps(tool)
    if Skin.orig[tool] then return end
    local o={}
    for _,d in ipairs(tool:GetDescendants()) do if d:IsA("BasePart") then local e={Color=d.Color,Material=d.Material,Transparency=d.Transparency}; if d:IsA("MeshPart") then e.TextureID=d.TextureID end; o[d]=e elseif d:IsA("SpecialMesh") then o[d]={TextureId=d.TextureId,VertexColor=d.VertexColor} end end
    Skin.orig[tool]=o
end
local function restoreTool(tool)
    for _,d in ipairs(tool:GetDescendants()) do if d.Name=="luxxsFx" or d.Name=="luxxsCustom" then pcall(function() d:Destroy() end) end end
    local o=Skin.orig[tool]; if o then for inst,e in pairs(o) do if inst.Parent then for k,v in pairs(e) do pcall(function() inst[k]=v end) end end end end
    Skin.applied[tool]=nil; Skin.live[tool]=nil
end
local function applyTool(tool,kind)
    local skinName=Flags["Skins/"..kind.." Skin"] or "Off"; local def=SKINS[skinName]
    local mesh=assetId(Skin.cfg[kind.."Mesh"]); local tex=assetId(Skin.cfg[kind.."Tex"]); local scl=(Flags["Skins/Mesh Scale %"] or 100)/100
    local sig=skinName.."|"..mesh.."|"..tex.."|"..scl
    if Skin.applied[tool]==sig then return end
    restoreTool(tool); Skin.applied[tool]=sig
    if not def and mesh=="" and tex=="" then return end
    saveProps(tool)
    local handle=tool:FindFirstChild("Handle") or tool:FindFirstChildWhichIsA("BasePart",true); local parts={}
    if def then
        local i=0
        for _,d in ipairs(tool:GetDescendants()) do if d:IsA("BasePart") then i+=1; parts[#parts+1]=d; d.Material=def.mat; d.Color=(i%2==0) and (def.b or def.a) or def.a; if d:IsA("MeshPart") then d.TextureID="" end elseif d:IsA("SpecialMesh") then d.TextureId=""; d.VertexColor=Vector3.new(1,1,1) end end
    end
    if mesh~="" and handle then
        for _,d in ipairs(tool:GetDescendants()) do if d:IsA("BasePart") then d.Transparency=1 end end
        local cp=Instance.new("Part"); cp.Name="luxxsCustom"; cp.Size=Vector3.new(1,1,1); cp.CanCollide=false; cp.CanQuery=false; cp.CanTouch=false; cp.Massless=true
        if def then cp.Color=def.a; cp.Material=def.mat end
        local sm=Instance.new("SpecialMesh"); sm.MeshType=Enum.MeshType.FileMesh; sm.MeshId=mesh; sm.TextureId=tex; sm.Scale=Vector3.new(scl,scl,scl); sm.Parent=cp
        local w=Instance.new("Weld"); w.Part0=handle; w.Part1=cp; w.Parent=cp
        cp.Parent=tool; parts[#parts+1]=cp
    elseif tex~="" then for _,d in ipairs(tool:GetDescendants()) do if d:IsA("MeshPart") then d.TextureID=tex elseif d:IsA("SpecialMesh") then d.TextureId=tex end end end
    local tr,pe
    if def and handle then
        local col=def.t or def.a
        if def.trail then
            local sz=handle.Size; local m=math.max(sz.X,sz.Y,sz.Z); local ax=(sz.X==m) and Vector3.new(1,0,0) or ((sz.Y==m) and Vector3.new(0,1,0) or Vector3.new(0,0,1))
            local a0=Instance.new("Attachment"); a0.Name="luxxsFx"; a0.Position=ax*(m/2); a0.Parent=handle
            local a1=Instance.new("Attachment"); a1.Name="luxxsFx"; a1.Position=-ax*(m/2); a1.Parent=handle
            tr=Instance.new("Trail"); tr.Name="luxxsFx"; tr.Attachment0=a0; tr.Attachment1=a1; tr.Lifetime=0.4; tr.LightEmission=0.8; tr.FaceCamera=true
            tr.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,0.2),NumberSequenceKeypoint.new(1,1)})
            tr.Color=ColorSequence.new(col); tr.Parent=handle
        end
        if def.spark then pe=Instance.new("ParticleEmitter"); pe.Name="luxxsFx"; pe.Rate=18; pe.Lifetime=NumberRange.new(0.4,0.8); pe.Speed=NumberRange.new(1,3); pe.LightEmission=1; pe.Size=NumberSequence.new({NumberSequenceKeypoint.new(0,0.2),NumberSequenceKeypoint.new(1,0)}); pe.Color=ColorSequence.new(col); pe.Parent=handle end
    end
    if def and def.rainbow then Skin.live[tool]={parts=parts,tr=tr,pe=pe} end
end
local function skinRoots() local r={}; if LP.Character then r[#r+1]=LP.Character end; local bp=LP:FindFirstChildOfClass("Backpack"); if bp then r[#r+1]=bp end; return r end
function Skin.refresh()
    local on=Flags["Skins/Enable"]
    for _,root in ipairs(skinRoots()) do for _,t in ipairs(root:GetChildren()) do if t:IsA("Tool") then local k=toolKind(t); if k then if on then applyTool(t,k) elseif Skin.applied[t] then restoreTool(t) end end end end end
end
function Skin.restoreAll() for _,root in ipairs(skinRoots()) do for _,t in ipairs(root:GetChildren()) do if t:IsA("Tool") then pcall(restoreTool,t) end end end end
track(RunService.Heartbeat:Connect(function()
    if next(Skin.live)==nil then return end
    local hue=(os.clock()*0.35)%1
    for tool,l in pairs(Skin.live) do if not tool.Parent then Skin.live[tool]=nil else for i,p in ipairs(l.parts) do if p.Parent then p.Color=Color3.fromHSV((hue+i*0.07)%1,0.85,1) end end; local c=Color3.fromHSV(hue,0.85,1); if l.tr and l.tr.Parent then l.tr.Color=ColorSequence.new(c) end; if l.pe and l.pe.Parent then l.pe.Color=ColorSequence.new(c) end end end
end))
task.spawn(function() while gui.Parent do task.wait(0.25); pcall(Skin.refresh); if Flags["Skins/Enable"] then local char=LP.Character; if char then for _,t in ipairs(char:GetChildren()) do if t:IsA("Tool") then local k=toolKind(t); if k then pcall(applyTool,t,k) end end end end end end)
end

-- FPS
local FPS={Enabled=false,Target=10000,Current=0}
local originalFpsCap=nil
local function applyFpsCap(c) if type(setfpscap)=="function" then pcall(setfpscap,c) end FPS.Current=c end
local function enableFps() if type(getfpscap)=="function" then local ok,cur=pcall(getfpscap); if ok then originalFpsCap=cur end end; applyFpsCap(FPS.Target); notify("FPS unlocked") end
local function disableFps() if originalFpsCap then applyFpsCap(originalFpsCap) else applyFpsCap(60) end end
local fpsGui=Instance.new("ScreenGui"); fpsGui.Name="luxxsFPS"; fpsGui.ResetOnSpawn=false; fpsGui.IgnoreGuiInset=true; fpsGui.DisplayOrder=100; fpsGui.Parent=parent
local fpsFrame=Instance.new("Frame"); fpsFrame.AnchorPoint=Vector2.new(1,0); fpsFrame.Position=UDim2.new(1,-12,0,12); fpsFrame.Size=UDim2.new(0,84,0,24); fpsFrame.BackgroundColor3=C.bg; fpsFrame.BackgroundTransparency=0.1; fpsFrame.BorderSizePixel=0; fpsFrame.ZIndex=5; fpsFrame.Parent=fpsGui
stroke(fpsFrame,C.line,1,0)
local fpsNum=Instance.new("TextLabel"); fpsNum.BackgroundTransparency=1; fpsNum.Position=UDim2.new(0,10,0,0); fpsNum.Size=UDim2.new(1,-12,1,0); fpsNum.Font=F_MONO; fpsNum.TextSize=12; fpsNum.TextColor3=C.text; fpsNum.TextXAlignment=Enum.TextXAlignment.Left; fpsNum.Text="0 FPS"; fpsNum.ZIndex=6; fpsNum.Parent=fpsFrame
local FpsCounter={Avg=0,Max=0,Frames=0,Last=tick()}
task.spawn(function()
    while fpsGui.Parent do
        RunService.RenderStepped:Wait()
        FpsCounter.Frames+=1
        local elapsed=tick()-FpsCounter.Last
        if elapsed>=0.25 then local fps=math.floor(FpsCounter.Frames/elapsed+0.5); FpsCounter.Frames=0; FpsCounter.Last=tick(); FpsCounter.Avg=FpsCounter.Avg==0 and fps or (FpsCounter.Avg*0.9+fps*0.1); if fps>FpsCounter.Max then FpsCounter.Max=fps end; fpsNum.Text=tostring(fps).." FPS" end
    end
end)
makeDraggable(fpsFrame,fpsFrame)

-- FAVORITES
local favTab=createTab("Favorites",true)
local favList=favTab:Frame(1)
local favLayout=Instance.new("UIListLayout"); favLayout.Padding=UDim.new(0,2); favLayout.SortOrder=Enum.SortOrder.LayoutOrder; favLayout.Parent=favList
local favSet={}
local function refreshFav()
    for _,c in ipairs(favList:GetChildren()) do if c:IsA("TextButton") then c:Destroy() end end
    local i=0
    for _,r in ipairs(allRows) do
        if r.key and favSet[r.key] then
            i+=1
            local b=Instance.new("TextButton"); b.Size=UDim2.new(1,0,0,32); b.BackgroundColor3=C.row; b.BackgroundTransparency=0.5; b.BorderSizePixel=0; b.Text="★ "..r.fullText:sub(1,40); b.Font=F_BODY; b.TextSize=13; b.TextColor3=C.text; b.TextXAlignment=Enum.TextXAlignment.Left; b.LayoutOrder=i; b.Parent=favList; corner(b,6)
            b.MouseButton1Click:Connect(function() if Setters[r.key] and Defaults[r.key]~=nil then local cur=Flags[r.key]; if type(cur)=="boolean" then Setters[r.key](not cur) else Setters[r.key](Defaults[r.key]) end end end)
        end
    end
end

-- TABS
local visTab=createTab("Visuals")
visTab:Label("ESP")
visTab:Toggle("ESP Box",false,nil,"Прямоугольник вокруг игроков")
visTab:Toggle("Role",false,nil,"Роль: Murderer/Sheriff/Innocent")
visTab:Toggle("Color by Role",false,nil,"Красить ESP по роли")
visTab:Toggle("Name",false,nil,"Ник над головой")
visTab:Toggle("Health",false,nil,"Полоска HP")
visTab:Toggle("Distance",false,nil,"Расстояние")
visTab:Toggle("Tracers",false,nil,"Линии от низа экрана")
visTab:Toggle("Skeleton",false,nil,"Скелет по костям")
visTab:Toggle("Head Dot",false,nil,"Точка на голове")
visTab:Toggle("Offscreen Arrows",false,nil,"Стрелки к игрокам за экраном")
visTab:Toggle("Chams",false,nil,"Подсветка сквозь стены")
visTab:Toggle("Glow",false,nil,"Свечение контура")
visTab:Slider("Chams Fill",0,100,50,nil,nil,"Прозрачность Chams")
visTab:Choice("ESP Color",COLOR_NAMES,"Lime",nil,"Цвет ESP")
visTab:Toggle("Hitbox Expander",false,nil,"Увеличить хитбоксы")
visTab:Slider("Hitbox Size",0,20,5,nil,nil,"Размер хитбокса")
visTab:Label("Gun ESP")
visTab:Toggle("Gun ESP",false,nil,"Подсветка пистолета")
visTab:Choice("Gun Color",COLOR_NAMES,"Gold",nil,"Цвет метки")
visTab:Button("Teleport to Gun",teleportToGun,"ТП к пистолету")
visTab:Label("Wings")
visTab:Toggle("Wings",false,function(s) if s then buildWings() else destroyCos("wings") end end,"Крылья")
visTab:Choice("Wing Color",WING_COLORS,"White",nil,"Цвет крыльев")
visTab:Slider("Wing Speed",1,10,3,nil,nil,"Скорость взмаха")
visTab:Label("Chinese Hat")
visTab:Toggle("Chinese Hat",false,function(s) if s then buildHat() else destroyCos("hat") end end,"Китайская шляпа")
visTab:Choice("Hat Color",HAT_COLORS,"Custom",nil,"Цвет шляпы")
visTab:Slider("Hat Hue",0,360,280,function(v) _G.LUXXS_HAT_H=v; local f=GradRefresh["Visuals/Hat Saturation"]; if f then f() end end,function() local kp={} for k=0,6 do kp[#kp+1]=ColorSequenceKeypoint.new(k/6,Color3.fromHSV(k/6,1,1)) end return ColorSequence.new(kp) end,"Оттенок")
visTab:Slider("Hat Saturation",0,100,70,function(v) _G.LUXXS_HAT_S=v/100 end,nil,"Насыщенность")
visTab:Slider("Hat Shade",0,100,100,function(v) _G.LUXXS_HAT_V=v/100 end,nil,"Яркость")
visTab:Slider("Hat Transparency",0,100,35,nil,nil,"Прозрачность")
visTab:Label("Trail")
visTab:Toggle("Trail",false,function(s) if s then buildTrail() else destroyCos("trail") end end,"След")
visTab:Choice("Trail Color",COLOR_NAMES,"Rainbow",nil,"Цвет следа")
visTab:Slider("Trail Length",1,30,10,nil,nil,"Длина")
visTab:Slider("Trail Width",1,10,4,nil,nil,"Толщина")
visTab:Label("Aura")
visTab:Toggle("Aura",false,function(s) if s then buildAura() else destroyCos("aura") end end,"Аура из частиц")
visTab:Choice("Aura Color",COLOR_NAMES,"Rainbow",nil,"Цвет ауры")
visTab:Slider("Aura Density",10,200,60,nil,nil,"Плотность частиц")

do
local aimTab=createTab("Aimbot")
aimTab:Label("Aim")
aimTab:Toggle("Enable",false,nil,"Главный выключатель")
aimTab:Toggle("Auto Shoot",true,nil,"Авто-выстрел")
aimTab:Slider("Shoot Delay (ms)",10,500,100,nil,nil,"Задержка")
aimTab:Toggle("Skip Innocents",true,nil,"Игнор невиновных")
aimTab:Toggle("Weapon Only",true,nil,"Только с оружием")
aimTab:Toggle("Wall Check",true,nil,"Проверка стен")
aimTab:Toggle("Prediction",false,nil,"Предсказание движения")
aimTab:Choice("Body Part",AIM_NAMES,"Head",nil,"Куда целиться")
aimTab:Slider("FOV",10,360,120,nil,nil,"Радиус FOV")
aimTab:Slider("Smoothness",1,100,30,nil,nil,"Плавность")
aimTab:Toggle("Show FOV",true,nil,"Показать круг")
aimTab:Label("Auto Win")
aimTab:Toggle("Auto Win",false,function(s) if s then startAutoWin() else stopAutoWin() end end,"Авто-убийство")
aimTab:Toggle("Auto Teleport",true,function(s) AutoWin.Teleport=s end,"ТП к цели")
aimTab:Toggle("Auto Equip Weapon",true,function(s) AutoWin.AutoEquip=s end,"Авто-экипировка")
aimTab:Slider("Auto Win Delay (ms)",50,600,200,function(v) AutoWin.Delay=(tonumber(v) or 200)/1000 end,nil,"Задержка")
aimTab:Button("Show AutoWin Status",function() notify("AutoWin: "..AutoWin.Status) end,"Показать статус")
aimTab:Label("Kill Effect")
aimTab:Toggle("Kill Effect",false,function(s) KillEffect.Enabled=s end,"Эффект при убийстве")
aimTab:Choice("Effect Type",KILL_EFFECTS,"Lightning",function(v) KillEffect.Type=v end,"Тип эффекта")
end

do
local moveTab=createTab("Move")
moveTab:Label("Fly")
moveTab:Toggle("Fly",false,function(state)
    Move.Fly=state; if state then enableFlyMove() else disableFlyMove() end
    local show=state and UIS.TouchEnabled; flyUpBtn.Visible=show; flyDownBtn.Visible=show
    notify(state and "Fly ON" or "Fly OFF")
end,"Свободный полёт")
moveTab:Slider("Fly Speed",10,300,60,function(v) Move.Speed=v end,nil,"Скорость полёта")
moveTab:Label("Noclip")
moveTab:Toggle("Noclip",false,function(state) Move.Noclip=state; setNoclipMove(state); notify(state and "Noclip ON" or "Noclip OFF") end,"Проход сквозь стены")
moveTab:Toggle("Anti-Fling",false,nil,"Защита от отброса")
moveTab:Label("Teleport")
moveTab:Button("Teleport to Gun",teleportToGun,"ТП к пистолету")
moveTab:Label("Walkspeed & Spin")
moveTab:Slider("WalkSpeed",16,1000,16,function(v) applyWalkSpeed(v) end,nil,"Скорость ходьбы")
moveTab:Button("Reset WalkSpeed (16)",function() applyWalkSpeed(16); if Setters["Move/WalkSpeed"] then Setters["Move/WalkSpeed"](16) end end,"Сброс")
moveTab:Slider("JumpPower",50,500,50,function(v) Move2.JumpPower=v; local char=LP.Character; local hum=char and char:FindFirstChildOfClass("Humanoid"); if hum then hum.UseJumpPower=true; hum.JumpPower=v end end,nil,"Сила прыжка")
moveTab:Toggle("Infinite Jump",false,function(s) Move2.InfJump=s end,"Бесконечный прыжок")
moveTab:Toggle("Spin",false,function(s) if s then startSpin() else stopSpin() end end,"Вращение")
moveTab:Slider("Spin Speed",0,1000,0,function(v) Move2.SpinSpeed=v end,nil,"Скорость вращения")
moveTab:Button("Reset Spin (0)",function() Move2.SpinSpeed=0; if Setters["Move/Spin Speed"] then Setters["Move/Spin Speed"](0) end end,"Сброс вращения")
moveTab:Label("Bunnyhop")
moveTab:Toggle("Bunnyhop",false,function(s) BHop.Enabled=s; notify(s and "Bhop ON" or "Bhop OFF") end,"Авто-прыжки")
moveTab:Slider("Bhop Accel",0,300,40,function(v) BHop.Accel=v end,nil,"Ускорение")
moveTab:Slider("Bhop Boost/hop",0,30,4,function(v) BHop.Boost=v end,nil,"Прибавка")
moveTab:Slider("Bhop Max Speed",20,400,120,function(v) BHop.Max=v end,nil,"Максимум")
moveTab:Label("Gravity")
moveTab:Toggle("Gravity Override",false,function(s) Gravity.Enabled=s end,"Переопределить гравитацию")
moveTab:Slider("Gravity Value",0,500,196,function(v) Gravity.Value=v end,nil,"Значение гравитации")
moveTab:Label("Safe Spot")
moveTab:Toggle("Safe Spot",false,function(s) if s then SafeSpot:start() else SafeSpot:stop() end end,"Прятки от убийцы")
moveTab:Slider("Safe Range",30,200,80,function(v) SafeSpot.Range=v end,nil,"Радиус")
end

do
local farmTab=createTab("Farm")
farmTab:Label("Coin auto-farm")
farmTab:Toggle("Enable Farm",false,function(state)
    Farm.Enabled=state
    if state then startFarm(); if Farm.Mode=="Noclip" then setNoclip(true) end; notify("Farm ON ("..Farm.Mode..")") else stopFarm(); notify("Farm OFF") end
end,"Автосбор монет")
farmTab:Choice("Mode",{"Safe","Teleport","Walk"},"Safe",function(v) Farm.Mode=v end,"Safe/Teleport/Walk")
farmTab:Slider("Speed",5,400,80,function(v) Farm.Speed=v end,nil,"Скорость")
farmTab:Slider("Max Distance",30,300,100,function(v) Farm.MaxDist=v end,nil,"Защита от смерти")
farmTab:Slider("Min Health",10,100,30,function(v) Farm.MinHealth=v end,nil,"Порог HP")
farmTab:Toggle("Anti-AFK",false,function(state) Farm.AntiAFK=state; setAntiAFK(state) end,"Anti-AFK")
farmTab:Toggle("Return to Start",false,function(state) Farm.ReturnOnFinish=state end,"Вернуться в начало")
farmTab:Button("Reset Counter",function() Farm.Collected=0; notify("Counter reset") end,"Сброс счётчика")
farmTab:Button("Show Status",function() notify("Collected: "..Farm.Collected.." | "..Farm.Status) end,"Статус")
end

do
local miscTab=createTab("Misc")
local function charOf(plr) local c=plr and plr.Character; local h=c and c:FindFirstChildOfClass("Humanoid"); local r=c and c:FindFirstChild("HumanoidRootPart"); if c and h and r and h.Health>0 then return c,h,r end return nil end
local function tpToRole(role)
    local _,_,me=charOf(LP); if not me then notify("No character") return end
    for _,plr in ipairs(Players:GetPlayers()) do if plr~=LP and getRoleCached(plr)==role then local _,_,r=charOf(plr); if r then me.CFrame=r.CFrame*CFrame.new(0,0,3); me.AssemblyLinearVelocity=Vector3.zero; notify("TP to "..role); return end end end
    notify(role.." not found")
end
miscTab:Label("Teleport")
miscTab:Button("Teleport to Murderer",function() tpToRole("Murderer") end,"ТП к убийце")
miscTab:Button("Teleport to Sheriff",function() tpToRole("Sheriff") end,"ТП к шерифу")
miscTab:Label("Auto Gun Pickup")
miscTab:Toggle("Enable Auto Gun Pickup",false,function(s) if s then gunAuto:start() else gunAuto:stop() end end,"Авто-ТП к пистолету")
miscTab:Slider("Auto Gun Range",20,300,60,function(v) gunAuto.range=v end,nil,"Радиус")
miscTab:Label("Spectate")
miscTab:Button("Spectate Murderer",function()
    for _,p in ipairs(Players:GetPlayers()) do if p~=LP and getRoleCached(p)=="Murderer" then startSpectate(p); notify("Spectate: "..p.Name); return end end
    notify("Murderer not found")
end,"Следить за убийцей")
miscTab:Button("Stop Spectate",stopSpectate,"Вернуть камеру")
miscTab:Label("Alerts")
miscTab:Toggle("Enable Alerts",false,function(s) Alerts.Enabled=s end,"Алерты")
miscTab:Slider("Alert Range",10,200,50,function(v) Alerts.Range=v end,nil,"Дистанция")
miscTab:Toggle("Alert Sound",true,function(s) Alerts.Sound=s end,"Звук")
miscTab:Toggle("Alert Notify",true,function(s) Alerts.Notify=s end,"Уведомления")
miscTab:Label("Keybinds")
miscTab:Button("Bind Fly ["..Keybinds.Fly.Name.."]",function() showKeyPrompt("Fly",function(k) Keybinds.Fly=k; notify("Fly bind: "..k.Name) end) end,"Клавиша Fly")
miscTab:Button("Bind Aimbot ["..Keybinds.Aimbot.Name.."]",function() showKeyPrompt("Aimbot",function(k) Keybinds.Aimbot=k; notify("Aim bind: "..k.Name) end) end,"Клавиша Aimbot")
miscTab:Button("Bind Noclip ["..Keybinds.Noclip.Name.."]",function() showKeyPrompt("Noclip",function(k) Keybinds.Noclip=k; notify("Noclip bind: "..k.Name) end) end,"Клавиша Noclip")
miscTab:Label("Anti-Kick")
miscTab:Toggle("Anti-Kick",false,nil,"Защита от кика")
miscTab:Label("Chat Spam")
miscTab:Toggle("Enable Chat Spam",false,function(s) if s then startChatSpam() else stopChatSpam() end end,"Спам в чат")
miscTab:Slider("Spam Delay",1,30,3,function(v) ChatSpam.Delay=v end,nil,"Задержка")
miscTab:Label("Crosshair")
miscTab:Choice("Crosshair Style",CROSSHAIR_STYLES,"Off",function() applyCrosshair() end,"Стиль прицела")
miscTab:Choice("Crosshair Color",COLOR_NAMES,"Lime",function() applyCrosshair() end,"Цвет")
miscTab:Slider("Crosshair Size",5,60,20,function() applyCrosshair() end,nil,"Размер")
miscTab:Slider("Crosshair Gap",0,20,4,function() applyCrosshair() end,nil,"Зазор")
miscTab:Slider("Crosshair Thickness",1,6,2,function() applyCrosshair() end,nil,"Толщина")
miscTab:Label("Watermark")
miscTab:Toggle("Show Watermark",false,function(s) wmFrame.Visible=s end,"Показать watermark")
miscTab:Label("Quick Bar")
miscTab:Toggle("Quick Bar",false,function(s) setQuickBarVisible(s); notify(s and "Quick Bar ON" or "Quick Bar OFF") end,"Быстрая панель")
miscTab:Choice("Quick Bar Position",QB_POSITIONS,"Left",function(v) applyQbPosition(v,true); notify("QB: "..v) end,"Расположение")
miscTab:Toggle("QB Rainbow",false,function(s) _G.LUXXS_QB_STYLE.Rainbow=s; _G.LUXXS_QB_APPLY() end,"Переливающийся цвет")
miscTab:Slider("QB Hue",0,360,0,function(v) _G.LUXXS_QB_STYLE.Hue=v; _G.LUXXS_QB_APPLY() end,function() local kp={} for k=0,6 do kp[#kp+1]=ColorSequenceKeypoint.new(k/6,Color3.fromHSV(k/6,1,1)) end return ColorSequence.new(kp) end,"Оттенок")
miscTab:Slider("QB Saturation",0,100,0,function(v) _G.LUXXS_QB_STYLE.Sat=v; _G.LUXXS_QB_APPLY() end,nil,"Насыщенность")
miscTab:Slider("QB Shade",0,100,100,function(v) _G.LUXXS_QB_STYLE.Val=v; _G.LUXXS_QB_APPLY() end,nil,"Яркость")
miscTab:Slider("QB Background",0,100,30,function(v) _G.LUXXS_QB_STYLE.Bg=v; _G.LUXXS_QB_APPLY() end,nil,"Прозрачность фона")
miscTab:Slider("QB Buttons",0,100,40,function(v) _G.LUXXS_QB_STYLE.Btn=v; _G.LUXXS_QB_APPLY() end,nil,"Прозрачность кнопок")
miscTab:Slider("QB Stroke",0,100,40,function(v) _G.LUXXS_QB_STYLE.Stroke=v; _G.LUXXS_QB_APPLY() end,nil,"Прозрачность обводки")
miscTab:Label("Screen")
miscTab:Choice("Aspect Ratio",SCREEN_RATIOS,"Default",function(v) ScreenRes.apply(v); notify("Screen: "..v) end,"Cinematic полосы")
end

do
local worldTab=createTab("World")
worldTab:Label("Lighting")
worldTab:Toggle("Time Changer",false,function(s) TimeChanger.Enabled=s end,"Управление временем")
worldTab:Slider("Time",0,24,12,function(v) TimeChanger.Time=v end,nil,"Время суток")
worldTab:Toggle("Ambient Override",false,function(s) Ambient.Enabled=s end,"Своя подсветка")
worldTab:Slider("Ambient R",0,255,100,function(v) Ambient.Color=Color3.fromRGB(v,Ambient.Color.G*255,Ambient.Color.B*255) end,nil,"Красный канал")
worldTab:Slider("Ambient G",0,255,100,function(v) Ambient.Color=Color3.fromRGB(Ambient.Color.R*255,v,Ambient.Color.B*255) end,nil,"Зелёный канал")
worldTab:Slider("Ambient B",0,255,150,function(v) Ambient.Color=Color3.fromRGB(Ambient.Color.R*255,Ambient.Color.G*255,v) end,nil,"Синий канал")
worldTab:Slider("Brightness",0,10,2,function(v) Ambient.Brightness=v end,nil,"Яркость")
worldTab:Label("Skybox")
worldTab:Choice("Skybox",{"Default","Night","Nebula","Space","Purple"},"Default",function(v) applySkybox(v) end,"Сменить небо")
worldTab:Label("Camera")
worldTab:Toggle("FOV Override",false,function(s) FovChanger.Enabled=s end,"Своё FOV")
worldTab:Slider("FOV",10,120,70,function(v) FovChanger.Value=v end,nil,"Значение FOV")
worldTab:Label("Character")
worldTab:Choice("Animation",ANIMATIONS,"Default",function(v) if v=="Default" then resetAnimation() else applyAnimation(v) end end,"Смена анимации")
worldTab:Toggle("Remove Effects",false,function(s)
    for _,e in ipairs(Lighting:GetChildren()) do if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then e.Enabled=not s end end
end,"Убрать пост-эффекты")
worldTab:Toggle("Remove Shadows",false,function(s) Lighting.GlobalShadows=not s end,"Убрать тени")
end

local setTab=createTab("Info")
setTab:Label("About")
setTab:Label2("luXxS-hub v7.0 MAX - crafted by DrHub",F_MONO,12,C.text)
setTab:Label2("Telegram: "..TELEGRAM_LINK,F_MONO,11,C.dim)
setTab:Button("Copy Telegram link",function() if type(setclipboard)=="function" then pcall(setclipboard,TELEGRAM_LINK); notify("Link copied!") else notify(TELEGRAM_LINK) end end)
setTab:Label("Interface")
setTab:Choice("Accent",ACCENT_NAMES,ACC_NAME,function(n) setAccent(ACCENTS[n]); restyleTabs(); if hasFS then ensureFolder(); pcall(function() writefile(FOLDER.."/accent.txt",n) end) end end,"Акцентный цвет")
setTab:Choice("Theme",THEME_NAMES,THEME_NAME,function(n) setTheme(n); if hasFS then ensureFolder(); pcall(function() writefile(FOLDER.."/theme.txt",n) end) end; notify("Тема: "..n.." (перезагрузка)") end,"Тема меню")
setTab:Label("Appearance")
setTab:Slider("Menu Opacity %",20,100,100,function(v) MenuAlpha=math.clamp(v/100,0,1); if isOpen then main.GroupTransparency=1-MenuAlpha end end,nil,"Прозрачность меню")
setTab:Slider("Menu Scale %",70,130,100,function(v) MenuScale=math.clamp((tonumber(v) or 100)/100,0.5,2); if isOpen then scale.Scale=fitScale()*MenuScale end end,nil,"Масштаб меню")
setTab:Label("Configs")
do
local function cfgPath(name) return FOLDER.."/cfg_"..name..".json" end
local isSettingsKey=function(k) return k:sub(1,9)=="Settings/" end
local cfgNameInput=setTab:Input("Config Name","default",nil,"Имя файла")
setTab:Button("Save Config",function()
    if not hasFS then notify("FS not available") return end
    ensureFolder()
    local name=(cfgNameInput.Text~="" and cfgNameInput.Text or "default"):gsub("[^%w_%-]","")
    local data={} for k,v in pairs(Flags) do if not isSettingsKey(k) then data[k]=v end end
    local ok=pcall(function() writefile(cfgPath(name),HttpService:JSONEncode(data)) end)
    notify(ok and ("Saved: "..name) or "Save error")
end,"Сохранить")
setTab:Button("Load Config",function()
    if not hasFS then notify("FS not available") return end
    local name=(cfgNameInput.Text~="" and cfgNameInput.Text or "default"):gsub("[^%w_%-]","")
    local path=cfgPath(name)
    if not isfile(path) then notify("Config not found") return end
    local ok,data=pcall(function() return HttpService:JSONDecode(readfile(path)) end)
    if not ok or type(data)~="table" then notify("Read error") return end
    for k,v in pairs(data) do if Setters[k] and not isSettingsKey(k) then Setters[k](v) end end
    notify("Loaded: "..name)
end,"Загрузить")
setTab:Button("Export to string",function()
    local data={} for k,v in pairs(Flags) do if not isSettingsKey(k) then data[k]=v end end
    local str=HttpService:JSONEncode(data)
    if type(setclipboard)=="function" then pcall(setclipboard,str); notify("Скопировано ("..#str.." символов)") else notify("Clipboard недоступен") end
end,"Экспорт в буфер")
local importInput=setTab:Input("Import string","",nil,"Строка конфига")
setTab:Button("Import from string",function()
    local str=importInput.Text
    if str=="" then notify("Empty") return end
    local ok,data=pcall(function() return HttpService:JSONDecode(str) end)
    if not ok or type(data)~="table" then notify("Invalid") return end
    for k,v in pairs(data) do if Setters[k] and not isSettingsKey(k) then Setters[k](v) end end
    notify("Imported!")
end,"Импорт из строки")
setTab:Button("Reset All",function() for k,d in pairs(Defaults) do if not isSettingsKey(k) and Setters[k] then Setters[k](d) end end; notify("Settings reset") end,"Сбросить всё")
end
setTab:Label("Session")
do
local sessionStart=tick()
local sessionLbl=setTab:Label2("SESSION  00:00:00",F_MONO,12,C.text)
local uptimeLbl=setTab:Label2("UPTIME   00:00:00",F_MONO,12,C.dim)
task.spawn(function()
    while gui.Parent do
        task.wait(1)
        local s=math.floor(tick()-sessionStart)
        local hh=math.floor(s/3600); local mm=math.floor((s%3600)/60); local ss=s%60
        sessionLbl.Text=string.format("SESSION  %02d:%02d:%02d",hh,mm,ss)
        uptimeLbl.Text=string.format("UPTIME   %02d:%02d:%02d",hh,mm,ss)
    end
end)
end
setTab:Button("Close Menu",closeMenu)
setTab:Button("Unload",function()
    for _,c in ipairs(connections) do pcall(function() c:Disconnect() end) end
    destroyCos("wings"); destroyCos("hat"); destroyCos("trail"); destroyCos("aura")
    for plr in pairs(espData) do removeESP(plr) end
    for p in pairs(GunESP.vis) do dropGunVisual(p) end
    pcall(function() GunFolder:Destroy() end)
    pcall(disableFlyMove); pcall(setNoclipMove,false)
    pcall(stopAutoWin); pcall(stopSpin); pcall(stopSpectate); pcall(stopChatSpam)
    BHop.Enabled=false; SafeSpot:stop(); gunAuto:stop()
    pcall(Skin.restoreAll); stopFarm(); disableFps()
    pcall(resetAnimation); pcall(applySkybox,"Default")
    gui:Destroy(); fpsGui:Destroy(); logoGui:Destroy(); chGui:Destroy(); wmGui:Destroy()
end)

do
local skinTab=createTab("Skins")
skinTab:Label("Weapon skins")
skinTab:Toggle("Enable",false,function() Skin.refresh() end,"Включить")
skinTab:List("Knife Skin",SKIN_NAMES,"Off",function() task.spawn(function() task.wait(0.05); Skin.refresh() end) end,"Скин ножа")
skinTab:List("Gun Skin",SKIN_NAMES,"Off",function() task.spawn(function() task.wait(0.05); Skin.refresh() end) end,"Скин пистолета")
skinTab:Label("Custom mesh")
skinTab:Input("Knife MeshId","",function(t) Skin.cfg.KnifeMesh=t; Skin.refresh() end,"ID меша ножа")
skinTab:Input("Knife TextureId","",function(t) Skin.cfg.KnifeTex=t; Skin.refresh() end,"ID текстуры ножа")
skinTab:Input("Gun MeshId","",function(t) Skin.cfg.GunMesh=t; Skin.refresh() end,"ID меша пистолета")
skinTab:Input("Gun TextureId","",function(t) Skin.cfg.GunTex=t; Skin.refresh() end,"ID текстуры пистолета")
skinTab:Slider("Mesh Scale %",10,500,100,function() Skin.refresh() end,nil,"Масштаб меша")
skinTab:Button("Remove all skins",function()
    if Setters["Skins/Knife Skin"] then Setters["Skins/Knife Skin"]("Off") end
    if Setters["Skins/Gun Skin"] then Setters["Skins/Gun Skin"]("Off") end
    Skin.cfg.KnifeMesh=""; Skin.cfg.KnifeTex=""; Skin.cfg.GunMesh=""; Skin.cfg.GunTex=""
    Skin.refresh(); notify("Skins removed")
end,"Убрать все скины")
end

do
local fpsTab=createTab("FPS")
fpsTab:Label("Unlocker")
fpsTab:Toggle("Enable Unlock",false,function(s) FPS.Enabled=s; if s then enableFps() else disableFps() end end,"Разблокировать FPS")
fpsTab:Slider("Target FPS",60,10000,10000,function(v) FPS.Target=v; if FPS.Enabled then applyFpsCap(v) end end,nil,"Целевой FPS")
fpsTab:Button("60 FPS",function() if Setters["FPS/Target FPS"] then Setters["FPS/Target FPS"](60) end end)
fpsTab:Button("120 FPS",function() if Setters["FPS/Target FPS"] then Setters["FPS/Target FPS"](120) end end)
fpsTab:Button("240 FPS",function() if Setters["FPS/Target FPS"] then Setters["FPS/Target FPS"](240) end end)
fpsTab:Button("1000 FPS",function() if Setters["FPS/Target FPS"] then Setters["FPS/Target FPS"](1000) end end)
fpsTab:Toggle("Show Counter",true,function(s) fpsFrame.Visible=s end,"Показать счётчик")
fpsTab:Label("Optimization")
fpsTab:Toggle("Remove Shadows",false,function(s) Lighting.GlobalShadows=not s end,"Убрать тени")
fpsTab:Toggle("Remove Fog",false,function(s) Lighting.FogEnd=s and 1e6 or 100000 end,"Убрать туман")
fpsTab:Toggle("Remove Effects",false,function(s)
    for _,e in ipairs(Lighting:GetChildren()) do if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then e.Enabled=not s end end
end,"Убрать Bloom/Blur/SunRays")
fpsTab:Toggle("Low Graphics",false,function(s)
    if s then
        if s then
            for _,d in ipairs(workspace:GetDescendants()) do
                if d:IsA("Decal") or d:IsA("Texture") then d.Transparency=1 end
                if d:IsA("ParticleEmitter") then d.Enabled=false end
            end
        end
    end
end,"Убрать текстуры/частицы")
end

local profileTab=createTab("Profile")
profileTab:Label("Player")
local profUser=profileTab:Label2("USER      "..LP.Name,F_MONO,13,C.text)
local profRole=profileTab:Label2("ROLE      Innocent",F_MONO,13,C.text)
local profSession=profileTab:Label2("SESSION   00:00:00",F_MONO,12,C.dim)
local profCoins=profileTab:Label2("COINS     0",F_MONO,12,C.dim)
local profFps=profileTab:Label2("FPS       0 | avg 0 | max 0",F_MONO,12,C.dim)
local profUserId=profileTab:Label2("USERID    "..LP.UserId,F_MONO,11,C.dim)
local profAccount=profileTab:Label2("ACCOUNT   "..LP.AccountAge.." days",F_MONO,11,C.dim)
local profPlace=profileTab:Label2("PLACE     "..game.PlaceId,F_MONO,11,C.dim)
profileTab:Button("Refresh",function()
    profUser.Text="USER      "..LP.Name
    profRole.Text="ROLE      "..getRole(LP)
    profCoins.Text="COINS     "..Farm.Collected
    profUserId.Text="USERID    "..LP.UserId
    profAccount.Text="ACCOUNT   "..LP.AccountAge.." days"
    profPlace.Text="PLACE     "..game.PlaceId
    notify("Refreshed")
end,"Обновить")
profileTab:Button("Copy UserId",function() if type(setclipboard)=="function" then pcall(setclipboard,tostring(LP.UserId)); notify("UserId copied") end end,"Копировать ID")

-- PREVIEW
local function solid(p,x,y,w,h,color,z,r) local f=Instance.new("Frame"); f.Position=UDim2.new(0,x,0,y); f.Size=UDim2.new(0,w,0,h); f.BackgroundColor3=color; f.BorderSizePixel=0; f.ZIndex=z or 1; f.Parent=p; if r and r>0 then corner(f,r) end; return f end
local function line(p,x1,y1,x2,y2,thick,color,z)
    local dx,dy=x2-x1,y2-y1
    local f=Instance.new("Frame"); f.AnchorPoint=Vector2.new(0.5,0.5); f.Position=UDim2.new(0,(x1+x2)/2,0,(y1+y2)/2); f.Size=UDim2.new(0,math.sqrt(dx*dx+dy*dy),0,thick); f.Rotation=math.deg(math.atan2(dy,dx)); f.BackgroundColor3=color; f.BorderSizePixel=0; f.ZIndex=z or 1; f.Parent=p
    return f
end
local function buildPreview(panel)
    local PW,PH=250,412
    panel.BackgroundColor3=WHITE; panel.ClipsDescendants=true; corner(panel,14)
    gradient(panel,90,ColorSequence.new(Color3.fromRGB(34,24,50),Color3.fromRGB(8,8,12)))
    T(stroke(panel,ACC,1.5,0.4),"Color")
    for i,y in ipairs({348,358,371,388,410}) do local f=solid(panel,0,y,PW,1,WHITE,1); f.BackgroundTransparency=0.9-i*0.02; T(f,"BackgroundColor3") end
    for i=-5,5 do local l=line(panel,125+i*6,340,125+i*44,412,1,WHITE,1); l.BackgroundTransparency=0.9; T(l,"BackgroundColor3") end
    local scanBand=solid(panel,0,0,PW,38,WHITE,2); T(scanBand,"BackgroundColor3")
    gradient(scanBand,90,nil,NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(1,0.8)}))
    local scanLine=solid(panel,0,0,PW,1,WHITE,2); scanLine.BackgroundTransparency=0.3; T(scanLine,"BackgroundColor3")
    local beam=solid(panel,0,0,170,340,WHITE,1); beam.AnchorPoint=Vector2.new(0.5,0); beam.Position=UDim2.new(0.5,0,0,24); beam.BackgroundTransparency=0; T(beam,"BackgroundColor3")
    gradient(beam,90,nil,NumberSequence.new({NumberSequenceKeypoint.new(0,0.9),NumberSequenceKeypoint.new(1,1)}))
    local orbit=solid(panel,0,0,210,210,WHITE,1,9999); orbit.AnchorPoint=Vector2.new(0.5,0.5); orbit.Position=UDim2.new(0.5,0,0,220); orbit.BackgroundTransparency=1
    local orbitS=stroke(orbit,ACC,2,0); T(orbitS,"Color")
    local og=Instance.new("UIGradient"); og.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(0.3,0.9),NumberSequenceKeypoint.new(1,1)}); og.Parent=orbitS
    local dot=solid(panel,12,10,5,5,WHITE,9); T(dot,"BackgroundColor3")
    local cap=Instance.new("TextLabel"); cap.BackgroundTransparency=1; cap.Position=UDim2.new(0,24,0,3); cap.Size=UDim2.new(0,80,0,18); cap.Font=F_MONO; cap.TextSize=10; cap.TextColor3=C.dim; cap.TextXAlignment=Enum.TextXAlignment.Left; cap.Text="PREVIEW // LIVE"; cap.ZIndex=9; cap.Parent=panel
    local aimCap=Instance.new("TextLabel"); aimCap.BackgroundTransparency=1; aimCap.AnchorPoint=Vector2.new(1,0); aimCap.Position=UDim2.new(1,-12,0,3); aimCap.Size=UDim2.new(0,130,0,18); aimCap.Font=F_MONO; aimCap.TextSize=10; aimCap.TextXAlignment=Enum.TextXAlignment.Right; aimCap.ZIndex=9; aimCap.Parent=panel; T(aimCap,"TextColor3")
    solid(panel,0,23,PW,1,C.line,3)
    local strip=solid(panel,0,PH-26,PW,26,Color3.fromRGB(12,12,15),8); strip.BackgroundTransparency=0.05
    solid(panel,0,PH-26,PW,1,C.line,9)
    local tagsL=Instance.new("TextLabel"); tagsL.BackgroundTransparency=1; tagsL.Position=UDim2.new(0,10,0,PH-26); tagsL.Size=UDim2.new(1,-20,0,26); tagsL.Font=F_MONO; tagsL.TextSize=10; tagsL.TextColor3=C.dim; tagsL.TextXAlignment=Enum.TextXAlignment.Left; tagsL.TextTruncate=Enum.TextTruncate.AtEnd; tagsL.Text="NO MODULES"; tagsL.ZIndex=10; tagsL.Parent=panel
    local glow={}
    for i=1,4 do local s=230-i*40; local c=solid(panel,0,0,s,s,WHITE,1,9999); c.AnchorPoint=Vector2.new(0.5,0.5); c.Position=UDim2.new(0.5,0,0,215); c.BackgroundTransparency=0.95; glow[i]=c end
    local shadow=solid(panel,0,0,120,22,Color3.new(0,0,0),1,9999); shadow.AnchorPoint=Vector2.new(0.5,0.5); shadow.Position=UDim2.new(0.5,0,0,350); shadow.BackgroundTransparency=0.35
    local ring1=solid(panel,0,0,110,20,WHITE,1,9999); ring1.AnchorPoint=Vector2.new(0.5,0.5); ring1.Position=UDim2.new(0.5,0,0,350); ring1.BackgroundTransparency=1
    local ring1S=stroke(ring1,ACC,1.5,0.2)
    local ring2=solid(panel,0,0,110,20,WHITE,1,9999); ring2.AnchorPoint=Vector2.new(0.5,0.5); ring2.Position=UDim2.new(0.5,0,0,350); ring2.BackgroundTransparency=1
    local ring2S=stroke(ring2,ACC,1,0.6)
    local particles={}
    math.randomseed(os.time())
    for i=1,14 do local f=solid(panel,0,0,2,2,WHITE,2); particles[i]={f=f,x=math.random(12,238),y=math.random(40,370),sp=math.random(8,24),ph=math.random()*6} end
    local fovRing=solid(panel,0,0,100,100,WHITE,2,9999); fovRing.AnchorPoint=Vector2.new(0.5,0.5); fovRing.Position=UDim2.new(0.5,0,0,222); fovRing.BackgroundTransparency=1; fovRing.Visible=false
    local fovS=stroke(fovRing,ACC,1,0.45)
    local tracer=solid(panel,126,349,1,37,ACC,2); tracer.Visible=false
    local fig=Instance.new("Frame"); fig.AnchorPoint=Vector2.new(0.5,0.5); fig.Position=UDim2.new(0.5,0,0,222); fig.Size=UDim2.new(0,90,0,170); fig.BackgroundTransparency=1; fig.Parent=panel
    local figScale=Instance.new("UIScale"); figScale.Scale=1.2; figScale.Parent=fig
    local body=Instance.new("Frame"); body.Size=UDim2.new(1,0,1,0); body.BackgroundTransparency=1; body.Parent=fig
    local trailF={}
    for k=1,14 do local f=solid(body,0,0,12,10,WHITE,1,4); f.AnchorPoint=Vector2.new(0.5,0.5); f.Visible=false; trailF[k]=f end
    local wingF={}
    local lens={64,60,55,49,43,37}
    for _,side in ipairs({-1,1}) do for i=1,6 do local f=solid(body,0,0,lens[i],8,WHITE,1,4); f.AnchorPoint=Vector2.new(0.5,0.5); f.Visible=false; gradient(f,0,nil,NumberSequence.new({NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,0.65)})); wingF[#wingF+1]={f=f,side=side,i=i,len=lens[i]} end end
    local overlays={}
    for _,a in ipairs(AIM_PARTS_DATA) do local ov=solid(body,a.x,a.y,a.w,a.h,AIM_RED,4,a.r); ov.BackgroundTransparency=1; overlays[a.name]=ov end
    local bodyParts={}
    local function seg(x,y,w,h,r)
        local f=solid(body,x,y,w,h,BODY_GRAY,3,r); gradient(f,90,ColorSequence.new(WHITE,Color3.fromRGB(122,122,136)))
        local s=Instance.new("UIStroke"); s.Thickness=1; s.Color=WHITE; s.Transparency=0.78; s.ApplyStrokeMode=Enum.ApplyStrokeMode.Border; s.Parent=f
        bodyParts[#bodyParts+1]={f=f,s=s}; return f
    end
    seg(41,35,8,8,2); seg(33,12,24,24,12); seg(27,43,36,30,4); seg(30,73,30,18,3); seg(28,91,34,13,3)
    seg(13,45,12,31,5); seg(12,77,10,28,4); seg(11,105,8,8,4)
    seg(65,45,12,31,5); seg(68,77,10,28,4); seg(71,105,8,8,4)
    seg(26,104,17,35,5); seg(28,140,13,26,4); seg(25,165,18,5,2)
    seg(47,104,17,35,5); seg(49,140,13,26,4); seg(47,165,18,5,2)
    for _,j in ipairs({{27,48},{63,48},{19,77},{71,77},{35,104},{55,104},{34,140},{56,140}}) do seg(j[1]-3,j[2]-3,6,6,3) end
    local visor=solid(body,37,20,16,5,Color3.fromRGB(26,26,32),4,2); visor.BackgroundTransparency=0.15
    local visorGlint=solid(body,39,21,6,1,WHITE,5); T(visorGlint,"BackgroundColor3")
    local emblem=Instance.new("TextLabel"); emblem.BackgroundTransparency=1; emblem.Position=UDim2.new(0,27,0,52); emblem.Size=UDim2.new(0,36,0,14); emblem.Font=F_HEAD; emblem.TextSize=8; emblem.TextTransparency=0.2; emblem.Text="LX"; emblem.ZIndex=4; emblem.Parent=body; T(emblem,"TextColor3")
    local belt=solid(body,28,91,34,2,WHITE,4); belt.BackgroundTransparency=0.4; T(belt,"BackgroundColor3")
    local skel=Instance.new("Frame"); skel.Size=UDim2.new(1,0,1,0); skel.BackgroundTransparency=1; skel.ZIndex=6; skel.Visible=false; skel.Parent=body
    local J={head={45,24},neck={45,40},shL={27,48},shR={63,48},elL={18,78},elR={72,78},haL={15,108},haR={75,108},pel={45,98},hipL={35,104},hipR={55,104},knL={34,140},knR={56,140},ftL={34,166},ftR={56,166}}
    local BPREV={{"head","neck"},{"neck","pel"},{"neck","shL"},{"neck","shR"},{"shL","elL"},{"elL","haL"},{"shR","elR"},{"elR","haR"},{"pel","hipL"},{"pel","hipR"},{"hipL","knL"},{"knL","ftL"},{"hipR","knR"},{"knR","ftR"}}
    local skelParts={}
    for _,b in ipairs(BPREV) do local a,c=J[b[1]],J[b[2]]; skelParts[#skelParts+1]=line(skel,a[1],a[2],c[1],c[2],2,WHITE,6) end
    for _,p in pairs(J) do skelParts[#skelParts+1]=solid(skel,p[1]-2.5,p[2]-2.5,5,5,WHITE,7,3) end
    local hatS={}
    local brim=solid(body,3,11,84,4,WHITE,5,2)
    gradient(brim,0,ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(140,140,140)),ColorSequenceKeypoint.new(0.5,WHITE),ColorSequenceKeypoint.new(1,Color3.fromRGB(130,130,130))}))
    brim.Visible=false; hatS[1]=brim
    for i=1,22 do
        local t=(i-1)/21; local w=56*(1-t)^1.3+3
        local hf=solid(body,45-w/2,13-i*2,w,2,WHITE,5,1)
        gradient(hf,0,ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(160,160,160)),ColorSequenceKeypoint.new(0.45,WHITE),ColorSequenceKeypoint.new(1,Color3.fromRGB(130,130,130))}))
        hf.Visible=false; hatS[#hatS+1]=hf
    end
    local aimUI={}
    for _,a in ipairs(AIM_PARTS_DATA) do
        local dotb=Instance.new("TextButton"); dotb.AnchorPoint=Vector2.new(0.5,0.5); dotb.Position=UDim2.new(0,a.dx,0,a.dy); dotb.Size=UDim2.new(0,11,0,11); dotb.BackgroundColor3=Color3.fromRGB(230,230,240); dotb.BackgroundTransparency=0.4; dotb.BorderSizePixel=0; dotb.Text=""; dotb.AutoButtonColor=false; dotb.ZIndex=12; dotb.Parent=body; corner(dotb,6)
        local ds=stroke(dotb,WHITE,1,0.5)
        local ui={a=a,dot=dotb,ds=ds,hover=false}
        dotb.MouseEnter:Connect(function() ui.hover=true end)
        dotb.MouseLeave:Connect(function() ui.hover=false end)
        dotb.MouseButton1Click:Connect(function() Setters["Aimbot/Body Part"](a.name) end)
        aimUI[#aimUI+1]=ui
    end
    local aimDot=solid(body,45,24,6,6,AIM_RED,13,3); aimDot.AnchorPoint=Vector2.new(0.5,0.5)
    local ret={}
    for i=1,4 do ret[i]=solid(body,0,0,(i<=2) and 6 or 1,(i<=2) and 1 or 6,AIM_RED,13); ret[i].AnchorPoint=Vector2.new(0.5,0.5) end
    local boxF=solid(fig,2,6,86,164,WHITE,7); boxF.BackgroundTransparency=1; boxF.Visible=false
    local br={}
    for i=1,8 do br[i]=solid(fig,0,0,2,2,WHITE,8); br[i].Visible=false end
    local function setBrackets(x,y,w,h,col,vis)
        local L=math.min(14,w*0.3,h*0.2)
        local specs={{x,y,L,2},{x,y,2,L},{x+w-L,y,L,2},{x+w-2,y,2,L},{x,y+h-2,L,2},{x,y+h-L,2,L},{x+w-L,y+h-2,L,2},{x+w-2,y+h-L,2,L}}
        for i,s in ipairs(specs) do local f=br[i]; f.Visible=vis; f.Position=UDim2.new(0,s[1],0,s[2]); f.Size=UDim2.new(0,s[3],0,s[4]); f.BackgroundColor3=col end
    end
    local function espLabel(font,size) local l=Instance.new("TextLabel"); l.BackgroundTransparency=1; l.Size=UDim2.new(0,130,0,13); l.Font=font; l.TextSize=size; l.ZIndex=8; l.Visible=false; l.TextStrokeTransparency=0.5; l.TextStrokeColor3=Color3.new(0,0,0); l.Parent=fig; return l end
    local roleL=espLabel(F_SEC,10); local nameL=espLabel(F_MONO,9); nameL.Text="PLAYER"; local distL=espLabel(F_MONO,8); distL.TextColor3=WHITE; distL.Text="[42m]"
    local hpBar=solid(fig,-5,6,3,164,Color3.fromRGB(14,14,16),8); hpBar.Visible=false
    local hpFill=solid(hpBar,0,0,3,100,Color3.fromRGB(70,230,110),9); hpFill.AnchorPoint=Vector2.new(0,1); hpFill.Position=UDim2.new(0,0,1,0); hpFill.Size=UDim2.new(1,0,0.72,0)
    local gunPrev=Instance.new("TextLabel"); gunPrev.BackgroundTransparency=1; gunPrev.Size=UDim2.new(0,90,0,12); gunPrev.Position=UDim2.new(0,-100,0,150); gunPrev.Font=F_MONO; gunPrev.TextSize=9; gunPrev.Text="GUN [18m]"; gunPrev.Visible=false; gunPrev.ZIndex=8; gunPrev.TextStrokeTransparency=0.5; gunPrev.Parent=fig
    local gunBody=solid(fig,-90,164,22,5,WHITE,8,1); gunBody.Visible=false
    local gunGrip=solid(fig,-90,166,5,10,WHITE,8,1); gunGrip.Visible=false
    local boxTop=6; local aimPosX,aimPosY=45,24; local tagAcc=0.3
    track(RunService.RenderStepped:Connect(function(dt)
        if not isOpen then return end
        local t=os.clock(); local role="Murderer"; local rcol=ROLE_COLORS[role] or WHITE
        local ecol=Flags["Visuals/Color by Role"] and rcol or getColor(Flags["Visuals/ESP Color"],t,0)
        local pulse=(math.sin(t*1.4)+1)/2
        for i,c in ipairs(glow) do c.BackgroundColor3=ACC; c.BackgroundTransparency=0.955-i*0.006-pulse*0.01 end
        dot.BackgroundTransparency=pulse*0.7; og.Rotation=(t*80)%360
        local ys=34+((t*0.33)%1)*336
        scanLine.Position=UDim2.new(0,0,0,ys); scanBand.Position=UDim2.new(0,0,0,ys-38)
        scanLine.BackgroundColor3=ACC; scanBand.BackgroundColor3=ACC
        local rp=(t*0.55)%1; ring2.Size=UDim2.new(0,90+rp*100,0,16+rp*26); ring2S.Transparency=0.3+rp*0.7
        for _,p in ipairs(particles) do p.y=p.y-p.sp*dt; if p.y<30 then p.y=378; p.x=math.random(12,238) end; p.f.Position=UDim2.new(0,p.x+math.sin(t*0.8+p.ph)*6,0,p.y); p.f.BackgroundTransparency=1-((p.y-30)/348)*0.55; p.f.BackgroundColor3=ACC end
        body.Position=UDim2.new(0,0,0,math.sin(t*2)*1.5)
        local hatOn=Flags["Visuals/Chinese Hat"]
        boxTop=boxTop+((hatOn and -36 or 6)-boxTop)*0.2; local bh=170-boxTop
        local boxOn=Flags["Visuals/ESP Box"]
        boxF.Visible=boxOn; boxF.BackgroundColor3=ecol; boxF.BackgroundTransparency=0.95; boxF.Position=UDim2.new(0,2,0,boxTop); boxF.Size=UDim2.new(0,86,0,bh)
        setBrackets(2,boxTop,86,bh,ecol,boxOn)
        roleL.Visible=Flags["Visuals/Role"]; roleL.Text=string.upper(role); roleL.TextColor3=rcol; roleL.Position=UDim2.new(0,-20,0,boxTop-26)
        nameL.Visible=Flags["Visuals/Name"]; nameL.TextColor3=ecol; nameL.Position=UDim2.new(0,-20,0,boxTop-14)
        distL.Visible=Flags["Visuals/Distance"]; distL.Position=UDim2.new(0,-20,0,170+3)
        hpBar.Visible=Flags["Visuals/Health"]; hpBar.Position=UDim2.new(0,-5,0,boxTop); hpBar.Size=UDim2.new(0,3,0,bh); hpFill.Size=UDim2.new(1,0,0.7+math.sin(t)*0.2,0)
        tracer.Visible=Flags["Visuals/Tracers"]; tracer.BackgroundColor3=ecol
        local skelOn=Flags["Visuals/Skeleton"]; skel.Visible=skelOn
        if skelOn then for _,s in ipairs(skelParts) do s.BackgroundColor3=ecol end end
        local chams,glowOn=Flags["Visuals/Chams"],Flags["Visuals/Glow"]
        for _,p in ipairs(bodyParts) do p.f.BackgroundColor3=chams and ecol or BODY_GRAY; p.f.BackgroundTransparency=chams and 0.25 or 0; p.s.Color=glowOn and ecol or WHITE; p.s.Transparency=glowOn and 0.05 or 0.78; p.s.Thickness=glowOn and 2 or 1 end
        visor.BackgroundColor3=chams and Color3.fromRGB(20,20,24) or Color3.fromRGB(26,26,32)
        for i,s in ipairs(hatS) do s.Visible=hatOn; if hatOn then s.BackgroundColor3=getColor(Flags["Visuals/Hat Color"],t,i*0.04); s.BackgroundTransparency=(Flags["Visuals/Hat Transparency"] or 35)/100 end end
        local gunOn=Flags["Visuals/Gun ESP"]; local gcol=getColor(Flags["Visuals/Gun Color"] or "Gold",t,0)
        gunPrev.Visible=gunOn; gunBody.Visible=gunOn; gunGrip.Visible=gunOn
        if gunOn then gunPrev.TextColor3=gcol; gunBody.BackgroundColor3=gcol; gunGrip.BackgroundColor3=gcol end
        local wingsOn=Flags["Visuals/Wings"]; local flap=math.sin(t*(Flags["Visuals/Wing Speed"] or 3))*0.2
        for _,w in ipairs(wingF) do
            w.f.Visible=wingsOn
            if wingsOn then
                local a=math.rad(8+(w.i-1)*14)+flap*(0.4+w.i*0.12); local dx,dy=w.side*math.cos(a),-math.sin(a); local sx=(w.side==-1) and 28 or 62
                w.f.Position=UDim2.new(0,sx+dx*w.len/2,0,50+dy*w.len/2); w.f.Rotation=math.deg(math.atan2(dy,dx)); w.f.BackgroundColor3=getColor(Flags["Visuals/Wing Color"],t,w.i*0.05)
            end
        end
        local trailOn=Flags["Visuals/Trail"]; local tlen=math.clamp(Flags["Visuals/Trail Length"] or 10,1,30); local count=math.clamp(math.floor(tlen/30*14)+3,3,14); local twidth=Flags["Visuals/Trail Width"] or 4
        for k,f in ipairs(trailF) do
            local show=trailOn and k<=count; f.Visible=show
            if show then local fall=k/count; f.Position=UDim2.new(0,16-k*8,0,100+math.sin(t*4+k*0.6)*4*fall); f.Size=UDim2.new(0,12,0,math.max(2,twidth*2.4*(1-fall*0.85))); f.BackgroundTransparency=0.1+fall*0.85; f.BackgroundColor3=getColor(Flags["Visuals/Trail Color"],t,-k*0.04) end
        end
        local aimOn=Flags["Aimbot/Enable"]
        fovRing.Visible=aimOn and Flags["Aimbot/Show FOV"] or false
        if fovRing.Visible then local r=24+((Flags["Aimbot/FOV"] or 120)-10)/350*94; fovRing.Size=UDim2.new(0,r*2,0,r*2); fovS.Color=ACC end
        ring1S.Color=ACC; ring2S.Color=ACC
        local sel=Flags["Aimbot/Body Part"]; local ap=(math.sin(t*5)+1)/2
        for pn,ov in pairs(overlays) do ov.BackgroundTransparency=(pn==sel) and (0.6-ap*0.2) or 1 end
        local selPart=nil
        for _,a in ipairs(AIM_PARTS_DATA) do if a.name==sel then selPart=a; break end end
        if selPart then local k=math.clamp(dt*12,0,1); aimPosX=aimPosX+(selPart.dx-aimPosX)*k; aimPosY=aimPosY+(selPart.dy-aimPosY)*k end
        aimDot.Position=UDim2.new(0,aimPosX,0,aimPosY)
        local g=7+ap*4
        ret[1].Position=UDim2.new(0,aimPosX-g-3,0,aimPosY); ret[2].Position=UDim2.new(0,aimPosX+g+3,0,aimPosY)
        ret[3].Position=UDim2.new(0,aimPosX,0,aimPosY-g-3); ret[4].Position=UDim2.new(0,aimPosX,0,aimPosY+g+3)
        for _,u in ipairs(aimUI) do
            if u.a.name==sel then u.dot.BackgroundColor3=AIM_RED; u.dot.BackgroundTransparency=0.2; u.dot.Size=UDim2.new(0,11,0,11); u.ds.Transparency=0.1
            elseif u.hover then u.dot.BackgroundColor3=Color3.fromRGB(255,170,170); u.dot.BackgroundTransparency=0.2; u.dot.Size=UDim2.new(0,13,0,13); u.ds.Transparency=0.2
            else u.dot.BackgroundColor3=Color3.fromRGB(230,230,240); u.dot.BackgroundTransparency=0.45; u.dot.Size=UDim2.new(0,11,0,11); u.ds.Transparency=0.55 end
        end
        aimCap.Text=aimOn and ("AIM / "..string.upper(tostring(sel))) or "AIM OFF"
        tagAcc+=dt
        if tagAcc>=0.25 then
            tagAcc=0; local tg={}
            local function add(k,n) if Flags[k] then tg[#tg+1]=n end end
            add("Visuals/ESP Box","BOX") add("Visuals/Name","NAME") add("Visuals/Role","ROLE") add("Visuals/Health","HP") add("Visuals/Distance","DIST")
            add("Visuals/Tracers","TRC") add("Visuals/Skeleton","SKEL") add("Visuals/Chams","CHAMS") add("Visuals/Glow","GLOW") add("Visuals/Gun ESP","GUN")
            add("Visuals/Head Dot","DOT") add("Visuals/Offscreen Arrows","ARW")
            add("Visuals/Chinese Hat","HAT") add("Visuals/Wings","WINGS") add("Visuals/Trail","TRAIL") add("Visuals/Aura","AURA")
            if aimOn then tg[#tg+1]="AIM"; if Flags["Aimbot/Skip Innocents"] then tg[#tg+1]="NO-INNO" end end
            if Flags["Aimbot/Auto Win"] then tg[#tg+1]="AUTOWIN" end
            if Flags["Move/Bunnyhop"] then tg[#tg+1]="BHOP" end
            if Flags["Move/Fly"] then tg[#tg+1]="FLY" end
            if Flags["Move/Noclip"] then tg[#tg+1]="NOCLIP" end
            tagsL.Text=#tg>0 and table.concat(tg," / ") or "NO MODULES"
        end
    end))
end
buildPreview(previewPanel)
selectTab(visTab)
refreshFav()

task.spawn(function()
    local startTick=tick()
    while gui.Parent do
        task.wait(1)
        local s=math.floor(tick()-startTick); local hh=math.floor(s/3600); local mm=math.floor((s%3600)/60); local ss=s%60
        local role=getRoleCached(LP)
        profSession.Text=string.format("SESSION   %02d:%02d:%02d",hh,mm,ss)
        profRole.Text="ROLE      "..role
        profCoins.Text="COINS     "..Farm.Collected
        profFps.Text="FPS       "..(FPS.Current or 0).." | avg "..math.floor(FpsCounter.Avg).." | max "..FpsCounter.Max
        if wmFrame.Visible then wmLbl.Text="luXxS-hub v7.0 | "..(FPS.Current or 0).." FPS | "..role end
    end
end)

notify("luXxS-hub v7.0 MAX // t.me/NurHuboffical")
print("[luXxS-hub] v7.0 MAX ready")
