{ stdenv, fetchPypi, buildPythonPackage, isPy3k }:

buildPythonPackage rec {
  pname = "antlr4-python3-runtime";
  version = "4.7.2";
  disabled = !isPy3k;

  src = fetchPypi {
    inherit pname version;
    sha256 = "168cdcec8fb9152e84a87ca6fd261b3d54c8f6358f42ab3b813b14a7193bb50b";
  };

  meta = {
    description = "Runtime for ANTLR";
    homepage = "http://www.antlr.org/";
    license = stdenv.lib.licenses.bsd3;
  };
}
