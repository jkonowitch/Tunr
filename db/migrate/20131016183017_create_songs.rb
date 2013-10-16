class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.references :artist, index: true
      t.string :spotify_uri

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        #add a foreign key
        execute <<-SQL
          ALTER TABLE songs
            ADD CONSTRAINT fk_songs_artists
            FOREIGN KEY (artist_id)
            REFERENCES artists(id)
        SQL
      end

      dir.down do
        execute <<-SQL
          ALTER TABLE users
            DROP FOREIGN KEY fk_songs_artists
        SQL
      end
    end
  end
end
