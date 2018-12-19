{ lib, fetchPypi, buildPythonPackage, docutils, six, sphinx, isPy3k }:

buildPythonPackage rec {
  version = "4.11.1";
  pname = "breathe";

  src = fetchPypi {
    inherit pname version;
    sha256 = "9b7a94122039ad61383551a696d9c1fa5c16b423a28dadf113389a481d03fad6";
  };

  propagatedBuildInputs = [ docutils six sphinx ];

  doCheck = !isPy3k;

  meta = {
    homepage = https://github.com/michaeljones/breathe;
    license = lib.licenses.bsd3;
    description = "Sphinx Doxygen renderer";
    inherit (sphinx.meta) platforms;
  };
}

