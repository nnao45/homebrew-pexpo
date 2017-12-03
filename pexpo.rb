require "formula"

class Pexpo < Formula
  desc "Terminal sending ping tool written in Go."
  homepage "https://github.com/nnao45/pexpo"
  url "https://github.com/nnao45/pexpo/archive/1.35.tar.gz"
  sha256 "4de53773d961b821b65e8acb5523e62c65aa845580223bc9e96d561c7cc2e15a"
  head "https://github.com/nnao45/pexpo.git"
  version "1.35"

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
