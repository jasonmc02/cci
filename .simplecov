module SimpleCov
  class << self

    private

    def from_command_line_options
      case original_run_command
      when /test\/functional\//, /test\/\{.*functional.*\}\//
        'Functional Tests'
      when /test\/integration\//
        'Integration Tests'
      else
        'Unit Tests'
      end
    end
  end
end

if ENV['CIRCLE_ARTIFACTS']
  dir = File.join('..', '..', '..', ENV['CIRCLE_ARTIFACTS'], 'coverage')

  SimpleCov.coverage_dir(dir)
  SimpleCov.minimum_coverage 50
  SimpleCov.merge_timeout 10800
  SimpleCov.formatter = SimpleCov::Formatter::CoberturaFormatter
  SimpleCov.start do
    add_filter '/test/'

    add_group 'Controllers', 'app/controllers'
    add_group 'Models', 'app/models'
    add_group 'Helpers', 'app/helpers'

    track_files '{app,lib}/**/*.rb'
  end
end

