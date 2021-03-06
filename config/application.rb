require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Default field_with_errors wrapper broke materialize input styles
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| 
  	  #"<div class=\"input-field field_with_errors\">#{html_tag}</div>".html_safe
  	  html_tag
  	}

    I18n.available_locales = [:pt]
    I18n.default_locale = :pt

    hash = {
      "<br />" => "", 
      '<pre style="background: #66b7ff;">' => "",
      "ldquo;" => "\"" ,
      "rdquo;" => "\"",
      "<blockquote>" => "\\begin{quotation}",
      "</blockquote>" => "\\end{quotation}"
    }
    Html2latex.add hash
  end
end
