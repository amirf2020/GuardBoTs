do

local function run(msg, matches)
  if matches[1] == "sendsh" then
    local file = matches[2]
    if is_sudo(msg) then
      local receiver = get_receiver(msg)
      send_document(receiver, ..file..".sh", ok_cb, false)
    end
  end
end

return {
  patterns = {
  "^[!/](sendsh) (.*)$"
  },
  run = run
}
end
