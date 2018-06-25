namespace :reset do
  desc "Rebuilds and repopulates the entire database"
  task all: :environment do
    if Rails.env.production?
      raise DangerousOperationError, "Please use `heroku pg:reset DATABASE_URL` and run everything manually."
    end

    Rake::Task["db:drop"].invoke
    Rake::Task["db:create"].invoke
    Rake::Task["db:migrate"].invoke
    Rake::Task["reset:data"].invoke
  end

  desc "Repopulates and reindexes default and generated data"
  task data: :environment do
    Rake::Task["db:fixtures:load"].invoke
    Rake::Task["db:seed"].invoke

    Gen.do_it_all!
    Rake::Task["searchkick:reindex:all"].invoke
  end
end
