Puppet::Parser::Functions.newfunction(:homedir, :type => :rvalue, :arity => 1) do |args|
  username = args[0]
  case username
  when 'root'
    return '/root'
  else
    return "/home/#{username}"
  end
end
