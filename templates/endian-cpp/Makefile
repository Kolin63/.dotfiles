# ------------------------------------------------------------
# WASI SDK bootstrap
# ------------------------------------------------------------
ifeq ($(origin WASI_SDK_PATH),undefined)
    WASI_SDK_PATH := ./wasi-sdk
    ifeq ("$(wildcard $(WASI_SDK_PATH))","")
        $(shell chmod +x ./install-wasi-sdk.sh)
        $(shell ./install-wasi-sdk.sh)
    endif
endif

WASI_CXX := $(WASI_SDK_PATH)/bin/clang++
FORMAT   := $(WASI_SDK_PATH)/bin/clang-format

# ------------------------------------------------------------
# Project layout
# ------------------------------------------------------------
SRC_DIR   := src
BUILD_DIR := build
DIST_DIR  := dist
INCLUDE   := include

TARGET := $(DIST_DIR)/plugin.wasm

# ------------------------------------------------------------
# Sources / objects / deps
# ------------------------------------------------------------
SRCS := $(wildcard $(SRC_DIR)/*.cpp)
OBJS := $(patsubst $(SRC_DIR)/%.cpp,$(BUILD_DIR)/%.o,$(SRCS))
DEPS := $(OBJS:.o=.d)

# ------------------------------------------------------------
# Compiler / linker flags
# ------------------------------------------------------------
CXXFLAGS := \
	-std=c++23 \
	-fno-exceptions \
	-O2 -g \
	-Wall -Wextra -Wpedantic \
	-MMD -MP \
	-I$(INCLUDE) \
	-I$(INCLUDE)/jsoncons/include \
	-I$(INCLUDE)/magic_enum/include/magic_enum

LDFLAGS := -mexec-model=reactor

# ------------------------------------------------------------
# Default target
# ------------------------------------------------------------
.PHONY: all
all: $(TARGET)

# ------------------------------------------------------------
# Build rules
# ------------------------------------------------------------
$(TARGET): $(OBJS)
	@mkdir -p $(DIST_DIR)
	$(WASI_CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(BUILD_DIR)
	$(WASI_CXX) $(CXXFLAGS) -c $< -o $@

-include $(DEPS)

# ------------------------------------------------------------
# Dependencies (Extism PDK + headers)
# ------------------------------------------------------------
$(INCLUDE)/extism-pdk.hpp:
	mkdir -p $(INCLUDE)
	cd $(INCLUDE) && \
		curl -OsL https://raw.githubusercontent.com/extism/cpp-pdk/refs/tags/v0.1.0/extism-pdk.hpp

$(INCLUDE)/magic_enum/include/magic_enum:
	mkdir -p $(INCLUDE)/magic_enum
	cd $(INCLUDE)/magic_enum && \
		curl -OsL https://github.com/Neargye/magic_enum/releases/download/v0.9.6/magic_enum-v0.9.6.tar.gz && \
		tar xf magic_enum-v0.9.6.tar.gz

$(INCLUDE)/jsoncons/include:
	mkdir -p $(INCLUDE)
	cd $(INCLUDE) && \
		curl -OsL https://github.com/danielaparker/jsoncons/archive/refs/tags/v0.177.0.zip && \
		unzip -qq v0.177.0.zip && \
		mv jsoncons-0.177.0 jsoncons

# Pull headers automatically when needed
$(OBJS): | $(INCLUDE)/extism-pdk.hpp \
          $(INCLUDE)/magic_enum/include/magic_enum \
          $(INCLUDE)/jsoncons/include

# ------------------------------------------------------------
# Utilities
# ------------------------------------------------------------
.PHONY: format
format:
	$(FORMAT) -i $(SRC_DIR)/*.cpp $(SRC_DIR)/*.hpp

.PHONY: clean
clean:
	rm -rf $(BUILD_DIR) $(DIST_DIR)

.PHONY: veryclean
veryclean: clean
	rm -rf $(INCLUDE) $(WASI_SDK_PATH)
