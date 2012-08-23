def interactive_program
  lines_of_code = ""
  line = ""
  while(line != 'q')
    line = gets.chomp
    lines_of_code += line + "\n"
    if(line.size == 0)
      eval(lines_of_code)
      lines_of_code = "" #flushing everything for the next input and program entry
    end
    $stdout.flush
  end
end

puts interactive_program