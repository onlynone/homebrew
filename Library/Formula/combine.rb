class Combine < Formula
  desc "A tool for working with record-oriented data files"
  homepage "https://www.gnu.org/software/combine/"
  url "http://ftp.gnu.org/gnu/combine/combine-0.4.0.tar.gz"
  version "0.4.0"
  sha256 "56e71cd9cc38404fc4e6dac02d5fb76e894d481f9be8719072b1f8b1d8afbe14"

  depends_on "gettext"
  depends_on "guile"

  def install
    guile = HOMEBREW_PREFIX/"bin/guile"
    guile_config = HOMEBREW_PREFIX/"bin/guile-config"
    guile_tools = HOMEBREW_PREFIX/"bin/guile-tools"
    guile_site = `#{guile_config} info pkgdatadir`.strip + "/site"

    system "./configure",
           "--prefix=#{prefix}",
           "GUILE=#{guile}",
           "GUILE_CONFIG=#{guile_config}",
           "GUILE_TOOLS=#{guile_tools}",
           "GUILE_SITE=#{guile_site}"
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test combine`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
