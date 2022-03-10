class Launchbox < Formula
  desc "Launchbox CLI client"
  homepage "https://launchbox.io/"
  url "https://github.com/launchboxio/launchbox/archive/refs/tags/0.0.1-rc4.tar.gz"
  sha256 "35f2df63a32134f432a04ddca5df5004c1a772f0a125457a20f2588ad962b1bd"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GOPATH"] = buildpath
    ENV["GO111MODULE"] = "on"
    ENV["GOFLAGS"] = "-mod=vendor"
    ENV["PATH"] = "#{ENV["PATH"]}:#{buildpath}/bin"
    (buildpath/"src/github.com/launchboxio/launchbox").install buildpath.children
    cd "src/github.com/launchboxio/launchbox" do
      system "go", "build", "-o", bin/"launchbox", "."
    end
  end

  test do
    assert_match /Launchbox: Democratizing Kubernetes/, shell_output("#{bin}/launchbox -h", 0)
  end
end