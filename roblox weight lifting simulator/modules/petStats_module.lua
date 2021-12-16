local module = {}

module.pets = {
	
	Alien = {multi = .1, coinMulti = 1.5};
	Alien2 = {multi = .2, coinMulti = 2};
	AlienShip = {multi = .3, coinMulti = 3};
	
	Earth1 = {multi = .1, coinMulti = 1.5};
	Earth2 = {multi = .2, coinMulti = 2};
	Ball = {multi = .3, coinMulti = 3};
	
	Ice = {multi = .1, coinMulti = 1.5};
	Ice2 = {multi = .2, coinMulti = 2};
	Ice3 = {multi = .3, coinMulti = 3};
	
	Light = {multi = .1, coinMulti = 1.5};
	Ghost = {multi = .2, coinMulti = 2};
	ElectroManga = {multi = .3, coinMulti = 3};
	
	Heaven = {multi = .1, coinMulti = 1.5};
	Heaven2 = {multi = .2, coinMulti = 2};
	Heavem3 = {multi = .3, coinMulti = 3};
	
	Lava = {multi = .1, coinMulti = 1.5};
	Lava2 = {multi = .2, coinMulti = 2};
	Lava3 = {multi = .3, coinMulti = 3}
	
}

function module.GetMulti(name)
	local key = module.pets[name].multi
	return key
end

function module.GetCoinMulti(name)
	local key = module.pets[name].coinMulti
	return key
end

return module
