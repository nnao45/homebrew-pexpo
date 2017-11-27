require "formula"

class Pexpo < Formula
  homepage "https://github.com/nnao45/pexpo"
  url "https://github.com/nnao45/pexpo/releases/download/1.30/pexpo-1.30-darwin-amd64.zip"
  sha256 "808a2308d7075b2131c11b9b24e8d2f3e9daf2e99fba043551036ec3d4c10226"
  head "https://github.com/nnao45/pexpo.git"
  version "1.30"

  def install
    system "go", "build"
    bin.install "pexpo"
  end
end
