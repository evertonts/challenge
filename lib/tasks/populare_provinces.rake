# Create Provinces defined on the provinces file based on https://github.com/VivaReal/code-challenge/blob/master/provinces.json

require 'net/http'

namespace :provinces do
  task import: :environment do
    Province.delete_all # Remove the old provinces

    uri = URI('https://raw.githubusercontent.com/VivaReal/code-challenge/master/provinces.json')
    response = Net::HTTP.get_response(uri)

    provinces = JSON.parse(response.body, symbolize_names: true)

    puts 'Creating provinces'

    provinces.each do |name, data|
      upper_left = data[:boundaries][:upperLeft]
      bottom_right = data[:boundaries][:bottomRight]

      Province.create(
        name: name,
        upper_left_x: upper_left[:x],
        upper_left_y: upper_left[:y],
        bottom_right_x: bottom_right[:x],
        bottom_right_y: bottom_right[:y]
      )

      print '.'
    end
    print "\n"
  end
end
