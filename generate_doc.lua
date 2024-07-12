local http = require 'socket.http'
local body, statusCode, headers, statusText = http.request('https://squirrel-prover.github.io/documentation/proofs.html')
print('statusCode ', statusCode)
print('statusText ', statusText)
print('headers ')

local htmlparser = require("htmlparser")

local truc = htmlparser.parse(body, 1000000)

local tactics = truc:select(".squirrel.tacn")

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
	-- tactics_file:write("New tactic:")
	-- local box = tactic:select(".sig.sig-object.squirrel")[1]
	local box = tactic.nodes[1]
	local pre = box:select(".pre")
	local type = pre[1]:getcontent()
	local name = pre[2]:getcontent()
	if (type == "Error") then
		break
	end
	-- tactics_file:write("Type: ", type, " Name: ", name)("./tactics.lua", "w")
	local description = tactic.nodes[2]
	-- tactics_file:write("Description:\n")
	tactics_file:write("\t{\n")
	tactics_file:write("\t\tname = \"", name:gsub(" ", ""), "\",\n")
	tactics_file:write("\t\ttype = \"", type, "\",\n")
	tactics_file:write("\t\tdescription = [[\n")
	for _, paragraph in pairs(description.nodes) do
		if (paragraph.name == "p") then
			tactics_file:write(format_html_to_markdown(paragraph:getcontent()), "\n")
			-- tactics_file:write(paragraph:getcontent())
		end
	end
	tactics_file:write("\t\t]],\n")
	tactics_file:write("\t},\n")
	-- for _, text in pairs(pre) do
	-- 	tactics_file:write(text:getcontent())
	-- end
	-- tactics_file:write("Type: ",type:getcontent())
end
tactics_file:write("}\n")
