namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_users
    make_posts
    make_comments
    make_relationships
    make_interests
    make_likes
    make_organizations
  end
end

def make_users
  25.times do |n|
    first_name  = Faker::Name.first_name
    last_name  = Faker::Name.last_name
    birthday = "2001-02-03"
    email = Faker::Internet.email
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
  User.all.each do |user|
    20.times do
      content = Faker::Lorem.sentence(5)
      user.posts.create!(:content => content)
    end
  end
end

def make_comments
  User.all.each do |user|
    user.posts(:limit => 3).each do |post|
      2.times do
        content = Faker::Lorem.sentence(5)
        post.comments.create!(:user_id => post.user.id,
                              :post_id => post.id,
                              :commenter_id => User.random.id,
                              :content => content)
      end
    end
  end
end

def make_relationships
  50.times do
    User.random.follow!(User.random)
  end
end

def make_interests
  50.times do
    name = Faker::Address.city
    description = Faker::Lorem.sentence(10)
    Interest.create!(:name => name, :description => description)
  end
end

def make_likes
  interests = Interest.all
  user = User.first
  interests.each { |interest| user.like!(interest) }
end

def make_organizations
  50.times do
    name = Faker::Company.name
    description = Faker::Lorem.sentence(10)
    Organization.create!(:name => name, :description => description)
  end
end
