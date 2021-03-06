# frozen_string_literal: true
require 'pry'
require 'httparty'
require 'rainbow'
require 'nokogiri'
require 'tty-link'
require 'word_wrap'

require_relative "./remotely/version"
require_relative "./remotely/cli"
require_relative "./remotely/category" 
require_relative "./remotely/job"
require_relative "./remotely/api"


module Remotely
  class Error < StandardError; end
  # Your code goes here...
end
