module JazzMoney
  class CommandLineTool
    def cwd
      File.expand_path(File.join(File.dirname(__FILE__), '../..'))
    end

    def expand(*paths)
      File.expand_path(File.join(*paths))
    end

    def template_path(filepath)
      expand(cwd, File.join("generators/jazz_money/templates", filepath))
    end

    def dest_path(filepath)
      expand(Dir.pwd, filepath)
    end

    def copy_unless_exists(relative_path, dest_path = nil)
      unless File.exist?(dest_path(relative_path))
        File.copy(template_path(relative_path), dest_path(dest_path || relative_path))
      end
    end

    def process(argv)
      case argv[0]
      when 'init'
        require 'ftools'
        File.makedirs('spec/javascripts')
        File.makedirs('spec/javascripts/support')
        File.makedirs('spec/javascripts/helpers')
        
        copy_unless_exists('spec/javascripts/support/jazz_money_runner.rb')

        rails_tasks_dir = dest_path('lib/tasks')
        if File.exist?(rails_tasks_dir)
          copy_unless_exists('lib/tasks/jazz_money.rake')
        end
        File.open(template_path('INSTALL'), 'r').each_line do |line|
          puts line
        end
      when 'run'
        exec "ruby spec/javascripts/support/jazz_money_runner.rb -c -f n"
      else
        puts "unknown command #{argv}"
        puts "Usage: jazz_money init"
      end
    end
  end
end
