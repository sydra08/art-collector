# create artists
davinci = Artist.create(name: "Leonardo Da Vinci")
botticelli = Artist.create(name: "Sandro Botticelli")
vangogh = Artist.create(name: "Vincent Van Gogh")
klimt = Artist.create(name: "Gustav Klimt")
bosch = Artist.create(name: "Hieronymus Bosch")
seurat = Artist.create(name: "George Seurat")
roy = Artist.create(name: "Roy Lichtenstein")
caravaggio = Artist.create(name: "Caravaggio")
pollock = Artist.create(name: "Jackson Pollock")

# create artworks
monalisa = Artwork.new(name: "The Mona Lisa", year: "1503-1505")
monalisa.artist = davinci
monalisa.save

supper = Artwork.new(name: "The Last Supper", year: "1494")
supper.artist = davinci
supper.save

venus = Artwork.new(name: "The Birth of Venus", year: "1484-1486")
venus.artist = botticelli
venus.save

starry = Artwork.new(name: "The Starry Night", year: "1889")
starry.artist = vangogh
starry.save

kiss = Artwork.new(name: "The Kiss", year: "1907-1908")
kiss.artist = klimt
kiss.save

garden = Artwork.new(name: "The Garden of Earthly Delights", year: "1480-1515")
garden.artist = bosch
garden.save

sunday = Artwork.new(name: "A Sunday Afternoon on the Island of La Grande Jatte", year: "1884-1886")
sunday.artist = seurat
sunday.save

violin = Artwork.new(name: "The Violin", year: "1976")
violin.artist = roy
violin.save

drip = Artwork.new(name: "One: Number 31" year: "1950")
drip.artist = pollock
drip.save

judith = Artwork.new(name: "Judith Beheading Holofernes" year: "1599–1602")
judith.artist = caravaggio
judith.save
