class Wardite < Formula
  desc "WebAssembly runtime written in Ruby"
  homepage "https://github.com/udzura/wardite"
  version "1.2.2"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :ventura

    url "https://github.com/udzura/wardite/releases/download/v#{version}/wardite-v#{version}-aarch64-macos.13.0.gz"
    sha256 "e2dbabd1345065b5ac162ae4097b44341b99cb6187360ade793317ef7ac2b64b"
  end

  on_linux do
    on_arm do
      url "https://github.com/udzura/wardite/releases/download/v#{version}/wardite-v#{version}-aarch64-linux-gnu.2.28.gz"
      sha256 "7429c621bacc789515fb1ffd50e73e999e22bcc979ae52f4cb0323b5d1dbd232"
    end

    on_intel do
      url "https://github.com/udzura/wardite/releases/download/v#{version}/wardite-v#{version}-x86_64-linux-gnu.2.28.gz"
      sha256 "c203bff7e35a8f59da6d0995c8117c19fbce9a0915643724c853972636a96aa7"
    end
  end

  release_version = version
  resource "licenses" do
    url "https://github.com/udzura/wardite/releases/download/v#{release_version}/wardite-v#{release_version}-licenses.txt"
    sha256 "c364d359144a48dfc39e767f0d981f298eb24c4fa45cfb9aed52b33a49d2d80a"
  end

  def install
    bin.install File.basename(stable.url, ".gz") => "wardite"
    chmod 0755, bin/"wardite"
    pkgshare.install resource("licenses")
  end

  test do
    assert_equal "wardite #{version}\n", shell_output("#{bin}/wardite --version")
  end
end
