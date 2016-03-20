local function run(msg, matches)
    if matches[1] == "پشتیبانی" or matches[1] == "support" then
 local user = "user#id"..msg.from.id
 local chat = "chat#id"..113090136
 
 chat_add_user(chat, user, ok_cb, false)
    end
return {
  patterns = {
    "^پشتیبانی$",
	"^support$",
  },
  run = run
}
end
