#!/usr/bin/env/ ruby
# Example application to demonstrate some basic ruby features 
# This code loads a given file into an associated application 

class Launcher

    def initialize app_map
      @app_map = app_map
    end
  
    # Execute the given file using the associate app
    def run file_name 
      application = select_app file_name 
      system "#{application} #{file_name}" 
    end  
   
    # Given a file, look up the matching application 
    def select_app file_name 
      ftype = file_type file_name 
      @app_map [ ftype ]
    end 

    # Return the part of the file name string after the last '.'
    def file_type file_name 
      File.extname( file_name ).gsub /^\./,''
    end 

end 


def help
 print "
You must pass in the path to the file to launch.
Usage #{__FILE__} target_file
"
end


if ARGV.empty? 
 help
 exit
end 

app_map = {
 'html' => 'firefox',
 'rb' => 'vim',
 'jpg' => 'gimp'
}


l = Launcher.new app_map
target = ARGV.join' '
l.run target 

 
