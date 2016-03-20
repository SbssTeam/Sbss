-- Function reference: http://mathjs.org/docs/reference/functions/categorical.html

local function mathjs(exp)
  local url = 'http://api.mathjs.org/v1/'
  url = url..'?expr='..URL.escape(exp)
  local b,c = http.request(url)
  local text = nil
  if c == 200 then
    text = '= '..b
  
  elseif c == 400 then
    text = b
  else
    text = 'خطا!'
  end
  return text
end

local function run(msg, matches)
  return mathjs(matches[1])
end

return {
description = "commands: / and * and ^ and + and -",
 usage = {
  "/calc (Formula) : Calculate a Formula",
  "calc (Formula) : Calculate a Formula",
  "/محاسبه (Formula) : Calculate a Formula",
 },
  patterns = {
    "^(محاسبه) (.*)$",
	"^(calc) (.*)$",
	"^[!/#](calc) (.*)$"
  },
  run = run
}
