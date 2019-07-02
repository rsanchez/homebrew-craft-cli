require 'formula'

class CraftCli < Formula
  homepage 'https://github.com/rsanchez/craft-cli'
  url 'https://github.com/rsanchez/craft-cli/releases/download/0.17.5/craft.phar'
  sha256 'd17590a7b3802a1cbfe4dedd66155044976a8d8b8a10644c4576ed1ee6104680'
  version '0.17.5'

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

  def caveats; <<~EOS
    Verify your installation by running:
      "craft --version".

    You can read more about craft-cli by running:
      "brew home craft-cli".
    EOS
  end

end
