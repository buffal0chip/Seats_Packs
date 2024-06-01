#Tests for newly spawned seat
execute as @e[type=armor_stand,tag=seat] at @s run function seats_dp:summon

#Tests to see if a seat has interaction data
execute as @e[type=interaction,tag=seat] if data entity @s interaction at @s run function seats_dp:mount

#Tests for seats that aren't being sat in that need to be reset
execute as @e[type=interaction,tag=seat] if data entity @s {height:0f,width:0f} unless predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"passenger":{"type":"minecraft:player"}}} at @s run function seats_dp:dismount

#Tests to see if a seat has attack data
execute as @e[type=interaction,tag=seat] if data entity @s attack at @s run function seats_dp:break
execute as @e[type=interaction,tag=seat] at @s if block ~ ~-0.1 ~ air run function seats_dp:break
execute as @e[type=interaction,tag=seat] at @s if block ~ ~-0.1 ~ #trapdoors[open=true] run function seats_dp:break

#Air toggling so motion data updates
execute as @e[type=item] if data entity @s {Item:{components:{"minecraft:item_name":'"Seat"'}}} unless data entity @s {OnGround:1b} run data modify entity @s Air set value 299
execute as @e[type=item] if data entity @s {Air:299} run data modify entity @s Air set value 300

#Summon or kill display entities to show where seats are
execute as @e[type=interaction,tag=seat,tag=!stairs] unless data entity @s {height:0f,weight:0f} at @s if entity @a[nbt={SelectedItem:{components:{"minecraft:item_name":'"Seat"'}}},distance=0..15] unless entity @e[type=item_display,tag=seat,distance=0.29999999999999..0.3] unless predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"passenger":{"type":"minecraft:player"}}} run summon item_display ~ ~0.3 ~ {billboard:"center",Rotation:[90F,0F],Tags:["seat"],transformation:{left_rotation:[0f,1f,0f,0f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.7f,0.7f,0.7f]},item:{id:"minecraft:armor_stand",count:1,components:{"minecraft:custom_model_data":1,"minecraft:entity_data":{id:"minecraft:armor_stand"}}}}
execute as @e[type=interaction,tag=seat,tag=stairs] unless data entity @s {height:0f,weight:0f} at @s if entity @a[nbt={SelectedItem:{components:{"minecraft:item_name":'"Seat"'}}},distance=0..15] unless entity @e[type=item_display,tag=seat,distance=0.79999999999999..0.8] unless predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"passenger":{"type":"minecraft:player"}}} run summon item_display ~ ~0.8 ~ {billboard:"center",Tags:["seat","stairs"],transformation:{left_rotation:[0f,1f,0f,0f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.7f,0.7f,0.7f]},item:{id:"minecraft:armor_stand",count:1,components:{"minecraft:custom_model_data":1,"minecraft:entity_data":{id:"minecraft:armor_stand"}}}}

execute as @e[type=item_display,tag=seat] at @s unless entity @a[nbt={SelectedItem:{components:{"minecraft:item_name":'"Seat"'}}},distance=0..15] run kill @s
execute as @e[type=item_display,tag=seat,tag=!stairs] at @s unless entity @e[type=interaction,tag=seat,distance=0.29999999999999..0.3] run kill @s
execute as @e[type=item_display,tag=seat,tag=stairs] at @s unless entity @e[type=interaction,tag=seat,distance=0.79999999999999..0.8] run kill @s