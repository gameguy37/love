Player = Object:extend()

function Player:new()
    self.image = love.graphics.newImage("/img/panda.png")
    self.x = 300
    self.y = 20
    self.speed = 500
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
    self.bullet_x_offset = self.width / 2
    self.bullet_y_offset = self.height
end

function Player:update(dt)
    if love.keyboard.isDown("left") then
        self.x = self.x - self.speed * dt
    elseif love.keyboard.isDown("right") then
        self.x = self.x + self.speed * dt
    end

    local window_width = love.graphics.getWidth()

    if self.x < 0 then
        self.x = 0
    elseif self.x + self.width > window_width then
        self.x = window_width - self.width
    end
end

function Player:draw()
    love.graphics.draw(self.image, self.x, self.y)
end

function Player:keypressed(key)
    if key == "space" then
        table.insert(listOfBullets, Bullet(self.x, self.y, self.bullet_x_offset, self.bullet_y_offset))
    end
end