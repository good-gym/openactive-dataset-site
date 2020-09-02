require "rubygems"
require "bundler/setup"

require "openactive/dataset_site"

OpenActive::DatasetSite::FeedType::EVENT
  .instance_variable_set(:@default_feed_path, "events")

settings = OpenActive::DatasetSite::Settings.new(
  dataset_site_url: "https://openactive.goodgym.org/",
  dataset_discussion_url: "https://github.com/good-gym/openactive-dataset-site",
  dataset_documentation_url: "https://developer.openactive.io/",
  dataset_languages: ["en-GB"],
  open_data_feed_base_url: "https://www.goodgym.org/api/openactive/",
  organisation_name: "GoodGym",
  organisation_url: "https://www.goodgym.org",
  organisation_legal_entity: "The Good Gym",
  organisation_plain_text_description: "A community of runners who get fit by doing good",
  organisation_logo_url: "https://openactive.goodgym.org/images/logo.png",
  organisation_email: "getinvolved@goodym.org",
  background_image_url: "https://openactive.goodgym.org/images/bg.jpg",
  date_first_published: "2010-08-16",
  data_feed_types: [
    OpenActive::DatasetSite::FeedType::EVENT
  ]
)

renderer = OpenActive::DatasetSite::TemplateRenderer.new(settings)

File.open("index.html", "w") do |file|
  file.puts renderer.render
end
