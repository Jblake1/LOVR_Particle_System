function lovr.load()
-- Load Requires
require "loadBackground"
require "loadLighting"

lovr.graphics.setColor(1, 0, 0)

-- Declaring Globals
	roomSize = 3
	math.randomseed(os.time())

	cubes = {}
end


function lovr.update(dt) 
	if math.random() < 0.01 then     ----comment
		local cube = {}
		cube.h = .05
		cube.x = math.random(-1, 1)
		cube.y = math.random(.25, 1.25) 
		cube.z = math.random(-1, 1)
		if math.random(-1,1) < 0 then cube.p = -.1 else cube.p = .1 end
		if math.random(-1,1) < 0 then cube.n = -.1 else cube.n = .1 end
		if math.random(-1,1) < 0 then cube.g = -.1 else cube.g = .1 end
		cube.speed = .1
--		cube.age = 0
		table.insert(cubes, cube)
	end

	for i=#cubes, 1, -1 do
		local cube = cubes[i]
--		cube.age = cube.age+1
--			if cube.age > 5000 then
--				table.remove(cubes,i)
--			end
		cube.x = cube.x+cube.p*cube.speed
		cube.y = cube.y+cube.g*cube.speed
		cube.z = cube.z+cube.n*cube.speed
			if cube.x >= roomSize or cube.x <= -roomSize then
				cube.p = (-cube.p)
			end
			if cube.y >= roomSize or cube.y <= .25 then
				cube.g = (-cube.g)
			end
			if cube.z >= roomSize or cube.z <= -roomSize then
				cube.n = (-cube.n)
			end
	end
end


function lovr.draw()

-- draw axis
--x (red)
	lovr.graphics.setColor(1, 0, 0)
	lovr.graphics.line(0, 0, 0, 2.5, 0, 0)
--y (green)
	lovr.graphics.setColor(0, 1, 0)
	lovr.graphics.line(0, 0, 0, 0, 2.5, 0)
--z (blue)
	lovr.graphics.setColor(0, 0, 1)
	lovr.graphics.line(0, 0, 0, 0, 0, 2.5)

-- draw grid shaders
	lovr.graphics.setShader(shader)
  	lovr.graphics.plane('fill', 0, 0, 0, 25, 25, -math.pi / 2, 1, 0, 0)
  	lovr.graphics.setShader()

-- draw hands
	lovr.graphics.setColor(1, 0, 0)
	for i, hand in ipairs(lovr.headset.getHands()) do
		local x, y, z = lovr.headset.getPosition(hand)
		lovr.graphics.sphere(x, y, z, .05)
	end

-- Draw cubes 
	for i=#cubes, 1, -1 do
		if i < 300 then
		local cube = cubes[i]
		
		lovr.graphics.cube('line', cube.x, cube.y, cube.z, cube.h, lovr.timer.getTime(), 1)
		else 
		end
  	end
end