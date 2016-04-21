# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Flixter::Application.initialize!
ENV['TMPDIR'] = Rails.root.join('tmp').to_s