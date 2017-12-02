require "formula"

class Pexpo < Formula
  homepage "https://github.com/nnao45/pexpo"
  url "https://github.com/nnao45/pexpo/archive/1.33.tar.gz"
  sha256 "9ff55d9173cd98c8e397658b9a314b4d815d5158be112c558bbbaa2a80fdbc3d"
  head "https://github.com/nnao45/pexpo.git"
  version "1.33"

  depends_on "go" => :build
  depends_on :hg => :build
  
  def install
    ENV["GOPATH"] = buildpath
    
    # Install Go dependencies
    system "go", "get", "github.com/dariubs/percent"
    system "go", "get", "github.com/mattn/go-runewidth"
    system "go", "get", "github.com/nsf/termbox-go"
    system "go", "get", "github.com/tatsushid/go-fastping"
	  
    # Build and install termshare
    system "go", "build", "-o", "pexpo"
    bin.install "pexpo"
  end
end
