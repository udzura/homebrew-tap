class Wardite < Formula
  desc "WebAssembly runtime written in Ruby"
  homepage "https://github.com/udzura/wardite"
  version "1.2.1"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :ventura

    url "https://github.com/udzura/wardite/releases/download/v#{version}/wardite-v#{version}-aarch64-macos.13.0.gz"
    sha256 "1b4509f8fe7a7501cf6e822001a75d6d16773d7ec45d3540653b45e23dc0cea0"
  end

  on_linux do
    on_arm do
      url "https://github.com/udzura/wardite/releases/download/v#{version}/wardite-v#{version}-aarch64-linux-gnu.2.28.gz"
      sha256 "1400400eb467ae94bd1c3bb2f3599da391a9a42884b3284e165cbdeafee2eac7"
    end

    on_intel do
      url "https://github.com/udzura/wardite/releases/download/v#{version}/wardite-v#{version}-x86_64-linux-gnu.2.28.gz"
      sha256 "71d82a2db76bffa217a72a9e343ec1a340cb98da2812c9454062da580c63a709"
    end
  end

  release_version = version
  resource "licenses" do
    url "https://github.com/udzura/wardite/releases/download/v#{release_version}/wardite-v#{release_version}-licenses.txt"
    sha256 "e25c44d8581152f300d77136968ae4a1503b783f92c36112a96ae6caa27a893a"
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
