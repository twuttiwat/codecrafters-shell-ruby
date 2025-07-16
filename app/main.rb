def in_path?(cmd)
  ENV["PATH"].split(':').find do |dir|
    File.exist?("#{dir}/#{cmd}") &&
    File.executable?("#{dir}/#{cmd}")
  end
end

commands = {
  exit: ->(code) { exit(code.to_i) },
  echo: ->(*args) { puts args.join(" ") },
  type: ->(cmd) do
    if commands.key?(cmd.to_sym)
      puts "#{cmd} is a shell builtin"
    elsif path = in_path?(cmd)
      # puts "path is #{path}"
      puts "#{cmd} is #{path}/#{cmd}"
    else
      puts "#{cmd}: not found"
    end
  end
}


loop do
  $stdout.write("$ ")
  command, *args = gets.chomp.split(" ")
  if !commands.key?(command.to_sym)
    puts "#{command}: command not found"
    next
  end
  commands[command.to_sym].call(*args)
end
