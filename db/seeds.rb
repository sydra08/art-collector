# create artists
davinci = Artist.create(name: "Leonardo Da Vinci")
vermeer = Artist.create(name: "Johannes Vermeer")
botticelli = Artist.create(name: "Sandro Botticelli")
vangogh = Artist.create(name: "Vincent Van Gogh")
whistler = Artist.create(name: "James Abbott McNeill Whistler")
klimt = Artist.create(name: "Gustav Klimt")
vaneyck = Artist.create(name: "Jan van Eyck")
bosch = Artist.create(name: "Hieronymus Bosch")
seurat = Artist.create(name: "George Seurat")
picasso = Artist.create(name: "Pablo Picasso")

# create artworks
monalisa = Artwork.new(name: "The Mona Lisa", year: "1503-1505")
monalisa.artist = davinci
monalisa.save

supper = Artwork.new(name: "The Last Supper", year: "1494")
supper.artist = davinci
supper.save

pearl = Artwork.new(name: "The Girl with a Pearl Earring", year: "1665")
pearl.artist = vermeer
pearl.save

venus = Artwork.new(name: "The Birth of Venus", year: "1484-1486")
venus.artist = botticelli
venus.save

starry = Artwork.new(name: "The Starry Night", year: "1889")
starry.artist = vangogh
starry.save

mother = Artwork.new(name: "Arrangement in Grey and Black No. 1 (Whistler's Mother)", year: "1871")
mother.artist = whistler
mother.save

kiss = Artwork.new(name: "The Kiss", year: "1907-1908")
kiss.artist = klimt
kiss.save

portrait = Artwork.new(name: "The Arnolfini Portrait", year: "1434")
portrait.artist = vaneyck
portrait.save

garden = Artwork.new(name: "The Garden of Earthly Delights", year: "1480-1515")
garden.artist = bosch
garden.save

sunday = Artwork.new(name: "A Sunday Afternoon on the Island of La Grande Jatte", year: "1884-1886")
sunday.artist = seurat
sunday.save

avignon = Artwork.new(name: "Les Demoiselles d'Avignon", year: "1907")
avignon.artist = picasso
avignon.save
