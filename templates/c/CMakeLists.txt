cmake_minimum_required(VERSION 4.2)

project(program)

file(GLOB SOURCES "src/*.c")

add_executable(${PROJECT_NAME} ${SOURCES})
