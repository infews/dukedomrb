# globals we've not replaced yet
f3 = 2
q1 = 0
q2 = 0

year = peasants = land = grain = 0
grain_text = [nil]
land_text = [nil]
peasants_text = [nil]

grain_archive = Array.new(11)
land_archive = Array.new(4)
peasant_archive = Array.new(9)

# Generate a Random # between -limit and limit, plus random offsset
def f_n_x(limit, index)
  random_number = rand(-limit..limit)
  random_number + ra[index]
end

def gaussian_random_number(min, max)
  random_number = rand(min..max)
  saved = random_number
  rand(min..max)
  if random_number > 5
    rand(min..max)
    Math.Floor((saved + random_number) / 2)
  else
    saved
  end
end

# Y/N with errors; puts answer in V
def read_yes_no
  done = false
  while !done
    input = gets
    input = Text.GetSubText(input, 1, 1)
    if (Text.GetLength(input) == 0)
      input = "N"
    end
    input = Text.ConvertToupperCase(input)
    if (input == "Y") or (input == "N")
      done = true
    else
      puts("Please answer yes or no:")
    end
  end
end

# Read a positive number with errors
def read_number
  done = false
  while !done
    input = gets
    if input >= 0
      done = true
    else
      puts("Please enter a non-negative #:")
    end
  end
  input
end

# takes top of stack
def output_pad_spacing
  j = Stack.PopValue(StackVar)
  if j >= 0
    puts(" ")
  end
end

# Error message for Grain purchase
# x1 is amount of grain per hectare of land
def insufficient_grain
  puts("But you don't have enough grain")
  puts("You have ")
  puts(grain)
  put(" HL. of grain left,")
  if x1 >= 4
    puts("Enough to buy ")
    puts(Math.Floor(grain / x1))
    puts(" HA. of land")
  else
    puts("Enough to plant ")
    puts(Math.Floor(grain / 2))
    puts(" HA. of land")
  end
end

# Error message for not enough land
def insufficient_land
  puts("But you don't have enough land")
  puts("You only have ")
  puts(land)
  puts(" HA. of land left")
end

# Error message for when not enough peasants to plant land
def insufficient_peasants
  puts("But you don't have enought peasants")
  puts("Your peasants can only plant ")
  puts(4 * peasants)
  puts(" HA. of land")
end

def deposed
  puts("The peasants are tired of war and starvation")
  puts("You are deposed")
end

def abolished_peasants
  puts("You have so few peasants left that")
  puts("the High King has abolished your Ducal")
  puts("right")
end

def abolished_land
  puts("You have so little land left that")
  puts("the High King has abolished your Ducal")
  puts("right")
end

InitializeLabel :

  q1 = 1
#
# START BANNER
#
puts("D U K E D O M")
puts("")
puts("Ruby Version")
puts("")

puts("Do you want to skip detailed reports ? ")
skip_report = read_yes_no

#
#  Initialize state
#
intialize_globals
intialize_global_strings

u = 0

#
# Seed random number table
#
initialize_random_base_table

#
# Short Annual Report
#
LastYearsResultsLabel :

puts("")
puts("Year ")
puts(year)
puts(" Peasants ")
puts(peasants)
puts(" Land ")
puts(land)
puts(" Grain ")
puts(grain)

puts("")

if skip_report == "Y"
  Goto NewYearsDay
end

#
# Detailed Report
#
StackVar = 0

[1..8].each do |i|
  if peasant_archive[i] != 0 || i == 1
    puts(peasants_text[i])
    Stack.PushValue(StackVar, peasant_archive[i])
    output_pad_spacing
    puts(peasant_archive[i])
  end
end

puts("Peasants at end      ")
Stack.PushValue(StackVar, peasants)
output_pad_spacing
puts(peasants)

puts("")

[1..3].each do |i|
  if land_archive[i] != 0
    Or i == 1
    puts(land_text[i])
    Stack.PushValue(StackVar, land_archive[i])
    output_pad_spacing
    puts(land_archive[i])
  end
end

puts("Land at end of year  ")
Stack.PushValue(StackVar, land)
output_pad_spacing()
puts(land)

puts("")

puts("100% 80%  60%  40%  20%  Depl")
[1..6].each do |i|
  puts(sa[i])
  [1..(5 - Text.GetLength(sa[i]))].times do
    puts(" ")
  end
end

puts("")

puts("")

[1..10].each do |i|
  if grain_archive[i] != 0
    Or i == 1
    puts(grain_text[i])
    Stack.PushValue(StackVar, grain_archive[i])
    output_pad_spacing()
    puts(grain_archive[i])
  end
end

puts("Grain at end of year ")
Stack.PushValue(StackVar, grain)
output_pad_spacing()
puts(grain)

puts("")

if year <= 0
  puts("(Severe crop damage due to seven")
  puts(" year locusts)")
end

#
# NEW YEAR
#

NewYearsDay :
  puts("")
puts("")

year += 1

# clear archive data
[0..8]..each do |i|
  peasant_archive[i] = 0
end
[0..3].each do |i|
  land_archive[i] = 0
end
[0..10].each do |i|
  grain_archive[i] = 0
end

peasant_archive[1] = peasants
land_archive[1] = land
grain_archive[1] = grain

# Test for End of Game
#
if peasants >= 33
  Goto TooLittleLandCheckLabel
else
  abolished_peasants
  Goto PlayAgainLabel
end

TooLittleLandCheckLabel :

  if land >= 199
    Goto DeposedCheckLabel
  else
    abolished_land()
    Goto PlayAgainLabel
  end

DeposedCheckLabel :

  if u1 > 88
    Or u2 > 99
    deposed()
    Goto PlayAgainLabel
  else
    if grain >= 429
      Goto AgeOfRetirementCheckLabel
    else
      deposed()
      Goto PlayAgainLabel
    end
  end

AgeOfRetirementCheckLabel :

  if Y > 45
    And K = 0
    puts("You have reached the age of retirement")
    Goto PlayAgainLabel
  end

u1 = 0

if K > 0
  puts("The King demands twice the royal tax in")
  puts("the hope to prevoke war.  Will you pay? ")
  input = read_yes_no()
  K = 2
  if input == "N"
    K = -1
  end
end

GrainForFoodLabel :

  puts("Grain for food = ")
input = read_number()
if input >= 100
  input = -input * -1
else
  input = -input * peasants * -1
end

if input > grain
  insufficient_grain
  Goto GrainForFoodLabel
end

if Math.Floor(input / peasants) < 11 && input != grain
  puts("The peasants demonstrate before the")
  puts("castle with sharpened scythes")
  Goto GrainForFoodLabel
end

grain_archive[2] = -input
grain = grain + grain_archive[2]
x1 = input / peasants
if x1 < 13
  puts("Some peasants have starved")
  peasant_archive[2] = -Math.Floor(peasants - peasants / 13)
  peasants = peasants + peasant_archive[2]
end

x1 = x1 - 14
if x1 <= 4
  x1 = -x1 * -1
else
  x1 = -4 * -1
end

u1 = u1 - 3 * peasant_archive[2] - 2 * x1

if (u > 88)
  deposed
  Goto PlayAgainLabel
else
  if (peasants < 33)
    abolished_peasants
    Goto PlayAgainLabel
  end
end

#LandBuySellLabel:

C = C1
x = f_n_x(f3, 1)
x1 = Math.Floor(2 * C + x - 5)
if x1 >= 4
  x1 = -x1 * -1
else
  x1 = -4 * -1
end

LandToBuyLabel :

  puts("Land to buy at ")
puts(x1)
puts(" HL./HA. = ")
read_number
grain_archive[3] = -V * x1

if (-grain_archive[3] > grain)
  insufficient_grain
  Goto LandToBuyLabel
end

land_archive[2] = V
sa[3] = sa[3] + V
if V > 0
  Goto LandCheckLabel
else
  x2 = sa[1] + sa[2] + sa[3]
end

3.times do
  x1 = x1 - 1
  puts("Land to sell at ")
  puts(x1)
  puts(" HL./HA. = ")
  land_to_sell = read_number()
  if land_to_sell > x2
    puts("But you only have ")
    puts(x2)
    puts(" HA. of good land")
  else
    grain_archive[3] = land_to_sell * x1
    if grain_archive[3] <= 4000
      Goto LandSaleCompleteLabel
    else
      puts("No buyers have that much grain try less")
    end
  end
end

puts("Buyers have lost interest")
land_to_sell = 0
grain_archive[3] = 0

LandSaleCompleteLabel :


land_archive[2] = -V

(1..3).reverse_each do |j1|
  if land_to_sell <= sa[j1]
    Goto updateLandTablesCompleteLabel
  end

  land_to_sell = land_to_sell - sa[j1]
  sa[j1] = 0
end

puts("Land selling loop error")
Program.End()

updateLandTablesCompleteLabel :

  sa[j1] = sa[j1] - land_to_sell

LandCheckLabel :

  land = land + land_archive[2]

if land < 10
  abolished_land
  Goto PlayAgainLabel
end

if land_archive[2] < 0
  And x1 < 4
  grain_archive[3] = Math.Floor(grain_archive[3] / 2)
  puts("The High King appropriates half")
  puts("of your earnings as punishment")
  puts("for selling at such a low price")
end

grain = grain + grain_archive[3]

#War with the King

if K != -2
  Goto LandToPlantLabel
end

x1 = Math.Floor(grain / 100)

puts("The King's army is about to attack")
puts("your duchy")
puts("at 100 HL. each (pay in advance)")
puts("You have hired")
puts(x1)
puts(" foreign mercenaries")

if ((8 * x1 + peasants) > 2399)
  Goto YouWinLabel
else
  Goto YouLostLabel
end

YouLostLabel :

  puts("Your head is placed atop of the")
puts("castle gate.")
Goto PlayAgainLabel

YouWinLabel :

  puts("Wipe the blood from the crown - you")
puts("are High King! A nearby monarchy")
puts("threatens war; how many ....")
puts("")
Goto PlayAgainLabel

#Grain Production
#

LandToPlantLabel :

  puts("Land to be planted = ")
read_number

if V > land
  insufficient_land
  Goto LandToPlantLabel
end

if V > 4 * peasants
  insufficient_peasants
  Goto LandToPlantLabel
end

grain_archive[4] = -2 * V
if -grain_archive[4] > grain
  insufficient_grain
  Goto LandToPlantLabel
end

grain_archive[8] = V
grain = grain + grain_archive[4]

[0..6]..each { |i| uA[i] = 0 }

[0..6].each do |j1|
  if V <= sa[j1]
    uA[j1] = V
    sa[j1] = sa[j1] - V
    sa[1] = sa[1] + sa[2]
    sa[2] = 0
    Goto CropRotationLabel
  end
  V = V - sa[j1]
  uA[j1] = sa[j1]
  sa[j1] = 0
end

puts("Land table error")
Program.End()

CropRotationLabel :

  for j1
    = 3 To 6
    sa[j1 - 2] = sa[j1 - 2] + sa[j1]
    sa[j1] = 0
  end

for j1
  = 1 To 5
  sa[j1 + 1] = sa[j1 + 1] + uA[j1]
end

sa[6] = sa[6] + uA[6]

#  Crop yield and loss
#
q1 = 2
x = f_n_x(f3, 2)
C = x + 9
if (Math.Floor(Y / 7) * 7)
  = Y
  puts("Seven year locusts")
  C = Math.Floor(C * 0.65)
end

x1 = 0

for j1
  = 1 To 5
  x1 = x1 + uA[j1] * (1.2 - 0.2 * j1)
end

if grain_archive[8] = 0
  C1 = 0
  C = 0
else
  C1 = Math.Floor((C * (x1 / grain_archive[8])) * 100) / 100
  C = C1
end

puts("Yield = ")
puts(C)
puts(" HL./HA")

x = f_n_x(f3, 3)

x1 = x + 3
if x1 < 9
  Goto WarLabel
else
  grain_archive[5] = -Math.Floor((x1 * grain) / 83)
  grain = grain + grain_archive[5]
  puts("Rats infest the grainery")

  if peasants < 67 || K = -1
    Goto WarLabel
  else
    x = f_n_x(f3, 4)

    x1 = x

    if x1 > (peasants / 30)
      Goto WarLabel
    else
      puts("The king requires ")
      puts(x1)
      puts(" peasants for")
      puts("his estate and mines.  Will you supply")
      puts("them (Y)es or pay ")
      puts(x1 * 100)
      puts(" HL. of")
      puts("grain instead (N)o ? ")
      supply = read_yes_no()

      if supply == "N"
        grain_archive[10] = -100 * x1
        grain = grain + grain_archive[10]
      else
        peasant_archive[3] = -x1
        peasants = peasants + peasant_archive[3]
      end
    end
  end
end

WarLabel :

  if K != -1
    Goto KingGrowsuneasyLabel
  end

puts("The High King calls for peasant levies")
puts("and hires many foreign mercenaries")
K = -2
Goto NeighborWarCheckLabel

KingGrowsuneasyLabel :

  x1 = Math.Floor(11 - 1.5 * C)
if (x1 >= 2)
  x1 = -x1 * -1
else
  x1 = -2 * -1
end

if (K != 0)
  Or (peasants <= 109) Or ((17 * (land - 400) + G) <= 10600)
  Goto OkayWithTheKingLabel
end

puts("The High King grows uneasy and may")
puts("be subidizing wars against you")
x1 = x1 + 2
x2 = Y + 5
Goto NeighborWarCheckLabel

OkayWithTheKingLabel :

  x2 = 0

NeighborWarCheckLabel :

  x = f_n_x(f3, 5)

x3 = x

if x3 > x1
  Goto DiseaseCheckLabel
end

puts("A nearby Duke threatens war; ")

x = f_n_x(f3, 6)

x2 = Math.Floor(x2 + 85 + 18 * x)
X4 = 1.2 - u1 / 16
x5 = Math.Floor(peasants * X4) + 13

puts("Will you attack first ? ")
attack_first = read_yes_no()

if attack_first == "Y"
  Goto HireMercenariesCheckLabel
end

if x2 >= x5
  Goto FirstStrikeFailedLabel
end

puts("Peace negotiations successful")

peasant_archive[4] = -x1 - 1
x2 = 0
Goto WarCasualtiesupdateLabel

FirstStrikeFailedLabel :

  puts("First strike failed - you need")
puts("professionals")
peasant_archive[4] = -x3 - x1 - 2
x2 = x2 + 3 + peasant_archive[4]

WarCasualtiesupdateLabel :

  peasants = peasants + peasant_archive[4]

if x2 < 1
  u1 = u1 - 2 * peasant_archive[4] - 3 * peasant_archive[5]
  Goto DiseaseCheckLabel
end

HireMercenariesCheckLabel :

  puts("How many mercenaries will you hire")
puts("at 40 HL. each = ")
mercenaries_to_hire = read_number()

if mercenaries_to_hire > 75
  puts("There are only 75 available for hire")
  Goto HireMercenariesCheckLabel
end

x2 = Math.Floor(x2 * m)
x5 = Math.Floor(peasants * X4) + 7 * V + 13
X6 = x2 - 4 * V - Math.Floor(0.25 * x5)
x2 = x5 - x2
land_archive[3] = Math.Floor(0.8 * x2)

if (-land_archive[3] <= 0.67 * L)
  Goto YouWonLabel
end

puts("You have been overrun and have lost")
puts("your entire Dukedom")
Goto YouLostLabel

YouWonlandabel :

  x1 = land_archive[3]

(1..3).each do |j1|
  x3 = Math.Floor(x1 / (4 - j1))
  if (-x3 <= sa[j1])
    x5 = x3
  else
    x5 = -sa[j1]
  end
  sa[j1] = sa[j1] + x5
  x1 = x1 - x5
end

if land_archive[3] < 399
  Goto WarResultCheck
end

puts("You have overrun the enemy and annexed")
puts("his entire Dukedom")

grain_archive[7] = 3513
grain = grain + grain_archive[7]
X6 = -47
X4 = 0.55

if K > 0
  Goto WarResultCalculations
end

K = 1

puts("The King fears for his throne and")
puts("may be be planning direct action")
Goto WarResultCalculations

WarResultCheck :

  if x2 < 1
    Goto YouLostTheWarLabel
  end

puts("You have won the war")

X4 = 0.67
grain_archive[7] = Math.Floor(1.7 * land_archive[3])
grain = grain + grain_archive[7]
Goto CleanupWarMessLabel

YouLostTheWarLabel :

  puts("You have lost the war")
X4 = grain_archive[8] / land

CleanupWarMessLabel :

  if X6 <= 9
    X6 = 0
  else
    X6 = Math.Floor(X6 / 10)
  end

WarResultCalculations :

  if X6 <= peasants
    X6 = -X6 * -1
  else
    X6 = -peasants * -1
  end

peasant_archive[4] = peasant_archive[4] - X6
peasants = peasants - X6
grain_archive[8] = grain_archive[8] + Math.Floor(X4 * land_archive[3])
X6 = 40 * V

if X6 <= grain
  grain_archive[6] = -X6
  Goto FruitsOfWarLabel
end

grain_archive[6] = -grain
peasant_archive[5] = -Math.Floor((X6 - grain) / 7) - 1

puts("There isn't enough grain to pay the")
puts("mercenaries")

FruitsOfWarLabel :

  grain = grain + grain_archive[6]
if -peasant_archive[5] <= peasants
  peasant_archive[5] = -peasant_archive[5] * -1
else
  peasant_archive[5] = peasants * -1
end

peasants = peasants + peasant_archive[5]
land = land + land_archive[3]
u1 = u1 - 2 * peasant_archive[4] - 3 * peasant_archive[5]

DiseaseCheckLabel :

#  Plagues, Births, Natural Deaths
#
  x = f_n_x(f4, 8)

x1 = x + 1

if x1 > 3
  Goto PopulationControlLabel
end

if x1 != 1
  puts("A POX EPIDEMIC has broken out")
  x2 = x1 * 5
  peasant_archive[6] = -Math.Floor(peasants / x2)
  peasants = peasants + peasant_archive[6]
  Goto PopulationControlLabel
end

if D > 0
  Goto PopulationControlLabel
end

puts("The BLACK PLAGuE has struck the area")
D = 13
x2 = 3
peasant_archive[6] = -Math.Floor(peasants / x2)
peasants = peasants + peasant_archive[6]

PopulationControlLabel :

  x = f_n_x(f3, 8)

x1 = x + 4

if peasant_archive[5] = 0
  x1 = -x1 * -1
else
  x1 = -4.5 * -1
end

peasant_archive[8] = Math.Floor(peasants / x1)
peasant_archive[7] = Math.Ceiling(0.3 - peasants / 22)
peasants = peasants + peasant_archive[7] + peasant_archive[8]
D = D - 1

# Grain Harvest, Castle Expenses, King#s Tax
#
grain_archive[8] = Math.Floor(C * grain_archive[8])
grain = grain + grain_archive[8]
x1 = grain_archive[8] - 4000

if x1 <= 0
  grain_archive[9] = -grain_archive[9] * -1
else
  grain_archive[9] = Math.Floor(0.1 * x1) * -1
end

grain_archive[9] = grain_archive[9] - 120
grain = grain + grain_archive[9]

if K < 0
  Goto updateCounterAndContinueLabel
end

x1 = -Math.Floor(land / 2)

if K < 2
  x1 = -x1 * -1
else
  x1 = -2 * x1 * -1
end

if -x1 <= grain
  grain_archive[10] = grain_archive[10] + x1
  grain = grain + x1
  Goto updateCounterAndContinueLabel
end

puts("You have insufficient grain to pay")
puts("the royal tax")
Goto PlayAgainLabel

updateCounterAndContinueLabel :

  Goto LastYearsResultsLabel

PlayAgainLabel :

  puts("Do you wish to play again ? ")
read_yes_no()

if V = "Y"
  Goto InitializeLabel
end

def intialize_globals
  Y = 0
  C1 = 3.95
  u1 = 0
  u2 = 0
  K = 0
  D = 0
  peasants = 100
  land = 600
  grain = 4177
  grain_archive[1] = 5193
  grain_archive[2] = -1344
  grain_archive[3] = 0
  grain_archive[4] = -768
  grain_archive[5] = 0
  grain_archive[6] = 0
  grain_archive[7] = 0
  grain_archive[8] = 1516
  grain_archive[9] = -120
  grain_archive[10] = -300
  land_archive[1] = 600
  land_archive[2] = 0
  land_archive[3] = 0
  peasant_archive[1] = 96
  peasant_archive[2] = 0
  peasant_archive[3] = 0
  peasant_archive[4] = 0
  peasant_archive[5] = 0
  peasant_archive[6] = 0
  peasant_archive[7] = -4
  peasant_archive[8] = 8
  sa[1] = 216
  sa[2] = 200
  sa[3] = 184
  sa[4] = 0
  sa[5] = 0
  sa[6] = 0
  uA[1] = 0
  uA[2] = 0
  uA[3] = 0
  uA[4] = 0
  uA[5] = 0
  uA[6] = 0
end

def intialize_global_strings
  # Initialize Text String Arrays
  grain_text << "Grain at Start       "
  grain_text << "used for food        "
  grain_text << "Land deals           "
  grain_text << "Seeding              "
  grain_text << "Rat losses           "
  grain_text << "Mercenary hire       "
  grain_text << "Fruits of war        "
  grain_text << "Crop yield           "
  grain_text << "Castle expense       "
  grain_text << "Royal tax            "

  land_text << "Land at Start        "
  land_text << "Bought/sold          "
  land_text << "Fruits of war        "

  peasants_text << "Peasants at Start    "
  peasants_text << "Starvations          "
  peasants_text << "King's levy          "
  peasants_text << "War casualties       "
  peasants_text << "Looting victims      "
  peasants_text << "Disease victims      "
  peasants_text << "Natural deaths       "
  peasants_text << "Births               "
end

# This can be refactored to calls to rand w/ range
# OR build a distribution of random #s?
def initialize_random_base_table

  [0..8].each { |n| ra[n] = 0 }

  ra[1] = gaussian_random_number(4, 7)
  ra[2] = gaussian_random_number(4, 8)
  ra[3] = gaussian_random_number(4, 6)
  ra[4] = gaussian_random_number(3, 8)
  ra[5] = gaussian_random_number(3, 8)
  ra[6] = gaussian_random_number(3, 6)
  ra[7] = gaussian_random_number(3, 8)
  ra[8] = gaussian_random_number(4, 8)
end
