require 'formula'

class CraftCli < Formula
  homepage 'https://github.com/rsanchez/craft-cli'
  url 'https://github.com/rsanchez/craft-cli/releases/download/0.4.0/craft.phar'
  sha256 '62710591d3b2f111c5a4690d0c1935ff68dab4b0899dfd38d07a22608128f219'
  version '0.4.0'

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