{ stdenv, buildPythonPackage, fetchPypi, mysql }:

buildPythonPackage rec {
  pname = "mysqlclient";
  version = "1.3.14";

  buildInputs = [
    mysql.connector-c
  ];

  # Tests need a MySQL database
  doCheck = false;

  src = fetchPypi {
    inherit pname version;
    sha256 = "3981ae9ce545901a36a8b7aed76ed02960a429f75dc53b7ad77fb2f9ab7cd56b";
  };

  meta = with stdenv.lib; {
    description = "Python interface to MySQL";
    homepage = "https://github.com/PyMySQL/mysqlclient-python";
    license = licenses.gpl1;
    maintainers = with maintainers; [ y0no ];
  };
}
