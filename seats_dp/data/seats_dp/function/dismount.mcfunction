#Realign seat to block after dismount if stair
execute as @s[tag=block] positioned ~ ~ ~ align xz run tp @s ~0.5 ~ ~0.5
execute as @s[tag=stairs] positioned ~ ~ ~ align xz run tp @s ~0.5 ~ ~0.5
execute as @s[tag=slab] positioned ~ ~ ~ align xz run tp @s ~0.5 ~ ~0.5
execute as @s[tag=trapdoor] positioned ~ ~ ~ align xz run tp @s ~0.5 ~ ~0.5

#Resize seat after dismount
data merge entity @s[tag=seat] {height:0.495f,width:0.99f}