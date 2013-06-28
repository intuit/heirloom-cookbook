require 'rubygems'
require 'bundler/setup'
require 'berkshelf'

# prevent recursive vendoring by berkshelf
# https://github.com/RiotGames/berkshelf/issues/263
FileUtils.rm_rf 'vendor/cookbooks/heirloom'
# install deps
berksfile = Berkshelf::Berksfile.from_file('Berksfile')
berksfile.install( :path => 'vendor/cookbooks')

libs = File.expand_path("../../libraries", __FILE__)

Dir.entries(libs).each do |r|
  require "#{libs}/#{r}" unless r =~ /^\..*$/
end

RSpec.configure do |config|
  # rspec config
end