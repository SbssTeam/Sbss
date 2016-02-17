do

-- Check Member
local function check_member_autorealm(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  for k,v in pairs(result.members) do
    local member_id = v.id
    if member_id ~= our_id then
      -- Group configuration
      data[tostring(msg.to.id)] = {
        group_type = 'Realm',
        settings = {
          set_name = string.gsub(msg.to.print_name, '_', ' '),
          lock_name = 'yes',
          lock_photo = 'no',
          lock_member = 'no',
          flood = 'yes',
		  lock_link = 'yes',
		  sticker = 'ok',
		  version = '3.5',
		  groupmodel = 'normal',
		  tag = 'no',
		  lock_badw = 'no',
		  lock_english = 'no',
		  lock_arabic = 'no',
		  welcome = 'group'
        }
      }
      save_data(_config.moderation.data, data)
      local realms = 'realms'
      if not data[tostring(realms)] then
        data[tostring(realms)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(realms)][tostring(msg.to.id)] = msg.to.id
      save_data(_config.moderation.data, data)
      return send_large_msg(receiver, 'به ریلیم جدید ما خوش آمدید')
    end
  end
end
local function check_member_realm_add(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  for k,v in pairs(result.members) do
    local member_id = v.id
    if member_id ~= our_id then
      -- Group configuration
      data[tostring(msg.to.id)] = {
        group_type = 'Realm',
        settings = {
          set_name = string.gsub(msg.to.print_name, '_', ' '),
          lock_name = 'yes',
          lock_photo = 'no',
          lock_member = 'no',
          flood = 'yes',
		  lock_link = 'yes',
		  sticker = 'ok',
		  version = '3.5',
		  groupmodel = 'normal',
		  tag = 'no',
		  lock_badw = 'no',
		  lock_english = 'no',
		  lock_arabic = 'no',
		  welcome = 'group'
        }
      }
      save_data(_config.moderation.data, data)
      local realms = 'realms'
      if not data[tostring(realms)] then
        data[tostring(realms)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(realms)][tostring(msg.to.id)] = msg.to.id
      save_data(_config.moderation.data, data)
      return send_large_msg(receiver, 'ریلیم اضافه شد!')
    end
  end
end
function check_member_group(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  for k,v in pairs(result.members) do
    local member_id = v.id
    if member_id ~= our_id then
      -- Group configuration
      data[tostring(msg.to.id)] = {
        group_type = 'Group',
        moderators = {},
        set_owner = member_id ,
        settings = {
          set_name = string.gsub(msg.to.print_name, '_', ' '),
          lock_name = 'yes',
          lock_photo = 'no',
          lock_member = 'no',
          flood = 'yes',
		  lock_link = 'yes',
		  sticker = 'ok',
		  version = '3.5',
		  groupmodel = 'normal',
		  tag = 'no',
		  lock_badw = 'no',
		  lock_english = 'no',
		  lock_arabic = 'no',
		  welcome = 'group'
        }
      }
      save_data(_config.moderation.data, data)
      local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(groups)][tostring(msg.to.id)] = msg.to.id
      save_data(_config.moderation.data, data)
      return send_large_msg(receiver, 'شما صاحب گروه شدید')
    end
  end
end
local function check_member_modadd(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  for k,v in pairs(result.members) do
    local member_id = v.id
    if member_id ~= our_id then
      -- Group configuration
      data[tostring(msg.to.id)] = {
        group_type = 'Group',
        moderators = {},
        set_owner = member_id ,
        settings = {
          set_name = string.gsub(msg.to.print_name, '_', ' '),
          lock_name = 'yes',
          lock_photo = 'no',
          lock_member = 'no',
          flood = 'yes',
		  lock_link = 'yes',
		  sticker = 'ok',
		  version = '3.5',
		  groupmodel = 'normal',
		  tag = 'no',
		  lock_badw = 'no',
		  lock_english = 'no',
		  lock_arabic = 'no',
		  welcome = 'group'
        }
      }
      save_data(_config.moderation.data, data)
      local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(groups)][tostring(msg.to.id)] = msg.to.id
      save_data(_config.moderation.data, data)
      return send_large_msg(receiver, 'گروه اضافه شد و شما صاحب آن شدید')
    end
  end
end
local function automodadd(msg)
  local data = load_data(_config.moderation.data)
  if msg.action.type == 'chat_created' then
    receiver = get_receiver(msg)
    chat_info(receiver, check_member_group,{receiver=receiver, data=data, msg = msg})
  end
end
local function autorealmadd(msg)
  local data = load_data(_config.moderation.data)
  if msg.action.type == 'chat_created' then
    receiver = get_receiver(msg)
    chat_info(receiver, check_member_autorealm,{receiver=receiver, data=data, msg = msg})
  end
end
local function check_member_realmrem(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  for k,v in pairs(result.members) do
    local member_id = v.id
    if member_id ~= our_id then
      -- Realm configuration removal
      data[tostring(msg.to.id)] = nil
      save_data(_config.moderation.data, data)
      local realms = 'realms'
      if not data[tostring(realms)] then
        data[tostring(realms)] = nil
        save_data(_config.moderation.data, data)
      end
      data[tostring(realms)][tostring(msg.to.id)] = nil
      save_data(_config.moderation.data, data)
      return send_large_msg(receiver, 'ریلیم حذف شد')
    end
  end
end
local function check_member_modrem(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  for k,v in pairs(result.members) do
    local member_id = v.id
    if member_id ~= our_id then
      -- Group configuration removal
      data[tostring(msg.to.id)] = nil
      save_data(_config.moderation.data, data)
      local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = nil
        save_data(_config.moderation.data, data)
      end
      data[tostring(groups)][tostring(msg.to.id)] = nil
      save_data(_config.moderation.data, data)
      return send_large_msg(receiver, 'گروه حذف شد')
    end
  end
end
--End Check Member
local function show_group_settingsmod(msg, data, target)
 	if not is_momod(msg) then
    	return "فقط مدیران"
  	end
  	local data = load_data(_config.moderation.data)
    if data[tostring(msg.to.id)] then
     	if data[tostring(msg.to.id)]['settings']['flood_msg_max'] then
        	NUM_MSG_MAX = tonumber(data[tostring(msg.to.id)]['settings']['flood_msg_max'])
        	print('custom'..NUM_MSG_MAX)
      	else 
        	NUM_MSG_MAX = 5
      	end
    end
    local bots_protection = "Yes"
    if data[tostring(msg.to.id)]['settings']['lock_bots'] then
    	bots_protection = data[tostring(msg.to.id)]['settings']['lock_bots']
   	end
    local leave_ban = "no"
    if data[tostring(msg.to.id)]['settings']['leave_ban'] then
    	leave_ban = data[tostring(msg.to.id)]['settings']['leave_ban']
   	end
    local lock_link = "Yes"
    if data[tostring(msg.to.id)]['settings']['lock_link'] then
    	lock_link = data[tostring(msg.to.id)]['settings']['lock_link']
   	end
    local sticker = "ok"
    if data[tostring(msg.to.id)]['settings']['sticker'] then
    	sticker = data[tostring(msg.to.id)]['settings']['sticker']
   	end
    local tag = "no"
    if data[tostring(msg.to.id)]['settings']['tag'] then
    	tag = data[tostring(msg.to.id)]['settings']['tag']
   	end
    local lock_badw = "no"
    if data[tostring(msg.to.id)]['settings']['lock_badw'] then
    	lock_badw = data[tostring(msg.to.id)]['settings']['lock_badw']
   	end
    local lock_english = "no"
    if data[tostring(msg.to.id)]['settings']['lock_english'] then
    	lock_username = data[tostring(msg.to.id)]['settings']['lock_english']
   	end
    local lock_arabic = "no"
    if data[tostring(msg.to.id)]['settings']['lock_arabic'] then
    	lock_arabic = data[tostring(msg.to.id)]['settings']['lock_arabic']
   	end
    local welcome = "group"
    if data[tostring(msg.to.id)]['settings']['welcome'] then
    	welcome = data[tostring(msg.to.id)]['settings']['welcome']
   	end
  local settings = data[tostring(target)]['settings']
  local text = "تنظیمات گروه:\n⚙⚙⚙⚙⚙⚙⚙⚙⚙⚙⚙⚙⚙⚙⚙⚙\n>قفل نام گروه : "..settings.lock_name.."\n>قفل عکس گروه : "..settings.lock_photo.."\n>قفل اعضا : "..settings.lock_member.."\n>ممنوعیت ارسال لینک : "..lock_link.."\n>حساسیت اسپم : "..NUM_MSG_MAX.."\n>قفل ربات ها : "..bots_protection.."\n>قفل تگ : "..tag.."\n>قفل اینگلیسی :"..lock_english.."\n>قفل فحش : "..lock_badw.."\n>Sbss Open Source Version\n"
  return text
end

local function set_descriptionmod(msg, data, target, about)
  if not is_momod(msg) then
    return "قفط مدیران"
  end
  local data_cat = 'توضیحات'
  data[tostring(target)][data_cat] = about
  save_data(_config.moderation.data, data)
  return 'توضیحات گروه به این متن تغییر یافت:\n'..about
end
local function get_description(msg, data)
  local data_cat = 'توضیحات'
  if not data[tostring(msg.to.id)][data_cat] then
    return 'توضیحی موجود نیست'
  end
  local about = data[tostring(msg.to.id)][data_cat]
  local about = string.gsub(msg.to.print_name, "_", " ")..':\n\n'..about
  return 'درباره'..about
end
local function lock_group_arabic(msg, data, target)
  if not is_momod(msg) then
    return "قفط مدیران"
  end
  local group_arabic_lock = data[tostring(target)]['settings']['lock_arabic']
  if group_arabic_lock == 'yes' then
    return 'عربی از قبل قفل است'
  else
    data[tostring(target)]['settings']['lock_arabic'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'عربی قفل شد'
  end
end

local function unlock_group_arabic(msg, data, target)
  if not is_momod(msg) then
    return "فقط مدیران"
  end
  local group_arabic_lock = data[tostring(target)]['settings']['lock_arabic']
  if group_arabic_lock == 'no' then
    return 'عربی از قبل آزاد است'
  else
    data[tostring(target)]['settings']['lock_arabic'] = 'no'
    save_data(_config.moderation.data, data)
    return 'عربی آزاد شد'
  end
end

local function lock_group_tag(msg, data, target)
  if not is_momod(msg) then
    return "فقط مدیران❗️"
  end
  local group_tag_lock = data[tostring(target)]['settings']['tag']
  if group_tag_lock == 'yes' then
    return 'تگ کردن از قبل قفل است🔒'
  else
    data[tostring(target)]['settings']['tag'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'تگردن ممنوع شد✅🔒'
  end
end

local function unlock_group_tag(msg, data, target)
  if not is_momod(msg) then
    return "فقط مدیران"
  end
  local group_tag_lock = data[tostring(target)]['settings']['tag']
  if group_tag_lock == 'no' then
    return 'تگ کردن از قبل آزاد است🔓'
  else
    data[tostring(target)]['settings']['tag'] = 'no'
    save_data(_config.moderation.data, data)
    return 'تگ کردن آزاد شد✅🔓'
  end
end

local function lock_group_username(msg, data, target)
  if not is_momod(msg) then
    return "قفط مدیران❗️"
  end
  local group_english_lock = data[tostring(target)]['settings']['lock_english']
  if group_english_lock == 'yes' then
    return 'ایگلیسی از قبل قفل است🔒'
  else
    data[tostring(target)]['settings']['lock_english'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'اینگلیسی قفل شد✅🔒'
  end
end

local function unlock_group_english(msg, data, target)
  if not is_momod(msg) then
    return "قفط مدیران❗️"
  end
  local group_english_lock = data[tostring(target)]['settings']['lock_english']
  if group_english_lock == 'no' then
    return 'اینگلیسی از قبل باز است🔓'
  else
    data[tostring(target)]['settings']['lock_english'] = 'no'
    save_data(_config.moderation.data, data)
    return 'اینگلیسی ازاد شد✅🔓'
  end
end

local function lock_group_badw(msg, data, target)
  if not is_momod(msg) then
    return "فقط مدیران❗️"
  end
  local group_badw_lock = data[tostring(target)]['settings']['lock_badw']
  if group_badw_lock == 'yes' then
    return 'فحاشی از قبل ممنوع است🔒'
  else
    data[tostring(target)]['settings']['lock_badw'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'فحاشی قفل شد✅🔒'
  end
end

local function unlock_group_badw(msg, data, target)
  if not is_momod(msg) then
    return "فقط مدیران❗️"
  end
  local group_badw_lock = data[tostring(target)]['settings']['lock_badw']
  if group_badw_lock == 'no' then
    return 'فحاشی از قبل آزاد است🔓'
  else
    data[tostring(target)]['settings']['lock_badw'] = 'no'
    save_data(_config.moderation.data, data)
    return 'فحاشی آزاد شد✅🔓'
  end
end

local function lock_group_link(msg, data, target)
  if not is_momod(msg) then
    return "فقط مدیران❗️"
  end
  local group_link_lock = data[tostring(target)]['settings']['lock_link']
  if group_link_lock == 'yes' then
    return 'ارسال لینک از قبل ممنوع است🔒'
  else
    data[tostring(target)]['settings']['lock_link'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'ارسال لینک ممنوع شد✅🔒'
  end
end

local function unlock_group_link(msg, data, target)
  if not is_momod(msg) then
    return "فقط مدیران❗️"
  end
  local group_link_lock = data[tostring(target)]['settings']['lock_link']
  if group_link_lock == 'no' then
    return 'ارسال لینک از قبل آزاد است🔓'
  else
    data[tostring(target)]['settings']['lock_link'] = 'no'
    save_data(_config.moderation.data, data)
    return 'lارسال لینک آزاد شد✅🔓'
  end
end

local function lock_group_username(msg, data, target)
  if not is_momod(msg) then
    return "فقط برای مدیران❗️"
  end
  local group_username_lock = data[tostring(target)]['settings']['lock_username']
  if group_username_lock == 'yes' then
    return 'یوزر نیم از قبل قفل است🔒'
  else
    data[tostring(target)]['settings']['lock_username'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'یوزر نیم آزاد شد✅🔒'
  end
end

local function unlock_group_username(msg, data, target)
  if not is_momod(msg) then
    return "فقط مدیران❗️"
  end
  local group_username_lock = data[tostring(target)]['settings']['lock_username']
  if group_username_lock == 'no' then
    return 'ارسال یوزر نیم از قبل آزاد است🔓'
  else
    data[tostring(target)]['settings']['lock_username'] = 'no'
    save_data(_config.moderation.data, data)
    return 'ارسال یوزر نیم آژاد شد✅🔓'
  end
end

local function lock_group_bots(msg, data, target)
  if not is_momod(msg) then
    return "قفط مدیران"
  end
  local group_bots_lock = data[tostring(target)]['settings']['lock_bots']
  if group_bots_lock == 'yes' then
    return 'قفل ربات ها از قبل فعال است'
  else
    data[tostring(target)]['settings']['lock_bots'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'ورود ربات ها قفل شد'
  end
end

local function unlock_group_bots(msg, data, target)
  if not is_momod(msg) then
    return "فقط مدیران"
  end
  local group_bots_lock = data[tostring(target)]['settings']['lock_bots']
  if group_bots_lock == 'no' then
    return 'ورود ربات ها از قبل آزاد است'
  else
    data[tostring(target)]['settings']['lock_bots'] = 'no'
    save_data(_config.moderation.data, data)
    return 'ورود ربات ها ازاد شد'
  end
end

local function lock_group_namemod(msg, data, target)
  if not is_momod(msg) then
    return "فقط برای مدیران"
  end
  local group_name_set = data[tostring(target)]['settings']['set_name']
  local group_name_lock = data[tostring(target)]['settings']['lock_name']
  if group_name_lock == 'yes' then
    return 'نام گروه از قبل قفل است'
  else
    data[tostring(target)]['settings']['lock_name'] = 'yes'
    save_data(_config.moderation.data, data)
    rename_chat('chat#id'..target, group_name_set, ok_cb, false)
    return 'نام گروه قفل شد'
  end
end
local function unlock_group_namemod(msg, data, target)
  if not is_momod(msg) then
    return "فقط مدیران"
  end
  local group_name_set = data[tostring(target)]['settings']['set_name']
  local group_name_lock = data[tostring(target)]['settings']['lock_name']
  if group_name_lock == 'no' then
    return 'نام گروه از قبل باز است'
  else
    data[tostring(target)]['settings']['lock_name'] = 'no'
    save_data(_config.moderation.data, data)
    return 'نام گروه باز شد'
  end
end
local function lock_group_floodmod(msg, data, target)
  if not is_owner(msg) then
    return "فقط توسط گلوبال ادمین ها"
  end
  local group_flood_lock = data[tostring(target)]['settings']['flood']
  if group_flood_lock == 'yes' then
    return 'ارسال پیام سریع ممنوع از قبل ممنوع بود'
  else
    data[tostring(target)]['settings']['flood'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'اسپم قفل شد'
  end
end

local function unlock_group_floodmod(msg, data, target)
  if not is_owner(msg) then
    return "فقط برای گلوبال ادمین ها"
  end
  local group_flood_lock = data[tostring(target)]['settings']['flood']
  if group_flood_lock == 'no' then
    return 'اسپم قفل نیست!'
  else
    data[tostring(target)]['settings']['flood'] = 'no'
    save_data(_config.moderation.data, data)
    return 'ارسال سریع پیام آزاد شد'
  end
end

local function lock_group_membermod(msg, data, target)
  if not is_momod(msg) then
    return "فقط برای مدیران!"
  end
  local group_member_lock = data[tostring(target)]['settings']['lock_member']
  if group_member_lock == 'yes' then
    return 'ورود اعضا از قبل قفل است'
  else
    data[tostring(target)]['settings']['lock_member'] = 'yes'
    save_data(_config.moderation.data, data)
  end
  return 'ورود اعضا قفل شد'
end

local function unlock_group_membermod(msg, data, target)
  if not is_momod(msg) then
    return "فقط مدیران"
  end
  local group_member_lock = data[tostring(target)]['settings']['lock_member']
  if group_member_lock == 'no' then
    return 'عضو گیری ازاد است'
  else
    data[tostring(target)]['settings']['lock_member'] = 'no'
    save_data(_config.moderation.data, data)
    return 'عضو گیری ازاد شد'
  end
end

local function lock_group_leave(msg, data, target)
  if not is_momod(msg) then
    return "فقط برای مدیران"
  end
  local leave_ban = data[tostring(msg.to.id)]['settings']['leave_ban']
  if leave_ban == 'yes' then
    return 'خروج از قبل ممنوع بود'
  else
    data[tostring(msg.to.id)]['settings']['leave_ban'] = 'yes'
    save_data(_config.moderation.data, data)
  end
  return 'کسانی که خارج میشوند بن خواهند شد'
end

local function unlock_group_leave(msg, data, target)
  if not is_momod(msg) then
    return "فقط مدیران!"
  end
  local leave_ban = data[tostring(msg.to.id)]['settings']['leave_ban']
  if leave_ban == 'no' then
    return 'خروج آزاد بود'
  else
    data[tostring(msg.to.id)]['settings']['leave_ban'] = 'no'
    save_data(_config.moderation.data, data)
    return 'خروج آزاد شد'
  end
end

local function unlock_group_photomod(msg, data, target)
  if not is_momod(msg) then
    return "فقط مدیران"
  end
  local group_photo_lock = data[tostring(target)]['settings']['lock_photo']
  if group_photo_lock == 'no' then
    return 'عکس گروه قفل نیست'
  else
    data[tostring(target)]['settings']['lock_photo'] = 'no'
    save_data(_config.moderation.data, data)
    return 'عکس گروه باز شد'
  end
end

local function set_rulesmod(msg, data, target)
  if not is_momod(msg) then
    return "فقط مدیران"
  end
  local data_cat = 'قوانین'
  data[tostring(target)][data_cat] = rules
  save_data(_config.moderation.data, data)
  return 'قوانین گروه به این متن تغییر یافت:\n'..rules
end
local function modadd(msg)
  -- superuser and admins only (because sudo are always has privilege)
  if not is_admin(msg) then
    return "شما ادمین نیستید"
  end
  local data = load_data(_config.moderation.data)
  if is_group(msg) then
    return 'گروه از قبل اد شده'
  end
    receiver = get_receiver(msg)
    chat_info(receiver, check_member_modadd,{receiver=receiver, data=data, msg = msg})
end
local function realmadd(msg)
  -- superuser and admins only (because sudo are always has privilege)
  if not is_admin(msg) then
    return "شما ادمین نیستید"
  end
  local data = load_data(_config.moderation.data)
  if is_realm(msg) then
    return 'ریلیم از قبل اد شده'
  end
    receiver = get_receiver(msg)
    chat_info(receiver, check_member_realm_add,{receiver=receiver, data=data, msg = msg}) 
end
-- Global functions
function modrem(msg)
  -- superuser and admins only (because sudo are always has privilege)
  if not is_admin(msg) then
    return "شما ادمین نیستید"
  end
  local data = load_data(_config.moderation.data)
  if not is_group(msg) then
    return 'گروه اضافه نشده'
  end
    receiver = get_receiver(msg)
    chat_info(receiver, check_member_modrem,{receiver=receiver, data=data, msg = msg})
end

function realmrem(msg)
  -- superuser and admins only (because sudo are always has privilege)
  if not is_admin(msg) then
    return "شما ادمین نیستید"
  end
  local data = load_data(_config.moderation.data)
  if not is_realm(msg) then
    return 'ریلیم اد نشده'
  end
    receiver = get_receiver(msg)
    chat_info(receiver, check_member_realmrem,{receiver=receiver, data=data, msg = msg})
end
local function get_rules(msg, data)
  local data_cat = 'قوانین'
  if not data[tostring(msg.to.id)][data_cat] then
    return 'قانونی موجود نیست'
  end
  local rules = data[tostring(msg.to.id)][data_cat]
  local rules = 'قوانین گروه:\n'..rules
  return rules
end

local function set_group_photo(msg, success, result)
  local data = load_data(_config.moderation.data)
  local receiver = get_receiver(msg)
  if success then
    local file = 'data/photos/chat_photo_'..msg.to.id..'.jpg'
    print('File downloaded to:', result)
    os.rename(result, file)
    print('File moved to:', file)
    chat_set_photo (receiver, file, ok_cb, false)
    data[tostring(msg.to.id)]['settings']['set_photo'] = file
    save_data(_config.moderation.data, data)
    data[tostring(msg.to.id)]['settings']['lock_photo'] = 'yes'
    save_data(_config.moderation.data, data)
    send_large_msg(receiver, 'عکس ذخیره شد!', ok_cb, false)
  else
    print('Error downloading: '..msg.id)
    send_large_msg(receiver, 'Failed, please try again!', ok_cb, false)
  end
end

local function promote(receiver, member_username, member_id)
  local data = load_data(_config.moderation.data)
  local group = string.gsub(receiver, 'chat#id', '')
  if not data[group] then
    return send_large_msg(receiver, 'گروه اضافه نشده')
  end
  if data[group]['moderators'][tostring(member_id)] then
    return send_large_msg(receiver, member_username..' از قبل مدیر است')
  end
  data[group]['moderators'][tostring(member_id)] = member_username
  save_data(_config.moderation.data, data)
  return send_large_msg(receiver, member_username..' ترفیع یافت')
end

local function promote_by_reply(extra, success, result)
    local msg = result
    local full_name = (msg.from.first_name or '')..' '..(msg.from.last_name or '')
    if msg.from.username then
      member_username = '@'.. msg.from.username
    else
      member_username = full_name
    end
    local member_id = msg.from.id
    if msg.to.type == 'chat' then
      return promote(get_receiver(msg), member_username, member_id)
    end  
end

local function demote(receiver, member_username, member_id)
  local data = load_data(_config.moderation.data)
  local group = string.gsub(receiver, 'chat#id', '')
  if not data[group] then
    return send_large_msg(receiver, 'گروه اضافه نشده')
  end
  if not data[group]['moderators'][tostring(member_id)] then
    return send_large_msg(receiver, member_username..' مدیر نیست !')
  end
  data[group]['moderators'][tostring(member_id)] = nil
  save_data(_config.moderation.data, data)
  return send_large_msg(receiver, member_username..' تنزل یافت')
end

local function demote_by_reply(extra, success, result)
    local msg = result
    local full_name = (msg.from.first_name or '')..' '..(msg.from.last_name or '')
    if msg.from.username then
      member_username = '@'..msg.from.username
    else
      member_username = full_name
    end
    local member_id = msg.from.id
    if msg.to.type == 'chat' then
      return demote(get_receiver(msg), member_username, member_id)
    end  
end

local function setleader_by_reply(extra, success, result)
  local msg = result
  local receiver = get_receiver(msg)
  local data = load_data(_config.moderation.data)
  local name_log = msg.from.print_name:gsub("_", " ")
  data[tostring(msg.to.id)]['set_owner'] = tostring(msg.from.id)
      save_data(_config.moderation.data, data)
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] setted ["..msg.from.id.."] as leader")
      local text = msg.from.print_name:gsub("_", " ").." اکنون صاحب گروه است "
      return send_large_msg(receiver, text)
end

local function promote_demote_res(extra, success, result)
--vardump(result)
--vardump(extra)
      local member_id = result.id
      local member_username = "@"..result.username
      local chat_id = extra.chat_id
      local mod_cmd = extra.mod_cmd
      local receiver = "chat#id"..chat_id
      if mod_cmd == 'ترفیع' then
        return promote(receiver, member_username, member_id)
      elseif mod_cmd == 'تنزل' then
        return demote(receiver, member_username, member_id)
      end
end

local function modlist(msg)
  local data = load_data(_config.moderation.data)
  local groups = "groups"
  if not data[tostring(groups)][tostring(msg.to.id)] then
    return 'گروه اد نشده'
  end
  -- determine if table is empty
  if next(data[tostring(msg.to.id)]['moderators']) == nil then --fix way
    return 'دراین گروه هیچ مدیری وجود ندارد'
  end
  local i = 1
  local message = '\nلیست مدیر های گروه ' .. string.gsub(msg.to.print_name, '_', ' ') .. ':\n'
  for k,v in pairs(data[tostring(msg.to.id)]['moderators']) do
    message = message ..i..' - '..v..' [' ..k.. '] \n'
    i = i + 1
  end
  return message
end

local function callbackres(extra, success, result)
--vardump(result)
  local user = result.id
  local name = string.gsub(result.print_name, "_", " ")
  local chat = 'chat#id'..extra.chatid
  send_large_msg(chat, user..'\n'..name)
  return user
end


local function help()
  local help_text = tostring(_config.help_text)
  return help_text
end

local function cleanmember(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local chat_id = "chat#id"..result.id
  local chatname = result.print_name
  for k,v in pairs(result.members) do
    kick_user(v.id, result.id)     
  end
end

local function killchat(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local chat_id = "chat#id"..result.id
  local chatname = result.print_name
  for k,v in pairs(result.members) do
    kick_user_any(v.id, result.id)     
  end
end

local function killrealm(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local chat_id = "chat#id"..result.id
  local chatname = result.print_name
  for k,v in pairs(result.members) do
    kick_user_any(v.id, result.id)     
  end
end

local function user_msgs(user_id, chat_id)
  local user_info
  local uhash = 'user:'..user_id
  local user = redis:hgetall(uhash)
  local um_hash = 'msgs:'..user_id..':'..chat_id
  user_info = tonumber(redis:get(um_hash) or 0)
  return user_info
end

local function kick_zero(cb_extra, success, result)
    local chat_id = cb_extra.chat_id
    local chat = "chat#id"..chat_id
    local ci_user
    local re_user
    for k,v in pairs(result.members) do
        local si = false
        ci_user = v.id
        local hash = 'chat:'..chat_id..':users'
        local users = redis:smembers(hash)
        for i = 1, #users do
            re_user = users[i]
            if tonumber(ci_user) == tonumber(re_user) then
                si = true
            end
        end
        if not si then
            if ci_user ~= our_id then
                if not is_momod2(ci_user, chat_id) then
                  chat_del_user(chat, 'user#id'..ci_user, ok_cb, true)
                end
            end
        end
    end
end

local function kick_inactive(chat_id, num, receiver)
    local hash = 'chat:'..chat_id..':users'
    local users = redis:smembers(hash)
    -- Get user info
    for i = 1, #users do
        local user_id = users[i]
        local user_info = user_msgs(user_id, chat_id)
        local nmsg = user_info
        if tonumber(nmsg) < tonumber(num) then
            if not is_momod2(user_id, chat_id) then
              chat_del_user('chat#id'..chat_id, 'user#id'..user_id, ok_cb, true)
            end
        end
    end
    return chat_info(receiver, kick_zero, {chat_id = chat_id})
end

local function run(msg, matches)
  local data = load_data(_config.moderation.data)
  local receiver = get_receiver(msg)
   local name_log = user_print_name(msg.from)
  local group = msg.to.id
  if msg.media then
    if msg.media.type == 'photo' and data[tostring(msg.to.id)]['settings']['set_photo'] == 'waiting' and is_chat_msg(msg) and is_momod(msg) then
      load_photo(msg.id, set_group_photo, msg)
    end
  end
  if matches[1] == 'اضافه' and not matches[2] then
    if is_realm(msg) then
       return 'خطا : از قبل ریلیم بوده'
    end
    print("group "..msg.to.print_name.."("..msg.to.id..") added")
    return modadd(msg)
  end
   if matches[1] == 'اضافه' and matches[2] == 'ریلیم' then
    if is_group(msg) then
       return 'خطا : اینجا یک گروه است'
    end
    print("group "..msg.to.print_name.."("..msg.to.id..") added as a realm")
    return realmadd(msg)
  end
  if matches[1] == 'حذف' and not matches[2] then
    print("group "..msg.to.print_name.."("..msg.to.id..") removed")
    return modrem(msg)
  end
  if matches[1] == 'حذف' and matches[2] == 'ریلیم' then
    print("group "..msg.to.print_name.."("..msg.to.id..") removed as a realm")
    return realmrem(msg)
  end
  if matches[1] == 'chat_created' and msg.from.id == 0 and group_type == "group" then
    return automodadd(msg)
  end
  if matches[1] == 'chat_created' and msg.from.id == 0 and group_type == "realm" then
    return autorealmadd(msg)
  end

  if msg.to.id and data[tostring(msg.to.id)] then
    local settings = data[tostring(msg.to.id)]['settings']
    if matches[1] == 'chat_add_user' then
      if not msg.service then
        return "Are you trying to troll me?"
      end
      local group_member_lock = settings.lock_member
      local user = 'user#id'..msg.action.user.id
      local chat = 'chat#id'..msg.to.id
      if group_member_lock == 'yes' and not is_owner2(msg.action.user.id, msg.to.id) then
        chat_del_user(chat, user, ok_cb, true)
      elseif group_member_lock == 'yes' and tonumber(msg.from.id) == tonumber(our_id) then
        return nil
      elseif group_member_lock == 'no' then
        return nil
      end
    end
    if matches[1] == 'chat_del_user' then
      if not msg.service then
         -- return "Are you trying to troll me?"
      end
      local user = 'user#id'..msg.action.user.id
      local chat = 'chat#id'..msg.to.id
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] deleted user  "..user)
    end
    if matches[1] == 'chat_delete_photo' then
      if not msg.service then
        return "Are you trying to troll me?"
      end
      local group_photo_lock = settings.lock_photo
      if group_photo_lock == 'yes' then
        local picturehash = 'picture:changed:'..msg.to.id..':'..msg.from.id
        redis:incr(picturehash)
        ---
        local picturehash = 'picture:changed:'..msg.to.id..':'..msg.from.id
        local picprotectionredis = redis:get(picturehash) 
        if picprotectionredis then 
          if tonumber(picprotectionredis) == 4 and not is_owner(msg) then 
            kick_user(msg.from.id, msg.to.id)
          end
          if tonumber(picprotectionredis) ==  8 and not is_owner(msg) then 
            ban_user(msg.from.id, msg.to.id)
            local picturehash = 'picture:changed:'..msg.to.id..':'..msg.from.id
            redis:set(picturehash, 0)
          end
        end
        
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] tried to deleted picture but failed  ")
        chat_set_photo(receiver, settings.set_photo, ok_cb, false)
      elseif group_photo_lock == 'no' then
        return nil
      end
    end
    if matches[1] == 'chat_change_photo' and msg.from.id ~= 0 then
      if not msg.service then
        return "Are you trying to troll me?"
      end
      local group_photo_lock = settings.lock_photo
      if group_photo_lock == 'yes' then
        local picturehash = 'picture:changed:'..msg.to.id..':'..msg.from.id
        redis:incr(picturehash)
        ---
        local picturehash = 'picture:changed:'..msg.to.id..':'..msg.from.id
        local picprotectionredis = redis:get(picturehash) 
        if picprotectionredis then 
          if tonumber(picprotectionredis) == 4 and not is_owner(msg) then 
            kick_user(msg.from.id, msg.to.id)
          end
          if tonumber(picprotectionredis) ==  8 and not is_owner(msg) then 
            ban_user(msg.from.id, msg.to.id)
          local picturehash = 'picture:changed:'..msg.to.id..':'..msg.from.id
          redis:set(picturehash, 0)
          end
        end
        
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] tried to change picture but failed  ")
        chat_set_photo(receiver, settings.set_photo, ok_cb, false)
      elseif group_photo_lock == 'no' then
        return nil
      end
    end
    if matches[1] == 'chat_rename' then
      if not msg.service then
        return "Are you trying to troll me?"
      end
      local group_name_set = settings.set_name
      local group_name_lock = settings.lock_name
      local to_rename = 'chat#id'..msg.to.id
      if group_name_lock == 'yes' then
        if group_name_set ~= tostring(msg.to.print_name) then
          local namehash = 'name:changed:'..msg.to.id..':'..msg.from.id
          redis:incr(namehash)
          local namehash = 'name:changed:'..msg.to.id..':'..msg.from.id
          local nameprotectionredis = redis:get(namehash) 
          if nameprotectionredis then 
            if tonumber(nameprotectionredis) == 4 and not is_owner(msg) then 
              kick_user(msg.from.id, msg.to.id)
            end
            if tonumber(nameprotectionredis) ==  8 and not is_owner(msg) then 
              ban_user(msg.from.id, msg.to.id)
              local namehash = 'name:changed:'..msg.to.id..':'..msg.from.id
              redis:set(namehash, 0)
            end
          end
          
          savelog(msg.to.id, name_log.." ["..msg.from.id.."] tried to change name but failed  ")
          rename_chat(to_rename, group_name_set, ok_cb, false)
        end
      elseif group_name_lock == 'no' then
        return nil
      end
    end
    if matches[1] == 'تنظیم نام' and is_momod(msg) then
      local new_name = string.gsub(matches[2], '_', ' ')
      data[tostring(msg.to.id)]['settings']['set_name'] = new_name
      save_data(_config.moderation.data, data)
      local group_name_set = data[tostring(msg.to.id)]['settings']['set_name']
      local to_rename = 'chat#id'..msg.to.id
      rename_chat(to_rename, group_name_set, ok_cb, false)
      
      savelog(msg.to.id, "Group { "..msg.to.print_name.." }  name changed to [ "..new_name.." ] by "..name_log.." ["..msg.from.id.."]")
    end
    if matches[1] == 'تنظیم عکس' and is_momod(msg) then
      data[tostring(msg.to.id)]['settings']['set_photo'] = 'waiting'
      save_data(_config.moderation.data, data)
      return 'لطفا عکس جدید گروه را ارسال کنید'
    end
    if matches[1] == 'ترفیع' and not matches[2] then
      if not is_owner(msg) then
        return "فقط توسط صاحب گروه"
      end
      if type(msg.reply_id)~="nil" then
          msgr = get_message(msg.reply_id, promote_by_reply, false)
      end
    end
    if matches[1] == 'ترفیع' and matches[2] then
      if not is_momod(msg) then
        return
      end
      if not is_owner(msg) then
        return "فقط توسط صاحب گروه"
      end
	local member = matches[2]
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] promoted @".. member)
	local cbres_extra = {
	chat_id = msg.to.id,
        mod_cmd = 'ترفیع', 
	from_id = msg.from.id
	}
	local username = matches[2]
	local username = string.gsub(matches[2], '@', '')
	return res_user(username, promote_demote_res, cbres_extra)
    end
    if matches[1] == 'تنزل' and not matches[2] then
      if not is_owner(msg) then
        return "فقط توسط صاحب گروه"
      end
      if type(msg.reply_id)~="nil" then
          msgr = get_message(msg.reply_id, demote_by_reply, false)
      end
    end
    if matches[1] == 'تنزل' and matches[2] then
      if not is_momod(msg) then
        return
      end
      if not is_owner(msg) then
        return "فقط توسط صاحب گروه"
      end
      if string.gsub(matches[2], "@", "") == msg.from.username and not is_owner(msg) then
        return "شما نمیتوانید مقام خود را حذف کنید"
      end
	local member = matches[2]
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] demoted @".. member)
	local cbres_extra = {
	chat_id = msg.to.id,
        mod_cmd = 'تنزل', 
	from_id = msg.from.id
	}
	local username = matches[2]
	local username = string.gsub(matches[2], '@', '')
	return res_user(username, promote_demote_res, cbres_extra)
    end
    if matches[1] == 'لیست مدیران' then
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group modlist")
      return modlist(msg)
    end
    if matches[1] == 'توضیحات' then
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group description")
      return get_description(msg, data)
    end
    if matches[1] == 'قوانین' then
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group rules")
      return get_rules(msg, data)
    end
    if matches[1] == 'تنظیم' then
      if matches[2] == 'قوانین' then
        rules = matches[3]
        local target = msg.to.id
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] has changed group rules to ["..matches[3].."]")
        return set_rulesmod(msg, data, target)
      end
      if matches[2] == 'توضیحات' then
        local data = load_data(_config.moderation.data)
        local target = msg.to.id
        local about = matches[3]
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] has changed group description to ["..matches[3].."]")
        return set_descriptionmod(msg, data, target, about)
      end
    end
    if matches[1] == 'قفل' then
      local target = msg.to.id
      if matches[2] == 'نام' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked name ")
        return lock_group_namemod(msg, data, target)
      end
      if matches[2] == 'اعضا' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked member ")
        return lock_group_membermod(msg, data, target)
        end
      if matches[2] == 'اسپم' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked flood ")
        return lock_group_floodmod(msg, data, target)
      end
      if matches[2] == 'ربات ها' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked bots ")
        return lock_group_bots(msg, data, target)
      end
      if matches[2] == 'لینک' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked link🔒 ")
        return lock_group_link(msg, data, target)
      end
      if matches[2] == 'تگ' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked tag🔒 ")
        return lock_group_tag(msg, data, target)
      end
      if matches[2] == 'فحش' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked badw🔒 ")
        return lock_group_badw(msg, data, target)
      end
      if matches[2] == 'اینگلیسی' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked english🔒 ")
        return lock_group_english(msg, data, target)
      end
    if matches[2] == 'خروج' then
       savelog(msg.to.id, name_log.." ["..msg.from.id.."] locked leaving ")
       return lock_group_leave(msg, data, target)
     end
   end
    if matches[1] == 'بازکردن' then 
      local target = msg.to.id
      if matches[2] == 'نام' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked name ")
        return unlock_group_namemod(msg, data, target)
      end
      if matches[2] == 'اعضا' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked member ")
        return unlock_group_membermod(msg, data, target)
      end
      if matches[2] == 'عکس' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked photo ")
        return unlock_group_photomod(msg, data, target)
      end
      if matches[2] == 'اسپم' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked flood ")
        return unlock_group_floodmod(msg, data, target)
      end
      if matches[2] == 'ربات  ها' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked bots ")
        return unlock_group_bots(msg, data, target)
      end
      if matches[2] == 'لینک' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked link🔓 ")
        return unlock_group_link(msg, data, target)
      end
      if matches[2] == 'تگ' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked tag🔓 ")
        return unlock_group_tag(msg, data, target)
      end
      if matches[2] == 'فحش' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked badw🔓 ")
        return unlock_group_badw(msg, data, target)
      end
      if matches[2] == 'اینگلیسی' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked english🔓 ")
        return unlock_group_english(msg, data, target)
      end
    if matches[2] == 'خروج' then
       savelog(msg.to.id, name_log.." ["..msg.from.id.."] unlocked leaving ")
       return unlock_group_leave(msg, data, target)
     end
   end
    if matches[1] == 'settings' or matches[1] == 'تنظیمات' then
      local target = msg.to.id
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group settings ")
      return show_group_settingsmod(msg, data, target)
    end	

  --[[if matches[1] == 'public' then
    local target = msg.to.id
    if matches[2] == 'yes' then
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] set group to: public")
      return set_public_membermod(msg, data, target)
    end
    if matches[2] == 'no' then
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] set group to: not public")
      return unset_public_membermod(msg, data, target)
    end
  end]]

    if matches[1] == 'لینک جدید' and not is_realm(msg) then
      if not is_momod(msg) then
        return "فقط برای مدیران"
      end
      local function callback (extra , success, result)
        local receiver = 'chat#'..msg.to.id
        if success == 0 then
           return send_large_msg(receiver, '*خطا : \nربات سازنده گروه نیست')
        end
        send_large_msg(receiver, "لینک جدید ساخته شد")
        data[tostring(msg.to.id)]['settings']['set_link'] = result
        save_data(_config.moderation.data, data)
      end
      local receiver = 'chat#'..msg.to.id
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] revoked group link ")
      return export_chat_link(receiver, callback, true)
    end
    if matches[1] == 'لینک' then
      if not is_momod(msg) then
        return "فقط مدیران"
      end
      local group_link = data[tostring(msg.to.id)]['settings']['set_link']
      if not group_link then 
        return "اول با لینک جدید یک  لینک جدید بسازید"
      end
       savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group link ["..group_link.."]")
      return "لینک گروه:\n🤖🇮🇷🤖🇮🇷🤖🇮🇷🤖🇮🇷🤖🇮🇷🤖🇮🇷🤖🇮🇷🤖🇮🇷🤖🇮🇷🤖🇮🇷\n"..group_link
    end
      if matches[1] == 'لینک خصوصی' then
      if not is_momod(msg) then
        return "فقط برای مدیران"
      end
      local group_link = data[tostring(msg.to.id)]['settings']['set_link']
      if not group_link then 
        return "اول با لینک جدید یک لینک جدید بسازید"
      end
       savelog(msg.to.id, name_log.." ["..msg.from.id.."] requested group link ["..group_link.."]")
     send_large_msg('user#id'..msg.from.id, "لینک گروه:\n🤖🇮🇷🤖🇮🇷🤖🇮🇷🤖🇮🇷🤖🇮🇷🤖🇮🇷🤖🇮🇷🤖🇮🇷🤖🇮🇷🤖🇮🇷\n"..group_link)
    end
    if matches[1] == 'دارنده' and matches[2] then
      if not is_owner(msg) then
        return "شما مجاز نیستید"
      end
      data[tostring(msg.to.id)]['set_owner'] = matches[2]
      save_data(_config.moderation.data, data)
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] set ["..matches[2].."] as leader")
      local text = matches[2].." added as leader"
      return text
    end
    if matches[1] == 'دارنده' and not matches[2] then
      if not is_owner(msg) then
        return "شما مجاز نیستید"
      end
      if type(msg.reply_id)~="nil" then
          msgr = get_message(msg.reply_id, setleader_by_reply, false)
      end
    end
    if matches[1] == 'صاحب گروه' then
      local group_leader = data[tostring(msg.to.id)]['set_owner']
      if not group_leader then 
        return "no leader,ask admins in support groups to set leader for your group"
      end
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] used /leader")
      return "آیدی صاحب گروه : ["..group_leader..']'
    end
    if matches[1] == 'صاحب' then
      local receiver = "chat#id"..matches[2]
      if not is_admin(msg) then
        return "For admins only!"
      end
      data[tostring(matches[2])]['set_owner'] = matches[3]
      save_data(_config.moderation.data, data)
      local text = matches[3].." added as leader"
      send_large_msg(receiver, text)
      return
    end
    if matches[1] == 'حساسیت' then 
      if not is_momod(msg) then
        return "شما مجاز نیستید"
      end
      if tonumber(matches[2]) < 5 or tonumber(matches[2]) > 20 then
        return "عددی از بین 5 و 20 انتخاب کنید"
      end
      local flood_max = matches[2]
      data[tostring(msg.to.id)]['settings']['flood_msg_max'] = flood_max
      save_data(_config.moderation.data, data)
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] set flood to ["..matches[2].."]")
      return 'حساسیت اسپم تغییر یافت به '..matches[2]
    end
    if matches[1] == 'پاک کردن' then
      if not is_owner(msg) then
        return "شما مجاز نیستید"
      end
      if matches[2] == 'اعضا' then
        if not is_owner(msg) then
          return "شما مجاز نیستید"
        end
        local receiver = get_receiver(msg)
        chat_info(receiver, cleanmember, {receiver=receiver})
      end
      if matches[2] == 'مدیران' then
        if next(data[tostring(msg.to.id)]['moderators']) == nil then --fix way
          return 'مدیری در گروه نیست'
        end
        local message = '\nلیست مدیران گروه ' .. string.gsub(msg.to.print_name, '_', ' ') .. ':\n'
        for k,v in pairs(data[tostring(msg.to.id)]['moderators']) do
          data[tostring(msg.to.id)]['moderators'][tostring(k)] = nil
          save_data(_config.moderation.data, data)
        end
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] cleaned modlist")
      end
      if matches[2] == 'rules' and matches[2] == 'قوانین' then 
        local data_cat = 'قوانین'
        data[tostring(msg.to.id)][data_cat] = nil
        save_data(_config.moderation.data, data)
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] cleaned rules")
      end
      if matches[2] == 'توضیحات' then 
        local data_cat = 'توضیحات'
        data[tostring(msg.to.id)][data_cat] = nil
        save_data(_config.moderation.data, data)
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] cleaned about")
      end     
    end
    if matches[1] == 'kill' and matches[2] == 'chat' then
      if not is_admin(msg) then
          return nil
      end
      if not is_realm(msg) then
          local receiver = get_receiver(msg)
          return modrem(msg),
          print("Closing Group..."),
          chat_info(receiver, killchat, {receiver=receiver})
      else
          return 'This is a realm'
      end
   end
    if matches[1] == 'kill' and matches[2] == 'realm' then
     if not is_admin(msg) then
         return nil
     end
     if not is_group(msg) then
        local receiver = get_receiver(msg)
        return realmrem(msg),
        print("Closing Realm..."),
        chat_info(receiver, killrealm, {receiver=receiver})
     else
        return 'This is a group'
     end
   end
    if matches[1] == 'راهنما' then
      if not is_momod(msg) or is_realm(msg) then
        return
      end
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] Used /help")
      return help()
    end
    if matches[1] == 'کد' and is_momod(msg) then 
      local cbres_extra = {
        chatid = msg.to.id
      }
      local username = matches[2]
      local username = username:gsub("@","")
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] Used /res "..username)
      return res_user(username,  callbackres, cbres_extra)
    end
    if matches[1] == 'kickinactive' then
      --send_large_msg('chat#id'..msg.to.id, 'I\'m in matches[1]')
	    if not is_momod(msg) then
	      return 'Only a moderator can kick inactive users'
	    end
	    local num = 1
	    if matches[2] then
	        num = matches[2]
	    end
	    local chat_id = msg.to.id
	    local receiver = get_receiver(msg)
      return kick_inactive(chat_id, num, receiver)
    end
  end 
end

return {
  patterns = {
  "^(اضافه)$",
  "^(اضافه) (ریلیم)$",
  "^(حذف)$",
  "^(حذف) (ریلیم)$",
  "^(قوانین)$",
  "^(توضیحات)$",
  "^(تنظیم نام) (.*)$",
  "^(تنظیم عکس)$",
  "^(ترفیع) (.*)$",
  "^(ترفیع)",
  "^(راهنما)$",
  "^(پاک کردن) (.*)$",
  "^(kill) (chat)$",
  "^(kill) (realm)$",
  "^(تنزل) (.*)$",
  "^(تنزل)",
  "^(تنظیم) ([^%s]+) (.*)$",
  "^(قفل) (.*)$",
  "^(دارنده) (%d+)$",
  "^(دارنده)",
  "^(صاحب گروه)$",
  "^(کد) (.*)$",
  "^(صاحب) (%d+) (%d+)$",-- (group id) (leader id)
  "^(بازکردن) (.*)$",
  "^(حساسیت) (%d+)$",
  "^(تنظیمات)$",
-- "^(public) (.*)$",
  "^(لیست مدیران)$",
  "^(لینک جدید)$",
  "^(لینک)$",
  "^(kickinactive)$",
  "^(kickinactive) (%d+)$",
  "^(لینک خصوصی)$",
  "%[(photo)%]",
  "^!!tgservice (.+)$",
  },
  run = run
}
end
