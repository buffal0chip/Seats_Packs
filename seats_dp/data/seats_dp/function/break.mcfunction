#Drops the seat item
execute if entity @s[tag=!stairs] run summon item ~ ~0.1 ~ {Item:{id:"minecraft:armor_stand",count:1,components:{"minecraft:max_stack_size":64,"minecraft:item_name":'{"text":"Seat"}',"minecraft:custom_model_data":1,"minecraft:entity_data":{id:"minecraft:armor_stand",Tags:["seat"],Invisible:1b}}}}
execute if entity @s[tag=stairs] run summon item ^ ^0.1 ^0.25 {Item:{id:"minecraft:armor_stand",count:1,components:{"minecraft:max_stack_size":64,"minecraft:item_name":'{"text":"Seat"}',"minecraft:custom_model_data":1,"minecraft:entity_data":{id:"minecraft:armor_stand",Tags:["seat"],Invisible:1b}}}}

#Add particle effects
particle item{item:"oak_planks"} ~ ~0.1 ~ 0.2 0.1 0.2 0.1 25 normal

#Add motion to item
execute as @n[type=item] store result entity @s Motion[0] double 0.01 run random value -10..10
execute as @n[type=item] store result entity @s Motion[1] double 0.01 run random value 20..25
execute as @n[type=item] store result entity @s Motion[2] double 0.01 run random value -10..10

#kills the seat entity
kill @s