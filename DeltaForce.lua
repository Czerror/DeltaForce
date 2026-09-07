--[[ Script Start ]]

------------------------------------------ [[ 玩家自定义 ]] ------------------------------------------
-- It is recommended to review the help documents and modify the following contents.
userInfo = {

	-- 是否输出调试信息，关闭后可以减小 CPU 计算压力。建议调试时开启，调试完毕后关闭。(1 - 开启 | 0 - 关闭)
	-- Whether to output debugging information, the CPU calculation pressure can be reduced after close.
	-- It is recommended to turn it on during debugging and turn it off after debugging.
	-- (0 - Disable | 1 - Enable)
	debug = 1,

	-- CPU 负载等级，建议输入 1 ~ 30 之间的数字，不能小于 1 。值越小，压枪效果越好，值越大，帧数越高。(过分掉帧会直接影响压枪效果，请在保证帧数的情况下减小该值)
	-- CPU load level, It is recommended to enter a number between 1 and 30, cannot be less than 1.
	-- The lower the value is, the better the effect is, the higher the value, the higher the number of frames.
	-- (excessive frame dropping will directly affect the gun pressing effect, please reduce the value while ensuring the frame number)
	cpuLoad = 2,

	-- 灵敏度调整 | Sensitivity adjustment
	sensitivity = {
		-- 开镜 | sighting mirror
		ADS = 100,
		-- 腰射 | take aim
		Aim = 0.55,
	},

	-- 腰射开关：0 = 仅开镜压枪, 1 = 腰射 + 开镜 均启用压枪
	-- Hipfire switch: 0 = ADS only, 1 = Hipfire + ADS
	hipfireEnabled = 0,

	-- 启动控制 (capslock - 使用大写锁定键控制 | numlock - 小键盘锁定键控制 | G_bind - 使用指令控制) | Start up control
	startControl = "G_bind",

	-- 支持的枪械，排列顺序即是配置顺序，可以自行调整。
	-- 新增口径只需: 1.在canUse添加条目 2.在ballisticData添加对应弹道数据
	-- {口径, 模式, 系数} 模式：0 - 不启用 | 1 - 启用 | 2 - 开启连点
	-- 系数：枪械自身系数，基于 ADS 进行调整 (ADS为全局系数，此处为自身系数)
	--
	-- ★ 新增口径示例 (以 ".300" 为例):
	--
	-- 第1步 - 在 canUse 中添加一行:
	--   { ".300",     1,      1 },
	--
	-- 第2步 - 在 ballisticData 中添加同名数据:
	--   [".300"] = {
	--       interval = 110,        -- 射速间隔(ms)，值越大射速越慢
	--       ballistic = {
	--           -- {发数, X补偿, Y补偿}  发数为累计值，X正=右移/负=左移，Y为下压量
	--           {1, 0, 0},            -- 第1发不补偿
	--           {3, 0, 20},           -- 第2~3发 Y补偿20
	--           {10, -2, 15},         -- 第4~10发 X左偏2 Y补偿15
	--       }
	--   },
	--
	-- 第3步(可选) - 在 G_bind 中绑定快捷键:
	--   ["G7"] = ".300",
	--
	canUse = {
		--口径        模式    系数
		{ "M14",      1,      1 },
		{ "MK47",     1,      1 },
		{ "MP5",     1,      1 },
		{ "PKM",     1,      1 },
		{ "M250",    1,      1 },
		{ "ASV",     1,      1 },
		{ "MK472",   1,      1},
	},

	-- 弹道数据配置 (interval=射速间隔ms, ballistic={发数, X补偿, Y补偿})
	ballisticData = {
		["M14"] = {
			interval = 82,
			ballistic = {
				{1, 0, 0},
				{2, 2, 15},
				{10, -3, 12},
				{20, -3, 11},
				{30, -3, 10},
			}
		},
		["MK47"] = {
			interval = 96,
			ballistic = {
				{1, 0, 0},
				{2, -6, 30},
				{10, -8, 30},
				{20, 3, 19},
				{30, -2, 20},
				{40, -8, 19},
			}
		},
		["MP5"] = {
			interval = 96,
			ballistic = {
				{1, 0, 0},
				{2, -1, 12},
				{10, -1, 11},
				{20, 3, 12},
				{30, 1, 11},
				{50, -2, 12},
			}
		},
		["PKM"] = {
			interval = 89,
			ballistic = {
				{1, 0, 0},
				{2, 1, 15},
				{10, 2, 18},
				{20, 3, 15},
				{30, 3, 11},
				{75, 5, 12},
			}
		},
		["M250"] = {
			interval = 109,
			ballistic = {
				{1, 0, 0},
				{2, 1, 8},
				{10, 2, 19},
				{20, 5, 19},
				{40, 8, 19},
				{75, 7, 16},
			}
		},
		["ASV"] = {
			interval = 62,
			ballistic = {
				{1, 0, 0},
				{2, 0, 12},
				{20, -2, 23},
				{30, -2, 28},
				{45, 3, 30},
			}
		},
		["MK472"] = {
			interval = 96,
			ballistic = {
				{1, 0, 0},
				{2, -6, 22},
				{10, -7, 22},
				{20, 3, 11},
				{30, -1, 12},
				{40, -9, 11},
			}
		},
	},

	-- G键自定义绑定，多余的组合键可以删除
	G_bind = {
		-- G
		["G3"] = "",
		["G4"] = "peak", -- peak摇摆开关 (按G4切换开关，开启后按住左键压枪时自动执行Q↔E摇摆)
		["G5"] = "",
		["G6"] = "MP5",
		["G7"] = "",
		["G8"] = "",
		["G9"] = "",
		["G10"] = "jumpSlide", -- 大跳滑铲 (Space → 800ms → C)
		["G11"] = "scissors", -- 剪刀 (C → 800ms → Space)
		-- 非鼠标G键，可以使键盘或者耳机上的G键，默认使用键盘G键，请确保你使用的是可编程的罗技键盘 | F1~12 (Non-mouse G-key)
		["F1"] = "",
		["F2"] = "",
		["F3"] = "",
		["F4"] = "",
		["F5"] = "",
		["F6"] = "",
		["F7"] = "",
		["F8"] = "",
		["F9"] = "",
		["F10"] = "",
		["F11"] = "",
		["F12"] = "",
	},
}
























----------------------------- [[ 以下是脚本核心代码，非专业人士请勿改动 ]] -----------------------------
----------------------------- [[ 以下是脚本核心代码，非专业人士请勿改动 ]] -----------------------------
----------------------------- [[ 以下是脚本核心代码，非专业人士请勿改动 ]] -----------------------------

-- internal configuration
DeltaForce = {
	ballistics = {}, -- 弹道配置库
	caliberConfig = {}, -- 口径配置查找表 (由init从canUse生成)
	enabledTypes = {}, -- 所有启用的子弹类型
	enabledIndex = 1, -- 当前在启用列表中的索引
	bulletType = "", -- 默认子弹型号
	counter = 0, -- 计数器
	xCounter = 0, -- x计数器
	sleep = userInfo.cpuLoad, -- 频率设置 (这里不能设置成0，调试会出BUG)
	sleepRandom = { userInfo.cpuLoad, userInfo.cpuLoad + 5 }, -- 防检测随机延迟
	startTime = 0, -- 鼠标按下时记录脚本运行时间戳
	generalSensitivityRatio = userInfo.sensitivity.ADS / 100, -- 按比例调整灵敏度
	isStart = false, -- 是否是启动状态
	G1 = false, -- G1键状态
	currentTime = 0, -- 此刻
	bulletIndex = 0, -- 第几颗子弹
	lastClickIndex = 0, -- 连点模式已触发的射击间隔
	peakEnabled = false, -- peak摇摆开关 (通过G_bind指令切换)
	peakSleep = 175, -- peak摇摆延迟(ms)，Q按下后等待此时间再按E
	peakState = 0, -- peak状态: 0=就绪, 1=已按Q等待E, 2=已按E等待下一轮Q
	peakTime = 0, -- peak下次状态转换的时间戳
}

DeltaForce.xLengthForDebug = DeltaForce.generalSensitivityRatio * 30 -- 调试模式下的水平移动单元长度
-- 渲染节点
DeltaForce.renderDom = {
	switchTable = "",
	separator = "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n", -- 分割线
	combo_key = "G-key", -- 组合键
	cmd = "cmd", -- 指令
	autoLog = "No operational data yet.\n", -- 压枪过程产生的数据输出
}

-- 是否开镜或瞄准
function DeltaForce.isAimingState (mode)
	if mode == "ADS" then
		return IsMouseButtonPressed(3)
	elseif mode == "Aim" then
		if userInfo.hipfireEnabled == 0 then
			return false
		end
		return not IsMouseButtonPressed(3)
	end
	return false
end

--[[ FormatFactory ]]
function DeltaForce.execOptions (caliber, options)

	--[[

		from

		{
			{ 5, 0, 10 },
			{ 10, -3, 24 },
		}

		to

		X: { 0, 0, 0, 0, 0, -3, -3, -3, -3, -3 }
		Y: { 10, 10, 10, 10, 10, 24, 24, 24, 24, 24 }

		to (cumulative)

		X: { 0, 0, 0, 0, 0, -3, -6, -9, -12, -15 }
		Y: { 10, 20, 30, 40, 50, 74, 98, 122, 146, 170 }

	]]

	local gunInfo = DeltaForce.caliberConfig[caliber]
	local ratio = DeltaForce.generalSensitivityRatio * gunInfo[2]

	-- 逐发展开容器
	local yPerBullet = {}
	local xPerBullet = {}
	-- 累计容器
	local yCumulative = {}
	local xCumulative = {}

	local idx = 1
	for i = 1, #options.ballistic do
		local entry = options.ballistic[i]
		local nextCount = entry[1]
		if i ~= 1 then
			nextCount = entry[1] - options.ballistic[i - 1][1]
		end
		local xVal = entry[2] * ratio
		local yVal = (entry[3] or 0) * ratio
		for j = 1, nextCount do
			yPerBullet[idx] = yVal
			xPerBullet[idx] = xVal
			idx = idx + 1
		end
	end

	for i = 1, #yPerBullet do
		if i == 1 then
			yCumulative[i] = yPerBullet[i]
			xCumulative[i] = xPerBullet[i]
		else
			yCumulative[i] = yCumulative[i - 1] + yPerBullet[i]
			xCumulative[i] = xCumulative[i - 1] + xPerBullet[i]
		end
	end

	return {
		duration = options.interval * #yCumulative, -- Time of duration
		amount = #yCumulative, -- Number of bullets
		interval = options.interval, -- Time of each bullet
		ballistic = yCumulative, -- Y ballistic data (cumulative)
		ballisticX = xCumulative, -- X ballistic data (cumulative)
	}

end

--[[ Initialization of firearms database ]]
function DeltaForce.init ()

	for i = 1, #userInfo.canUse do
		local entry = userInfo.canUse[i]
		local type = entry[1]
		local mode = entry[2]
		local ratio = entry[3]
		DeltaForce.caliberConfig[type] = { mode, ratio }

		if mode >= 1 then
			DeltaForce.ballistics[type] = DeltaForce.execOptions(type, userInfo.ballisticData[type])
			if mode == 2 then
				DeltaForce.ballistics[type].amount = math.min(DeltaForce.ballistics[type].amount, 3)
				DeltaForce.ballistics[type].duration = DeltaForce.ballistics[type].interval * DeltaForce.ballistics[type].amount
			end
			DeltaForce.ballistics[type].autoContinuousFiring = ({ 0, 0, 1 })[
				math.max(1, math.min(mode + 1, 3))
			]
			DeltaForce.enabledTypes[#DeltaForce.enabledTypes + 1] = type
			if DeltaForce.bulletType == "" then DeltaForce.bulletType = type end
		end
	end

	DeltaForce.SetRandomseed()
	DeltaForce.outputLogRender()

end

-- SetRandomseed
function DeltaForce.SetRandomseed ()
	math.randomseed(GetRunningTime())
end

--[[ Before automatic press gun ]]
function DeltaForce.auto (options)

	-- Accurate aiming press gun
	DeltaForce.currentTime = GetRunningTime()
	local elapsed = DeltaForce.currentTime - DeltaForce.startTime
	local position = elapsed / options.interval
	local baseIndex = math.floor(position) + 1
	local fraction = position - math.floor(position)
	local targetX
	local targetY

	if baseIndex < options.amount then
		DeltaForce.bulletIndex = baseIndex + 1
		targetX = options.ballisticX[baseIndex] + (options.ballisticX[baseIndex + 1] - options.ballisticX[baseIndex]) * fraction
		targetY = options.ballistic[baseIndex] + (options.ballistic[baseIndex + 1] - options.ballistic[baseIndex]) * fraction
	else
		DeltaForce.bulletIndex = options.amount
		local overflow = position - (options.amount - 1)
		local lastX = options.ballisticX[options.amount] - (options.ballisticX[options.amount - 1] or 0)
		local lastY = options.ballistic[options.amount] - (options.ballistic[options.amount - 1] or 0)
		targetX = options.ballisticX[options.amount] + lastX * overflow
		targetY = options.ballistic[options.amount] + lastY * overflow
	end

	-- Developer Debugging Mode
	local debugX = IsKeyLockOn("scrolllock") and position * DeltaForce.xLengthForDebug or 0
	local x = math.ceil(targetX + debugX) - DeltaForce.xCounter
	local y = math.ceil(targetY) - DeltaForce.counter
	-- 4-fold pressure gun mode
	local realY = DeltaForce.getRealY(options, y)
	MoveMouseRelative(x, realY)
	-- Whether to issue automatically or not
	if options.autoContinuousFiring == 1 then
		local clickIndex = math.floor(position)
		if clickIndex > DeltaForce.lastClickIndex then
			PressAndReleaseMouseButton(1)
			DeltaForce.lastClickIndex = clickIndex
		end
	end

	-- Real-time operation parameters
	DeltaForce.autoLog(options, x, y, targetX, targetY)
	DeltaForce.outputLogRender()

	DeltaForce.xCounter = DeltaForce.xCounter + x
	DeltaForce.counter = DeltaForce.counter + y

	DeltaForce.autoSleep(IsKeyLockOn("scrolllock"))

end

--[[ Sleep of DeltaForce.auto ]]
function DeltaForce.autoSleep (isTest)
	local random = 0
	if isTest then
		-- When debugging mode is turned on, Turn off random delays in preventive testing
		random = math.random(DeltaForce.sleep, DeltaForce.sleep)
	else
		random = math.random(DeltaForce.sleepRandom[1], DeltaForce.sleepRandom[2])
	end
	-- Sleep(10)
	Sleep(random)
end

--[[ get real y position ]]
function DeltaForce.getRealY (options, y)
	local realY = y

	if DeltaForce.isAimingState("ADS") then
		-- ADS: no additional adjustment
	elseif DeltaForce.isAimingState("Aim") then
		realY = y * userInfo.sensitivity.Aim
	end

	return math.round(realY)
end

--[[ Peak摇摆更新：非阻塞状态机，在压枪循环中持续调用 ]]
function DeltaForce.peakUpdate ()
	if not DeltaForce.peakEnabled then return end

	local now = GetRunningTime()
	local peakX = math.round(80 * DeltaForce.generalSensitivityRatio)

	if DeltaForce.peakState == 0 then
		-- 就绪状态：按下Q开始左探头
		PressKey("q")
		DeltaForce.peakState = 1
		DeltaForce.peakTime = now + DeltaForce.peakSleep + math.random(-DeltaForce.sleepRandom[2], DeltaForce.sleepRandom[2])
	elseif DeltaForce.peakState == 1 and now >= DeltaForce.peakTime then
		-- Q探头动画完成，向右补偿准心偏移
		MoveMouseRelative(peakX, 0)
		DeltaForce.peakState = 2
		DeltaForce.peakTime = now + DeltaForce.peakSleep + math.random(-DeltaForce.sleepRandom[2], DeltaForce.sleepRandom[2])
	elseif DeltaForce.peakState == 2 and now >= DeltaForce.peakTime then
		-- 释放Q，向左返回补偿；按下E开始右探头
		MoveMouseRelative(-peakX, 0)
		ReleaseKey("q")
		PressKey("e")
		DeltaForce.peakState = 3
		DeltaForce.peakTime = now + DeltaForce.peakSleep + math.random(-DeltaForce.sleepRandom[2], DeltaForce.sleepRandom[2])
	elseif DeltaForce.peakState == 3 and now >= DeltaForce.peakTime then
		-- E探头动画完成，向左补偿准心偏移
		MoveMouseRelative(-peakX, 0)
		DeltaForce.peakState = 4
		DeltaForce.peakTime = now + DeltaForce.peakSleep + math.random(-DeltaForce.sleepRandom[2], DeltaForce.sleepRandom[2])
	elseif DeltaForce.peakState == 4 and now >= DeltaForce.peakTime then
		-- 释放E，向右返回补偿；按下Q开始下一轮左探头
		MoveMouseRelative(peakX, 0)
		ReleaseKey("e")
		PressKey("q")
		DeltaForce.peakState = 1
		DeltaForce.peakTime = now + DeltaForce.peakSleep + math.random(-DeltaForce.sleepRandom[2], DeltaForce.sleepRandom[2])
	end
end

--[[ change DeltaForce isStart status ]]
function DeltaForce.changeIsStart (isTrue)
	DeltaForce.isStart = isTrue
	if isTrue then
		SetBacklightColor(0, 255, 150, "kb")
		SetBacklightColor(0, 255, 150, "mouse")
	else
		SetBacklightColor(255, 0, 90, "kb")
		SetBacklightColor(255, 0, 90, "mouse")
	end
end

--[[ set bullet type ]]
function DeltaForce.setBulletType (bulletType)
	-- 再次按下相同口径时关闭
	if DeltaForce.bulletType == bulletType and DeltaForce.isStart then
		DeltaForce.changeIsStart(false)
		return
	end

	DeltaForce.bulletType = bulletType

	for i = 1, #DeltaForce.enabledTypes do
		if DeltaForce.enabledTypes[i] == bulletType then
			DeltaForce.enabledIndex = i
			break
		end
	end

	DeltaForce.changeIsStart(true)
end

--[[ Script running status ]]
function DeltaForce.runStatus ()
	if not DeltaForce.ballistics[DeltaForce.bulletType] then return false end
	if userInfo.startControl == "capslock" then
		return IsKeyLockOn("capslock")
	elseif userInfo.startControl == "numlock" then
		return IsKeyLockOn("numlock")
	elseif userInfo.startControl == "G_bind" then
		return DeltaForce.isStart
	end
end

--[[ 剪刀：C → 800ms → Space ]]
function DeltaForce.scissors ()
	PressKey("c")
	Sleep(75 + math.random(-10, 10))
	ReleaseKey("c")
	Sleep(800 + math.random(-25, 25))
	PressKey("spacebar")
	Sleep(75 + math.random(-10, 10))
	ReleaseKey("spacebar")
end

--[[ 大跳滑铲：Space → 800ms → C ]]
function DeltaForce.jumpSlide ()
	PressKey("spacebar")
	Sleep(75 + math.random(-10, 10))
	ReleaseKey("spacebar")
	Sleep(800 + math.random(-25, 25))
	PressKey("c")
	Sleep(75 + math.random(-10, 10))
	ReleaseKey("c")
end

--[[ G key command binding ]]
function DeltaForce.runCmd (cmd)
	if cmd == "" then cmd = "none" end
	local switch = {
		["none"] = function () end,
		["peak"] = function ()
			DeltaForce.peakEnabled = not DeltaForce.peakEnabled
		end,
		["scissors"] = function ()
			DeltaForce.scissors()
		end,
		["jumpSlide"] = function ()
			DeltaForce.jumpSlide()
		end,
		["off"] = function ()
			DeltaForce.changeIsStart(false)
		end,
	}

	-- 动态注册所有启用的口径指令
	for i = 1, #DeltaForce.enabledTypes do
		switch[DeltaForce.enabledTypes[i]] = DeltaForce.setBulletType
	end

	local cmdGroup = string.split(cmd, '|')

	for i = 1, #cmdGroup do
		local _cmd = cmdGroup[i]
		if switch[_cmd] then
			switch[_cmd](_cmd)
		end
	end
end

--[[ autputLog render ]]
function DeltaForce.outputLogRender ()
	if userInfo.debug == 0 then return false end
	if not DeltaForce.G1 then
		DeltaForce.renderDom.switchTable = DeltaForce.outputLogGunSwitchTable()
	end
	local resStr = table.concat({
		"\n>> [\"", DeltaForce.renderDom.combo_key, "\"] = \"", DeltaForce.renderDom.cmd, "\" <<\n",
		DeltaForce.renderDom.separator,
		DeltaForce.renderDom.switchTable,
		DeltaForce.renderDom.separator,
		DeltaForce.outputLogGunInfo(),
		DeltaForce.renderDom.separator,
		DeltaForce.renderDom.autoLog,
		DeltaForce.renderDom.separator,
	})
	ClearLog()
	OutputLogMessage(resStr)
end

--[[ Output switching table ]]
function DeltaForce.outputLogGunSwitchTable ()
	local peakTag = DeltaForce.peakEnabled and "ON" or "OFF"
	local resStr = "      index\t      Series\t      ratio\t      peak: " .. peakTag .. "\n\n"

	for i = 1, #DeltaForce.enabledTypes do
		local type = DeltaForce.enabledTypes[i]
		local config = DeltaForce.caliberConfig[type]
		local tag = type == DeltaForce.bulletType and "=> " or "      "
		resStr = table.concat({ resStr, tag, i, "\t", tag, type, "\t", tag, config[2], "\n" })
	end

	return resStr
end

-- output Log Gun Info
function DeltaForce.outputLogGunInfo ()
	local k = DeltaForce.bulletType
	if not DeltaForce.ballistics[k] then return "No enabled caliber.\n" end

	return table.concat({
		"Currently series: [ ", k, " ]\n",
		"Currently index: [ ", DeltaForce.enabledIndex, " / ", #DeltaForce.enabledTypes, " ]\n",
		"Recoil table of [ ", k, " ]:\n",
		DeltaForce.outputLogRecoilTable(),
	})
end

--[[ output recoil table log ]]
function DeltaForce.outputLogRecoilTable ()
	local k = DeltaForce.bulletType
	local data = DeltaForce.ballistics[k]
	local resY = "Y: { "
	local resX = "X: { "
	for j = 1, data.amount do
		resY = table.concat({ resY, data.ballistic[j] })
		resX = table.concat({ resX, data.ballisticX[j] })
		if j ~= data.amount then
			resY = table.concat({ resY, ", " })
			resX = table.concat({ resX, ", " })
		end
	end
	resY = table.concat({ resY, " }\n" })
	resX = table.concat({ resX, " }\n" })

	return table.concat({ resY, resX })
end

--[[ log of DeltaForce.auto ]]
function DeltaForce.autoLog (options, x, y, targetX, targetY)
	DeltaForce.renderDom.autoLog = table.concat({
		"----------------------------------- Automatically counteracting gun recoil -----------------------------------\n",
		"------------------------------------------------------------------------------------------------------------------------------\n",
		"bullet index: ", DeltaForce.bulletIndex, "\n",
		"Y target: ", targetY, "  Y current: ", DeltaForce.counter, "  Y move: ", y, "\n",
		"X target: ", targetX, "  X current: ", DeltaForce.xCounter, "  X move: ", x, "\n",
		"------------------------------------------------------------------------------------------------------------------------------\n",
	})
end

--[[ Automatic press gun ]]
function DeltaForce.OnEvent_NoRecoil (event, arg, family)
	if event == "MOUSE_BUTTON_PRESSED" and arg == 1 and family == "mouse" then
		if not DeltaForce.runStatus() then return false end
		if DeltaForce.isAimingState("ADS") or DeltaForce.isAimingState("Aim") then
			DeltaForce.startTime = GetRunningTime()
			DeltaForce.G1 = true
			DeltaForce.lastClickIndex = 0
			DeltaForce.peakState = 0
			DeltaForce.peakTime = 0
			DeltaForce.shooting()
			-- 循环结束后清理：释放按键并返回未归位的补偿
			local peakX = math.round(80 * DeltaForce.generalSensitivityRatio)
			if DeltaForce.peakState == 1 then
				ReleaseKey("q")
			elseif DeltaForce.peakState == 2 then
				MoveMouseRelative(-peakX, 0)
				ReleaseKey("q")
			elseif DeltaForce.peakState == 3 then
				ReleaseKey("e")
			elseif DeltaForce.peakState == 4 then
				MoveMouseRelative(peakX, 0)
				ReleaseKey("e")
			end
			DeltaForce.G1 = false
			DeltaForce.counter = 0
			DeltaForce.xCounter = 0
			DeltaForce.SetRandomseed()
		end
	end
end

--[[ 压枪循环：持续执行直到松开左键 ]]
function DeltaForce.shooting ()
	repeat
		DeltaForce.peakUpdate()
		DeltaForce.auto(DeltaForce.ballistics[DeltaForce.bulletType])
	until not IsMouseButtonPressed(1)
end

-- [[ processing instruction ]]
function DeltaForce.modifierHandle (modifier)
	local cmd = userInfo.G_bind[modifier]
	DeltaForce.renderDom.combo_key = modifier -- Save combination keys

	if (cmd) then
		DeltaForce.renderDom.cmd = cmd -- Save instruction name
		DeltaForce.runCmd(cmd) -- Execution instructions
	else
		DeltaForce.renderDom.cmd = ""
	end

	DeltaForce.outputLogRender() -- Call log rendering method to output information
end

--[[ Listener method ]]
function OnEvent (event, arg, family)

	-- OutputLogMessage("event = %s, arg = %s, family = %s\n", event, arg, family)
	-- console.log("event = " .. event .. ", arg = " .. arg .. ", family = " .. family)

	DeltaForce.OnEvent_NoRecoil(event, arg, family)

	-- Switching arsenals according to different types of ammunition
	if event == "MOUSE_BUTTON_PRESSED" and arg >=3 and arg <= 11 and family == "mouse" then
		DeltaForce.modifierHandle("G" .. arg)
	elseif event == "G_PRESSED" and arg >=1 and arg <= 12 then
		-- if not DeltaForce.runStatus() and userInfo.startControl ~= "G_bind" then return false end
		local modifier = "F" .. arg

		DeltaForce.modifierHandle(modifier)
	end

	-- Script deactivated event
	if event == "PROFILE_DEACTIVATED" then
		EnablePrimaryMouseButtonEvents(false)
		ReleaseKey("lshift")
		ReleaseKey("lctrl")
		ReleaseKey("lalt")
		ReleaseKey("rshift")
		ReleaseKey("rctrl")
		ReleaseKey("ralt")
		ClearLog()
	end

end

--[[ tools ]]

-- 四舍五入 #170
function math.round (num, digit)
    local decimalPlaces = 10 ^ (digit or 0)
    return math.floor((num * decimalPlaces * 10 + 5) / 10) / decimalPlaces
end

-- split function
function string.split (str, s)
	if string.find(str, s) == nil then return { str } end

	local res = {}
	local reg = "(.-)" .. s .. "()"
	local index = 0
	local last_i

	for n, i in string.gmatch(str, reg) do
		index = index + 1
		res[index] = n
		last_i = i
	end

	res[index + 1] = string.sub(str, last_i)

	return res
end

-- Javascript Array.prototype.reduce
function table.reduce (t, c)
	local res = c(t[1], t[2])
	for i = 3, #t do res = c(res, t[i]) end
	return res
end

-- Javascript Array.prototype.map
function table.map (t, c)
	local res = {}
	for i = 1, #t do res[i] = c(t[i], i) end
	return res
end

-- Javascript Array.prototype.forEach
function table.forEach (t, c)
	for i = 1, #t do c(t[i], i) end
end

--[[
	* 打印 table
	* @param  {any} val     传入值
	* @return {str}         格式化后的文本
]]
function table.print (val)

	local function loop (val, keyType, _indent)
		_indent = _indent or 1
		keyType = keyType or "string"
		local res = ""
		local indentStr = "     " -- 缩进空格
		local indent = string.rep(indentStr, _indent)
		local end_indent = string.rep(indentStr, _indent - 1)
		local putline = function (...)
			local arr = { res, ... }
			for i = 1, #arr do
				if type(arr[i]) ~= "string" then arr[i] = tostring(arr[i]) end
			end
			res = table.concat(arr)
		end

		if type(val) == "table" then
			putline("{ ")

			if #val > 0 then
				local index = 0
				local block = false

				for i = 1, #val do
					local n = val[i]
					if type(n) == "table" or type(n) == "function" then
						block = true
						break
					end
				end

				if block then
					for i = 1, #val do
						local n = val[i]
						index = index + 1
						if index == 1 then putline("\n") end
						putline(indent, loop(n, type(i), _indent + 1), "\n")
						if index == #val then putline(end_indent) end
					end
				else
					for i = 1, #val do
						local n = val[i]
						index = index + 1
						putline(loop(n, type(i), _indent + 1))
					end
				end

			else
				putline("\n")
				for k, v in pairs(val) do
					putline(indent, k, " = ", loop(v, type(k), _indent + 1), "\n")
				end
				putline(end_indent)
			end

			putline("}, ")
		elseif type(val) == "string" then
			val = string.gsub(val, "\a", "\\a") -- 响铃(BEL)
			val = string.gsub(val, "\b", "\\b") -- 退格(BS),将当前位置移到前一列
			val = string.gsub(val, "\f", "\\f") -- 换页(FF),将当前位置移到下页开头
			val = string.gsub(val, "\n", "\\n") -- 换行(LF),将当前位置移到下一行开头
			val = string.gsub(val, "\r", "\\r") -- 回车(CR),将当前位置移到本行开头
			val = string.gsub(val, "\t", "\\t") -- 水平指标(HT),(调用下一个TAB位置)
			val = string.gsub(val, "\v", "\\v") -- 垂直指标(VT)
			putline("\"", val, "\", ")
		elseif type(val) == "boolean" then
			putline(val and "true, " or "false, ")
		elseif type(val) == "function" then
			putline(tostring(val), ", ")
		elseif type(val) == "nil" then
			putline("nil, ")
		else
			putline(val, ", ")
		end

		return res
	end

	local res = loop(val)
	res = string.gsub(res, ",(%s*})", "%1")
	res = string.gsub(res, ",(%s*)$", "%1")
	res = string.gsub(res, "{%s+}", "{}")

	return res
end

-- console
console = {}
function console.log (str)
	OutputLogMessage(table.print(str) .. "\n")
end

--[[ Other ]]
EnablePrimaryMouseButtonEvents(true) -- Enable left mouse button event reporting
DeltaForce.init() -- Script initialization

--[[ Script End ]]
