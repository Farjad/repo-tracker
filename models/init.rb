# encoding: utf-8
require 'sequel'

DB = Sequel.postgres ENV['REPO_TRACKER_DB'], user: ENV['REPO_TRACKER_USER'], password: ENV['REPO_TRACKER_PASS'], host: ENV['REPO_TRACKER_HOST'], port: ENV['REPO_TRACKER_PORT']
DB << "SET CLIENT_ENCODING TO 'UTF8';"

require_relative 'repo'
require_relative 'repo_commit'
require_relative 'image'