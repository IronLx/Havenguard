/// @description Attack Button
if(timer >= attack_intermission)
{
	Attack(20, obj_novice_attack, "Instances");
	timer = 0;
}