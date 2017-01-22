module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')
      file.each do |row|
        csv_contents << row.chomp.split(', ')
      end
    end

    attr_accessor :headers, :csv_contents

    def initialize
      read
    end

    def each
      csv_contents.each do |row|
        yield CsvRow.new headers, row
      end
    end
  end
end

class CsvRow
  attr :content
  def initialize headers, row
    @content = [headers, row].transpose.to_h
  end

  def method_missing name
    @content[name.to_s]
  end
end

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end

ruby_csv = RubyCsv.new
puts ruby_csv.headers.inspect
puts ruby_csv.csv_contents.inspect
puts

ruby_csv.each do |row|
  puts row.one
end
