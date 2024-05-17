/// @description Handles it's duration and sticking to the player
//Check if the time's up
if(timer < duration)
{
	timer++;
}
//If so Finish it
else instance_destroy();

//Make sure that attack is moving with the player
with(owner)
{
	other.x = x + (other.range * other.image_xscale);
}

if (place_meeting(x, y, obj_peon)) {
    var _target = instance_place(x, y, obj_peon);
    if (_target != noone) {
        _target.hp -= attack_damage;
        if (_target.hp <= 0) {
            instance_destroy(_target);
        }
        //effect_create_above(ef_explosion, target.x, target.y, c_red);
        instance_destroy();
    }
}

if (place_meeting(x, y, obj_barricade_built)) {
    var _target = instance_place(x, y, obj_barricade_built);
    if (_target != noone) {
        _target.hp -= attack_damage;
        if (_target.hp <= 0) {
            with(_target)
			{
				instance_change(obj_barricade_unbuilt,true);
			}
        }
        //effect_create_above(ef_explosion, target.x, target.y, c_red);
        instance_destroy();
    }
}

if (place_meeting(x, y, obj_player)) {
    var _target = instance_place(x, y, obj_player);
    if (_target != noone) {
        _target.hp -= attack_damage;
        if (_target.hp <= 0) {
            instance_destroy(_target);
        }
        //effect_create_above(ef_explosion, target.x, target.y, c_red);
        instance_destroy();
    }
}