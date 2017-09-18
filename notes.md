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
  [x] user auth for individual pages
    [x] view a collection
    [x] users can only view/edit their own collections
[ ] nav bar
  [x] signup/login/logout
  [x] view artists
  [x] view artworks
  [x] user profile
  [ ] different depending on the page (but in html/css not erb conditionals)?
    (https://github.com/sydra08/exceptional-realty-bootstrapped/blob/master/new-properties.html)
  [x] remove conditionals from the navbar on pages what require the user to be logged in
[ ] browse artworks
    [ ] sort alphabetically?
    [ ] sort by artist?
[ ] browse artists
    [ ] sort alphabetically?
    [ ] sort by number of works?
[x] create a collection
  [ ] add a name (required)
  [ ] add any existing artworks to your collection
    [ ] if none are chosen should there be a message like "this collection is empty! add some artworks to get started"
[ ] view a collection (but also the view that will link to the edit collection functions)
  [ ] can edit the collection's name => would this just patch to the same route, but only have 1 input field?
  [ ] can remove artworks from a collection on this page (trash icon)
  [ ] button to 'add new artwork'
    [ ] can add ONE from the list of existing artworks
    [ ] OR can add/create a new artwork
      [ ] field for name (required)
      [ ] field for year (optional)
      [ ] field for artist
        [ ] can choose from list of existing artists or create a new artist
        [ ] should artworks be required to have an artist? or should there be a default value of "unknown"
  [ ] add an artwork
    [ ] if an artwork starts with the word "the" you can run a search for it with and without the "the"
[x] edit a collection (add/remove existing works, update collection name)
[ ] delete a collection
  [ ] add a pop up confirmation
[ ] add error messages
  [ ] look into AR validation messages http://edgeguides.rubyonrails.org/active_record_validations.html
[ ] input validations
  [ ] when a user adds an artwork, should they be able to add "Mona Lisa" if "The Mona Lisa" exists?
[ ] maybe remove the 'browse artist' view for now?
[ ] style views
[ ] decide if i want to have default values for things in tables or just handle another way in erb

Misc
[ ] style the input boxes differently
[ ] fix the padding on the sidebar div on the homepage
[ ] style the checkbox lists differently
[ ] change the background color
[ ] find a new google font?
[ ] why are the edit routes showing up with ? at the end...need to investigate buttons more when I work on styling the routes
[ ] add trash can and pen icons to the "all collections" view
[ ] add trash can and pen icons to the "single collection" view
[ ] add http://google.github.io/material-design-icons/ to fonts (icons)
  [ ] edit = <i class="material-icons">mode_edit</i>
  [ ] delete = <i class="material-icons">delete</i>
<!-- [ ] should a user only be able to edit an artist's details but not their artworks?
[ ] should you be able edit an artwork's artist? -->
[ ] consider how changing the name affects the slug?
[ ] reset database and re-seed before submitting
[ ] when you're creating a collection should you be able to select from a dropdown menu?
[ ] review all of the messages/verbiage before submitting
[ ] how can I make it so that form button look prettier

Enhancements/Improvements for a later iteration
+ if you add an artist to your collection, by default all of the artworks are checked off
+ collections can have a description
+ have different navbar sections?
+ allow users to add/edit artworks in the database?
+ allow users to add/edit artists in the database?

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
