class CreateUsersSongs < ActiveRecord::Migration
  def change
    create_table :songs_users do |t|
      t.belongs_to :user
      t.belongs_to :song
    end

    reversible do |dir|
      dir.up do
        #add a foreign key
        execute <<-SQL
          ALTER TABLE songs_users
            ADD CONSTRAINT fk_users
            FOREIGN KEY (user_id)
            REFERENCES users(id),
            ADD CONSTRAINT fk_songs
            FOREIGN KEY (song_id)
            REFERENCES songs(id)
        SQL
      end
    end
  end
end
