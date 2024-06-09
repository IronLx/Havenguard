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

if (!hit_registered && place_meeting(x, y, targets)) 
{
	hit_registered = true;
	for (var i = 0; i < array_length(targets); i++) 
	{
	    var _target_type = targets[i];
	    if (place_meeting(x, y, _target_type)) {
	        var _target = instance_place(x, y, _target_type);
	        if (_target != noone) {
	            _target.hp -= attack_damage;
	        }
	    }
	}
}