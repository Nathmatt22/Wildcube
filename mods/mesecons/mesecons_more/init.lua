minetest.override_item('default:mese', {
    mesecons = {
        receptor = {
		    state = mesecon.state.on,
		    rules = torch_get_output_rules
        }
    }
})
