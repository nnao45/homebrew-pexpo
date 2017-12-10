require "formula"

class Pexpo < Formula
  desc "Terminal sending ping tool written in Go."
  homepage "https://github.com/nnao45/pexpo"
  url "https://github.com/nnao45/pexpo/archive/1.40.tar.gz"
  sha256 "bb109afd043da63b94092e1fdb1054374d92535980d866c72443aa1e6ece9898"
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
      system "make"
      bin.install "pexpo"
    end
  end
end
