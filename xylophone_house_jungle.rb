# frozen_string_literal: true

#1
require 'csv'

#2
class SafeStreets
  #3
  def initialize
    @streets_data = {}
  end

  #4
  def read_csv
    CSV.foreach('./streets.csv', headers: true) do |row|
      @streets_data[row['street'].downcase] = row
    end
  end

  #5
  def find_street(street)
    @streets_data[street.downcase]
  end

  #6
  def streets_safe?(street)
    row = find_street(street)
    row && row['safe']
  end

  #7
  def list_streets
    @streets_data.keys
  end

  #8
  def add_street(street, safe_rating)
    @streets_data[street.downcase] = {
      'street' => street,
      'safe' => safe_rating
    }
  end

  #9
  def update_street_safety(street, safe_rating)
    @streets_data[street.downcase] ||= {}
    @streets_data[street.downcase]['safe'] = safe_rating
  end

  #10
  def save_to_csv
    CSV.open('./streets.csv', 'w', write_headers: true, headers: [
      'street', 'safe'
    ]) do |csv|
      @streets_data.values.each do |row|
        csv << row.values
      end
    end
  end
end

#11
safe_streets = SafeStreets.new

#12
safe_streets.read_csv

#13
streets = safe_streets.list_streets

#14
streets.each do |street|
  puts "#{street}: #{safe_streets.streets_safe?(street)}"
end

#15
safe_streets.add_street('Baker Street', true)

#16
safe_streets.update_street_safety('Main Street', false)

#17
safe_streets.save_to_csv

#18
puts safe_streets.find_street('Baker Street')

#19
streets.each do |street|
  puts "#{street}: #{safe_streets.streets_safe?(street)}"
end

#20
safe_streets.save_to_csv