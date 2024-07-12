package = "squirrel-prover-lsp"
version = "dev-1"
source = {
	url = "git+ssh://git@github.com/benjamin-voisin/squirrel-prover-lsp.git"
}
description = {
	summary = "An LSP for the Squirrel Prover Langage",
	detailed = [[
	An LSP for the Squirrel Prover Langage
	]],
	homepage = "*** please enter a project homepage ***",
	license = "CC-BY-SA-4.0"
}
dependencies = {
	"lua >= 5.1",
	"easy-lsp >= 0.1.0",
}
build = {
	type = "builtin",
	modules = {
		["squirrel-prover-lsp"] = "squirrel-prover-lsp/init.lua",
		["squirrel-prover-lsp.tactics"] = "squirrel-prover-lsp/tactics.lua",
		["squirrel-prover-lsp.commands"] = "squirrel-prover-lsp/commands.lua",
		["squirrel-prover-lsp.declarations"] = "squirrel-prover-lsp/declarations.lua",
	}
}
