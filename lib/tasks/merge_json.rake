require 'csv'
pokemon_file = Rails.root.join('lib/pokemon.json')
moves_csv = Rails.root.join('lib/moves.csv')
pokemon_moves_csv = Rails.root.join('lib/pokemon_moves.csv')
types_csv = Rails.root.join('lib/types.csv')
move_effect_prose = Rails.root.join('lib/move_effect_prose.csv')
pokemon_move_methods_prose = Rails.root.join('lib/pokemon_move_method_prose.csv')
pokemon_species_csv = Rails.root.join('lib/pokemon_species.csv')
pokemon_csv = Rails.root.join('lib/pokemon.csv')

ENGLISH_ID = '9'

task :merge_json do
  pokemons = JSON.parse(File.read(pokemon_file))
  moves = CSV.read(moves_csv, headers: true)
  pokemon_moves = CSV.read(pokemon_moves_csv, headers: true)
  types = CSV.read(types_csv, headers: true)
  move_effects = CSV.read(move_effect_prose, headers: true)
  pokemon_move_methods = CSV.read(pokemon_move_methods_prose, headers: true)
  species = CSV.read(pokemon_species_csv, headers: true)
  pokemon_from_csv = CSV.read(pokemon_csv, headers: true)

  pokemon_moves =
    pokemon_moves.select do |pokemon_move|
      ['1'].include?(pokemon_move['version_group_id'])
    end
    .group_by { |pokemon_move| pokemon_move['pokemon_id'] }

  move_effects = move_effects.select do |move_effect|
    move_effect['local_language_id'] == ENGLISH_ID
  end

  species =
    species.select { |specimen| specimen['generation_id'] == '1' }

  pokemon_move_methods = pokemon_move_methods.select do |move_method|
    move_method['local_language_id'] == ENGLISH_ID
  end

  pokemons.each_with_index do |pokemon_entry, idx|
    normalized_id = pokemon_entry['number'].to_i.to_s
    pokemon_csv_entry = pokemon_from_csv.find { |p| p['id'] == normalized_id }
    specimen = species.find { |specimen| specimen['id'] == normalized_id }

    involution_id = specimen['evolves_from_species_id']
    pokemon_entry['involution'] = involution_id.present? ?
      involution_id.rjust(3, '0') :
      nil

    pokemon_entry['height'] = (pokemon_csv_entry['height'].to_i / 10.0).round(2) # in meters
    pokemon_entry['weight'] = (pokemon_csv_entry['weight'].to_i / 10.0).round(2) # in kilograms

    pokemon_entry['moves'] = []

    pokemon_moves[pokemon_entry['number'].to_i.to_s].each do |pokemon_move|
      move = moves.find { |move| move['id'] == pokemon_move['move_id'] }
      move_method = pokemon_move_methods.find { |move_method| move_method['pokemon_move_method_id'] == pokemon_move['pokemon_move_method_id'] }
      effect = move_effects.find { |effect| effect['move_effect_id'] == move['effect_id'] }

      pokemon_entry['moves'].push(
        name: move['identifier'],
        type: types.find { |type| type['id'] == move['type_id'] }['identifier'],
        power: move['power'].nil? ? nil : move['power'].to_i,
        pp: move['pp'].nil? ? nil : move['pp'].to_i,
        accuracy: move['accuracy'].nil? ? nil : move['accuracy'].to_i,
        level: pokemon_move['level'].to_i,
        effect_chance: move['effect_chance'].nil? ? nil : move['effect_chance'].to_i,
        effect: {
          id: effect['move_effect_id'].to_i,
          description: effect['short_effect']
        },
        move_method: {
          id: move_method['pokemon_move_method_id'],
          name: move_method['name'],
          description: move_method['description']
        }
      )
    end
  end

  File.open(pokemon_file, 'w') do |f|
    f.write(JSON.pretty_generate(pokemons))
  end
end
