# Import file "uc-bg-proto"
sk = Framer.Importer.load("imported/uc-bg-proto@1x")

backgroundA = new BackgroundLayer
	backgroundColor: "rgba(19,19,19,1)"

sk.artb.backgroundColor = "rgba(0,0,0,0)"

sk.icns.visible = false

sk.heroo.superLayer = null
sk.header.superLayer = null
sk.heroo.center()
sk.header.centerX()

base = [sk.i1, sk.i2, sk.i3, sk.i4, sk.i5, sk.i6, sk.i7, sk.i8, sk.i9, sk.i10, sk.i11, sk.i12, sk.i13]

# properties

scalefactor = 0.5


margin = 60 * scalefactor

columns = Math.round(Canvas.width/margin) #25
rows = Math.round(Canvas.height/margin) #15

# generate array
container = []
shifter = 1
shvalue = margin / 2

for j in [0..rows]
	subcontainer = []
		
	for i in [0..columns]
		icn = base[Math.floor(Math.random()*13)].copy()
		icn.superLayer = backgroundA
		icn.scale = scalefactor
		icn.x = margin * i + (shifter * shvalue) + Math.round((30 - icn.width) / 2)
		icn.y = margin * j  + Math.round((30 - icn.height) / 2)
		icn.opacity = .17
		icn.states.add
			dim:
				opacity:.06
				
		icn.states.animationOptions =
			time:1
		icn.states.switchInstant("dim")
		
		
			
		subcontainer.push icn
	
	if shifter == 1
		shifter = 0
	else
		shifter = 1
	
	container.push subcontainer



# animate

launchRandom = ->
	rnd = container[Math.floor(Math.random()*rows)][Math.floor(Math.random()*columns)]
	rnd.states.switch("default")
	Utils.delay 1, ->
		rnd.states.switch("dim")


Utils.interval .2, ->
	for i in [0..2]
		launchRandom()