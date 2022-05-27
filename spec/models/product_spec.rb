require 'rails_helper'

RSpec.describe Product, type: :model do
  it ".list" do
    # Somehow VCR is not working me. I got this error.
    #      NoMethodError:
    #        undefined method `<<' for #<Hash:0x00007fda1ea05ed8>
    #        Did you mean?  <
    #      # lib/webmock/http_lib_adapters/net_http.rb:97:in `block in request'
    #      # lib/webmock/http_lib_adapters/net_http.rb:110:in `block in request'
    #      # lib/webmock/http_lib_adapters/net_http.rb:109:in `request'
    #      # ./app/models/product.rb:31:in `list'
    VCR.use_cassette("list") do
      Product.list("MyApiKey")
    end
  end
end
