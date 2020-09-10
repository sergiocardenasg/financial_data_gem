require_relative 'lib/financial_data/version'

Gem::Specification.new do |spec|
  spec.name          = "financial_data"
  spec.version       = FinancialData::VERSION
  spec.authors       = ["sergiocardenasg"]
  spec.email         = ["sergiocardenas@utexas.edu"]

  spec.summary       = %q{Financial Data}
  spec.description   = %q{Financial Data}
  spec.homepage      = "https://github.com/sergiocardenasg/financial_data_gem"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/sergiocardenasg/financial_data_gem"
  spec.metadata["changelog_uri"] = "https://github.com/sergiocardenasg/financial_data_gem"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "pry"
  spec.add_dependency "nokogiri"
  spec.add_dependency "httparty"
  spec.add_dependency "uri"
  spec.add_dependency "openssl"
end
