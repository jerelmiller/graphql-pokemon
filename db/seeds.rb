pokemon_file = Rails.root.join('lib/pokemon.json')
pokemons = JSON.parse(File.read(pokemon_file))

pokemons.each do |pokemon_json|
  pokemon_json = pokemon_json.with_indifferent_access

  pokemon = Pokemon.create!(
    name: pokemon_json[:name],
    number: pokemon_json[:number],
    description: pokemon_json[:description]
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
