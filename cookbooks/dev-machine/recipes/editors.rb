# Install visual studio code
# package []

apt_repository "neovim" do
  uri "ppa:neovim-ppa/unstable"
end

package ["neovim", "python-dev", "python-pip", "python3-dev", "python3-pip"]

execute "nvim_python_integration" do
  command "pip3 install --upgrade neovim"
end

execute "nvim_as_default" do
  command \
    "update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60 && " \
    "update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60 && " \
    "update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60"
end

remote_directory `echo -n ~#{ENV["SUDO_USER"]}` + "/config/nvim" do
  source "nvim"
  owner ENV["SUDO_UID"].to_i
  group ENV["SUDO_GID"].to_i
end
