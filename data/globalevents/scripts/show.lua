----------------------------
--------Talkting TPS 3.0 ---
---------- By mock ---------
--dont remove the credists--
----------------------------

clolortypes = {
 {kind=2,chance=100,{x=100,y=100,z=7},'Haha i can say ma ny words with this script ;D ---By  mock      ',255}, -- kind (text), chance 100%,pos,Text,color 
 {kind=3,chance=98,{x=100,y=100,z=7},{x=102,y=102,z=7},CONST_ANI_SPEAR}, -- kind(distance), chance 98%, frompos, topos, distance
 {kind=4,chance=10,function()   --- kind(function), chance 10%, function
                    local pos = {x=110,y=110,z=7,stackpos=255}
                    local a = getThingfromPos(pos)
                    if isPlayer(a.uid) == TRUE then
                       doTeleportThing(a.uid, {x=100,y=100,z=7})
                    end
                  end},
 {kind=1,chance=20,{x=100,y=100,z=7},CONST_ME_WATERCREATURE}, -- kind (effect), chance 20%, pos, effecttype  

}
function animatedTextBig(pos,letters,color)-- by Mock
local pos2 = {x=pos.x,y=pos.y,z=pos.z}
local m = 10
local c = math.floor(#letters/m)
local ac = 0

for i=1,c+1 do
	ac = i
	local l1 = ((i-1)*m)
	local l2 = (m*(i))-1
	doSendAnimatedText(pos2,letters:sub(l1,l2), color)
	pos2.x = pos2.x+1
end
return ac
end
function run_it()
for i=1,#clolortypes do
      if clolortypes[i].kind == 1 then
         if clolortypes[i].chance >= math.random(1,100) then
            doSendMagicEffect(clolortypes[i][1],clolortypes[i][2])
         end
      elseif clolortypes[i].kind == 2 then
         if clolortypes[i].chance >= math.random(1,100) then
            animatedTextBig(clolortypes[i][1],clolortypes[i][2],clolortypes[i][3])
         end
      elseif clolortypes[i].kind == 3 then
         if clolortypes[i].chance >= math.random(1,100) then
            doSendDistanceShoot(clolortypes[i][1],clolortypes[i][2],clolortypes[i][3])
         end
      elseif clolortypes[i].kind == 4 then
         if clolortypes[i].chance >= math.random(1,100) then
            xpcall(clolortypes[i][1](),false)  --- para nao parar o evento
         end   
      end
   end
end                   
function onThink(interval, lastExecution)
   run_it()
return TRUE
end