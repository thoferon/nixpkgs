{ stdenv
, buildPythonPackage
, fetchPypi
, pytestrunner
, pytest
, psutil
, pkgconfig
, setuptools_scm
}:

buildPythonPackage rec {
  pname = "lz4";
  version = "2.1.5";

  src = fetchPypi {
    inherit pname version;
    sha256 = "d2733ab8d59708acfd2c576b5a8b1a9478a578703c91adb77cabf23ff0ce61b4";
  };

  buildInputs = [ setuptools_scm pytestrunner pkgconfig ];
  checkInputs = [ pytest psutil ];

  meta = with stdenv.lib; {
    description = "Compression library";
    homepage = https://github.com/python-lz4/python-lz4;
    license = licenses.bsd3;
  };

}
