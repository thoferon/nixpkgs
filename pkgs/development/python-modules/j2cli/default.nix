{ stdenv
, buildPythonPackage
, fetchPypi
, isPy3k
, nose
, jinja2
, pyyaml
}:

buildPythonPackage rec {
  pname = "j2cli";
  version = "0.3.2.post1";
  disabled = isPy3k;

  src = fetchPypi {
    inherit pname version;
    sha256 = "acbf49589ca182d5352bb15821483b95ce35ffaf829578cefbe66e8e6bf5f73c";
  };

  buildInputs = [ nose ];
  propagatedBuildInputs = [ jinja2 pyyaml ];

  meta = with stdenv.lib; {
    homepage = https://github.com/kolypto/j2cli;
    description = "Jinja2 Command-Line Tool";
    license = licenses.bsd3;
    longDescription = ''
      J2Cli is a command-line tool for templating in shell-scripts,
      leveraging the Jinja2 library.
    '';
    maintainers = with maintainers; [ rushmorem ];
  };

}
