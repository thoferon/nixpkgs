{ stdenv
, buildPythonPackage
, fetchPypi
, ruamel_base
, typing
, ruamel_ordereddict
, isPy3k
}:

buildPythonPackage rec {
  pname = "ruamel.yaml";
  version = "0.15.81";

  src = fetchPypi {
    inherit pname version;
    sha256 = "6cbe7273a2e7667cd2ca7b12bec1c715a8259ad80f09c6f12c378f664d29fa5e";
  };

  # Tests cannot load the module to test
  doCheck = false;

  propagatedBuildInputs = [ ruamel_base typing ]
    ++ stdenv.lib.optional (!isPy3k) ruamel_ordereddict;

  meta = with stdenv.lib; {
    description = "YAML parser/emitter that supports roundtrip preservation of comments, seq/map flow style, and map key order";
    homepage = https://bitbucket.org/ruamel/yaml;
    license = licenses.mit;
  };

}
