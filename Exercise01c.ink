/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Variable types: integer, float, boolean
 - Variable assignment
 - Printing variables
 - Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
*/

VAR health  = 5
VAR pet_name = ""
VAR torches = 0

VAR coins = 0
VAR keys = 0
VAR pet_type = ""

-> cave_mouth

== memory ==
Before you stands the cavern of Josh. You wish your childhood pet was with you right now. The cave might be less intimidating then. What was your pet's name?

* [Charlie]
    ~ pet_name = "Charlie"
    -> cave_mouth
* [Susan]
    ~ pet_name = "Susan"
    -> cave_mouth
* [Spot]
    ~ pet_name = "Spot"
    ->cave_mouth

== cave_mouth ==
You are at the enterance to a cave. {not torch_pickup:There is a torch on the floor.} The cave extends to the east and west.

You made it to the cave. If only {pet_name} could see you now.

You have {torches} torches.


+ [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
* [Pick up the torch] -> torch_pickup

== east_tunnel ==
You are in the east tunnel. {not east_tunnel_lit:It is very dark, you can't see anything. | }
* {torches > 0} [Light Torch] -> east_tunnel_lit
+ {east_tunnel_lit} [Look Around] -> east_tunnel_lit
+ [Go Back to the Cave Mouth] -> cave_mouth
-> END

== west_tunnel ==
You are in the west
{pet_name == "Spot" : Spot would love it here in the west| }
+ [Continue Forward] -> west_tunnel_chest
+ [Go Back to the Cave Mouth] -> cave_mouth
-> END

=== torch_pickup ===
~ torches = torches + 1
You now have a torch. May it light the way.
* [Go Back to the Cave Mouth] -> cave_mouth
-> END

=== coin_pickup ===
~ coins = coins + 1
You now have {coins} coins.
+ [Go Back to the Cave Mouth] -> cave_mouth
-> END

== east_tunnel_lit ==
The light of your torch glints off of the thousands of coins in the room.
* [Pick up a coin.] -> coin_pickup
+ [Dig through more of the treasure] -> east_tunnel_lit_chest
+ [Go Back] -> cave_mouth
-> END

== east_tunnel_lit_chest ==
{key_chest: You see the chest you already opened. | You dig through the treasure and see a large silver chest. It is locked.}
* {keys > 0} [Use the key to open the chest.] -> key_chest
+ {key_chest} [Examine the chest again] -> examine_chest
* [Try to pry the chest open] -> pry_chest
+ [Go Back to the Cave Mouth] -> cave_mouth
-> END

== key_chest ==
~ coins = coins + 5
You use the key to open the chest. Inside the chest are hundrends of diamonds and many gold coins. 

You suddenly think of your {pet_name} and wish you could have such company again. Perhaps you should vist the market and adopt a pet.
+ [Go to the market] -> pet_market
+ [No thanks, Go Back to the Cave Mouth] -> cave_mouth
-> END

== examine_chest ==
You used a key to open the chest. Inside the chest were hundrends of diamonds and many gold coins but you already collected those.

You suddenly think of your {pet_name} and wish you could have such company again. Perhaps you should vist the market and adopt a pet.
+ [Go to the market] -> pet_market
+ [No thanks, Go Back to the Cave Mouth] -> cave_mouth
-> END

== pry_chest == 
You try to pry the chest open. It does not budge. You might need to find the key instead.
+ [Go back and try somthing else] -> east_tunnel_lit_chest
+ [Go Back to the Cave Mouth] -> cave_mouth
-> END

== west_tunnel_chest == 
As you walk, you trip over a small wooden chest. {not west_tunnel_chest: You open it and find another coin. | You have already opened this chest.}
* [Pick up a coin.] -> coin_pickup
+ [Continue Forward] -> west_tunnel_end
+ [Go Back to the Cave Mouth] -> cave_mouth
-> END

== west_tunnel_end == 
You reach the end of the west tunnel. The are a few coins scatterred around. {not key_pickup: As you turn to leave, you notice a shiny key on the floor. | }
* [Pick up the key.] -> key_pickup
* [Pick up the coin.] -> coin_pickup
+ [Go Back to the Cave Mouth] -> cave_mouth
-> END

== key_pickup ==
~ keys = keys + 1
You now have {keys} key.
+ [Go Back to the Cave Mouth] -> cave_mouth
-> END


== pet_market ==
You look around the market, searching for an ideal pet.

What pet are you looking for?
+ [A dog]
    ~ pet_type = "Dog"
    -> purchase_pet
+ [A Horse]
    ~ pet_type = "Horse"
    -> purchase_pet
+ [A Cat]
    ~ pet_type = "Cat"
    -> purchase_pet
    -> END

== purchase_pet ==//8 coins
{coins > 7: You found a cute {pet_type} and have enough coins to buy the {pet_type}. You are now happy you have a companion to go on adventures with. | Unfortunately, you only have {coins} coins which is not enough to buy the {pet_type}. The {pet_type} costs 8 coins.}
+ [Go Back to the market] -> pet_market
+ [Go Back to the Cave Mouth] -> cave_mouth
-> END