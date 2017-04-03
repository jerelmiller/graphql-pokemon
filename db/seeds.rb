pokemon_file = Rails.root.join('lib/pokemon.json')
pokemons = JSON.parse(File.read(pokemon_file))

pokemons.each do |pokemon_json|
  pokemon_json = pokemon_json.with_indifferent_access

  pokemon = Pokemon.create!(
    name: pokemon_json[:name],
    number: pokemon_json[:number],
    description: pokemon_json[:description],
    attack: pokemon_json[:attack],
    defense: pokemon_json[:defense],
    hp: pokemon_json[:hp],
    special_attack: pokemon_json[:special_attack],
    special_defense: pokemon_json[:special_defense],
    speed: pokemon_json[:speed]
  )

  pokemon_json[:types].each do |type|
    type = Type.where(name: type).first_or_create!
    PokemonType.create!(pokemon: pokemon, type: type)
  end

  pokemon_json[:weaknesses].each do |type|
    type = Type.where(name: type).first_or_create!
    PokemonWeakness.create!(pokemon: pokemon, type: type)
  end

  pokemon_json[:strengths].each do |type|
    type = Type.where(name: type).first_or_create!
    PokemonStrength.create!(pokemon: pokemon, type: type)
  end
end
