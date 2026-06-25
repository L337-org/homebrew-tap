# This file is maintained automatically by publish-homebrew.yaml in GavinLucas/docker-mcp.
# Do not edit by hand — changes will be overwritten on the next release.
class DockerMcpServer < Formula
  desc "MCP server for managing Docker via the Docker SDK for Python"
  homepage "https://github.com/GavinLucas/docker-mcp"
  version "1.9.2"
  license "MIT"

  depends_on "python@3.14"
  depends_on "uv" => :build

  # Prevent Homebrew's post-install linkage fixer from rewriting @rpath IDs
  # in Python extension .so files inside the virtualenv. Those binaries don't
  # have headerpad room for longer absolute paths and don't need relinking —
  # Python loads them directly by path, not via the dylib ID.
  skip_clean "libexec"

  on_macos do
    on_arm do
      url "https://github.com/GavinLucas/docker-mcp/releases/download/v1.9.2/docker-mcp-server-1.9.2-wheelhouse-macos-arm64.tar.gz"
      sha256 "de27e70457646bbf52d33f2fcf8a7694847330e97b74becf498f70436526c61b"
    end
    on_intel do
      url "https://github.com/GavinLucas/docker-mcp/releases/download/v1.9.2/docker-mcp-server-1.9.2-wheelhouse-macos-x86_64.tar.gz"
      sha256 "7679ccdae458c68b609d41f4d80977166742bac5c931073a3d5702821eee3345"
    end
  end

  def install
    python3 = Formula["python@3.14"].opt_bin/"python3.14"
    system "uv", "venv", libexec.to_s, "--python", python3.to_s
    system "uv", "pip", "install",
      "--python", (libexec/"bin/python3").to_s,
      "--no-index",
      "--find-links=#{buildpath}",
      "docker-mcp-server==#{version}"
    bin.install_symlink libexec/"bin/docker-mcp-server"
    bin.install_symlink libexec/"bin/docker-mcp"
  end

  test do
    system libexec/"bin/python3", "-c", "import docker_mcp"
  end
end
