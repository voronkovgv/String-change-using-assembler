#define _CRT_SECURE_NO_WARNINGS
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

extern "C" void _cdecl CHANGE(int a, char *c, char* str);

/*extern "C" void PRINT(int n) {
	n--;
	cout << "New string length is " << n << endl;
}*/



void main() {
	char space[] = " ";
	char str[256] = "";
	printf("Enter a string\n");
	cin.getline(str, 100);
	strcat(str, space);
	char result[256]=" ";
	CHANGE(strlen(str), result, str);
	cout << result << endl;
}