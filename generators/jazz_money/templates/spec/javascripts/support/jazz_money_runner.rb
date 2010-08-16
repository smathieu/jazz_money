require 'rubygems'
require 'jazz_money'
require 'yaml'

JAVASCRIPT_SPEC = File.join(File.expand_path(File.dirname(__FILE__)),"..")
RAILS_ROOT = File.expand_path(File.join(JAVASCRIPT_SPEC,"..",".."))

config = YAML::load_file(File.join(JAVASCRIPT_SPEC,"support","jasmine.yml"))

paths =   config["src_files"]
helpers = config["helpers"]
specs =   config["spec_files"]

pre_script = config["pre_script"]

javascript_files = []
jasmine_spec_files = []

# load js files relative to rails root
paths.each { |path| javascript_files.concat(Dir[File.join(RAILS_ROOT,path)]) } unless paths.nil?

# load all other files relative to spec dir (current dir)
helpers.each { |path| javascript_files.concat(Dir[File.join(JAVASCRIPT_SPEC,path)]) } unless helpers.nil?
specs.each { |path| jasmine_spec_files.concat(Dir[File.join(JAVASCRIPT_SPEC,path)]) } unless specs.nil?

JazzMoney::Runner.new(javascript_files, jasmine_spec_files, pre_script).call