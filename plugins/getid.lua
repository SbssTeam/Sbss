do

function run(msg, matches)
    if is_sudo(msg) then
local reply_id = msg['id']
return reply_id
end
end

return {
patterns = {
"(.*)"

},
run = run
}

end