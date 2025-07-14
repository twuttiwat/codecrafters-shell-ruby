EXIT_CMD = "exit"
ECHO_CMD = "echo"
TYPE_CMD = "type"

def write_prompt
  $stdout.write("$ ")
end

def get_input
  gets.chomp.split(" ")
end

def is_builtin(command)
  builtin_cmds = [EXIT_CMD, ECHO_CMD, TYPE_CMD]
  builtin_cmds.include? command
end

def handle_command(command, args)
  case command
  when EXIT_CMD
    return true
  when ECHO_CMD
    puts args.join(" ")
  when TYPE_CMD
    cmd_to_check = args.first
    if is_builtin(cmd_to_check)
      puts "#{cmd_to_check} is a shell builtin" if is_builtin(cmd_to_check)
    else 
      puts "#{cmd_to_check}: not found"
    end
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
