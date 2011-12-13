PennBook Readme
--------
Created by:
* Ceasar Bautista (ceasarb@seas.upenn.edu)
* Adi Dahiya (adahiya@seas.upenn.edu)

Features
--------
* User profiles
* Statuses
* Comments
* Affilitating with Organization
* Liking Interests
* Following other Users
* Dynamic newsfeed on Home page
* List of current online followers
* Network visualization (using javascript library)
    The graph shows users you are following 2 levels deep.
    This means that you can see your friends' friends, but not beyond that.
    Users with the same affiliation as you will also show up in the graph (in
    red).
* Ability to follow users (asymmetric 'friending' model)
* Abilitiy to posts on other's walls
* Persistent sessions
* User directory with search
* Ability to delete your own posts and comments
 

Extra Credit claimed
--------------------



Source Files
------------
Gemfile
Gemfile.lock
README
Rakefile
app
app/assets
app/assets/images
app/assets/images/logo.png
app/assets/images/rails.png
app/assets/javascripts
app/assets/javascripts/affiliations.js.coffee
app/assets/javascripts/application.js
app/assets/javascripts/interests.js.coffee
app/assets/javascripts/likes.js.coffee
app/assets/javascripts/likes.js.js
app/assets/javascripts/organizations.js.coffee
app/assets/javascripts/organizations.js.js
app/assets/javascripts/pages
app/assets/javascripts/pages/jit-yc.js
app/assets/javascripts/pages/pages.js
app/assets/javascripts/sessions.js.coffee
app/assets/javascripts/users.js.coffee
app/assets/stylesheets
app/assets/stylesheets/application.css
app/assets/stylesheets/bootstrap.min.css
app/assets/stylesheets/scaffolds.css
app/assets/stylesheets/scaffolds.css.scss
app/assets/stylesheets/styles.css
app/assets/stylesheets/styles.less
app/assets/stylesheets/users.css
app/assets/stylesheets/users.css.scss
app/controllers
app/controllers/affiliations_controller.rb
app/controllers/application_controller.rb
app/controllers/comments_controller.rb
app/controllers/interests_controller.rb
app/controllers/likes_controller.rb
app/controllers/organizations_controller.rb
app/controllers/pages_controller.rb
app/controllers/posts_controller.rb
app/controllers/relationships_controller.rb
app/controllers/sessions_controller.rb
app/controllers/users_controller.rb
app/helpers
app/helpers/affiliations_helper.rb
app/helpers/application_helper.rb
app/helpers/comments_helper.rb
app/helpers/interests_helper.rb
app/helpers/likes_helper.rb
app/helpers/organizations_helper.rb
app/helpers/pages_helper.rb
app/helpers/posts_helper.rb
app/helpers/sessions_helper.rb
app/helpers/users_helper.rb
app/mailers
app/mailers/.gitkeep
app/models
app/models/.gitkeep
app/models/affiliation.rb
app/models/comment.rb
app/models/interest.rb
app/models/like.rb
app/models/organization.rb
app/models/post.rb
app/models/relationship.rb
app/models/user.rb
app/views
app/views/interests
app/views/interests/_interest.html.erb
app/views/interests/_like.html.erb
app/views/interests/_like_form.html.erb
app/views/interests/_unlike.html.erb
app/views/interests/index.html.erb
app/views/interests/new.html.erb
app/views/interests/show.html.erb
app/views/layouts
app/views/layouts/_footer.html.erb
app/views/layouts/_header.html.erb
app/views/layouts/application.html.erb
app/views/organizations
app/views/organizations/_affiliate.html.erb
app/views/organizations/_affiliate_form.html.erb
app/views/organizations/_organization.html.erb
app/views/organizations/_unaffiliate.html.erb
app/views/organizations/index.html.erb
app/views/organizations/new.html.erb
app/views/organizations/show.html.erb
app/views/pages
app/views/pages/about.html.erb
app/views/pages/help.html.erb
app/views/pages/home.html.erb
app/views/pages/visualize.html.erb
app/views/posts
app/views/posts/_form.html.erb
app/views/posts/_post.html.erb
app/views/posts/edit.html.erb
app/views/posts/index.js.erb
app/views/posts/new.html.erb
app/views/posts/show.html.erb
app/views/sessions
app/views/sessions/new.html.erb
app/views/shared
app/views/shared/_affiliations.html.erb
app/views/shared/_error_messages.html.erb
app/views/shared/_feed.html.erb
app/views/shared/_feed_item.html.erb
app/views/shared/_homebar.html.erb
app/views/shared/_likes.html.erb
app/views/shared/_post_form.html.erb
app/views/shared/_search_form.html.erb
app/views/shared/_sidebar.html.erb
app/views/shared/_stats.html.erb
app/views/users
app/views/users/_follow.html.erb
app/views/users/_follow_form.html.erb
app/views/users/_form.html.erb
app/views/users/_unfollow.html.erb
app/views/users/_user.html.erb
app/views/users/edit.html.erb
app/views/users/index.html.erb
app/views/users/index.json.erb
app/views/users/new.html.erb
app/views/users/show.html.erb
app/views/users/show_follow.html.erb
app/views/users/show_follow.json.erb
app/views/users/show_like.html.erb
config
config/application.rb
config/boot.rb
config/database.yml
config/environment.rb
config/environments
config/environments/.production.rb.un~
config/environments/development.rb
config/environments/production.rb
config/environments/test.rb
config/initializers
config/initializers/backtrace_silencers.rb
config/initializers/inflections.rb
config/initializers/mime_types.rb
config/initializers/secret_token.rb
config/initializers/session_store.rb
config/initializers/wrap_parameters.rb
config/locales
config/locales/en.yml
config/routes.rb
config/routes.rb.orig
config.ru
db
db/migrate
db/migrate/20111203194536_create_users.rb
db/migrate/20111203194545_create_posts.rb
db/migrate/20111205110215_create_interests.rb
db/migrate/20111205112806_add_email_uniqueness_index.rb
db/migrate/20111205114140_add_name_to_interest.rb
db/migrate/20111205114247_rmove_interest_from_interest.rb
db/migrate/20111205114317_add_a_name_to_interest.rb
db/migrate/20111205132945_add_password_to_users.rb
db/migrate/20111205134650_add_salt_to_users.rb
db/migrate/20111207083933_create_comments.rb
db/migrate/20111207093438_create_relationships.rb
db/migrate/20111207130903_create_likes.rb
db/migrate/20111210212251_add_commenter_id_to_comment.rb
db/migrate/20111211125549_create_organizations.rb
db/migrate/20111211131832_create_affiliations.rb
db/migrate/20111212052821_add_poster_id_to_post.rb
db/schema.rb
db/schema.rb.orig
db/seeds.rb
doc
doc/README_FOR_APP
friend_recommendation
friend_recommendation/EdgeList.txt
friend_recommendation/finish.py
friend_recommendation/init.py
friend_recommendation/iter.py
friend_recommendation/output
friend_recommendation/output/finish1
friend_recommendation/output/out1
friend_recommendation/output/out2
friend_recommendation/output/out3
friend_recommendation/output/out4
friend_recommendation/output/out5
friend_recommendation/output/out6
friend_recommendation/socialrank
friend_recommendation/socialrank/diff1Mapper.java
friend_recommendation/socialrank/diff1Reducer.java
friend_recommendation/socialrank/diff2Mapper.java
friend_recommendation/socialrank/diff2Reducer.java
friend_recommendation/socialrank/finishMapper.java
friend_recommendation/socialrank/finishReducer.java
friend_recommendation/socialrank/initMapper.java
friend_recommendation/socialrank/initReducer.java
friend_recommendation/socialrank/iterMapper.java
friend_recommendation/socialrank/iterReducer.java
friend_recommendation/socialrank/SocialRankDriver.java
lib
lib/assets
lib/assets/.gitkeep
lib/tasks
lib/tasks/.gitkeep
lib/tasks/sample_data.rake
log
log/.gitkeep
public
public/404.html
public/422.html
public/500.html
public/favicon.ico
public/robots.txt
script
script/rails
test
test/fixtures
test/fixtures/.gitkeep
test/fixtures/affiliations.yml
test/fixtures/comments.yml
test/fixtures/interests.yml
test/fixtures/likes.yml
test/fixtures/organizations.yml
test/fixtures/posts.yml
test/fixtures/relationships.yml
test/fixtures/users.yml
test/functional
test/functional/.gitkeep
test/functional/affiliations_controller_test.rb
test/functional/comments_controller_test.rb
test/functional/interests_controller_test.rb
test/functional/likes_controller_test.rb
test/functional/organizations_controller_test.rb
test/functional/pages_controller_test.rb
test/functional/posts_controller_test.rb
test/functional/sessions_controller_test.rb
test/functional/users_controller_test.rb
test/integration
test/integration/.gitkeep
test/performance
test/performance/browsing_test.rb
test/test_helper.rb
test/unit
test/unit/.gitkeep
test/unit/affiliation_test.rb
test/unit/comment_test.rb
test/unit/helpers
test/unit/helpers/affiliations_helper_test.rb
test/unit/helpers/comments_helper_test.rb
test/unit/helpers/interests_helper_test.rb
test/unit/helpers/likes_helper_test.rb
test/unit/helpers/organizations_helper_test.rb
test/unit/helpers/pages_helper_test.rb
test/unit/helpers/posts_helper_test.rb
test/unit/helpers/sessions_helper_test.rb
test/unit/helpers/users_helper_test.rb
test/unit/interest_test.rb
test/unit/like_test.rb
test/unit/organization_test.rb
test/unit/post_test.rb
test/unit/relationship_test.rb
test/unit/user_test.rb
vendor
vendor/assets
vendor/assets/stylesheets
vendor/assets/stylesheets/.gitkeep
vendor/plugins
vendor/plugins/.gitkeep


Instructions for running PennBook
------------
1. Install Ruby, Rails, and sqlite.
2. Run "bundle install" to install the Ruby gems for this project.
3. Run "bundle exec rake db:migrate" to set up the database.
4. Run "bundle exec rake db:populate" to populate the database with test data.
5. Run "rails -s" to start the server.
6. Go to localhost:3000 and sign-up.

Instructions for running Friend Recommendation
-----------
1. Install Python
2. If pip or easyinstall is available, run "pip install dumbo" or "easyinstall dumbo" to install Dumbo. Otherwise, follow the instructions at https://github.com/klbostee/dumbo/wiki.
3. Go the friend_recommendation directory and run "dumbo start init.py -input
   EdgeList.txt -output out1"
4. Run the same command for iter.py (with input as out1, etc and output as out2,
   etc) until convergence
5. Run the same command for finish.py to get a list of friend recommendation
   labels (output contains list of directed edges with their 'degree of
   recommendation' as a decimal fraction)
6. To run dumbo on a Hadoop cluster instead of your local machine, add "-hadoop
   /usr/local/hadoop" after the name of the file being run in the dumbo command:
   "dumbo start iter.py -hadoop /usr/local/hadoop -input out1 -output out2"

