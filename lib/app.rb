require 'pry'
require 'tty-prompt'

def ruby_file_creator
    if ARGV.empty?
        puts "You should name your directory directly after calling the method !"
        exit
    else
        path_result = Dir.pwd
        mkdir_name = ARGV.join('_').delete('"')
        mkdir_named_path = path_result + "/" + mkdir_name
        mkdir_named_path_lib = mkdir_named_path + "/lib"
        mkdir_named_path_spec = mkdir_named_path + "/spec"

        Dir.mkdir("#{mkdir_named_path}")

        Dir.mkdir("#{mkdir_named_path_lib}")

        Dir.mkdir("#{mkdir_named_path_spec}")

        spec = File.open("#{mkdir_named_path_spec}/app_spec.rb", "a")
        spec.puts("require_relative '../lib/app.rb'")
        spec.puts("# Free Synthaxe for ya")
        spec.puts("describe 'scrap coin market should return someting' do ")
        spec.puts("    it 'should return a hash' do ")
        spec.puts("        expect(your_method).to be_truthy")
        spec.puts("    end")
        spec.puts("end")
        spec.close

        app = File.open("#{mkdir_named_path_lib}/app.rb", "a")
        app.puts("#Powered by Segrelove !")
        app.close

        readme = File.open("#{mkdir_named_path}/README.md", "a")
        readme.puts("# Here is a new Project !")
        readme.close

        gemfile = File.open("#{mkdir_named_path}/Gemfile", "a")
        gemfile.puts("source 'https://rubygems.org'")
        gemfile.puts("ruby '2.5.1'")
        gemfile.puts("gem 'rspec'")
        gemfile.puts("gem 'pry'")
        gemfile.close

        Dir.chdir "#{mkdir_name}"
        system("bundle install")
        sleep(0.2)

        sleep(0.75)
        system("rspec --init")
        sleep(0.75)
        prompt = TTY::Prompt.new
        result = prompt.yes?('Do you want to git init?(Y/n)')
        if result == true
            system("git init")
            sleep(0.2)
            system("git add .")
            sleep(0.2)
            system('git commit -m "Structure"')
            puts " "
            puts "Now put your git@github.com:yourusername/yourrepository.git and push yourself"
            puts " "
        else
        end
        puts " "
        puts "Your new template is created, and located on "
        puts " "
        puts "> #{mkdir_named_path}"
        exit
    end
end

ruby_file_creator