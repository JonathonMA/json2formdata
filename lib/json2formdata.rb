require "json2formdata/version"

require "http/form_data"
require "json"

module JSON2FormData
  module_function def call(json_encoded_hash)
    post_hash = JSON.load(json_encoded_hash).map do |key, value|
      [key, value.is_a?(Array) ? JSON.dump(value) : value]
    end.to_h

    HTTP::FormData.create(post_hash).to_s
  end
end
