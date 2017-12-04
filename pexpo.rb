require "formula"

class Pexpo < Formula
  desc "Terminal sending ping tool written in Go."
  homepage "https://github.com/nnao45/pexpo"
  url "https://github.com/nnao45/pexpo/archive/1.37.tar.gz"
  sha256 "125506e94f43a995cf399cce421cde7784cbc013f7415e448714805a7577695e"
  head "https://github.com/nnao45/pexpo.git"
  version "1.37"

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
