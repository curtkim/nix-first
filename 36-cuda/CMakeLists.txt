cmake_minimum_required(VERSION 3.16)
project(cuda-first LANGUAGES CUDA C CXX)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_executable(cuda-first main.cc first-gpu.cu)

install(TARGETS cuda-first DESTINATION bin)

