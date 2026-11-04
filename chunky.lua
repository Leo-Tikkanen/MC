function depot()
  for i=1,16,1 do
    turtle.select(i)
    turtle.refuel()
    turtle.dropDown()
  end
end

function init(height)
  for i=1,height,1 do
    turtle.up()
  end
  turtle.forward()
end

function deinit(height)
  for i=1,height,1 do
    turtle.down()
  end
  turtle.back()
end 

function bedrocknup()
  local depth = 0
  turtle.digDown()
  while turtle.down() do
    depth = depth + 1
    turtle.digDown()
  end
  while not turtle.dig() do
    turtle.up()
    depth = depth-1
  end
  turtle.forward()
  turtle.digDown()
  while turtle.down() do
    depth = depth+1
    turtle.digDown()
  end
  for i=1,depth,1 do
     turtle.digUp()
     turtle.up()
  end
end
 
function send(x,y)
   turtle.turnRight()
   for i =  1,x,1 do
      turtle.forward()
   end
   turtle.turnLeft()
   for j = 1,y,1 do
     turtle.forward()
   end
end

function back(x,y)
   for j =1,y,1 do
       turtle.back()
   end
   turtle.turnRight()
   for i=1,x,1  do
     turtle.back()
   end
   turtle.turnLeft()
end

for i=2,15,1 do
  for j=0,14,2  do
    init(3)
    send(i,j)
    bedrocknup()
    back(i,j+1)
    deinit(3)
    depot()
  end
end
