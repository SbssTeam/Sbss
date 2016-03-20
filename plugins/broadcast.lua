local function run(msg, matches)
	if matches[1] == 'bc' and is_admin(msg) then
		local response = matches[3]
		send_large_msg("chat#id"..matches[2], response)
	end
	if matches[1] == 'فرستادن' or matches[1] == 'broadcast'then
		if is_sudo(msg) then -- Only sudo !
			local data = load_data(_config.moderation.data)
			local groups = 'groups'
			local response = matches[2]
			for k,v in pairs(data[tostring(groups)]) do
				chat_id =  v
				local receiver = 'chat#id'..chat_id
				send_large_msg(receiver, response)
			end
		end
	end
end
return {
description = "Send a Massage To all Groups",
 usage = {
  "/broadcast (msg) : Send Massage To all Groups",
  "broadcast (msg): Send Massage To all Groups",
  "فرستادن (msg) : Send Massage To all Groups",
 },
  patterns = {
    "^(فرستادن) +(.+)$",
    "^[!/#](broadcast) +(.+)$",
    "^(broadcast) +(.+)$",
    "^(bc) (%d+) (.*)$"
  },
  run = run
}
