CFLAGS=-g
LBPROGRAMS=lb-gps-linux lb-gps-linux-status
PROGRAMS=gpsdo-status
HIDLIB=-lhidapi-hidraw -Wl,-rpath,.

all: gpsdo-status lb-gps-utils

gpsdo-status: gpsdo-status.cpp
	gcc ${CFLAGS} -o gpsdo-status gpsdo-status.cpp -I. -lstdc++ ${HIDLIB}

lb-gps-utils: lb-gps-linux-status.cpp lb-gps-linux.cpp GPSSettings.cpp
	gcc ${CFLAGS} -o lb-gps-linux-status lb-gps-linux-status.cpp -I. -lstdc++
	gcc ${CFLAGS} -o lb-gps-linux lb-gps-linux.cpp GPSSettings.cpp -I. -lstdc++

all-clean:
	rm ${LBPROGRAMS} ${PROGRAMS}

clean:
	rm ${PROGRAMS}


