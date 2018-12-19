{ lib
, buildPythonPackage
, fetchPypi
, chardet
, pyparsing
, graphviz
}:

buildPythonPackage rec {
  pname = "pydot";
  version = "1.4.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "d49c9d4dd1913beec2a997f831543c8cbd53e535b1a739e921642fe416235f01";
  };
  checkInputs = [ chardet ];
  # No tests in archive
  doCheck = false;
  propagatedBuildInputs = [pyparsing graphviz];
  meta = {
    homepage = https://github.com/erocarrera/pydot;
    description = "Allows to easily create both directed and non directed graphs from Python";
    license = lib.licenses.mit;
  };
}
