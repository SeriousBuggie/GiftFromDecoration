class InventoryDestroyer extends Triggers;

var Inventory Target;
var int delay;
var int countdown;

function Disappear() {
	local Pawn TargetOwner;
	local string ItemName;
	
	if (Target != None) {
		TargetOwner = Pawn(Target.Owner);
		ItemName = Target.ItemName;
		Target.Destroy();
		if (TargetOwner != None) {
			if ((TargetOwner.Weapon == Target || TargetOwner.Weapon == None)) TargetOwner.SwitchToBestWeapon();
			if (TournamentPlayer(TargetOwner) != None) {
				TargetOwner.ClientMessage(GiftFromDecorationMutator(Owner).Disappear1 $ ItemName $ 
					GiftFromDecorationMutator(Owner).Disappear2, 'CriticalEvent');
			}
		}
	}
	Destroy();
}

auto state Idle {
Begin:
	while (true) {
		Sleep(0.1);
		If (Target == None) {
			Destroy();
		} else if (Target.Owner != None) {
			countdown = Min(countdown, delay - 1);
			delay -= countdown;
			GotoState('Wait');
		}
	}
}

state Wait {
Begin:
	Sleep(0.1);
	If (Target != None) {
		if (TournamentPlayer(Target.Owner) != None) {
			Pawn(Target.Owner).ClientMessage(GiftFromDecorationMutator(Owner).PickupGift1 $ Target.ItemName $ 
				GiftFromDecorationMutator(Owner).PickupGift2 @ (delay + countdown) @ 
				GiftFromDecorationMutator(Owner).PickupGift3, 'CriticalEvent');
		}
		Sleep(delay);
	}
	while (countdown > 0) {
		If (Target == None) break;
		if (TournamentPlayer(Target.owner) != None) {
			TournamentPlayer(Target.owner).TimeMessage(countdown);
		}
		countdown--;
		sleep(1);
	}
	Disappear();
}
