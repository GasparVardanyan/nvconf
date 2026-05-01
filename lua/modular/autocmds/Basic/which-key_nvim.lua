local wk = require ("which-key")
for k, v in pairs (require ("modular.config.whichkey")) do
	wk.add ({ k, group = v })
end
