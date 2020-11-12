/// @description get_keys()
function get_keys() {
	p_u = (p_u + 1)*k_u
	p_d = (p_d + 1)*k_d
	p_l = (p_l + 1)*k_l
	p_r = (p_r + 1)*k_r

	p_a = (p_a + 1)*k_a
	p_b = (p_b + 1)*k_b
	p_st= (p_st+ 1)*k_st
	p_sl= (p_sl+ 1)*k_sl

	//Reads key variables
	k_u = keyboard_check(vk_up);

	k_d = keyboard_check(vk_down)
	k_r = keyboard_check(vk_right)
	k_l = keyboard_check(vk_left)

	k_shift_u = keyboard_check_pressed(ord("A"));
	k_shift_d = keyboard_check_pressed(ord("Z"));

	k_a = keyboard_check(ord("X"))
	k_b = keyboard_check(ord("C"))
	k_st= keyboard_check(vk_enter)
	k_sl= keyboard_check(vk_shift)

	k_lookb	= keyboard_check(ord("S"));



}
