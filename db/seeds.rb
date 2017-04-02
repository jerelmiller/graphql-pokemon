normal = Type.create!(name: 'normal')
fighting = Type.create!(name: 'fighting')
flying = Type.create!(name: 'flying')
poison = Type.create!(name: 'poison')
ground = Type.create!(name: 'ground')
rock = Type.create!(name: 'rock')
bug = Type.create!(name: 'bug')
ghost = Type.create!(name: 'ghost')
steel = Type.create!(name: 'steel')
fire = Type.create!(name: 'fire')
water = Type.create!(name: 'water')
grass = Type.create!(name: 'grass')
electric = Type.create!(name: 'electric')
psychic = Type.create!(name: 'psychic')
ice = Type.create!(name: 'ice')
dragon = Type.create!(name: 'dragon')
dark = Type.create!(name: 'dark')
fairy = Type.create!(name: 'fairy')

bulbasaur = Pokemon.create!(
  name: 'Bulbasaur',
  number: '001',
  description: "Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun's rays, the seed grows progressively larger."
)

bulbasaur.types << [grass, poison]
bulbasaur.weaknesses << [fire, flying, ice, psychic]
bulbasaur.strenghts << [water, fairy]
