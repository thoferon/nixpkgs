{ stdenv, buildPythonPackage, isPyPy, fetchPypi
, cffi, pycparser, mock, pytest, py, six }:

with stdenv.lib;

buildPythonPackage rec {
  version = "3.1.5";
  pname = "bcrypt";

  src = fetchPypi {
    inherit pname version;
    sha256 = "136243dc44e5bab9b61206bd46fff3018bd80980b1a1dfbab64a22ff5745957f";
  };
  buildInputs = [ pycparser mock pytest py ];
  propagatedBuildInputs = [ six ] ++ optional (!isPyPy) cffi;

  meta = {
    maintainers = with maintainers; [ domenkozar ];
    description = "Modern password hashing for your software and your servers";
    license = licenses.asl20;
    homepage = https://github.com/pyca/bcrypt/;
  };
}
