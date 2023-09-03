# frozen_string_literal: true

namespace :db do
  desc 'Reset the database'
  task reset: :environment do
    Rake::Task['db:migrate:reset'].invoke
    Rake::Task['db:seed'].invoke
  end
end
