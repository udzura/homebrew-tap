class Wardite < Formula
  desc "WebAssembly runtime written in Ruby"
  homepage "https://github.com/udzura/wardite"
  version "1.4.0"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :ventura

    url "https://github.com/udzura/wardite/releases/download/v#{version}/wardite-v#{version}-aarch64-macos.13.0.gz"
    sha256 "4a102701d6cdb15bdc13f9642644a94463d5f41d2e3ae3fdb8ca16bd5bebe311"
  end

  on_linux do
    on_arm do
      url "https://github.com/udzura/wardite/releases/download/v#{version}/wardite-v#{version}-aarch64-linux-gnu.2.28.gz"
      sha256 "55a1b208ff51e9c91680156edb8299d504095c3611b7edb9d99cfd74f7ad4f69"
    end

    on_intel do
      url "https://github.com/udzura/wardite/releases/download/v#{version}/wardite-v#{version}-x86_64-linux-gnu.2.28.gz"
      sha256 "0e47abdf03c9e495a14f77afa75e64affcdb49a62c90f21a359d473b41c94d39"
    end
  end

  release_version = version
  resource "licenses" do
    url "https://github.com/udzura/wardite/releases/download/v#{release_version}/wardite-v#{release_version}-licenses.txt"
    sha256 "a0d2250f7948dc1aca2c67e12b755b6607061641b914a53cb2b4881c63c1fbc6"
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
