


local function run(msg)
    
    local data = load_data(_config.moderation.data)
    
     if data[tostring(msg.to.id)]['settings']['lock_sticker'] == 'yes' then
      
    
if msg.media.type  == 'document' and msg.media.caption == 'sticker.webp' and not is_momod(msg) then
    
    
chat_del_user('chat#id'..msg.to.id, 'user#id'..msg.from.id, ok_cb, true)
    local msgads = 'ForbiddenAdText'
   local receiver = msg.to.id
    send_large_msg('chat#id'..receiver, msg.."\n", ok_cb, false)
	
      end
   end
end
    
return {
patterns = {
    "sticker.webp",
	"%[(document)%]",
},
 run = run
}
