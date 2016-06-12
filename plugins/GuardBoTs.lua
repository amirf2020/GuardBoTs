local function run(msg, matches)
local GuardBoTs = [[GuardBoTs Version : 1.0
BoT Channel : @xxxxx
BoT Sudo : @alfroshotak
BoT Sudo Report : @alfroshotak_pm_bot
BoT Pv : @GuardBoTs
BoT Github : https://github.com/amirf2020/GuardBoTs]]
return GuardBoTs
end
return {
patterns = {
"^[!#/][Gg][Uu][Aa][Rr][Dd][Bb][Oo][Tt][Ss]$"
}, 
run = run
}
