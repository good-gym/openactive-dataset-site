require "rubygems"
require "bundler/setup"

require "openactive/dataset_site"

settings = OpenActive::DatasetSite::Settings.new(
  dataset_site_url: "https://data.goodgym.org/",
  dataset_discussion_url: "https://github.com/simpleweb/sw-oa-php-test-site",
  dataset_documentation_url: "https://developer.openactive.io/",
  dataset_languages: ["en-GB"],
  open_data_feed_base_url: "https://www.goodgym.org/api/openactive/events",
  organisation_name: "GoodGym",
  organisation_url: "https://www.goodgym.org",
  organisation_legal_entity: "The Good Gym",
  organisation_plain_text_description: "A community of runners who get fit by doing good",
  organisation_logo_url: "https://data.goodgym.org/logo.png",
  organisation_email: "getinvolved@goodym.org",
  background_image_url: "https://data.goodgym.org/background.jpg",
  date_first_published: "2010-08-16",
  data_feed_types: [
    OpenActive::DatasetSite::FeedType::SCHEDULED_SESSION
  ]
)

renderer = OpenActive::DatasetSite::TemplateRenderer.new(settings)

File.open("index.html", "w") do |file|
  file.puts renderer.render
end
