process_the_loop = [true, false].sample

process_the_loop ? loop { puts "The loop was processed"; break } : puts("The loop wasn't processed!")
