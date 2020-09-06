class GiftFromDecorationMutator extends Mutator;

var() localized string PickupGift1;
var() localized string PickupGift2;
var() localized string PickupGift3;
var() localized string Disappear1;
var() localized string Disappear2;

var() globalconfig int delay;
var() globalconfig int countdown;
var() globalconfig string Items[100];
var() globalconfig int Chance[100];
var int count;
var int FullChance;

auto state Idle {
Begin:
	Tag = 'GiftFromDecorationMutator';
}

function PostBeginPlay() {
	local Decoration decor;
	local int i;
	local Class<Inventory> ItemClass;
	
	count = 0;
	FullChance = 0;
	for (i = 0; i < 100; i++) {
		if (Items[i] == "") continue;
		ItemClass = Class<Inventory>(DynamicLoadObject(Items[i], class'Class'));
		if (ItemClass == None) {
			Log("Failed load class " $ Class.Name $ ".Items[" $ i $ "] = '" $ Items[i] $ "'");
			continue;
		}
		if (i != count) {
			Items[count] = Items[i];
			Chance[count] = Chance[i];
		}
		if (Chance[count] <= 0) Chance[count] = 1;
		FullChance += Chance[count];
		count++;
	}
	if (count == 0) {
		Log(Class.Name $ ": No Items!");
		return;
	}
	
	ForEach AllActors(class'Decoration', decor) {		
		if (decor.Event != '' || decor.contents != None) continue;
		decor.Event = 'GiftFromDecorationMutator';
	}
}

function Trigger(actor Other, pawn EventInstigator) {
	local Inventory inv;
	local InventoryDestroyer destr;
	local Class<Inventory> ItemClass;
	local int i, rnd;
	
	if (Other == None) return;
	Other.Event = ''; // only once
	
	rnd = Rand(FullChance);
	for (i = 0; i < count; i++) {
		if (rnd < Chance[i]) break;
		rnd -= Chance[i];
	}
	ItemClass = Class<Inventory>(DynamicLoadObject(Items[i], class'Class'));
	if (ItemClass == None) {
		Log(Class.Name $ ": Failed load class '" $ Items[i] $ "'");
		return;
	}
	
	inv = Other.spawn(ItemClass);
	inv.ReSpawnTime = 0;
	inv.bRotatingPickup = false;
	destr = Spawn(class'InventoryDestroyer', Self);
	destr.Target = inv;
	destr.delay = delay;
	destr.countdown = countdown;
}

defaultproperties {
	delay=30
	countdown=10
	PickupGift1="You got a Gift ("
	PickupGift2=") for"
	PickupGift3="seconds!"
	Disappear1="Gift ("
	Disappear2=") disappear!"
	Items(4)="UnrealShare.Amplifier"
	Items(5)="UnrealShare.Armor"
	Items(6)="UnrealShare.Health"
	Items(7)="UnrealShare.SuperHealth"
	Items(8)="Unreali.JumpBoots"
	Items(9)="UnrealShare.ShieldBelt"
	Items(10)="UnrealI.PowerShield"
	Items(12)="UnrealI.AsbestosSuit"
	Items(13)="UnrealShare.KevlarSuit"
	Items(14)="UnrealI.ToxinSuit"
	Items(20)="Botpack.SuperShockRifle"
	Items(21)="Botpack.WarheadLauncher"
	Items(22)="BotPack.Armor2"
	Items(23)="BotPack.ThighPads"
	Items(24)="BotPack.UDamage"
	Items(25)="BotPack.UT_JumpBoots"
	Items(26)="BotPack.UT_ShieldBelt"
	Items(27)="BotPack.HealthPack"
	Items(28)="BotPack.HealthVial"
	Items(29)="BotPack.MedBox"
}