{ lib, python3, poetry2nix, fetchPypi, fetchFromGitHub, pkgs }:

poetry2nix.mkPoetryApplication rec {
  pname = "harleguin";
  version = "1.20.0";

#  projectDir = fetchPypi {
#    inherit pname version; 
#    #hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
#    #hash = "1fcpv9528pfgdcjszjsgl5vb1g7ml09ykr0s1f4nkvizj93b63im";
#    sha256 = "sha256-qqjrnivc75hzp64ah21iqd6siksd338j";
#  };
#  projectDir = fetchTarball({
#    url = "https://github.com/tconbeer/harlequin/releases/download/v1.20.0/harlequin-1.20.0.tar.gz";
#    sha256 = "1674h56z27pjxm94lzz0k60wq7v8z38a8mrq5yihdxgr0qjb7j0c";
#  });

  projectDir = fetchFromGitHub {
    owner = "tconbeer";
    repo = pname;
    rev = "e887504a871706a20066021c498479a8c77c5e67";
    sha256="sha256-Ik6LKZQq+7SObV6ovYAPfAkg65ZJqvp6DSVUVBS/qoM=";
  };

  propagatedBuildInputs = with python3.pkgs; [
    setuptools
    wheel
  ];

  meta = with lib; {
    homepage = "https://github.com/tconbeer/harlequin";
    description = "The SQL IDE for Your Terminal.";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}
