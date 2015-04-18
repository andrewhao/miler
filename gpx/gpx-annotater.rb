require 'nokogiri'
require 'thor'

class GpxAnnotaterCLI < Thor
  desc "annotate FILENAME", "Insert time metadata into the GPX from the"
end

GpxAnnotaterCLI.start(ARGV)
