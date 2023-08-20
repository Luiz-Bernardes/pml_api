class TypesController < ApplicationController
  before_action :set_type, only: [:show, :update, :destroy]

  # GET /types
  def index
    @types = Type.all

    render json: serialize_type(@types, options)
  end

  # GET /types/1
  def show
    render json: serialize_type(@type, options)
  end

  # POST /types
  def create
    @type = Type.new(type_params)

    if @type.save
      render json: serialize_type(@type, options), status: :created, location: @type
    else
      render json: @type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /types/1
  def update
    if @type.update(type_params)
      render json: serialize_type(@type, options)
    else
      render json: @type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /types/1
  def destroy
    @type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type
      @type = Type.find(params[:id])
    end

    def serialize_type query, options
      TypeSerializer.new(query, options).serialized_json
    end

    # Only allow a trusted parameter "white list" through.
    def type_params
      params.require(:type).permit(:name)
    end

    def options
      @options ||= { include: %i[pokemons] } 
    end
end
