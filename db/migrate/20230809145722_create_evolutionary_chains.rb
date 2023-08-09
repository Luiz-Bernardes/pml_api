class CreateEvolutionaryChains < ActiveRecord::Migration[6.0]
  def change
    create_table :evolutionary_chains do |t|
      t.references :pokemon, null: false, foreign_key: true
      t.integer :evolution_levelup
      t.text :evolution_method

      t.timestamps
    end
  end
end
