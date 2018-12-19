{ lib
, buildPythonPackage
, fetchPypi
, flask
, python-socketio
, coverage
}:

buildPythonPackage rec {
  pname = "Flask-SocketIO";
  version = "3.1.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "972eb14d8269c9a1a619d3b02a5b681fee02ce3a0106e1b0369be42c4f1de999";
  };

  propagatedBuildInputs = [
    flask
    python-socketio
  ];

  checkInputs = [ coverage ];
  # tests only on github, but lates release there is not tagged
  doCheck = false;

  meta = with lib; {
    description = "Socket.IO integration for Flask applications";
    homepage = http://github.com/miguelgrinberg/Flask-SocketIO/;
    license = licenses.mit;
    maintainers = [ maintainers.mic92 ];
  };
}
