return {
	gs = {
		callback = function ()
			local prefills = {
				paths = require ("oil").get_current_dir (),
			}

			local grug_far = require ("grug-far")

			if not grug_far.has_instance ("explorer") then
				grug_far.open ({
					instanceName = "explorer",
					prefills = prefills,
					staticTitle = "Find and Replace from Explorer",
				})
			else
				grug_far.get_instance ("explorer"):open ()
				grug_far.get_instance ("explorer"):update_input_values (prefills, false)
			end
		end,
		desc = "oil: Search in directory",
	},
}
