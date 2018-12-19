{ stdenv, buildPythonPackage, fetchPypi, pytest, psycopg2, click, sqlparse }:

buildPythonPackage rec {
  pname = "pgspecial";
  version = "1.11.5";

  src = fetchPypi {
    inherit pname version;
    sha256 = "f44dd48db53fd93dc78d61ebac0ca2cc3c58203f94b30edc730b02bfd3ee747b";
  };

  buildInputs = [ pytest psycopg2 ];
  propagatedBuildInputs = [ click sqlparse ];

  checkPhase = ''
    find tests -name \*.pyc -delete
    py.test tests
  '';

  meta = with stdenv.lib; {
    description = "Meta-commands handler for Postgres Database";
    homepage = https://pypi.python.org/pypi/pgspecial;
    license = licenses.bsd3;
  };
}
