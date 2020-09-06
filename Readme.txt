-=[ Mutator Gift From Decoration for MonsterHunt ]=-

Break decorations (barrels, tables, chairs, statues, etc.) to get inventory items (Armor, Health, Damage booster, Shield, weapons, etc.) for a limited time.

Before the disappearance of the gift is a countdown.
If the current weapon has disappeared, it will switch to the "best" weapon.
If it was Armor, it will disappear.
If the Inventory was expendable, such as ammo or Health pack - there will be no timer, Health will not decrease.

You can specify any inventory objects in the settings. For example, a BPak weapon.

If a player controls a Redemeer rocket during its disappearance, there may be various special effects.
Usually the rocket remains guided, but there is no crosshair, it is impossible to detonate it with a click, only crashing into something.
Also when Redemeer disappear rocket make sharp turn to launch orientation.
With all sorts of Jet can be a problems.

The weapon that is picked up is disappear. Ammo remains.
Therefore, if you do not use a Redemeer, then the next time there will be two rocket on it, not one.

-=[ Configuration ]=-

In UnrealTournament.ini place section

[GiftFromDecoration.GiftFromDecorationMutator]
; seconds before Gift disappear
delay=30
; seconds for countdown announce (0-10) before Gift disappear
countdown=10
; localized messages
PickupGift1=You got a Gift (
PickupGift2=) for
PickupGift3=seconds!
Disappear1=Gift (
Disappear2=) disappear!
; You can list up to 100 Items. Empty items skipped.
; If Item can not be spawned - log record appear.
; On server do not forget list all Items on ServerPackages
; Chance - just int value. Can be more 100. If 0 or less then use 1.
; Bigger chance - more often drop this item. But it depends on chances for other items.
; 5 and 10 - give first item less chance rather second.
; 5 and 1 - vice versa.
; By default all chances equal 1.
Items[4]=UnrealShare.Amplifier
Chance[4]=100
Items[5]=UnrealShare.Armor
Chance[5]=100
Items[6]=UnrealShare.Health
Chance[6]=100
Items[7]=UnrealShare.SuperHealth
Chance[7]=100
Items[8]=Unreali.JumpBoots
Chance[8]=100
Items[9]=UnrealShare.ShieldBelt\
Chance[9]=100
Items[10]=UnrealI.PowerShield
Chance[10]=100
Items[12]=UnrealI.AsbestosSuit
Chance[12]=100
Items[13]=UnrealShare.KevlarSuit
Chance[13]=100
Items[14]=UnrealI.ToxinSuit
Chance[14]=100

Items[20]=Botpack.SuperShockRifle
Chance[20]=10
Items[21]=Botpack.WarheadLauncher
Chance[21]=20
Items[22]=BotPack.Armor2
Chance[22]=100
Items[23]=BotPack.ThighPads
Chance[23]=100
Items[24]=BotPack.UDamage
Chance[24]=100
Items[25]=BotPack.UT_JumpBoots
Chance[25]=100
Items[26]=BotPack.UT_ShieldBelt
Chance[26]=100
Items[27]=BotPack.HealthPack
Chance[27]=100
Items[28]=BotPack.HealthVial
Chance[28]=100
Items[29]=BotPack.MedBox
Chance[29]=100


-=[ Install ]=-

As usual - copy .u and .int files in System UT directory. Nothing more.

Use on server - it is fully server-sided package, so you do not need list it in ServerPackages.

Source can be built with UMake.

-=[ Credits ]=-

If you need something go to ut99.org
