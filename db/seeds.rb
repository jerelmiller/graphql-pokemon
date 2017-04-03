pokemon_file = Rails.root.join('lib/pokemon.json')
pokemons = JSON.parse(File.read(pokemon_file))
pokemons = pokemons.map(&:with_indifferent_access)

ActiveRecord::Base.transaction do
  mapped_effects = {}
  cached_types = {}
  mapped_move_methods = {}
  cached_pokemon = {}

  pokemons.flat_map do |pokemon_json|
    pokemon_json['types'] +
      pokemon_json['strengths'] +
      pokemon_json['weaknesses']
  end
    .uniq
    .each { |name| cached_types[name] = Type.create!(name: name) }

  pokemons.each do |pokemon_json|
    pokemon = Pokemon.create!(
      name: pokemon_json[:name],
      number: pokemon_json[:number],
      description: pokemon_json[:description],
      attack: pokemon_json[:attack],
      defense: pokemon_json[:defense],
      hp: pokemon_json[:hp],
      special_attack: pokemon_json[:special_attack],
      special_defense: pokemon_json[:special_defense],
      speed: pokemon_json[:speed],
      height: pokemon_json[:height],
      weight: pokemon_json[:weight],
      parent: cached_pokemon[pokemon_json[:involution]]
    )

    cached_pokemon[pokemon_json[:number]] = pokemon

    pokemon_json[:types].each do |type|
      PokemonType.create!(pokemon: pokemon, type: cached_types[type])
    end

    pokemon_json[:weaknesses].each do |type|
      PokemonWeakness.create!(pokemon: pokemon, type: cached_types[type])
    end

    pokemon_json[:strengths].each do |type|
      PokemonStrength.create!(pokemon: pokemon, type: cached_types[type])
    end

    pokemon_json[:moves].each do |move_json|
      mapped_effects[move_json[:effect][:id]] ||=
        Effect.create!(description: move_json[:effect][:description])

      mapped_move_methods[move_json[:move_method][:id]] ||=
        MoveMethod.create!(
          name: move_json[:move_method][:name],
          description: move_json[:move_method][:description]
        )

      effect = mapped_effects[move_json[:effect][:id]]
      move_method = mapped_move_methods[move_json[:move_method][:id]]

      move =
        Move
          .where(name: move_json[:name])
          .first_or_create!(
            type: cached_types[move_json[:type]],
            power: move_json[:power],
            pp: move_json[:pp],
            accuracy: move_json[:accuracy],
            effect_chance: move_json[:effect_chance],
            effect: effect
          )

      PokemonMove.create!(
        pokemon: pokemon,
        move: move,
        move_method: move_method,
        level: move_json[:level]
      )
    end
  end
end
