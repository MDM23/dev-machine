# Guake terminal
package "guake"

# ZSH
package "zsh"

execute "install_ohmyzsh" do
  command "sh -c \"$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)\""
end

user ENV["SUDO_USER"] do
  shell "/usr/bin/zsh"
end

template ENV["HOME"] + "/.zshrc" do
  source "zshrc.erb"
end

template ENV["HOME"] + "/.profile" do
  source "profile.erb"
end
