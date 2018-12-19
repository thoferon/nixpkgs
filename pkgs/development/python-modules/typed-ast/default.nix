{ buildPythonPackage, fetchPypi, lib, pythonOlder }:
buildPythonPackage rec {
  pname = "typed-ast";
  version = "1.1.1";
  src = fetchPypi{
    inherit pname version;
    sha256 = "6cb25dc95078931ecbd6cbcc4178d1b8ae8f2b513ae9c3bd0b7f81c2191db4c6";
  };
  # Only works with Python 3.3 and newer;
  disabled = pythonOlder "3.3";
  # No tests in archive
  doCheck = false;
  meta = {
    homepage = https://pypi.python.org/pypi/typed-ast;
    description = "a fork of Python 2 and 3 ast modules with type comment support";
    license = lib.licenses.asl20;
  };
}
