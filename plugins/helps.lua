function run(msg, matches)
if is_momod(msg) then
      fwd_msg('chat#id'..msg.to.id,'146173',ok_cb,false)
end 
return {
  description = "Invite bot into a group chat", 
  usage = "!join [invite link]",
  patterns = {
    "^[#!/](group help)",
    "^(group help)",
    "^(کمک)",

  },
  run = run
}
end