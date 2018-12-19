{ stdenv, fetchPypi, buildPythonPackage }:

buildPythonPackage rec {
  pname = "dpkt";
  version = "1.9.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "52a92ecd5ca04d5bd852bb11cb2eac4bbe38b42a7c472e0d950eeb9f82a81e54";
  };

  meta = with stdenv.lib; {
    description = "Fast, simple packet creation / parsing, with definitions for the basic TCP/IP protocols";
    homepage = https://code.google.com/p/dpkt/;
    license = licenses.bsd3;
    maintainers = with maintainers; [ bjornfor ];
    platforms = platforms.all;
  };
}
