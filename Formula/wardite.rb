class Wardite < Formula
  desc "WebAssembly runtime written in Ruby"
  homepage "https://github.com/udzura/wardite"
  version "1.2.0"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :ventura

    url "https://github.com/udzura/wardite/releases/download/v#{version}/wardite-v#{version}-aarch64-macos.13.0.gz"
    sha256 "1bcc5dbffffc63b8baa91a79c8c15fbc6cd1c7f218e64219618fc7dedf6a8264"
  end

  on_linux do
    on_arm do
      url "https://github.com/udzura/wardite/releases/download/v#{version}/wardite-v#{version}-aarch64-linux-gnu.2.28.gz"
      sha256 "45a960c333bcf931d105b3840f9758931300fc9369aa4c1a3818c9091b28bb81"
    end

    on_intel do
      url "https://github.com/udzura/wardite/releases/download/v#{version}/wardite-v#{version}-x86_64-linux-gnu.2.28.gz"
      sha256 "2e58504ad8636487b5eb96ff65a8e7dbe4e38224d482238166c6671e654e1f74"
    end
  end

  release_version = version
  resource "licenses" do
    url "https://github.com/udzura/wardite/releases/download/v#{release_version}/wardite-v#{release_version}-licenses.txt"
    sha256 "fa21aa1e4a23aa495478ab01950ac6a12e238a14e23aa22818f5c0940e3f3d30"
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
