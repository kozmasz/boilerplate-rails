require "net/http"
require "uri"

class Product < ApplicationRecord

  # ATTR ACCESSORS

  attr_accessor :from, :to, :amount_param, :api_key

  # CONSTANTS

  LIST_URL = URI("https://api.apilayer.com/currency_data/list")

  # COMPOSED OF

  composed_of :price, class_name: "Money", mapping: [%w(amount amount), %w(currency currency)]

  # CLASS METHODS

  class << self
    # Get all currencies
    # returns with:
    #
    # {"AED"=>"United Arab Emirates Dirham", ......}

    def list(api_key)
      https             = Net::HTTP.new(LIST_URL.host, LIST_URL.port);
      https.use_ssl     = true
      request           = Net::HTTP::Get.new(LIST_URL)
      request['apikey'] = api_key
      @list           ||= JSON.parse(https.request(request).read_body)["currencies"].with_indifferent_access
    rescue Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, EOFError,
      Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError, Net::ProtocolError => e
      Rails.logger.error(e.errors.messages)
      "Something went wrong!"
    end
  end

  # INSTANCE METHODS

  def list(api_key = nil)
    self.class.list(api_key)
  end

  def convert
    url               = URI("https://api.apilayer.com/currency_data/convert?from=#{from}&to=#{to}&amount=#{amount_param}")
    https             = Net::HTTP.new(url.host, url.port);
    https.use_ssl     = true
    request           = Net::HTTP::Get.new(url)
    request['apikey'] = api_key
    JSON.parse(https.request(request).read_body).with_indifferent_access
  rescue Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, EOFError,
    Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError, Net::ProtocolError => e
    Rails.logger.error(e.errors.messages)
    "Something went wrong!"
  end

  def set_attributes
    self.name        = "New #{to}"
    self.amount      = convert["result"]
    self.description = "Description #{to}"
    self.currency    = to
  end

  # SERIALIZERS
  # TODO Use Active Model Serializer

  def serialized_data
    attributes.except("created_at", "updated_at")
  end
end
