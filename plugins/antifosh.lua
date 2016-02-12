


local function run(msg)
    
    local data = load_data(_config.moderation.data)
    
     if data[tostring(msg.to.id)]['settings']['antifosh'] == 'yes' then
      
    
if not is_momod(msg) then
    
    
chat_del_user('chat#id'..msg.to.id, 'user#id'..msg.from.id, ok_cb, true)
    local msgads = 'ForbiddenAdText'
   local receiver = msg.to.id
    send_large_msg('chat#id'..receiver, msg.."\n", ok_cb, false)
	
      end
   end
end
    
return {patterns = {
    "کیر",
	"[Kk]ir",
	"کص",
	"کس",
	"جنده",
	"لاشی",
	"کونی",
	"حرومزاده",
	"حرومی",
	"سگ",
	"مادر سگ",
	"[Kk]os",
	"[Jj]ende",
	"[Ll]ashi",
	"[Kk]ooni",
	"[Hh]aroom",
	"[Ff]uck",
	"[Ff]cker",
	"suck",
    },
    run = run
    }
