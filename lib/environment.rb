# frozen_string_literal: true

require_relative "./remotely/version"
require_relative "./remotely/cli"
require_relative "./remotely/api"
require_relative "./remotely/job"

require 'pry'
require 'httparty'
require 'rainbow'

module Remotely
  class Error < StandardError; end
  # Your code goes here...
end
