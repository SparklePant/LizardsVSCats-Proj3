CXX = g++
CXXFLAGS = -g -Wall -std=c++11
LDFLAGS = -pthread
TARGET = lizard
SRC = lizard.cpp

all: $(TARGET)

$(TARGET): $(SRC)
	$(CXX) $(CXXFLAGS) $(SRC) -o $(TARGET) $(LDFLAGS)

clean:
	rm -f $(TARGET)

.PHONY: all clean