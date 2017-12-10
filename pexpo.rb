require "formula"

class Pexpo < Formula
  desc "Terminal sending ping tool written in Go."
  homepage "https://github.com/nnao45/pexpo"
  url "https://github.com/nnao45/pexpo/archive/1.40.tar.gz"
  sha256 "a732c32e558816a00b7c01028648694f490e97cf407a6bbf995261386d7e8c56"
  head "https://github.com/nnao45/pexpo.git"
  version "1.40"

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
