# file: package.nix

# The items in the curly brackets are function parameters as this is a Nix
# function that accepts dependency inputs and returns a new package
# description
{ lib
#, stdenv
, gcc11Stdenv
, cmake
, cudaPackages
}:

# stdenv.mkDerivation now accepts a list of named parameters that describe
# the package itself.

gcc11Stdenv.mkDerivation {
  name = "cuda-first";

  # good source filtering is important for caching of builds.
  # It's easier when subprojects have their own distinct subfolders.
  src = lib.sourceByRegex ./. [
    "main.cc"
    "first-gpu.cu"
    "first-gpu.hpp"
    "CMakeLists.txt"
  ];

  # We now list the dependencies similar to the devShell before.
  # Distinguishing between `nativeBuildInputs` (runnable on the host
  # at compile time) and normal `buildInputs` (runnable on target
  # platform at run time) is an important preparation for cross-compilation.
  nativeBuildInputs = [ 
    cmake 
    cudaPackages.cuda_nvcc
  ];
  buildInputs = [ cudaPackages.cuda_cudart ];

  # Instruct the build process to run tests.
  # The generic builder script of `mkDerivation` handles all the default
  # command lines of several build systems, so it knows how to run our tests.
  doCheck = false;

}