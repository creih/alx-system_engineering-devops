#!/usr/bin/env ruby
# script to print the hbtn string with upto 4 t reps
puts ARGV[0].scan(/hbn|hbt{1,4}n/).join
