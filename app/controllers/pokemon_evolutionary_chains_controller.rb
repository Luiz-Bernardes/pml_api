class PokemonEvolutionaryChainsController < ApplicationController
  before_action :set_pokemon_evolutionary_chain, only: [:show, :update, :destroy]

  # GET /pokemon_evolutionary_chains
  def index
    @pokemon_evolutionary_chains = PokemonEvolutionaryChain.all

    render json: @pokemon_evolutionary_chains
  end

  # GET /pokemon_evolutionary_chains/1
  def show
    render json: @pokemon_evolutionary_chain
  end

  # POST /pokemon_evolutionary_chains
  def create
    @pokemon_evolutionary_chain = PokemonEvolutionaryChain.new(pokemon_evolutionary_chain_params)

    if @pokemon_evolutionary_chain.save
      render json: @pokemon_evolutionary_chain, status: :created, location: @pokemon_evolutionary_chain
    else
      render json: @pokemon_evolutionary_chain.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pokemon_evolutionary_chains/1
  def update
    if @pokemon_evolutionary_chain.update(pokemon_evolutionary_chain_params)
      render json: @pokemon_evolutionary_chain
    else
      render json: @pokemon_evolutionary_chain.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pokemon_evolutionary_chains/1
  def destroy
    @pokemon_evolutionary_chain.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pokemon_evolutionary_chain
      @pokemon_evolutionary_chain = PokemonEvolutionaryChain.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pokemon_evolutionary_chain_params
      params.require(:pokemon_evolutionary_chain).permit(:evolutionary_chain_id, :pokemon_id)
    end
end
