while true do
  # Get input command
  $stdout.write("$ ")
  command, *args = gets.chomp.split(" ")

  # Evaluate command
  $stdout.write("#{command}: command not found\n")
end
