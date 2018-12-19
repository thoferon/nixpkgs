{ stdenv, buildPythonPackage, fetchPypi, isPy3k
, pkgconfig
, systemd, libyaml, openzwave, cython
, six, pydispatcher, urwid }:

buildPythonPackage rec {
  pname = "python_openzwave";
  version = "0.4.16";

  disabled = !isPy3k;

  src = fetchPypi {
    inherit pname version;
    sha256 = "7f699da1a387a713d5bebbba1d03bac437a633a7a85138f61e806c000782bad5";
    extension = "zip";
  };

  nativeBuildInputs = [ pkgconfig ];
  buildInputs = [ systemd libyaml openzwave cython ];
  propagatedBuildInputs = [ six urwid pydispatcher ];

  # primary location for the .xml files is in /etc/openzwave so we override the
  # /usr/local/etc lookup instead as that allows us to dump new .xml files into
  # /etc/openzwave if needed
  postPatch = ''
    substituteInPlace src-lib/libopenzwave/libopenzwave.pyx \
      --replace /usr/local/etc/openzwave ${openzwave}/etc/openzwave
  '';

  # no tests available
  doCheck = false;

  meta = with stdenv.lib; {
    description = "Python wrapper for the OpenZWave C++ library";
    homepage = https://github.com/OpenZWave/python-openzwave;
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ etu ];
    inherit (openzwave.meta) platforms;
  };
}
