module CelticsRoster
end

require_relative '../config/environment'
require "./celtics_roster_cli_project/version"
require "./celtics_roster_cli_project/cli"
require "./celtics_roster_cli_project/player"
require "./celtics_roster_cli_project/scraper"
require 'open-uri'
require 'nokogiri'
require 'pry'

