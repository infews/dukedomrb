# # globals we've not replaced yet
# f3 = 2
# q1 = 0
# q2 = 0
#
# grain_text = [nil]
# land_text = [nil]
# peasants_text = [nil]
#
# # Generate a Random # between -limit and limit, plus random offsset
# def f_n_x(limit, index)
#   random_number = rand(-limit..limit)
#   random_number + ra[index]
# end
#
# def gaussian_random_number(min, max)
#   random_number = rand(min..max)
#   saved = random_number
#   rand(min..max)
#   if random_number > 5
#     rand(min..max)
#     Math.Floor((saved + random_number) / 2)
#   else
#     saved
#   end
# end
#
# # Y/N with errors; puts answer in V
# def read_yes_no
#   done = false
#   while !done
#     input = gets
#     input = Text.GetSubText(input, 1, 1)
#     if (Text.GetLength(input) == 0)
#       input = "N"
#     end
#     input = Text.ConvertToupperCase(input)
#     if (input == "Y") or (input == "N")
#       done = true
#     else
#       puts("Please answer yes or no:")
#     end
#   end
# end
#
# # Read a positive number with errors
# def read_number
#   done = false
#   while !done
#     input = gets
#     if input >= 0
#       done = true
#     else
#       puts("Please enter a non-negative #:")
#     end
#   end
#   input
# end
#
# # takes top of stack
# def output_pad_spacing
#   j = Stack.PopValue(StackVar)
#   if j >= 0
#     puts(" ")
#   end
# end
#
# # Error message for Grain purchase
# # x1 is amount of grain per hectare of land
# def insufficient_grain(grain_per_hectare)
#   puts("But you don't have enough grain")
#   puts("You have ")
#   puts(grain)
#   put(" HL. of grain left,")
#   if grain_per_hectare >= 4
#     puts("Enough to buy ")
#     puts(Math.Floor(grain / grain_per_hectare))
#     puts(" HA. of land")
#   else
#     puts("Enough to plant ")
#     puts(Math.Floor(grain / 2))
#     puts(" HA. of land")
#   end
# end
#
# # Error message for not enough land
# def insufficient_land
#   puts("But you don't have enough land")
#   puts("You only have ")
#   puts(land)
#   puts(" HA. of land left")
# end
#
# # Error message for when not enough peasants to plant land
# def insufficient_peasants
#   puts("But you don't have enought peasants")
#   puts("Your peasants can only plant ")
#   puts(4 * peasants)
#   puts(" HA. of land")
# end
#
# def deposed
#   puts("The peasants are tired of war and starvation")
#   puts("You are deposed")
# end
#
# def abolished_peasants
#   puts("You have so few peasants left that")
#   puts("the High King has abolished your Ducal")
#   puts("right")
# end
#
# def abolished_land
#   puts("You have so little land left that")
#   puts("the High King has abolished your Ducal")
#   puts("right")
# end
#
# InitializeLabel :
#
#   q1 = 1
# #
# # START BANNER
# #
# puts("D U K E D O M")
# puts("")
# puts("Ruby Version")
# puts("")
#
# puts("Do you want to skip detailed reports ? ")
# skip_report = read_yes_no
#
# #
# #  Initialize state
# #
# year = 0
# previous_year_crop_yield_rate = 3.95
# u1 = 0
# u2 = 0
# K = 0
# D = 0
# peasants = 100
# land = 600
# grain = 4177
#
# grain_at_start = 5193
# grain_for_food = -1344
# land_deals = 0
# seeding = -768
# rat_losses = 0
# grain_for_mercs = 0
# seized_grain = 0
# crop_yield = 1516
# castle_expenses = -120
# royal_tax = -300
#
# land_at_start = 600
# land_transactions = 0
# seized_land = 0
#
# peasants_at_start = 96
# starvations = 0
# kings_levy = 0
# war_casualties = 0
# looting_victims = 0
# disease_victims = 0
# natural_deaths = -4
# births = 8
#
# land_quality = Array[7]
# land_quality[1] = 216
# land_quality[2] = 200
# land_quality[3] = 184
# land_quality[4] = 0
# land_quality[5] = 0
# land_quality[6] = 0
#
# uA[1] = 0
# uA[2] = 0
# uA[3] = 0
# uA[4] = 0
# uA[5] = 0
# uA[6] = 0
#
# intialize_global_strings
#
# u = 0
#
# #
# # Seed random number table
# #
# initialize_random_base_table
#
# #
# # Short Annual Report
# #
# LastYearsResultsLabel :
#
# puts("")
# puts("Year ")
# puts(year)
# puts(" Peasants ")
# puts(peasants)
# puts(" Land ")
# puts(land)
# puts(" Grain ")
# puts(grain)
#
# puts("")
#
# if skip_report == "Y"
#   Goto NewYearsDay
# end
#
# #
# # Detailed Report
# #
# StackVar = 0
#
# [1..8].each do |i|
#   if peasant_archive[i] != 0 || i == 1
#     puts(peasants_text[i])
#     Stack.PushValue(StackVar, peasant_archive[i])
#     output_pad_spacing
#     puts(peasant_archive[i])
#   end
# end
#
# puts("Peasants at end      ")
# Stack.PushValue(StackVar, peasants)
# output_pad_spacing
# puts(peasants)
#
# puts("")
#
# [1..3].each do |i|
#   if land_archive[i] != 0
#     Or i == 1
#     puts(land_text[i])
#     Stack.PushValue(StackVar, land_archive[i])
#     output_pad_spacing
#     puts(land_archive[i])
#   end
# end
#
# puts("Land at end of year  ")
# Stack.PushValue(StackVar, land)
# output_pad_spacing()
# puts(land)
#
# puts("")
#
# puts("100% 80%  60%  40%  20%  Depl")
# [1..6].each do |i|
#   puts(land_quality[i])
#   [1..(5 - Text.GetLength(land_quality[i]))].times do
#     puts(" ")
#   end
# end
#
# puts("")
#
# puts("")
#
# [1..10].each do |i|
#   if grain_archive[i] != 0 || i == 1
#     puts(grain_text[i])
#     Stack.PushValue(StackVar, grain_archive[i])
#     output_pad_spacing()
#     puts(grain_archive[i])
#   end
# end
#
# puts("Grain at end of year ")
# Stack.PushValue(StackVar, grain)
# output_pad_spacing()
# puts(grain)
#
# puts("")
#
# if year <= 0
#   puts("(Severe crop damage due to seven")
#   puts(" year locusts)")
# end
#
# #
# # NEW YEAR
# #
#
# NewYearsDay :
#   puts("")
# puts("")
#
# year += 1
#
# # clear archive data
# [0..8]..each do |i|
#   peasant_archive[i] = 0
# end
# [0..3].each do |i|
#   land_archive[i] = 0
# end
# [0..10].each do |i|
#   grain_archive[i] = 0
# end
#
# peasants_at_start = peasants
# land_at_start = land
# grain_at_start = grain
#
# # Test for End of Game
# #
# if peasants >= 33
#   Goto TooLittleLandCheckLabel
# else
#   abolished_peasants
#   Goto PlayAgainLabel
# end
#
# TooLittleLandCheckLabel :
#
#   if land >= 199
#     Goto DeposedCheckLabel
#   else
#     abolished_land()
#     Goto PlayAgainLabel
#   end
#
# DeposedCheckLabel :
#
#   if u1 > 88
#     Or u2 > 99
#     deposed()
#     Goto PlayAgainLabel
#   else
#     if grain >= 429
#       Goto AgeOfRetirementCheckLabel
#     else
#       deposed()
#       Goto PlayAgainLabel
#     end
#   end
#
# AgeOfRetirementCheckLabel :
#
#   if Y > 45
#     And K = 0
#     puts("You have reached the age of retirement")
#     Goto PlayAgainLabel
#   end
#
# u1 = 0
#
# if K > 0
#   puts("The King demands twice the royal tax in")
#   puts("the hope to prevoke war.  Will you pay? ")
#   input = read_yes_no()
#   K = 2
#   if input == "N"
#     K = -1
#   end
# end
#
# GrainForFoodLabel :
#
#   puts("Grain for food = ")
# input = read_number()
# if input >= 100
#   input = -input * -1
# else
#   input = -input * peasants * -1
# end
#
# if input > grain
#   insufficient_grain(x1)
#   Goto GrainForFoodLabel
# end
#
# if Math.Floor(input / peasants) < 11 && input != grain
#   puts("The peasants demonstrate before the")
#   puts("castle with sharpened scythes")
#   Goto GrainForFoodLabel
# end
#
# grain_for_food = -input
# grain = grain + grain_for_food
# x1 = input / peasants
# if x1 < 13
#   puts("Some peasants have starved")
#   starvations = -Math.Floor(peasants - peasants / 13)
#   peasants = peasants + starvations
# end
#
# x1 = x1 - 14
# if x1 <= 4
#   x1 = -x1 * -1
# else
#   x1 = -4 * -1
# end
#
# u1 = u1 - 3 * starvations - 2 * x1
#
# if (u > 88)
#   deposed
#   Goto PlayAgainLabel
# else
#   if (peasants < 33)
#     abolished_peasants
#     Goto PlayAgainLabel
#   end
# end
#
# #LandBuySellLabel:
#
# crop_yield_rate = C1
# x = f_n_x(f3, 1)
# x1 = Math.Floor(2 * crop_yield_rate + x - 5)
# if x1 >= 4
#   x1 = -x1 * -1
# else
#   x1 = -4 * -1
# end
#
# LandToBuyLabel :
#
# puts("Land to buy at ")
# puts(x1)
# puts(" HL./HA. = ")
# read_number
# land_deals = -input * x1
#
# if (-land_deals > grain)
#   insufficient_grain
#   Goto LandToBuyLabel
# end
#
# land_transactions = input
# land_quality[3] = land_quality[3] + input
# if input > 0
#   Goto LandCheckLabel
# else
#   x2 = land_quality[1] + land_quality[2] + land_quality[3]
# end
#
# 3.times do
#   x1 = x1 - 1
#   puts("Land to sell at ")
#   puts(x1)
#   puts(" HL./HA. = ")
#   land_to_sell = read_number()
#   if land_to_sell > x2
#     puts("But you only have ")
#     puts(x2)
#     puts(" HA. of good land")
#   else
#     land_deals = land_to_sell * x1
#     if land_deals <= 4000
#       Goto LandSaleCompleteLabel
#     else
#       puts("No buyers have that much grain try less")
#     end
#   end
# end
#
# puts("Buyers have lost interest")
# land_to_sell = 0
# land_deals = 0
#
# LandSaleCompleteLabel :
#
#
# land_transactions = -input
#
# (1..3).reverse_each do |k|
#   if land_to_sell <= land_quality[k]
#     Goto updateLandTablesCompleteLabel
#   end
#
#   land_to_sell = land_to_sell - land_quality[k]
#   land_quality[k] = 0
#
#
# puts("Land selling loop error")
# Program.End()
#
# updateLandTablesCompleteLabel :
#
#   land_quality[k] = land_quality[k] - land_to_sell
#
# LandCheckLabel :
#
#   land = land + land_transactions
# end
#
# if land < 10
#   abolished_land
#   Goto PlayAgainLabel
# end
#
# if land_transactions < 0
#   And x1 < 4
#   land_deals = Math.Floor(land_deals / 2)
#   puts("The High King appropriates half")
#   puts("of your earnings as punishment")
#   puts("for selling at such a low price")
# end
#
# grain = grain + land_deals
#
# #War with the King
#
# if K != -2
#   Goto LandToPlantLabel
# end
#
# x1 = Math.Floor(grain / 100)
#
# puts("The King's army is about to attack")
# puts("your duchy")
# puts("at 100 HL. each (pay in advance)")
# puts("You have hired")
# puts(x1)
# puts(" foreign mercenaries")
#
# if ((8 * x1 + peasants) > 2399)
#   Goto YouWinLabel
# else
#   Goto YouLostLabel
# end
#
# YouLostLabel :
#
#   puts("Your head is placed atop of the")
# puts("castle gate.")
# Goto PlayAgainLabel
#
# YouWinLabel :
#
#   puts("Wipe the blood from the crown - you")
# puts("are High King! A nearby monarchy")
# puts("threatens war; how many ....")
# puts("")
# Goto PlayAgainLabel
#
# #Grain Production
# #
#
# LandToPlantLabel :
#
#   puts("Land to be planted = ")
# read_number
#
# if V > land
#   insufficient_land
#   Goto LandToPlantLabel
# end
#
# if V > 4 * peasants
#   insufficient_peasants
#   Goto LandToPlantLabel
# end
#
# seeding = -2 * V
# if -seeding > grain
#   insufficient_grain
#   Goto LandToPlantLabel
# end
#
# crop_yield = V
# grain = grain + seeding
#
# [0..6]..each { |i| uA[i] = 0 }
#
# [0..6].each do |k|
#   if V <= land_quality[k]
#     uA[k] = V
#     land_quality[k] = land_quality[k] - V
#     land_quality[1] = land_quality[1] + land_quality[2]
#     land_quality[2] = 0
#     Goto CropRotationLabel
#   end
#   V = V - land_quality[k]
#   uA[k] = land_quality[k]
#   land_quality[k] = 0
# end
#
# puts("Land table error")
# Program.End()
#
# CropRotationLabel :
#
# (3..6).each do |k|
#   land_quality[k - 2] = land_quality[k - 2] + land_quality[k]
#   land_quality[k] = 0
# end
#
# (1..5).each do |k|
#   land_quality[k + 1] = land_quality[k + 1] + uA[k]
# end
#
# land_quality[6] = land_quality[6] + uA[6]
#
# #  Crop yield and loss
# #
# q1 = 2
# x = f_n_x(f3, 2)
# crop_yield_rate= x + 9
# if (Math.Floor(Y / 7) * 7)
#   = Y
#   puts("Seven year locusts")
#   crop_yield_rate= Math.Floor(crop_yield_rate* 0.65)
# end
#
# x1 = 0
#
# (1..5).each do |k|
#   x1 = x1 + uA[k] * (1.2 - 0.2 * k)
# end
#
# if crop_yield = 0
#   previous_year_crop_yield_rate = 0
#   crop_yield_rate = 0
# else
#   previous_year_crop_yield_rate = Math.Floor((crop_yield_rate * (x1 / crop_yield)) * 100) / 100
#   crop_yield_rate = previous_year_crop_yield_rate
# end
#
# puts("Yield = ")
# puts(crop_yield_rate)
# puts(" HL./HA")
#
# x = f_n_x(f3, 3)
#
# x1 = x + 3
# if x1 < 9
#   Goto WarLabel
# else
#   rat_losses = -Math.Floor((x1 * grain) / 83)
#   grain = grain + rat_losses
#   puts("Rats infest the grainery")
#
#   if peasants < 67 || K = -1
#     Goto WarLabel
#   else
#     x = f_n_x(f3, 4)
#
#     x1 = x
#
#     if x1 > (peasants / 30)
#       Goto WarLabel
#     else
#       puts("The king requires ")
#       puts(x1)
#       puts(" peasants for")
#       puts("his estate and mines.  Will you supply")
#       puts("them (Y)es or pay ")
#       puts(x1 * 100)
#       puts(" HL. of")
#       puts("grain instead (N)o ? ")
#       supply = read_yes_no()
#
#       if supply == "N"
#         royal_tax = -100 * x1
#         grain = grain + royal_tax
#       else
#         kings_levy = -x1
#         peasants = peasants + kings_levy
#       end
#     end
#   end
# end
#
# WarLabel :
#
#   if K != -1
#     Goto KingGrowsuneasyLabel
#   end
#
# puts("The High King calls for peasant levies")
# puts("and hires many foreign mercenaries")
# K = -2
# Goto NeighborWarCheckLabel
#
# KingGrowsuneasyLabel :
#
#   x1 = Math.Floor(11 - 1.5 * crop_yield_rate)
# if (x1 >= 2)
#   x1 = -x1 * -1
# else
#   x1 = -2 * -1
# end
#
# if (K != 0) || (peasants <= 109) || ((17 * (land - 400) + G) <= 10600)
#   Goto OkayWithTheKingLabel
# end
#
# puts("The High King grows uneasy and may")
# puts("be subidizing wars against you")
# x1 = x1 + 2
# x2 = Y + 5
# Goto NeighborWarCheckLabel
#
# OkayWithTheKingLabel :
#
#   x2 = 0
#
# NeighborWarCheckLabel :
#
#   x = f_n_x(f3, 5)
#
# x3 = x
#
# if x3 > x1
#   Goto DiseaseCheckLabel
# end
#
# puts("A nearby Duke threatens war; ")
#
# x = f_n_x(f3, 6)
#
# x2 = Math.Floor(x2 + 85 + 18 * x)
# X4 = 1.2 - u1 / 16
# x5 = Math.Floor(peasants * X4) + 13
#
# puts("Will you attack first ? ")
# attack_first = read_yes_no()
#
# if attack_first == "Y"
#   Goto HireMercenariesCheckLabel
# end
#
# if x2 >= x5
#   Goto FirstStrikeFailedLabel
# end
#
# puts("Peace negotiations successful")
#
# war_casualties = -x1 - 1
# x2 = 0
# Goto WarCasualtiesupdateLabel
#
# FirstStrikeFailedLabel :
#
#   puts("First strike failed - you need")
# puts("professionals")
# war_casualties = -x3 - x1 - 2
# x2 = x2 + 3 + war_casualties
#
# WarCasualtiesupdateLabel :
#
#   peasants = peasants + war_casualties
#
# if x2 < 1
#   u1 = u1 - 2 * war_casualties - 3 * looting_victims
#   Goto DiseaseCheckLabel
# end
#
# HireMercenariesCheckLabel :
#
#   puts("How many mercenaries will you hire")
# puts("at 40 HL. each = ")
# mercenaries_to_hire = read_number()
#
# if mercenaries_to_hire > 75
#   puts("There are only 75 available for hire")
#   Goto HireMercenariesCheckLabel
# end
#
# x2 = Math.Floor(x2 * m)
# x5 = Math.Floor(peasants * X4) + 7 * V + 13
# X6 = x2 - 4 * V - Math.Floor(0.25 * x5)
# x2 = x5 - x2
# seized_land = Math.Floor(0.8 * x2)
#
# if (-seized_land <= 0.67 * L)
#   Goto YouWonLabel
# end
#
# puts("You have been overrun and have lost")
# puts("your entire Dukedom")
# Goto YouLostLabel
#
# YouWonlandabel :
#
#   x1 = seized_land
#
# (1..3).each do |j1|
#   x3 = Math.Floor(x1 / (4 - j1))
#   if (-x3 <= land_quality[j1])
#     x5 = x3
#   else
#     x5 = -land_quality[j1]
#   end
#   land_quality[j1] = land_quality[j1] + x5
#   x1 = x1 - x5
# end
#
# if seized_land < 399
#   Goto WarResultCheck
# end
#
# puts("You have overrun the enemy and annexed")
# puts("his entire Dukedom")
#
# seized_grain = 3513
# grain = grain + seized_grain
# X6 = -47
# X4 = 0.55
#
# if K > 0
#   Goto WarResultCalculations
# end
#
# K = 1
#
# puts("The King fears for his throne and")
# puts("may be be planning direct action")
# Goto WarResultCalculations
#
# WarResultCheck :
#
#   if x2 < 1
#     Goto YouLostTheWarLabel
#   end
#
# puts("You have won the war")
#
# X4 = 0.67
# seized_grain = Math.Floor(1.7 * seized_land)
# grain = grain + seized_grain
# Goto CleanupWarMessLabel
#
# YouLostTheWarLabel :
#
#   puts("You have lost the war")
# X4 = crop_yield / land
#
# CleanupWarMessLabel :
#
#   if X6 <= 9
#     X6 = 0
#   else
#     X6 = Math.Floor(X6 / 10)
#   end
#
# WarResultCalculations :
#
#   if X6 <= peasants
#     X6 = -X6 * -1
#   else
#     X6 = -peasants * -1
#   end
#
# war_casualties = war_casualties - X6
# peasants = peasants - X6
# crop_yield = crop_yield + Math.Floor(X4 * seized_land)
# X6 = 40 * V
#
# if X6 <= grain
#   grain_for_mercs = -X6
#   Goto FruitsOfWarLabel
# end
#
# grain_for_mercs = -grain
# looting_victims = -Math.Floor((X6 - grain) / 7) - 1
#
# puts("There isn't enough grain to pay the")
# puts("mercenaries")
#
# FruitsOfWarLabel :
#
#   grain = grain + grain_for_mercs
# if -looting_victims <= peasants
#   looting_victims = -looting_victims * -1
# else
#   looting_victims = peasants * -1
# end
#
# peasants = peasants + looting_victims
# land = land + seized_land
# u1 = u1 - 2 * war_casualties - 3 * looting_victims
#
# DiseaseCheckLabel :
#
# #  Plagues, Births, Natural Deaths
# #
#   x = f_n_x(f4, 8)
#
# x1 = x + 1
#
# if x1 > 3
#   Goto PopulationControlLabel
# end
#
# if x1 != 1
#   puts("A POX EPIDEMIC has broken out")
#   x2 = x1 * 5
#   disease_victims = -Math.Floor(peasants / x2)
#   peasants = peasants + disease_victims
#   Goto PopulationControlLabel
# end
#
# if D > 0
#   Goto PopulationControlLabel
# end
#
# puts("The BLACK PLAGuE has struck the area")
# D = 13
# x2 = 3
# disease_victims = -Math.Floor(peasants / x2)
# peasants = peasants + disease_victims
#
# PopulationControlLabel :
#
#   x = f_n_x(f3, 8)
#
# x1 = x + 4
#
# if looting_victims = 0
#   x1 = -x1 * -1
# else
#   x1 = -4.5 * -1
# end
#
# births = Math.Floor(peasants / x1)
# natural_deaths = Math.Ceiling(0.3 - peasants / 22)
# peasants = peasants + natural_deaths + births
# D = D - 1
#
# # Grain Harvest, Castle Expenses, King's Tax
# #
# crop_yield = Math.Floor(crop_yield_rate * crop_yield)
# grain = grain + crop_yield
# x1 = crop_yield - 4000
#
# if x1 <= 0
#   castle_expenses = -castle_expenses * -1
# else
#   castle_expenses = Math.Floor(0.1 * x1) * -1
# end
#
# castle_expenses = castle_expenses - 120
# grain = grain + castle_expenses
#
# if K < 0
#   Goto updateCounterAndContinueLabel
# end
#
# x1 = -Math.Floor(land / 2)
#
# if K < 2
#   x1 = -x1 * -1
# else
#   x1 = -2 * x1 * -1
# end
#
# if -x1 <= grain
#   royal_tax = royal_tax + x1
#   grain = grain + x1
#   Goto updateCounterAndContinueLabel
# end
#
# puts("You have insufficient grain to pay")
# puts("the royal tax")
# Goto PlayAgainLabel
#
# updateCounterAndContinueLabel :
#
#   Goto LastYearsResultsLabel
#
# PlayAgainLabel :
#
#   puts("Do you wish to play again ? ")
# read_yes_no()
#
# if V = "Y"
#   Goto InitializeLabel
# end
#
#
#
# def intialize_global_strings
#   # Initialize Text String Arrays
#   grain_text << "Grain at Start       "
#   grain_text << "used for food        "
#   grain_text << "Land deals           "
#   grain_text << "Seeding              "
#   grain_text << "Rat losses           "
#   grain_text << "Mercenary hire       "
#   grain_text << "Fruits of war        "
#   grain_text << "Crop yield           "
#   grain_text << "Castle expense       "
#   grain_text << "Royal tax            "
#
#   land_text << "Land at Start        "
#   land_text << "Bought/sold          "
#   land_text << "Fruits of war        "
#
#   peasants_text << "Peasants at Start    "
#   peasants_text << "Starvations          "
#   peasants_text << "King's levy          "
#   peasants_text << "War casualties       "
#   peasants_text << "Looting victims      "
#   peasants_text << "Disease victims      "
#   peasants_text << "Natural deaths       "
#   peasants_text << "Births               "
# end
#
# # This can be refactored to calls to rand w/ range
# # OR build a distribution of random #s?
# def initialize_random_base_table
#
#   [0..8].each { |n| ra[n] = 0 }
#
#   ra[1] = gaussian_random_number(4, 7)
#   ra[2] = gaussian_random_number(4, 8)
#   ra[3] = gaussian_random_number(4, 6)
#   ra[4] = gaussian_random_number(3, 8)
#   ra[5] = gaussian_random_number(3, 8)
#   ra[6] = gaussian_random_number(3, 6)
#   ra[7] = gaussian_random_number(3, 8)
#   ra[8] = gaussian_random_number(4, 8)
# end
