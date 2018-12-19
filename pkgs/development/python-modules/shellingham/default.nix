{ stdenv, buildPythonPackage, fetchPypi
}:

buildPythonPackage rec {
  pname = "shellingham";
  version = "1.2.8";

  src = fetchPypi {
    inherit pname version;
    sha256 = "56e6c7f043661a82b276c241c8e62da62cdf710437164cdef75b3f3ac50fb384";
  };

  meta = with stdenv.lib; {
    description = "Tool to Detect Surrounding Shell";
    homepage = https://github.com/sarugaku/shellingham;
    license = licenses.isc;
    maintainers = with maintainers; [ mbode ];
  };
}
