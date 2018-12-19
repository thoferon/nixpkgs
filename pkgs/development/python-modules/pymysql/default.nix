{ lib
, buildPythonPackage
, fetchPypi
, cryptography
}:

buildPythonPackage rec {
  pname = "PyMySQL";
  version = "0.9.3";

  src = fetchPypi {
    inherit pname version;
    sha256 = "d8c059dcd81dedb85a9f034d5e22dcb4442c0b201908bede99e306d65ea7c8e7";
  };

  propagatedBuildInputs = [ cryptography ];

  # Wants to connect to MySQL
  doCheck = false;

  meta = with lib; {
    description = "Pure Python MySQL Client";
    homepage = https://github.com/PyMySQL/PyMySQL;
    license = licenses.mit;
    maintainers = [ maintainers.kalbasit ];
  };
}
