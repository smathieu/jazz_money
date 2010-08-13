class JazzMoneyGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.directory "spec/javascripts/support"
      m.file "spec/javascripts/support/jazz_money_runner.rb", "spec/javascripts/support/jazz_money_runner.rb"

      m.directory "lib/tasks"
      m.file "lib/tasks/jazz_money.rake", "lib/tasks/jazz_money.rake"

      m.readme "INSTALL"
    end
  end
end