require "spec_helper"

describe JSON2FormData do
  it "has a version number" do
    expect(JSON2FormData::VERSION).not_to be nil
  end

  it "formats JSON as x-www-form-urlencoded" do
    json = %(
      {
        "foo": "bar",
        "baz": [
          {"quux": "xyzzy"}
        ]
      }
    )
    expected_form_data = %(foo=bar&baz=%5B%7B%22quux%22%3A%22xyzzy%22%7D%5D)

    result = JSON2FormData.call(json)

    expect(result).to eq expected_form_data
  end
end
