AddCSLuaFile("shared.lua")

SWEP.PrintName = "SCP-682 SWEP"
SWEP.Author = "Sharky"
SWEP.Purpose = ""
SWEP.Instructions = "Left click to attack, Right click to roar."

SWEP.Spawnable = true
SWEP.AdminSpawnable = true

SWEP.ViewModel = ""
SWEP.WorldModel = ""
SWEP.DrawCrosshair 		= false

SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false
SWEP.Slot = 1
SWEP.SlotPos = 1		

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"



function SWEP:PrimaryAttack() 
	local tgt = self.Owner:GetEyeTrace()
if tgt.HitPos:Distance(self.Owner:GetShootPos()) <= 190 then  -- 200 is the distance away the swep can hit. Taking into account of the player model
	local hit = self:GetOwner():GetEyeTrace().Entity

------sound------

self:EmitSound(Sound("npc/barnacle/barnacle_crunch3.wav"))





------damage------

bullet = {}

			bullet.Num    = 0
			bullet.Src    = self.Owner:GetShootPos()
			bullet.Dir    = self.Owner:GetAimVector()
			bullet.Spread = Vector(0, 0, 0)
			bullet.Tracer = 0
			bullet.Force  = 1
			bullet.Damage = 150  -------- Damage amount done
self.Owner:FireBullets( bullet )



end
     self:SetNextPrimaryFire( CurTime() + 1 )
	end

function SWEP:SecondaryAttack()
roar_sounds = {"npc/antlion_guard/angry1.wav","npc/antlion_guard/angry2.wav","npc/antlion_guard/angry3.wav"}

self:EmitSound(Sound(table.Random(roar_sounds)))


self:SetNextSecondaryFire( CurTime() + 1 )

	end


function SWEP:OnDrop()

	self:Remove() -- You can't this swep

end
