%%writefile test.cpp

// C++ program to convert Hexadecimal number to Binary
 
#include <bits/stdc++.h>

using namespace std;
 
int main()
{
    char hexdec[100] = "fb";      // Hexadecimal number
    string king;
    long int i = 0;
    // Run while for every text in Hex input
    while (hexdec[i])
     {
        
        switch (hexdec[i]) 
        {
        case '0':
            king = king + "0000";
            break;
        case '1':
            king = king + "0001";
            break;
        case '2':
            king = king + "0010";
            break;
        case '3':
            king = king + "0011";
            break;
        case '4':
            king = king + "0100";
            break;
        case '5':
            king = king + "0101";
            break;
        case '6':
            king = king + "0110";
            break;
        case '7':
            king = king + "0111";
            break;
        case '8':
            king = king + "1000";
            break;
        case '9':
            king = king + "1001";
            break;
        case 'A':
        case 'a':
            king = king + "1010";
            break;
        case 'B':
        case 'b':
            king = king + "1011";
            break;
        case 'C':
        case 'c':
            king = king + "1100";
            break;
        case 'D':
        case 'd':
            king = king + "1101";
            break;
        case 'E':
        case 'e':
            king = king + "1110";
            break;
        case 'F':
        case 'f':
            king = king + "1111";
            break;
        default:
            king = king + "0000";
        }
        i++;
    
    }
    long double val = stoi(king);             // Convert String result into int
    cout << "\nEquivalent Binary value is : ";
    cout<< val;
}
