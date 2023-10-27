class CreatePokemons < ActiveRecord::Migration[7.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :sprite
      t.string :typePokemon
      t.integer :hp
      t.integer :attack
      t.integer :defense

      t.timestamps
    end
  end
end
