class Diadem < Formula
  desc "Console DLNA media server: share a folder, watch on any screen"
  homepage "https://github.com/pandaCaffeine/diadem"
  url "https://github.com/pandaCaffeine/diadem/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "9d308f3a708283e2bde9fd1caf3655117c0ffe74b6f802aafecb5a667fe9f07f"
  license "MIT"
  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=v#{version}")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/diadem --version")
  end
end