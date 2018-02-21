namespace :dummy do
  desc "Hydrate the database with some dummy data to make it easier to develop"
  task :reset => :environment do
    # Write some Ruby to quickly create some records in your tables.
    # If it's helpful, you can use methods from the Faker gem for random data:
    #   https://github.com/stympy/faker

  end
end
