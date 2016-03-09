require "pig_sniffer/version"
require "unirest"

module PigSniffer
 
 class Police 

  attr_reader :zip, :location, :address, :state, :district, :city
  
  def initialize(police_api_info)

    @zip = police_api_info["zip"]
    @location = police_api_info["location"]
    @address = police_api_info["address"]
    @state = police_api_info["state"]
    @district = police_api_info["district"]
    @city = police_api_info["city"]

end 


  def self.all
    api_array = Unirest.get('https://data.cityofchicago.org/resource/z8bn-74gv.json').body
    police_stations = []
    
    api_array.each do |station|
      police_stations << Police.new(station)
    end
    police_stations
  end

  def self.search(search_keyword)
    api_array = Unirest.get("https://data.cityofchicago.org/resource/z8bn-74gv.json$q=#{search_keyword}").body
    police_stations = []

    police_stations = []
    
    api_array.each do |station|
      police_stations << Police.new(station)
    end
    police_stations
  end







 end 

end
