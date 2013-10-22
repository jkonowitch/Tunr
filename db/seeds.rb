Song.destroy_all
Artist.destroy_all
User.destroy_all

radiohead = Artist.create(name: "Radiohead")

radiohead.songs.create(name: "Fake Plastic Trees", spotify_uri: "spotify:track:0Uro2xUVsEHQNKR5QL4Lku")

User.create(email: "j@k.com", password: "j", password_confirmation: "j")