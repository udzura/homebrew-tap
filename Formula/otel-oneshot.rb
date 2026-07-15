class OtelOneshot < Formula
  desc "Render an OTLP/JSON trace as an ASCII span timeline"
  homepage "https://github.com/udzura/otel-oneshot"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/udzura/otel-oneshot/releases/download/v#{version}/otel-oneshot_v#{version}_darwin_arm64.tar.gz"
      sha256 "c9a1a9f0cebadc6c09274d4788fbf0d676a1db19f0ec91295582fb3106bbbfee"
    end
    on_intel do
      url "https://github.com/udzura/otel-oneshot/releases/download/v#{version}/otel-oneshot_v#{version}_darwin_amd64.tar.gz"
      sha256 "cf6684bdeecff4b7c8f361a3d0f9074829ce5a0e7d9c508e97bb9714b6a77979"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/udzura/otel-oneshot/releases/download/v#{version}/otel-oneshot_v#{version}_linux_arm64.tar.gz"
      sha256 "d25d9be9f1c1b8ec80636fcf53b71bc0804f65f271afd0b1118e231b9d2f4830"
    end
    on_intel do
      url "https://github.com/udzura/otel-oneshot/releases/download/v#{version}/otel-oneshot_v#{version}_linux_amd64.tar.gz"
      sha256 "b6817d3fdf605e8384e5cf65755694a1573bc9575b9acf616365f967dfe0de21"
    end
  end

  def install
    bin.install "otel-oneshot"
  end

  test do
    assert_match "otel-oneshot v#{version}", shell_output("#{bin}/otel-oneshot --version")
  end
end
