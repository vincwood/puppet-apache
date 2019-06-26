Facter.add(:nginx_processes) do
  confine :kernel => "Linux"
  setcode do
    osfamily = Facter.value(:osfamily)
    case osfamily
    when 'Debian'
      Facter::Core::Execution.execute('pgrep nginx | wc -l')

    when 'RedHat'
      Facter::Core::Execution.execute('pgrep httpd | wc -l')
    end
  end
end
