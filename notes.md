**TO DO**
[x] create migrations
[x] manually add seed data
[ ] scrape wikipedia for artists and artworks (for seed data?)
[x] create models
[x] set up model relationships and validations
[x] test models via tux
  [x] test validations
  [x] test relationships
[x] seed database with artists and artworks
[x] set up controller files
[x] enable sessions in ApplicationController
[x] set up basic views
[x] set up routes
[x] test to make sure views work before elaborating on them
[x] user auth
  [x] sign up
  [x] login
  [ ] user auth for individual pages
    [ ] view a collection
    [ ] users can only view/edit their own collections
[ ] nav bar
  [ ] signup/login/logout
  [ ] view artists
  [ ] view artworks
  [ ] user profile
[ ] create a collection
  [ ] add an artist
  [ ] add an artwork
  [ ] if you add an artist to your collection, by default all of the artworks are checked off
[ ] edit a collection
[ ] delete a collection
[ ] add flash messages
[ ] style views
[ ] decide if i want to have default values for things in tables or just handle another way in erb

Misc
[ ] style the input boxes differently


**Basic Outline of App**

+ A user can create a collection
+ A user can view, edit and delete a collection that belongs to them
  + A user can view their collection by artist or by artworks
+ When a user creates a new collection they can add a new or existing artwork or a new or existing artist to their collection
  + If a user adds an artist to their collection, they will be prompted to select which pieces by an artist they would like to add to the collection
+ A user cannot delete an artwork or an artist from the database
+ A logged in user can view a list of all the artists in the database
+ A logged in user can view all of the artworks in the database
+ A logged in user can view a single artist and all of the associated artworks
+ A logged in user can view a single artwork and the artist it is associated with

**Model Relationships**

+ An artist has_many artworks

+ An artwork belongs_to an artist
+ An artwork has_many collections through collection_artworks

+ A collection has_many artists through artworks
+ A collection has_many artworks through collection_artworks
+ A collection has_many collection_artworks

+ A user has_many user_collections
+ A user has_many collections through user_collections

+ A user_collection belongs_to a user
+ A user_collection belongs_to a collection

+ A collection_artwork belongs_to an artwork
+ A collection_artwork belongs_to a collection

**Questions**

Seed DB - top 25-50 artists & top 25-50 artworks?
Can a user add an artist without any artworks?
If a user tries to add an artist that already exists they are denied?

**Database Schema**

*Collections*
collection_id INT (PK)
name STRING (required)
comment TEXT

*Collection_Artworks*
collection_artworks_id INT (PK)
artwork_id INT (FK)
collection_id INT (FK)

*Artworks*
artwork_id INT (PK)
artist_id INT (FK)
name STRING (required)
year INT (optional?)

*Artists*
artist_id INT (PK)
name STRING (required)
style STRING
location STRING
birth_year INT
alive BOOL

*Users*
user_id INT (PK)
collection_id INT (FK)
username STRING (required)
password_digest STRING (required)
email STRING (required)

*User_Collections*
user_collections_id INT (PK)
user_id INT (FK)
collection_id INT (FK)
