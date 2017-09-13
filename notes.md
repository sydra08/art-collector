**TO DO**
[ ] create migrations
[ ] scrape wikipedia for artists and artworks (for seed data)
[ ] create models
[ ] set up model relationships and validations
[ ] test models via tux
[ ] seed database with artists and artworks
[ ] set up application controller
[ ] set up artwork controller
[ ] set up artist controller
[ ] set up user controller
[ ] set up collection controller
[ ] set up session controller (?)
[ ] set up basic views
[ ] test to make sure views work before elaborating on them
[ ] user auth
[ ] style views


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
+ A collection has_many artworks through collection_artworks
+ A collection has_many collection_artworks
+ An artwork belongs_to an artist
+ A collection has_many artists through artworks
+ A user has_many collections
+ A collection belongs_to a user

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
art_id INT (FK)
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
date_of_birth INT
date_of_death INT

*Users*
user_id INT (PK)
collection_id INT (FK)
username STRING (required)
password_digest STRING (required)
email STRING (required)
