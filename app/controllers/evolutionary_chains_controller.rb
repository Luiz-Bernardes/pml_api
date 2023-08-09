class EvolutionaryChainsController < ApplicationController
  before_action :set_evolutionary_chain, only: [:show, :update, :destroy]

  # GET /evolutionary_chains
  def index
    @evolutionary_chains = EvolutionaryChain.all

    render json: @evolutionary_chains
  end

  # GET /evolutionary_chains/1
  def show
    render json: @evolutionary_chain
  end

  # POST /evolutionary_chains
  def create
    @evolutionary_chain = EvolutionaryChain.new(evolutionary_chain_params)

    if @evolutionary_chain.save
      render json: @evolutionary_chain, status: :created, location: @evolutionary_chain
    else
      render json: @evolutionary_chain.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /evolutionary_chains/1
  def update
    if @evolutionary_chain.update(evolutionary_chain_params)
      render json: @evolutionary_chain
    else
      render json: @evolutionary_chain.errors, status: :unprocessable_entity
    end
  end

  # DELETE /evolutionary_chains/1
  def destroy
    @evolutionary_chain.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evolutionary_chain
      @evolutionary_chain = EvolutionaryChain.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def evolutionary_chain_params
      params.require(:evolutionary_chain).permit(:pokemon_id, :pokemon_evolved_id, :evolution_levelup, :evolution_method)
    end
end
