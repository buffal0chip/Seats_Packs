#Summon the interaction entity that will be the seat
summon interaction ~ ~ ~ {Tags:["seat"]}

#Tag seat based on what block type it is
execute unless block ~ ~-0.1 ~ #stairs[half=bottom] unless block ~ ~-0.1 ~ #slabs[type=bottom] unless block ~ ~-0.1 ~ #trapdoors[half=bottom] run tag @n[type=interaction,tag=seat] add block
execute if block ~ ~-0.1 ~ #stairs[half=bottom] run tag @n[type=interaction,tag=seat] add stairs
execute if block ~ ~-0.1 ~ #slabs[type=bottom] run tag @n[type=interaction,tag=seat] add slab
execute if block ~ ~-0.1 ~ #trapdoors[half=bottom,open=false] run tag @n[type=interaction,tag=seat] add trapdoor

#Properly resize seat if needed based on what block type it is
execute as @e[type=interaction,tag=seat] run data merge entity @s {height:0.495f,width:0.99f}

#Properly align seat if it is a stair
execute as @n[type=interaction,tag=stairs,distance=0] run tp @s ~ ~-0.5 ~ ~ ~

#Remove the armor stand
kill @s