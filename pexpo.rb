require "formula"

class Pexpo < Formula
  desx "Terminal Sending Ping Tool in Go."
  homepage "https://github.com/nnao45/pexpo"
  url "https://github.com/nnao45/pexpo/archive/1.34.tar.gz"
  sha256 "88cacfd9db8d29a731cff370ab7fe6e7a58ab4c68e8be15fa9a876c0da55c82b"
  head "https://github.com/nnao45/pexpo.git"
  version "1.34"

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
