Gem::Specification.new do |s|
  s.name                = "jazz_money"
  s.summary             = "Jasmine + Harmony"
  s.description         = "Command line running of Jasmine specs via Harmony"
  s.author              = "Mike Grafton"
  s.email               = "mike@pivotallabs.com"
  s.homepage            = "http://github.com/pivotalexperimental/jazz_money"
  s.rubyforge_project   = ""
  s.require_path        = "lib"
  s.version             =  "0.0.5"
  s.executables         = ["jazz_money"]
  s.files               =  s.files = [
     "generators/jazz_money/jazz_money_generator.rb",
     "generators/jazz_money/templates/INSTALL",
     "generators/jazz_money/templates/spec/javascripts/support/jazz_money_runner.rb",
     "generators/jazz_money/templates/lib/tasks/jazz_money.rake",
     "lib/jazz_money.rb",
     "lib/jazz_money/runner.rb",
     "lib/jazz_money/command_line_tool.rb",
     "lib/jazz_money/rspec_thread.rb",
     "lib/jazz_money/jasmine_runner.rb",
     "lib/jazz_money/tasks/jazz_money.rake",
     "jasmine/lib/TrivialReporter.js",
     "jasmine/lib/consolex.js",
     "jasmine/lib/jasmine-0.11.1.js",
     "jasmine/lib/jasmine.css",
     "jasmine/lib/json2.js",
  ]

  s.add_dependency 'harmony', '~>0.5.4'
end
