-- By AviraTeam https://telegram.me/avirateam
-- Devloper : MohammadArak https://telegram.me/mohammadarak
-- Bot ID: @avirabot
--      /\  \\        // ||  //------\\        /\
--     //\\  \\      //  || ||       ||       //\\
--    //__\\  \\    //   || ||______//       //__\\
--   //____\\  \\  //    || ||      \\      //____\\
--  //      \\  \\//     || ||       \\    //      \\
-- //        \\  \/      || ||        \\  //        \\

local function is_channel_disabled( receiver )
	if not _config.disabled_channels then
		return false
	end

	if _config.disabled_channels[receiver] == nil then
		return false
	end

  return _config.disabled_channels[receiver]
end

local function enable_channel(receiver)
	if not _config.disabled_channels then
		_config.disabled_channels = {}
	end

	if _config.disabled_channels[receiver] == nil then
		return 'ربات خاموش نمی باشد 🚀'
	end
	
	_config.disabled_channels[receiver] = false

	save_config()
	return "ربات روشن شد 🚀"
end

local function disable_channel( receiver )
	if not _config.disabled_channels then
		_config.disabled_channels = {}
	end
	
	_config.disabled_channels[receiver] = true

	save_config()
	return "ربات خاموش شد 😴"
end

-- By AviraTeam https://telegram.me/avirateam
-- Devloper : MohammadArak https://telegram.me/mohammadarak
-- Bot ID: @avirabot
--      /\  \\        // ||  //------\\        /\
--     //\\  \\      //  || ||       ||       //\\
--    //__\\  \\    //   || ||______//       //__\\
--   //____\\  \\  //    || ||      \\      //____\\
--  //      \\  \\//     || ||       \\    //      \\
-- //        \\  \/      || ||        \\  //        \\

local function pre_process(msg)
	local receiver = get_receiver(msg)
	
	-- If sender is moderator then re-enable the channel
	--if is_sudo(msg) then
	if is_momod(msg) then
	  if msg.text:lower() == "#bot on" or msg.text:lower() == "/bot on"or msg.text:lower() == "!bot on" then
	    enable_channel(receiver)
	  end
	end

  if is_channel_disabled(receiver) then
  	msg.text = "ربات روشن شد 🚀"
  end

	return msg
end

local function run(msg, matches)
	local receiver = get_receiver(msg)
	-- Enable a channel
	if matches[1]:lower() == 'on' then
		return enable_channel(receiver)
	end
	-- Disable a channel
	if matches[1]:lower() == 'off' then
		return disable_channel(receiver)
	end
end

return {
	description = "Plugin to manage channels. Enable or disable channel.", 
	usage = {
		"!channel enable: enable current channel",
		"!channel disable: disable current channel" },
	patterns = {
		"^[!#/][Bb]ot? ([Oo]n)",
		"^[!#/][Bb]ot? ([Oo]ff)",}, 
	run = run,
	--privileged = true,
	privileged = true,
	pre_process = pre_process
}

-- By AviraTeam https://telegram.me/avirateam
-- Devloper : MohammadArak https://telegram.me/mohammadarak
-- Bot ID: @avirabot
--      /\  \\        // ||  //------\\        /\
--     //\\  \\      //  || ||       ||       //\\
--    //__\\  \\    //   || ||______//       //__\\
--   //____\\  \\  //    || ||      \\      //____\\
--  //      \\  \\//     || ||       \\    //      \\
-- //        \\  \/      || ||        \\  //        \\
