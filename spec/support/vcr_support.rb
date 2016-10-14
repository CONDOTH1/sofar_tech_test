require 'rails_helper'

VCR.configure do |c|
  c.cassette_library_dir = Rails.root.join("spec", "vcr")
  c.hook_into :webmock
  c.default_cassette_options = { :record => :once }
end
