# Add PPA for PHP 7
apt_repository "php7" do
  uri "ppa:ondrej/php"
end

# Install PHP 7 packages
package [
  "php7.0-bcmath",
  "php7.0-cli",
  "php7.0-curl",
  "php7.0-imap",
  "php7.0-json",
  "php7.0-ldap",
  "php7.0-mbstring",
  "php7.0-mcrypt",
  "php7.0-mysql",
  "php7.0-readline",
  "php7.0-soap",
  "php7.0-xml",
  "php7.0-zip",
]

# Install composer
execute "install_composer" do
  command \
    "wget " \
    "https://raw.githubusercontent.com/composer/getcomposer.org/1b137f8bf6db3e79a38a5bc45324414a6b1f9df2/web/installer -O - -q " \
    "| php -- --install-dir=/usr/bin --filename=composer"
end
