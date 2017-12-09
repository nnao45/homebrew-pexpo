require "formula"

class Pexpo < Formula
  desc "Terminal sending ping tool written in Go."
  homepage "https://github.com/nnao45/pexpo"
  url "https://github.com/nnao45/pexpo/archive/1.39.tar.gz"
  sha256 "eda7affd32211844f1ff5bcef21ff9659d2a14035918925e7e0ab342940b4a41"
  head "https://github.com/nnao45/pexpo.git"
  version "1.39"

  depends_on "go" => :build
  depends_on "glide" => :build
  
  def install
    ENV["GOPATH"] = buildpath
    ENV["GLIDE_HOME"] = HOMEBREW_CACHE/"glide_home/#{name}"
    (buildpath/"src/github.com/nnao45/pexpo").install buildpath.children
    cd "src/github.com/nnao45/pexpo" do
      system "glide", "install"
      system "go", "build", "-o", "pexpo"
      bin.install "pexpo"
    end
  end
end
