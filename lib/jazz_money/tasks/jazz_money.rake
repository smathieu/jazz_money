namespace :jazz_money do
  task :require do
    require 'jazz_money'
  end

  task :runner => "jazz_money:require" do
    puts "do something"
  end
end

desc "Run specs via server"
task :jazz_money => ['jazz_money:runner']
