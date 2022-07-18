#include <iostream>
#include <ctime>
#include <cmath>
#include <math.h>
#include <cstring>
#include <string.h>
#include <cstdio>
#include <stdio.h>
#include <stdlib.h>
using namespace std;

extern "C" void PRINT(int n) {
	n--;
	cout << "New string length is " << n << endl;
}