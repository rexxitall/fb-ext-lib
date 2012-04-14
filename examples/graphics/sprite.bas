''File: sprite.bas
''Description: Demonstration of ext.gfx.Sprite object.
''
''Copyright (c) 2007 FreeBASIC Extended Library Development Group
''
''Distributed under the FreeBASIC Extended Library Group license. (See
''accompanying file LICENSE.txt or copy at
''http://code.google.com/p/fb-extended-lib/wiki/License)


# include once "ext/graphics.bi"

''This lets us not have to type ext.gfx before every Sprite object.
using ext.gfx

screenres 640,480,32

''This is the normal way to dimension a ext.gfx.Sprite object.
var mySprite1 = Sprite(5)

''This is an alternative way that is compatible with arrays.
dim mySprite2 as Sprite
mySprite2.Init( 5 )

''Functionally both ways are the same, but using the constructor method is preferred when not using an array of Sprites.


''This loop will make our lead character, a large blue circle.
for n as uinteger = 0 to 4

	var crcl = imagecreate(100,100,&hFF00FF)

	circle crcl, (50,50), 20 + (n*5), &h0000FF,,,, F

	''You will notice we reuse the crcl variable name since Sprite becomes 
	''responsible for freeing the image's memory when it is no longer needed.
	mySprite1.SetImage(n, crcl)

next

''This loop creates our enemy, a smaller green circle.
for n as uinteger = 0 to 4

	var crcl2 = imagecreate(50,50,&hFF00FF)

	circle crcl2, (25,25), 10 + (n*5), &h00FF00,,,,F
	mySprite2.SetImage(n, crcl2)

next

mySprite1.Position( 100, 100 )
mySprite2.Position( 200, 200 )

var n = 0
var tog = 0

''Loop repeatedly until you press the ESC key on your keyboard.
do while not multikey(FB.SC_ESCAPE)

''Lock the screen before drawing to prevent flicker
screenlock

	cls

	mySprite1.DrawImage n, null, TRANS_
	''is equivalent to: put (x1,y1), mySprite1.GetImage(n), TRANS

	mySprite2.DrawImage n, null, TRANS_
	''is equivalent to: put (x2,y2), mySprite2.GetImage(n), TRANS

	''Lets see if our hero has collided with our enemy.
	''You could call the isCollided on either Sprite you wanted to check, it doesn't matter.
	''The first two parameters are the x and y coordinates of the calling sprite,
	''the next is the second Sprite object to test collision with and the last two
	''are the x and y coordinates of that Sprite object.
	if mySprite1.isCollided( mySprite2 ) then
		locate 1,1
		print "Boom!"
	end if
screenunlock

''Check for Arrow key presses and adjust our hero's location.
if multikey(FB.SC_LEFT) then mySprite1.Update(-2)
if multikey(FB.SC_RIGHT) then MySprite1.Update(2)
if multikey(FB.SC_UP) then MySprite1.Update(,-2)
if multikey(FB.SC_DOWN) then MySprite1.Update(,2)


''Slow things down a bit so you can see everything.
sleep 50

''The tog variable is used to make the circles appear to pulsate.
if tog = 0 then

	n+=1

else
	n-=1

endif

''Reset tog if it goes out of bounds.
if n < 0 then
	n = 0
	tog = 0

end if

if n > 4 then 
	n = 4
	tog = 1

end if

''Lather, Rinse, Repeat.
loop
