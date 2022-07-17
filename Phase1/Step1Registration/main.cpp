#include <iostream>
#include <string>
#include <fstream>

#define NBR_BIG 10000
#define NBR_SMALL 100

using std::cout;
using std::string;
using std::ifstream;
using std::ofstream;

int main(int argc, char **argv) {
    if (argc != 3) {
        cout << "[Script name] [relative input file name (no extension)] [relative output filename]\n";
    }

    string inputFilename(argv[1]);
    string outputFilename(argv[2]);
    string line;
    float registrationMatrix[12];
    float x;
    float y;
    float z;
    float reg_x;
    float reg_y;
    float reg_z;
    unsigned long pointCount;

    ifstream inputStreamDat(inputFilename + ".dat");
    ifstream inputStreamTxt(inputFilename + ".txt");
    ofstream outputStream(outputFilename);

    for (int i = 0; i < 12; ++i) {
        inputStreamDat >> registrationMatrix[i];
        cout << registrationMatrix[i] << "\n";
    }

    inputStreamTxt >> pointCount;
    cout << pointCount << " points to treat.\n";

    for (unsigned long i = 0; i < pointCount; ++i) {
        if (rand() % NBR_BIG < NBR_SMALL) {
            inputStreamTxt >> x >> y >> z;
            std::getline(inputStreamTxt, line);
            reg_x = x * registrationMatrix[0] + y * registrationMatrix[1] + z * registrationMatrix[2] +
                    registrationMatrix[3];
            reg_y = x * registrationMatrix[4] + y * registrationMatrix[5] + z * registrationMatrix[6] +
                    registrationMatrix[7];
            reg_z = x * registrationMatrix[8] + y * registrationMatrix[9] + z * registrationMatrix[10] +
                    registrationMatrix[11];
            outputStream << reg_x << " " << reg_y << " " << reg_z << "\n";
        }
        std::getline(inputStreamTxt, line);
    }

    return 0;
}
