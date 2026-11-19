class Diadem < Formula
  desc "Console DLNA media server: share a folder, watch on any screen"
  homepage "https://github.com/pandaCaffeine/diadem"
  url "https://github.com/pandaCaffeine/diadem/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "aff4670715b5cb6dee01f9a072712e5a01b254db235ade4fdedb18f8033b2909"
  license "MIT"
  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=v#{version}")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/diadem --version")
  end
end