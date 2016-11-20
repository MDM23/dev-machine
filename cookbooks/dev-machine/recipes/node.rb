execute "instal_nodev7" do
  command "curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -"
end

package "nodejs"
