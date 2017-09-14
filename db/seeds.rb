# create artists
davinci = Artist.create(name: "Leonardo Da Vinci", birth_year: 1452, movement: "High Renaissance", location: "Italy", alive: false)
vermeer = Artist.create(name: "Johannes Vermeer", birth_year: 1632, movement: "Baroque", location: "Dutch Republic", alive: false)
botticelli = Artist.create(name: "Sandro Botticelli", birth_year: 1445, movement: "Italian Renaissance", location: "Italy", alive: false)
vangogh = Artist.create(name: "Vincent Van Gogh", birth_year: 1853, movement: "Post-Impressionism", location: "The Netherlands", alive: false)
whistler = Artist.create(name: "James Abbott McNeill Whistler", birth_year: 1834, movement: "Aestheticism", location: "Massachusetts", alive: false)
klimt = Artist.create(name: "Gustav Klimt", birth_year: 1862, movement: "Symbolism", location: "Austrian Emprie", alive: false)
vaneyck = Artist.create(name: "Jan van Eyck", birth_year: 1399, movement: "Northern Renaissance", location: "The Netherlands", alive: false)
bosch = Artist.create(name: "Hieronymus Bosch", birth_year: 1450, movement: "Northern Renaissance", location: "The Netherlands", alive: false)
seurat = Artist.create(name: "Geroges Seurat", birth_year: 1859, movement: "Pointillism", location: "", alive: false)
picasso = Artist.create(name: "Pablo Picasso", birth_year: 1881, movement: "Cubism", location: "Spain", alive: false)

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
