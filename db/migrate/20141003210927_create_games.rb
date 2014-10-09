class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :player1
      t.references :player2
      t.string :move1
      t.string :move2
      t.string :winner
      t.references :tournament
    end
  end
end
