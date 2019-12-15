local ui = {}

function ui.Btt(p1, p2)
	local midle = {}
	midle.x = (p1.x + p2.x)/2
	midle.y = (p1.y +p2.y)/2
	return midle
end

return ui
