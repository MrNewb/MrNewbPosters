if Config.Progress ~= "qb" then return end

function CreateProgress(vehicle, currentplate)
    exports['progressbar']:Progress({
        name = 'poster',
        duration = 2000,
        label = 'Applying Poster',
        useWhileDead = false,
        canCancel = true,
		controlDisables = {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		},
    }, function(cancelled)
        if not cancelled then

        else

        end
    end)
end