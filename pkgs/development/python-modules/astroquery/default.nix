{ pkgs
, buildPythonPackage
, fetchPypi
, astropy
, requests
, keyring
, beautifulsoup4
, html5lib
}:

buildPythonPackage rec {
  pname = "astroquery";
  version = "0.3.9";

  doCheck = false; # Tests require the pytest-astropy package

  src = fetchPypi {
    inherit pname version;
    sha256 = "2b4bcc02c719061d8391599e25dd3af75b07fff61ac764ca16d03097c5ed837f";
  };

  propagatedBuildInputs = [ astropy requests keyring beautifulsoup4 html5lib ];

  meta = with pkgs.lib; {
    description = "Functions and classes to access online data resources";
    homepage = "https://astroquery.readthedocs.io/";
    license = licenses.bsd3;
    maintainers = [ maintainers.smaret ];
  };
}
