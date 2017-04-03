class Resolvers::PokemonResolver
  def call(obj, args, ctx)
    Pokemon.includes(:types, :weaknesses, :strengths)
  end
end
