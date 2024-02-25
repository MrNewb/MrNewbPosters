if Config.Notify ~= "pNotify" then return end

function NotifyPlayer(msg, status)
	return exports.pNotify:SendNotification({text = msg, type = status, layout = "bottomCenter", timeout = 5000})
end