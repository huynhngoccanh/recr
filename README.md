## When Staging is Down:

Run `heroku run rake searchkick:reindex:all`


## Generating Dummy Data

We've got some rudimentary logic to generate dummy data simply so I
could test pagination and see all the possible connection states between
an athlete and a college at once. Everything for this currently resides
in `app/models/gen.rb`

### Usage

Run

```
rake reset:data
```

This will reload the fixtures, add a default admin account, generate
some dummy data and reindex everything.

If you want to get more granular and, say, generate 100 different
athletes:

Simply call in your Rails console:

```
Gen.do_it_all!
```

then exit the console and run:

```
rake searchkick:reindex:all
```

And 20 new athletes, high_schools, and colleges will be linked up and
generated.

Need more than that?

```
Gen.do_it_all!(100)
```

### How it works

_Note: the example code here is meant solely to illustrate the thinking
behind data generation an won't be strictly accurate since it will change over
time. You can see the latest in `app/models/gen.rb`_

It's a super-simple, ruby-only implementation of a `Factory`, aka an
object that generates other objects. For example:

```
class Gen
  def self.athlete
    class_of = [2016, 2017, 2018, 2019].sample
    Athlete.create(class_of: class_of, primary_position: Position.abbreviations.sample)
  end
end
```

This adds a class method to generate a new Athlete with random
attributes. To use this, you'd simply call:

```
new_athlete = Gen.athlete
```

The thing is, an athlete alone is no good without an attached user and
high school. So, we'll need to make sure we add these, too:

```ruby
class Gen
  def self.high_school_athlete!
    hs = high_school
    us = user
    at = athlete

    us.update(membershipable: at)
    at.update(owner: user)
    Connection.create(athlete: at, organization: hs, athlete_approved: true, organization_approved: true)
    at
  end
end
```

This sets up the High School, User, and Athlete. Users can have a
"membership" in a given Athlete, High School, or College, which denotes
who they belong to. This, combined with their "role," can tell us who
they can act as, AND on whose behalf.

Next, Athletes specifically implement an "Ownable" concern, which means you
can specify which user actually owns the athlete profile.

Finally, we create the fully approved connection between an the athlete
and the high school.

Lastly, the method is supposed to create a high_school_athlete, so we
need to return our newly set up athlete.

## Generating lots of data

Hopefully this code, while informal, is pretty self-explanatory. It's all
wrapped in a transaction so if any part goes wrong, we don't get
incomplete data and instead everything is cancelled.

```ruby
class Gen
  def self.do_it_all!(count=20)
    count = count.to_i
    ActiveRecord::Base.transaction do
      athletes = count.times.map { high_school_athlete! }
      count.times { college }
      connect_everyone!(athletes)
      athletes.each { |athlete| add_tons_of_stats!(athlete) }
    end
  end
```

The default number of times a new athlete/college/high_school
combination is created is 20. If you pass in a different number, it will
build that many different athletes. Is this madness? No...THIS. IS.

```ruby
Gen.do_it_all!(300)
```

### Customizing

If this kind of functionality proves to be really useful, it might
actually be worth it to get FactoryGirl all set up. But if we're gonna
use it one-off a couple times, then this will do just fine.

To customize, swap out anywhere you see `Faker::Something.attribute`
because this is where everything gets named. Just make sure that if
you're gonna drop in ~30ish custom names, that you dont call Gen more
than 30 times or you'll get repeats.

### Debugging

If `Gen.do_it_all!` doesn't work, that means there are some new
validations which haven't been reflected in the generators yet. Look for
where the rollback happened, and definitely whatever it happened on
needs to be updated. So if you see it happen on athlete, try:

```
athlete = Gen.athlete
athlete.errors
```

To see what went wrong.


## Updating

Rails 5 Release Candidate 1 is out!
So is Ruby 2.3.1, which resolves some odd bugs and increases security.

To update ruby if you're using rbenv:
```sh
brew update && brew upgrade ruby-build
rbenv install 2.3.1

# make sure you're in the /recruitingboard root directory:
rbenv local 2.3.1

# or if you want to set the new version globally
rbenv global 2.3.1

# install bundler on your new ruby version so it can take care of the
rest of your gem stuff:
gem install bundler

# then, to install all the latest versions of your gems, run:
bundle update

```

## Git Workflow

```sh
# To switch to an existing branch

git checkout branch_name

# To create a new branch

git checkout -b new_branch_name

# Convention: yourname_feature_name, ex: chris_direct_messaging

# To merge: open a pull request, or

# while you're currently on the branch you want to pull changes into (usually dev)

git merge other_branch_name
git push

# potentially have to deal with merge conflicts first
```

## Setup

Bar none the best guide to getting set up is <a href="https://gorails.com/setup/osx/10.10-yosemite" target="_blank">here</a>.

All of the commands in this section are meant to be run from the root directory of your rails app in the terminal unless otherwise specified.

You'll want to install:
* rbenv (with ruby 2.3.0)
* bundler
* postgres
* elasticsearch

Setting up the database for the first time:

```
bundle install
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:fixtures:load
```

Keeping the database current after you pull down recent changes:

```
bundle install
bundle exec rake db:migrate
bundle exec rake db:fixtures:load
```

ElasticSearch:

[Install Elasticsearch](https://www.elastic.co/guide/en/elasticsearch/reference/current/setup.html). For Homebrew, use:

```sh
brew install elasticsearch

# if you want it to always be there (recommended), copy the command after install starting with:
launchctl load ~/ #...

# otherwise, to start the server
elasticsearch
```

If you run into any strange errors, or we've edited any migrations, you can completely rebuild and repopulate your database with this one command:

**If we have production data:**

_(We'll be taking care of any database changes strictly through
migrations)_

```
rake db:migrate
rake reset:data
```

**If we're not in production yet:**

_(We'll have the freedom to change our database, revise our migrations,
etc to keep it as clean as
possible before we launch into production)_

```
rake reset:all
```

This will completely drop the database, rebuild it, and fill it with seed data, then reindex it. Part of the development process will be making sure that we keep current seed data.


## Other Dependencies

Installing Redis:

```
brew install redis
```

Running Redis (only if you need):

```
redis-server
```

Running SideKiq (only if you need):

```
bundle exec sidekiq
```

## View Reference

* [login page](/app/views/accounts/sessions/new.html.erb) - `/app/views/accounts/sessions/new.html.erb`
* [sign up page](/app/views/accounts/registrations/new.html.erb) - `/app/views/accounts/registrations/new.html.erb`
* [account edit page](/app/views/accounts/registrations/edit.html.erb) - `/app/views/accounts/registrations/edit.html.erb`
* [home pages (landing, about, etc)](/app/views/home/) - in `/app/views/home/`
* [navigational elements](/app/views/shared) - in ``/app/views/shared`
* [default layout](/app/views/layouts/application.html.erb) - in `/app/views/layouts/application.html.erb`
