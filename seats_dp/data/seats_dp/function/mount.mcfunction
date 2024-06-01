#Won't let them sit if they are shifting
execute on target if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"flags":{"is_sneaking":true}}} run data remove entity @n[type=interaction] interaction
execute on target if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"flags":{"is_sneaking":true}}} run return fail

#Tests to see if seat is too far away
execute on target if entity @s[distance=3..] run title @s actionbar {"text":"You may not sit now; the seat is too far away"}
execute on target if entity @s[distance=3..] run data remove entity @n[type=interaction] interaction
execute on target if entity @s[distance=3..] run return fail

#Tests to see if seat is obstructed
execute on target unless block ~ ~1 ~ air run title @s actionbar {"text":"This seat is obstructed"}
execute unless block ~ ~1 ~ air run data remove entity @s interaction
execute unless block ~ ~1 ~ air run return fail

#Dismount if you are riding something then mount the seat you interacted with
execute on target run ride @s dismount
execute on target run ride @s mount @n[type=minecraft:interaction,tag=seat]

#Align the seat with the block it's on
tp @s[tag=block] ^ ^ ^-0.2
tp @s[tag=stairs] ^ ^ ^0.2
tp @s[tag=slab] ^ ^ ^-0.2
tp @s[tag=trapdoor] ^ ^ ^-0.2

#Resize the seat so it doesn't have a hitbox when you are on it
data merge entity @s {height:0f,width:0f}

#Remove interaction data so it will let you dismount
data remove entity @s interaction