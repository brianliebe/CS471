#include <iostream>

using namespace std;

int main() {
	int a = 0;
	int b = (a++ && ++a) > (a++ && a++);
	cout << a << " " << b << endl;
}
