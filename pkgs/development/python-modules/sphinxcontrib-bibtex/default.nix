{ stdenv, buildPythonPackage, fetchPypi
, oset, pybtex, pybtex-docutils, sphinx
}:

buildPythonPackage rec {
  version = "0.4.1";
  pname = "sphinxcontrib-bibtex";

  src = fetchPypi {
    inherit pname version;
    sha256 = "595b8d73fcb3c57f5b3cb4f377b9afd33a8b0e485fd4fbf3f3342627f122a04f";
  };

  propagatedBuildInputs = [ oset pybtex pybtex-docutils sphinx ];

  meta = {
    description = "A Sphinx extension for BibTeX style citations";
    homepage = "https://github.com/mcmtroffaes/sphinxcontrib-bibtex";
    license = stdenv.lib.licenses.bsd2;
  };

}
