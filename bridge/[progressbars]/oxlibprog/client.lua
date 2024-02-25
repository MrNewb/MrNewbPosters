if Config.Progress ~= "ox" then return end

function CreateProgress()
	if lib.progressBar({
			duration = 2000, 
			label = 'Applying Poster',
			useWhileDead = false,
			canCancel = true,
			disable = {move = true, car = true , move = true, sprint = true},
			anim = {},
			prop = {},
		}) then
			--print('Progressbar started')
	end
end