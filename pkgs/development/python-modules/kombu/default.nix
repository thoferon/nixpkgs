{ lib, buildPythonPackage, fetchPypi, pytest, case, pytz, amqp }:

buildPythonPackage rec {
    pname = "kombu";
    version = "4.2.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "52763f41077e25fe7e2f17b8319d8a7b7ab953a888c49d9e4e0464fceb716896";
  };

  postPatch = ''
    substituteInPlace requirements/test.txt --replace "pytest-sugar" ""
  '';

  checkInputs = [ pytest case pytz ];

  propagatedBuildInputs = [ amqp ];

  meta = with lib; {
    description = "Messaging library for Python";
    homepage    = https://github.com/celery/kombu;
    license     = licenses.bsd3;
  };
}
