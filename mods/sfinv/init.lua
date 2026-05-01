-- sfinv/init.lua

dofile(minetest.get_modpath("sfinv") .. "/api.lua")

-- Load support for MT game translation.
local S = minetest.get_translator("sfinv")

sfinv.register_page("sfinv:crafting", {
	title = S("Crafting"),
	get = function(self, player, context)
		return sfinv.make_formspec(player, context, [[
				image[4.75,1.5;1,1;sfinv_crafting_arrow.png]
				list[current_player;craft;1.75,1.5;2,2;]
				list[current_player;craftpreview;5.75,2;1,1;]
				listring[current_player;main]
				listring[current_player;craft]
			]], true)
	end
})

core.register_node("sfinv:crafting_table", {
	description = S("Crafting Table"),
	tiles = {"default_wood.png"},
	paramtype2 = "facedir",
	groups = {choppy = 2, oddly_breakable_by_hand = 2},
	sounds = default.node_sound_wood_defaults(),

on_rightclick = function(pos, node, player, itemstack, pointed_thing)
    core.show_formspec(
        player:get_player_name(),
        "sfinv:crafting_table",
        "size[9, 10]" ..
		"style[invbtn_exit;border=false]" ..
		"style[invbtn_exit:hovered;fgimg=exit_btn_hover.png;border=false]" ..
		"image_button_exit[8,0;1,1;exit_btn.png;invbtn_exit;]" ..
		"item_image[0.2,0.2;1,1;sfinv:crafting_table]" ..
		"label[1.1,0.4;" .. S("Crafting Table") .. "]" ..
        "image[4.75,2.5;1,1;sfinv_crafting_arrow.png]" ..
        "list[current_player;craft;1.75,1.5;3,3;]" ..
        "list[current_player;craftpreview;5.75,2.5;1,1;]" ..
		"list[current_player;main;0.5,6;8,4;]" ..
        "listring[current_player;main]" ..
        "listring[current_player;craft]"
    )
end
})