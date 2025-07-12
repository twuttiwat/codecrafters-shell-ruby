EXIT_CMD = "exit"
ECHO_CMD = "echo"

def write_prompt
  $stdout.write("$ ")
end

def get_input
  gets.chomp.split(" ")
end

def handle_command(command, *args)
  case command
  when EXIT_CMD
    return true
  when ECHO_CMD
    puts args.join(" ")
  else
    puts "#{command}: command not found"
  end
end

def do_exit(args)
  exit_val = args.first.to_i || 0
  exit exit_val
end

while true
  write_prompt
  command, *args = get_input
  is_exit = handle_command(command, args)
  do_exit(args) if is_exit
end
