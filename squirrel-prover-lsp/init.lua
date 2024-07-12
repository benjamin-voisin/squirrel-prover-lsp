local lsp = require 'easy-lsp'

local tactics = require 'squirrel-prover-lsp.tactics'
local commands = require 'squirrel-prover-lsp.commands'
local declarations = require 'squirrel-prover-lsp.declarations'

lsp.name = "Squirrel-Prover LSP"
lsp.version = "0.1.0"
lsp.capabilities = {
	textDocumentSync = 1,
	completionProvider = {},
	hoverProvider = true,
}

lsp.HandleRequest["textDocument/hover"] = function (request)
	local response = {
		id = request.id,
		result = {
			contents = {
				kind = 'markdown',
				value = "# Tactic __auto__ _simpl_flags_\nAttempt to automatically prove a goal using the hypotheses.\nThe tactic uses the __reduction engine__ with the provided flags (defaults to :g:`rw,beta,proj`).\nMoreover, for local goals, the tactic relies on basic propositional reasoning, rewriting simplications, and both __constraints__ and __congruence__.\n---\n___Error:___ cannot close goal\nThe current goal could not be closed.",
			},
		}
	}
	return response
end

function lsp.generate_completion (params)
	local results = {}
	for _, tactic in pairs(tactics) do
		local item = {
			label = tactic.name,
			documentation = tactic.description,
			kind = 2
		}
		table.insert(results, item)
	end
	for _, command in pairs(commands) do
		local item = {
			label = command.name,
			documentation = command.description,
			kind = 2
		}
		table.insert(results, item)
	end
	for _, declaration in pairs(declarations) do
		local item = {
			label = declaration.name,
			documentation = declaration.description,
			kind = 2
		}
		table.insert(results, item)
	end
	return results
end

lsp.start()
