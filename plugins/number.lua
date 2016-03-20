local function run(msg, matches ) 
  if matches[1] == "phone" then
    return msg.from.number
  end
end

return {
  patterns ={
    "^[/! #](phone)$" 
 }, 
  run = run 
}