require "formula"

class Pexpo < Formula
  desc "Terminal sending ping tool written in Go."
  homepage "https://github.com/nnao45/pexpo"
  url "https://github.com/nnao45/pexpo/archive/1.41.tar.gz"
  sha256 "3122c9d273644c4733ec723f224b52fab8ccbaa0dc001b84dff7a0cf1454f1ab"
  head "https://github.com/nnao45/pexpo.git"
  version "1.41"

  depends_on "go" => :build
  depends_on "glide" => :build
  
  def install
    ENV["GOPATH"] = buildpath
    ENV["GLIDE_HOME"] = HOMEBREW_CACHE/"glide_home/#{name}"
    (buildpath/"src/github.com/nnao45/pexpo").install buildpath.children
    cd "src/github.com/nnao45/pexpo" do
      system "make", "glide"
      system "make", "deps"
      system "make"
      bin.install "bin/pexpo"
      system "make", "clean"
    end
  end
end
