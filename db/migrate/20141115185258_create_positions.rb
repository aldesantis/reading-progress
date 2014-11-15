class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.integer :article_id, null: false
      t.inet :user_ip, null: false
      t.integer :offset, null: false, default: 0
    end

    add_index :positions, [:article_id, :user_ip], unique: true
  end
end
