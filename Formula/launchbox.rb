class Launchbox < Formula
  desc "Launchbox CLI client"
  homepage "https://launchbox.io/"
  url "https://github.com/launchboxio/launchbox/archive/refs/tags/0.0.1-rc3.tar.gz"
  sha256 "7a5cf70af05352485ccd9170975c9bede0aa2a5a4257dbdbd494e1297d0556cd"

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