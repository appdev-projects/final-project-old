namespace :dev do
  desc "Hydrate the database with some dummy data to make it easier to develop"
  task prime: "db:setup" do
  end
end
