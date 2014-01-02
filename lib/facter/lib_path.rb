# lib_path.rb
Facter.add("lib_path") do
	setcode do 
		case Facter.value(:architecture)
			when /64/ then 'lib64'
			else 'lib'
		end
	end
end
