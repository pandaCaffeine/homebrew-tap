class Diadem < Formula
  desc "Console DLNA media server: share a folder, watch on any screen"
  homepage "https://github.com/pandaCaffeine/diadem"
  url "https://github.com/pandaCaffeine/diadem/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "09e888f66ccd4d6adda1ce0cd49245c79b1832bcb1dc4cb06ca982d86f1ae5e6"
  license "MIT"
  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=v#{version}")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/diadem --version")
  end
end