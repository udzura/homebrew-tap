class Wardite < Formula
  desc "WebAssembly runtime written in Ruby"
  homepage "https://github.com/udzura/wardite"
  version "1.3.0"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :ventura

    url "https://github.com/udzura/wardite/releases/download/v#{version}/wardite-v#{version}-aarch64-macos.13.0.gz"
    sha256 "6841866f4c4a4ead69050c03f23ea48af3f60af99deb8a1a13a668af23947543"
  end

  on_linux do
    on_arm do
      url "https://github.com/udzura/wardite/releases/download/v#{version}/wardite-v#{version}-aarch64-linux-gnu.2.28.gz"
      sha256 "5c8b118e04154a35f76d821b7670aae31b07146cb0adeb7e67b00fc86fe3a632"
    end

    on_intel do
      url "https://github.com/udzura/wardite/releases/download/v#{version}/wardite-v#{version}-x86_64-linux-gnu.2.28.gz"
      sha256 "956027b79a69a7527e84b3e2763d4210172c5deb0af59857214874e415af2dc9"
    end
  end

  release_version = version
  resource "licenses" do
    url "https://github.com/udzura/wardite/releases/download/v#{release_version}/wardite-v#{release_version}-licenses.txt"
    sha256 "3cd9c4270d15c072fd1b407385fdceaa24c1c7804b364035e9ceed95e0ba25b4"
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
