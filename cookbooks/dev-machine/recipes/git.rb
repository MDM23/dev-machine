apt_repository "git-core" do
  uri "ppa:git-core/ppa"
end

package "git"

template `echo -n ~#{ENV["SUDO_USER"]}` + "/.gitconfig" do
  source "gitconfig.erb"
end
