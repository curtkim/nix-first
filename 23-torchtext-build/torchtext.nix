{ lib
, buildPythonPackage
, fetchFromGitHub

# Native build inputs
, cmake
, which

# Build inputs
, pybind11

# Propogated build inputs
, pytorch
, requests
, tqdm

# Check inputs
, pytestCheckHook
}:


buildPythonPackage rec {
  version = "0.15.2";
  pname = "torchtext";

  # Pypi only contains platform specific wheels, fetching from github seems simpler
  src = fetchFromGitHub {
    owner = "pytorch";
    repo = "text";
    rev = "v${version}";
    fetchSubmodules = true;
    sha256 = "sha256-ksik1yYqr20D0QcfSLdDa/A2OMisR64Aif6p8BVsSjc=";
  };

  dontUseCmakeConfigure = true;

  nativeBuildInputs = [
    cmake
    which
  ];

  buildInputs =[
    pybind11
  ];

  propagatedBuildInputs = [
    pytorch
    requests
    tqdm
  ];

  checkInputs = [
    pytestCheckHook
  ];

  pythonImportsCheck = [ "torchtext" ];

#  meta = {
#    homepage = https://pytorch.org;
#    description = "Data loaders and abstractions for text and NLP";
#    license = lib.licenses.bsd3;
#    maintainers = with lib.maintainers; [ ];
#    broken = true; # FIXME: tests can't find the torchtext._torchtext module generated via pybind11
#  };
}
