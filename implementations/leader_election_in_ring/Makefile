CXX = g++
CXXFLAGS = -g -std=c++11 -pedantic

all: node

node: node.cpp
	$(CXX) $(CXXFLAGS) node.cpp -o node

clean:
	rm -rf node *.dSYM

.PHONY: clean
