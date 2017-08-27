class CreateUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :urls do |t|
      t.text :longUrl

      t.timestamps
    end
  end
end
