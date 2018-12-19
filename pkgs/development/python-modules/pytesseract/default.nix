{ buildPythonPackage, fetchPypi, lib, pillow, tesseract, substituteAll }:

buildPythonPackage rec {
  pname = "pytesseract";
  version = "0.2.6";

  src = fetchPypi {
    inherit pname version;
    sha256 = "11c20321595b6e2e904b594633edf1a717212b13bac7512986a2d807b8849770";
  };

  patches = [
    (substituteAll {
      src = ./tesseract-binary.patch;
      drv = "${tesseract}";
    })
  ];

  buildInputs = [ tesseract ];
  propagatedBuildInputs = [ pillow ];

  # the package doesn't have any tests.
  doCheck = false;

  meta = with lib; {
    homepage = https://pypi.org/project/pytesseract/;
    license = licenses.gpl3;
    description = "A Python wrapper for Google Tesseract";
    maintainers = with maintainers; [ ma27 ];
  };
}
