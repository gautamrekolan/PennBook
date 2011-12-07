namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_users
    make_posts
    make_relationships
  end
end

def make_users
  99.times do |n|
    first_name  = Faker::Name.first_name
    last_name  = Faker::Name.last_name
    birthday = "2001-02-03"
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(:first_name => first_name,
                 :last_name => last_name,
                 :birthday => birthday,
                 :email => email,
                 :password => password,
                 :password_confirmation => password)
  end
end

def make_posts
  User.all(:limit => 6).each do |user|
    50.times do
      content = Faker::Lorem.sentence(5)
      user.posts.create!(:content => content)
    end
  end
end

def make_relationships
  users = User.all
  user  = users.first
  following = users[1..50]
  followers = users[3..40]
  following.each { |followed| user.follow!(followed) }
  followers.each { |follower| follower.follow!(user) }
end
