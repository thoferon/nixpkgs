{ stdenv, buildPythonPackage, fetchPypi
, setuptools }:

buildPythonPackage rec {
  version = "2.0.1";
  pname = "pyshp";

  src = fetchPypi {
    inherit pname version;
    sha256 = "5a092adcb8c2cd1dbeab76b62695db9b8e6e1408e7c37cf49eb61c0dcc913d11";
  };

  buildInputs = [ setuptools ];

  meta = with stdenv.lib; {
    description = "Pure Python read/write support for ESRI Shapefile format";
    homepage = https://github.com/GeospatialPython/pyshp;
    license = licenses.mit;
  };
}
