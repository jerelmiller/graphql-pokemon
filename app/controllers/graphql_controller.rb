class GraphqlController < ApplicationController
  def create
    render json: PokemonSchema.execute(params[:query], variables: variables)
  end

  private

  def variables
    if params[:variables].blank?
      {}
    elsif params[:variables].kind_of?(String)
      JSON.parse(params[:variables])
    else
      params[:variables]
    end
  end
end
