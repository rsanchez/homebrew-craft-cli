require 'formula'

class CraftCli < Formula
  homepage 'https://github.com/rsanchez/craft-cli'
  url 'https://github.com/rsanchez/craft-cli/releases/download/0.2.1/craft.phar'
  sha1 'd4a9147ca28bfeb28d801911346b3c0f83c1d145'
  version '0.2.1'

  def install
    libexec.install "craft.phar"
    sh = libexec + "craft"
    sh.write("#!/usr/bin/env bash\n\n/usr/bin/env php -d allow_url_fopen=On -d detect_unicode=Off #{libexec}/craft.phar $*")
    chmod 0755, sh
    bin.install_symlink sh
  end

  test do
    system 'craft --version'
  end

  def caveats; <<-EOS.undent
    Verify your installation by running:
      "craft --version".

    You can read more about craft-cli by running:
      "brew home craft-cli".
    EOS
  end

end