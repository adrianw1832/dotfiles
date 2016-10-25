require 'fileutils'

def configure_gemfile
  gemfile = File.read('Gemfile')
  gems = ['capybara', 'database_cleaner', 'factory_girl_rails', 'launchy', 'poltergeist', 'rspec-collection_matchers', 'rspec-rails', 'shoulda']

  gems.reverse.each { |gem|
    gemfile.sub!(":test do", ":test do\n  gem '#{gem}'") unless gemfile.include?(gem)
  }

  File.open('Gemfile', "w") { |file|
    file << gemfile
    puts 'gems added'
  }

  puts `bundle install`
  puts `bin/rails generate rspec:install` unless File.exist?('spec')
end

def configure_requires
  rails_helper = File.read('spec/rails_helper.rb')
  requires = ['support/database_cleaner', 'support/factory_girl', 'capybara/poltergeist', 'capybara/rails']
  poltergeist_setting = 'Capybara.javascript_driver = :poltergeist'

  rails_helper.sub!("'rspec/rails'", "'rspec/rails'\n#{poltergeist_setting}") unless rails_helper.include?(poltergeist_setting)

  requires.each { |file|
    rails_helper.sub!("'rspec/rails'", "'rspec/rails'\nrequire '#{file}'") unless rails_helper.include?(file)
  }

  rails_helper.sub!("transactional_fixtures = true", "transactional_fixtures = false")

  File.open('spec/rails_helper.rb', "w") { |file|
    file << rails_helper
    puts 'requires added'
  }
end

def configure_support_files
  source =  File.expand_path('support', File.dirname(__FILE__))
  dest = File.join(Dir.pwd, 'spec')
  factories = File.join(Dir.pwd, 'spec', 'factories')
  FileUtils.cp_r(source, dest) unless File.exist?(File.join(dest, 'support'))
  Dir.mkdir(factories) unless File.exist?(factories)
end

def configure_devise
  puts 'would you like to have devise installed? [y/n]'
  answer = gets.chomp

  if answer === 'y'
    gemfile = File.read('Gemfile')
    gemfile.sub!("group :development", "gem 'devise'\n\ngroup :development")
  end

  File.open('Gemfile', "w") { |file| file << gemfile }

  puts `bundle install`
  puts `bin/rails generate devise:install`
  puts `bin/rails generate devise User`
end

puts `spring stop` #in case spring is preventing rails generate from runnning
configure_gemfile
configure_requires
configure_support_files
configure_devise
