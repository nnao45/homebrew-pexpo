require "formula"

class Pexpo < Formula
  desc "Terminal sending ping tool written in Go."
  homepage "https://github.com/nnao45/pexpo"
  url "https://github.com/nnao45/pexpo/archive/1.41.tar.gz"
  sha256 "e8443a01c59d517e590f6c795aa3b3f4f93e4b1e215ab9592d075213d053338a"
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
