class Launchbox < Formula
  desc "Launchbox CLI client"
  homepage "https://launchbox.io/"
  url "https://github.com/robwittman/launchbox/archive/refs/tags/0.0.1-rc2.tar.gz"
  sha256 "e65a3102ef7e0968fbccbe98f852a749634dbf4d6117c54f8e850e080395bdce"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GOPATH"] = buildpath
    ENV["GO111MODULE"] = "on"
    ENV["GOFLAGS"] = "-mod=vendor"
    ENV["PATH"] = "#{ENV["PATH"]}:#{buildpath}/bin"
    (buildpath/"src/github.com/robwittman/launchbox").install buildpath.children
    cd "src/github.com/robwittman/launchbox" do
      system "go", "build", "-o", bin/"launchbox", "."
    end
  end

  test do
    assert_match /Launchbox: Democratizing Kubernetes/, shell_output("#{bin}/launchbox -h", 0)
  end
end