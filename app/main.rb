EXIT_CMD = "exit"

while true do
  # Get input command
  $stdout.write("$ ")
  command, *args = gets.chomp.split(" ")

  if command == EXIT_CMD
    break
  end

  # Evaluate command
  $stdout.write("#{command}: command not found\n")
end
