require "formula"

class Pexpo < Formula
  desc "Terminal sending ping tool written in Go."
  homepage "https://github.com/nnao45/pexpo"
  url "https://github.com/nnao45/pexpo/archive/1.36.tar.gz"
  sha256 "3ad1e0e5360d4e96a2121be31106cbc344d2924be7eebe98ffcba11a9e016738"
  head "https://github.com/nnao45/pexpo.git"
  version "1.36"

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
