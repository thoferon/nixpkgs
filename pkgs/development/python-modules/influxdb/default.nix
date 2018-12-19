{ stdenv
, buildPythonPackage
, fetchPypi
, requests
, dateutil
, pytz
, six
}:

buildPythonPackage rec {
  pname = "influxdb";
  version = "5.2.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "75d96de25d0d4e9e66e155f64dc9dc2a48de74ac4e77e3a46ad881fba772e3b6";
  };

  # ImportError: No module named tests
  doCheck = false;
  propagatedBuildInputs = [ requests dateutil pytz six ];

  meta = with stdenv.lib; {
    description = "Python client for InfluxDB";
    homepage = https://github.com/influxdb/influxdb-python;
    license = licenses.mit;
  };

}
