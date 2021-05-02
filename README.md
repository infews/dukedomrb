# Dukedom

Port of (link) to Ruby for fun and understanding

## Rough Loop

1. Print Banner
1. Init a Ledger
1. Choose a Reporter
1. Create Game w/ Ledger, Reporter
1. Game.start
1. Report
1. Make a Food Manager (Chef)
1. Update Ledger / End check
1. Make a Real Estate Manager
1. Update Ledger / End check
1. War with king? (I think)
1. Make a Farm Manager
1. Update Ledger
1. War check again?
1. Process Disease Stuff
1. Increment Year
1. Retirement check
1. Goto 6
1. Why did we break?

## Land Minister

### Buy Land

- Calculates rate of land for transaction
    - Max of 4, Math.Floor(2 * crop_yield_rate + RAND(SOMETHING, SOMETHING) - 5)
- Ask how much to buy at that rate?
    - reject if not enough grain to buy and try again
- save land to buy

### Sell Land

- Available land to sell = land_q(1) + land_q(2) + land_q(3)
- 3 times
    - Drop transaction rate by 1
    - Ask how much to sell
        - ensure it's <= available
    - if land_to_sell * rate >= 4000
        - try again
    - else done
- if 3 times and no sold, "buyers have lost interest"
- Settle land sales
    - check 100 / 80 / 60 land
    - sell from 60 first, then, 80, then 100
- MajorDomo needs to check if land has dropped below 10 for game_over?
- King punishment for selling too low
    - If you sold some AND you sold for < 4
    - Deduct grain: amount sold/2.floor
- NOTE:
    - Should update ledger to manage land in the quality buckets
    - Buy: goes into 60 bucket
    - Sell: sell from 100, then 80, then 60
    - Who does this math? Ledger or LandMinister?
    - Ledger land totals should sum the buckets

## War Minister: King over land

### TODO:

- if king == -2 (sentiment?)
- if ((8 * (grain/100) + peasants) > 2399) Then
    - WIN => game over
    - Else
    - LOSS => game over

## Agriculture Minister

- How much land to plant?
    - Must be positive
    - Must be less than available land
    - Must be greater than 4 * peasants
    - seeding = (twice input) must be <= amount of grain available
- Subtract seeding from available grain
- crop_yield = input
- allocate crops
- rotate crops
- calculate yield
- seven year locusts
- rat losses

## War with another Duke OR King

# TODO

x Fields 
  - at_100, at_80, at_60, at_40, at_20, at_0
x Ledger has a Fields
x DetailReporter shows land %'s
x Stitch together game with report each year
  - The game can sort of be playable...until out of grain
- LandMinister buys land 
  - Buy should put land in the right field
- LandMinister sells land
  - Sell should take from the correct fields
- Add LandMinister to game
- MajorDomo looks for King's grumpiness on sale
- WarMinister for war with King
- AgriculturalMinister queries grain to be planted
- AgriculturalMinister plants land
- AgriculturalMinister calculates harvest
    - Includes check for 7-year locusts
- AgriculturalMinister rotates crops
- Add AgriculturalMinister to game
- MajorDomo determines if it is a "havoc year" for
  - Asks ArgiculturalMinister re: rat losses
- MajorDomo determines King's Levy
  - Note that it's EITHER Peasants OR Grain
- WarMinister for war with another Duke
- MajorDomo tracks King's sentiment?
- King's sentiment used in age of retirement

- Improve Reporting
  - Move ERB to files
  - Right justify number output
  - Add negatives or parens to subtraction amounts? Or move to storing negatives?


# Crop planting, locusts, rotation from python game, converted to ruby/pseudo

```ruby

def allocate(list, amount)
  list.each_with_object([]) do |item, collection|
    x = [amount, item].min
    collection << item - x
    amount -= max(amount - x, 0)
  end
end

grain = 10000
crop_yield = 0

puts('Land to be planted = ')
farmed = gets
seeding = farmed * 2 # it takes two hl of grain to plant 1 ha of land
grain -= seeding

sown = allocate(land, farmed)                           # land, high-to-low, how much farmed
fallow = land.zip(sown).collect {|a| a.first - a.last } # land, high-to-low, amount less farmed

# Crop gains - yield starts with a random number
crop_yield = distributions.random(2) + 9 

if (year % 7) == 0
  # Field grain is eaten by seven year locusts. They eat half of all your crop
  # in the years that they appear.
  puts 'Seven year locusts.'
  crop_yield = round(crop_yield * 0.65) # Hmm, not really half...
end

weighted = sown[0..4].each_with_index { |field, i| field * 1.0 - (0.2 * i) }.sum
crop_yield = if farmed == 0
               0
             else
               round(crop_yield * (weighted / farmed) * 100) / 100
             end
puts("Yield = #{crop_yield} HL/HA.")
# save to ledger

# sown land reduces quality for next year 
sown.unshift(0)            # 100 gets depleted; each section gets demoted
sown[5] = sown[5..6].sum   # 0% land gets sum of 20 + 0%
sown.pop                   # don't need extra element

# fallow land improves for next year
nutrition = []
nutrition << fallow[0..2].sum # promote unused 100/80/60 to 100
nutrition += fallow[3..5]     # 80 = 40, 60 = 20, 40 = 0% 
nutrition += [0, 0]           # 20 = 0, 0% = 0

# add depletion + nutrition
land.each_with_index do |field, i|
  field = sown[i] + nutrition[i]
end

new_land = sown.zip(nutrition).collect{|a| a.sum }


# Alternate

farmed_land = gets
ledger.seeding = farmed_land * 2 

ledger.fields.plant(farmed_land) # plant & rotate
ledger.crop_yield_rate = ledger.fields.harvest(locusts?)
ledger.crop_yield = ledger.crop_yield_rate * farmed_land


 
```
