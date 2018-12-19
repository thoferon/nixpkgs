{ stdenv
, buildPythonPackage
, fetchPypi
, six
, pytest
, hypothesis
}:

buildPythonPackage rec {
  pname = "pyrsistent";
  version = "0.14.7";

  src = fetchPypi {
    inherit pname version;
    sha256 = "05910b7ff43cec0a853c15da0bfaf2867faa95f29b08e71f5846a195f1f38c75";
  };

  propagatedBuildInputs = [ six ];
  buildInputs = [ pytest hypothesis ];

  checkPhase = ''
    py.test
  '';

  meta = with stdenv.lib; {
    homepage = https://github.com/tobgu/pyrsistent/;
    description = "Persistent/Functional/Immutable data structures";
    license = licenses.mit;
    maintainers = with maintainers; [ desiderius ];
  };

}
