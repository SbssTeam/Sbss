local function returnids(cb_extra, success, result)
   local receiver = cb_extra.receiver
   local chat_id = result.id
   local chatname = result.print_name
   for k,v in pairs(result.members) do
      send_large_msg(v.print_name, text)
   end
   send_large_msg(receiver, 'پیام با موفقیت به همه اعضا ارسال شد')
end

local function run(msg, matches)
   local receiver = get_receiver(msg)
   if not is_chat_msg(msg) then
      return 'کارکرد فقط در گروه'
   end
   if matches[1] then
      text = 'ارسال شده از: ' .. string.gsub(msg.to.print_name, '_', ' ') .. '\n______________________________'
      text = text .. '\n\n' .. matches[1]
      local chat = get_receiver(msg)
      chat_info(chat, returnids, {receiver=receiver})
   end
end

return {
   description = "ارسال پیام به پی وی اعضا گروه",
   usage = {
      "ارسال به همه (pm) : فرستادن یپام به پی وی افراد گروه",
	  "/s2a (pm) : فرستادن یپام به پی وی افراد گروه",
	  "s2a (pm) : فرستادن یپام به پی وی افراد گروه",
   },
   patterns = {
      "^ارسال به همه +(.+)$",
	  "^[!/#]s2a +(.+)$",
	  "^s2a +(.+)$"
   },
   run = run,
   moderated = true
}
