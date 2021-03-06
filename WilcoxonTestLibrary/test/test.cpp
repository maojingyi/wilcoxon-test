#include <fstream>
#include <cmath>
#include <iostream>
#include <sstream>
#include <cstdlib>
#include <vector>
#include <string.h>
#include <WilcoxonTest.h>
using namespace std;

std::vector<string> * errorMessages = new std::vector<string>();
bool verbose;

std::vector<string> * splitLine(string inputString, char delimitter)
{
    std::istringstream stringStream ( inputString );
    std::vector<string> * splittedLine = new std::vector<string>;
    while (!stringStream.eof())
    {
        string newString;
        getline( stringStream, newString, delimitter);
        splittedLine->push_back(newString);
    }
    return splittedLine;
}

float readTestFile(string fileLocation, std::vector<std::vector<string> * > * testData)
{
  ifstream listFile(fileLocation.c_str());
  if (!listFile.is_open())
  {
      cerr << "P values table file does not exist at " << fileLocation << endl;
      throw;
  }

  string testResult = "";

  string sLine = "";
  bool endOfDataReached = false;
  while (!listFile.eof())
  {
    getline(listFile, sLine);
    if(sLine.compare("") != 0)
    {
      if(sLine.compare("==") == 0){
        endOfDataReached = true;
      }
      else if(endOfDataReached){
        testResult = sLine;
      }else{
        testData->push_back(splitLine(sLine, ','));
      }
    }
  }
  listFile.close();
  return atof(testResult.c_str());
}

void fillDataMatrix(float * data, std::vector<std::vector<string> *> * testData)
{
  unsigned int dataXsize = testData->at(0)->size();
  for(unsigned int i = 0; i < testData->size(); i++)
  {
    for(unsigned int j = 0; j < dataXsize; j++)
    {
      data[j + (dataXsize * i)] = atof(testData->at(i)->at(j).c_str());
    }
  }
}

void runTest(string testFilePath)
{ 
  std::vector<int> * testIndexes = new std::vector<int>();
  std::vector<int> * controlIndexes = new std::vector<int>();
  testIndexes->push_back(0);
  controlIndexes->push_back(1);
  std::vector<std::vector<string> *> * testData = new std::vector<std::vector<string> *>();
  float testResult = readTestFile(testFilePath.c_str(), testData);

  int dataYsize = testData->size();
  int dataXsize = testData->at(0)->size();

  float * data = new float[dataXsize * dataYsize];
  fillDataMatrix(data, testData);

  WilcoxonTest wilx(data, dataXsize, dataYsize, testIndexes, controlIndexes);
  double result = wilx.test()->at(0);
  if (result <= testResult * 1.1 && result >= testResult * 0.9){
    if(verbose == true){
      ostringstream os;
      os << testFilePath << ": expected: " << testResult << ", got: " << result;
      cout << os.str() << endl; 
    }else{
      cout << ".";
    }
  }else{
    cout << "F";
    ostringstream os;
    os << testFilePath << ": expected: " << testResult << ", got: " << result;
    errorMessages->push_back(os.str()); 
  }
}

void printFailures()
{ 
  cout << endl << endl;
  for(unsigned int i = 0; i < errorMessages->size(); i++){
    cout << "Failure at: " << endl << errorMessages->at(i) << endl << endl;; 
  }
}

int main(int argc, char* argv[])
{
  if(argc > 1 && strcmp(argv[1], "-v") == 0){
    verbose = true;
  }
  else{
    verbose = false;
  }
  runTest("test/test1.data");
  runTest("test/test2.data");
  runTest("test/test3.data");
  printFailures();
}

