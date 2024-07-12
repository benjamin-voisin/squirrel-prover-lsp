local http = require 'socket.http'
local htmlparser = require("htmlparser")

local tactics_body, statusCode, headers, statusText = http.request('https://squirrel-prover.github.io/documentation/proofs.html')

local tactics_html = htmlparser.parse(tactics_body, 1000000)
local tactics = tactics_html:select(".squirrel.tacn")
local trace_tactics = tactics_html:select(".squirrel.tact")
for _, trace_tactic in pairs(trace_tactics) do
	table.insert(tactics, trace_tactic)
end
local equiv_tactics = tactics_html:select(".squirrel.tace")
for _, equiv_tactic in pairs(equiv_tactics) do
	table.insert(tactics, equiv_tactic)
end



local function format_html_to_markdown(str)
	local result, _ = str:gsub("<[^>]*>", "")
	result, _ = result:gsub("\n", " ")
	return result
end

local tactics_file = io.open("./squirrel-prover-lsp/tactics.lua", "w")
if not tactics_file then
	print("Could not open tacics.lua file, exiting")
	os.exit(1)
end

tactics_file:write("return {\n")
for _,tactic in pairs(tactics) do
	local box = tactic.nodes[1]
	local pre = box:select(".pre")
	local type = pre[1]:getcontent()
	local name = pre[2]:getcontent()
	if (type == "Error") then
		break
	end
	local description = tactic.nodes[2]
	tactics_file:write("\t{\n")
	tactics_file:write("\t\tname = \"", name:gsub(" ", ""), "\",\n")
	tactics_file:write("\t\ttype = \"", type, "\",\n")
	tactics_file:write("\t\tdescription = [[\n")
	for _, paragraph in pairs(description.nodes) do
		if (paragraph.name == "p") then
			tactics_file:write(format_html_to_markdown(paragraph:getcontent()), "\n")
		end
	end
	tactics_file:write("\t\t]],\n")
	tactics_file:write("\t},\n")
end
tactics_file:write("}\n")
tactics_file:close()

local declarations_body, statusCode, headers, statusText = http.request('https://squirrel-prover.github.io/documentation/declarations.html')
local declarations_html = htmlparser.parse(declarations_body, 1000000)
local declarations = declarations_html:select(".squirrel.decl")

local declarations_file = io.open("./squirrel-prover-lsp/declarations.lua", "w")

if not declarations_file then
	print("Could not open ./squirrel-prover-lsp/declarations.lua, exiting...")
	os.exit(1)
end

declarations_file:write("return {\n")
for _,declaration in pairs(declarations) do
	local box = declaration.nodes[1]
	local pre = box:select(".pre")
	local type = pre[1]:getcontent()
	local name = pre[2]:getcontent()
	if (type == "Error") then
		break
	end
	local description = declaration.nodes[2]
	declarations_file:write("\t{\n")
	declarations_file:write("\t\tname = \"", name:gsub(" ", ""), "\",\n")
	declarations_file:write("\t\ttype = \"", type, "\",\n")
	declarations_file:write("\t\tdescription = [[\n")
	for _, paragraph in pairs(description.nodes) do
		if (paragraph.name == "p") then
			declarations_file:write(format_html_to_markdown(paragraph:getcontent()), "\n")
		end
	end
	declarations_file:write("\t\t]],\n")
	declarations_file:write("\t},\n")
end
declarations_file:write("}\n")
declarations_file:close()

local commands_body, statusCode, headers, statusText = http.request('https://squirrel-prover.github.io/documentation/commands.html')

local commands_html = htmlparser.parse(commands_body, 1000000)
local commands = commands_html:select(".squirrel.cmd")

local commands_file = io.open("./squirrel-prover-lsp/commands.lua", "w")

if not commands_file then
	print("Could not open ./squirrel-prover-lsp/commands.lua, exiting...")
	os.exit(1)
end

commands_file:write("return {\n")
for _,command in pairs(commands) do
	local box = command.nodes[1]
	local pre = box:select(".pre")
	local type = pre[1]:getcontent()
	local name = pre[2]:getcontent()
	if (type == "Error") then
		break
	end
	local description = command.nodes[2]
	commands_file:write("\t{\n")
	commands_file:write("\t\tname = \"", name:gsub(" ", ""), "\",\n")
	commands_file:write("\t\ttype = \"", type, "\",\n")
	commands_file:write("\t\tdescription = [[\n")
	for _, paragraph in pairs(description.nodes) do
		if (paragraph.name == "p") then
			commands_file:write(format_html_to_markdown(paragraph:getcontent()), "\n")
		end
	end
	commands_file:write("\t\t]],\n")
	commands_file:write("\t},\n")
end
commands_file:write("}\n")
commands_file:close()
