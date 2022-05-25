require "net/http"
require "uri"

class Product < ApplicationRecord
  # CONSTANTS

  LIST_URL = URI("https://api.apilayer.com/currency_data/list")
  API_KEY  = "Puyhfe1GLBe6SdDjWP5e1VRR8LR25FRV"


  # CLASS METHODS

  class << self
    # Get all currencies
    # returns with:
    #
    # {"AED"=>"United Arab Emirates Dirham", ......}

    def list
      https             = Net::HTTP.new(LIST_URL.host, LIST_URL.port);
      https.use_ssl     = true
      request           = Net::HTTP::Get.new(LIST_URL)
      request['apikey'] = API_KEY
      @list ||= JSON.parse(https.request(request).read_body)["currencies"].with_indifferent_access
    rescue Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, EOFError,
      Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError, Net::ProtocolError => e
      "Something went wrong!"
    end
  end

end
