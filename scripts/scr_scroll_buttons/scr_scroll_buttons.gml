function scr_scroll_buttons() {
	scroll_up				= instance_create_depth(0,0,depth-1,obj_scroll_button);
	scroll_up.idle_sprite	= spr_arrow_single_black;
	scroll_up.sprite_index	= scroll_up.idle_sprite;
	scroll_up.hover_sprite	= spr_arrow_single_green;
	scroll_up.image_yscale	= -1;
	scroll_up.x				= x + sprite_get_width(sprite_index) / 2 + 20;
	scroll_up.y				= y - sprite_get_height(sprite_index) / 3;
	scroll_up.hover_text	= "Scroll up";
	scroll_up.creator		= id;
	scroll_up.scroll_px		= sprite_get_height(spr_transparent);

	scroll_top				= instance_create_depth(0,0,depth-1,obj_scroll_button);
	scroll_top.idle_sprite	= spr_arrow_double_black;
	scroll_top.sprite_index	= scroll_top.idle_sprite;
	scroll_top.hover_sprite	= spr_arrow_double_green;
	scroll_top.image_yscale	= -1;
	scroll_top.x			= x + sprite_get_width(sprite_index) / 2 + 20;
	scroll_top.y			= y - sprite_get_height(sprite_index) / 4;
	scroll_top.hover_text	= "Go to top";
	scroll_top.creator		= id;
	scroll_top.scroll_px	= sprite_get_height(spr_transparent);

	scroll_bottom				= instance_create_depth(0,0,depth-1,obj_scroll_button);
	scroll_bottom.idle_sprite	= spr_arrow_double_black;
	scroll_bottom.sprite_index	= scroll_bottom.idle_sprite;
	scroll_bottom.hover_sprite	= spr_arrow_double_green;
	scroll_bottom.x				= x + sprite_get_width(sprite_index) / 2 + 20;
	scroll_bottom.y				= y + sprite_get_height(sprite_index) / 4;
	scroll_bottom.hover_text	= "Go to bottom";
	scroll_bottom.creator		= id;
	scroll_bottom.scroll_px		= -sprite_get_height(spr_transparent);

	scroll_down					= instance_create_depth(0,0,depth-1,obj_scroll_button);
	scroll_down.idle_sprite		= spr_arrow_single_black;
	scroll_down.sprite_index	= scroll_down.idle_sprite;
	scroll_down.hover_sprite	= spr_arrow_single_green;
	scroll_down.x				= x + sprite_get_width(sprite_index) / 2 + 20;
	scroll_down.y				= y + sprite_get_height(sprite_index) / 3;
	scroll_down.hover_text		= "Scroll down";
	scroll_down.creator			= id;
	scroll_down.scroll_px		= -sprite_get_height(spr_transparent);


}
