
local function run(msg, matches)
  local text = matches[1]
  local b = 1

  while b ~= 0 do
    text = text:trim()
    text,b = text:gsub('^!+','')
  end
  return text
end

return {
  description = "تکرار یک پیام",
  usage = " تکرار پیام",
  patterns = {
    "^(.+)$"
  }, 
  run = run 
}
