do

local function run(msg, matches)
  if matches[1] == 'me' then
    if is_sudo(msg) then
    send_document(get_receiver(msg), "/root/robot/sudo.webp", ok_cb, false)
      return "You are My SUDO"
    elseif is_admin(msg) then
    send_document(get_receiver(msg), "/root/robot/admin.webp", ok_cb, false)
      return "You are My ADMIN"
    elseif is_owner(msg) then
    send_document(get_receiver(msg), "/root/robot/owner.webp", ok_cb, false)
      return "You are Group Owner"
    elseif is_momod(msg) then
    send_document(get_receiver(msg), "/root/robot/mod.webp", ok_cb, false)
      return "You are Group Mod"
    else
    send_document(get_receiver(msg), "/root/robot/mmbr.webp", ok_cb, false)
      return "You are Group Member"
    end
  end
end

return {
  patterns = {
    "^[!/]([Mm]e)$",
    "^([Mm]e)$"
    },
  run = run
}
end
