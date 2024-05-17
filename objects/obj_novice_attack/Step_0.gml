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