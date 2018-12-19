{ stdenv, buildPythonPackage, isPy3k, fetchPypi }:

buildPythonPackage rec {
  pname = "pyhomematic";
  version = "0.1.53";

  disabled = !isPy3k;

  src = fetchPypi {
    inherit pname version;
    sha256 = "70cbf350eda15d9bd452fd0c7d6c5bf02202f40dc537afd5151cfbb3176e38b3";
  };

  # PyPI tarball does not include tests/ directory
  # Unreliable timing: https://github.com/danielperna84/pyhomematic/issues/126
  doCheck = false;

  meta = with stdenv.lib; {
    description = "Python 3 Interface to interact with Homematic devices";
    homepage = https://github.com/danielperna84/pyhomematic;
    license = licenses.mit;
    maintainers = with maintainers; [ dotlambda ];
  };
}
