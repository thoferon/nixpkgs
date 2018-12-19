{ lib, buildPythonPackage, fetchPypi, isPy3k }:

buildPythonPackage rec {
  pname = "dominate";
  version = "2.3.5";

  src = fetchPypi {
    inherit pname version;
    sha256 = "4076735c0745fe771e57b2313dbb4bfeec42731816ee23cee509f66e8912aa51";
  };

  doCheck = !isPy3k;

  meta = with lib; {
    homepage = https://github.com/Knio/dominate/;
    description = "Dominate is a Python library for creating and manipulating HTML documents using an elegant DOM API";
    license = licenses.lgpl3;
    maintainers = with maintainers; [ ];
  };
}
