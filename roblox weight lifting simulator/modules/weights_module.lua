local module = {}

module.Weights = {
	
	White = {cost =	150, multiplier = .1}; 
	Red = {cost = 200, multiplier = .1};
	Green = {cost = 200, multiplier = .1}; 
	Blue = {cost = 200, multiplier = .1};
	Pink = {cost = 200, multiplier = .1}; 
	Orange = {cost = 200, multiplier = .1};
	["Red Spikes" ] = {cost = 250, multiplier = .15};
	["Purple Wings"] = {cost = 350, multipleir = .15};
	["Orange Wings"] = {cost = 350, multiplier = .15};
	["Green Wings"] = {cost = 350, multiplier = .15};
	["Purple Glow"] = {cost = 350, multiplier = .17};
	["Gold Wings"] = {cost = 375, multiplier = .17};
	["Red Wings"] = {cost = 450, multiplier = .18};
	["White Wings"] = {cost = 450, multiplier = .18};
	["Blue Spikes"] = {cost = 500, multiplier = .19};
	["Yellow Spikes"] = {cost = 500, multiplier = .19};
	["Black Wings"] = {cost = 600, multiplier = .2};
	Legendary = {cost = 750, multiplier = .25}
	
}

module.GetCost = function(name)
	local key = module.Weights[name].cost
	return key
end

module.GetMultiplier = function(name)
	local key = module.Weights[name].multiplier
	return key
end

return module