/// @description Delayed Attack effect
function AttackEffect(_range,_type,_layer)
{
	var _attack = instance_create_layer(x + (_range * image_xscale), y, _layer, _type);
	_attack.image_xscale = image_xscale;
	_attack.range = _range;
	_attack.owner = obj_player;
}

AttackEffect(20, obj_novice_attack, "Instances");
