
#include <iostream>
using namespace std;


struct car {
  string brand;
  string model;
  int year;
  char c;
}tomobile={"Dacia","AMG",2001,'@'},MyCAAR;
int main() {
    MyCAAR.brand="RS";
    cout<< tomobile.brand <<endl;
  car myCar1;
  myCar1={"BMW","X6",1999,'B'};
  //myCaar.model="x5";
  //myCaaar1.brand="Dacia";
 // cout << myCaar.model << "KANDIROUUUUHA " << endl;
  // Create another car structure and store it in myCar2;
  car myCar2;
  myCar2.brand = "Ford";
  myCar2.model = "Mustang";
  myCar2.year = 1969;
  cout << " adding 2 cars year model" << myCar1.year + myCar2.year << endl;
  myCar2.c='D';
  cout << myCar1.brand << " " << myCar1.model << " " << myCar1.year << " " << myCar1.c << "\n";
  cout << myCar2.brand << " " << myCar2.model << " " << myCar2.year << " " << myCar2.c  << "\n";
  return 0;
}

/*
class point { // d�claration "classique" des donn�es
    public :
    int x;
    int y;
public :
	void initialise (int, int);
    void deplace(int, int);
    void affiche();
 };
	void point::initialise (int abs, int ord) { x = abs ; y = ord ; }
	void point::deplace (int dx, int dy) { x += dx ; y += dy ; }
	void point::affiche () { cout << "Je suis en " << x << " " << y << "\n" ; }

int main() {
	point a, b ;
	a.x=5,a.y=7;
	a.initialise(40,80);
	b.initialise (5, 2) ;
	a.affiche() ;
	a.deplace (-2, 4) ; a.affiche() ;
	b.initialise (1,-1) ; b.affiche() ;
	return 0;
}
*/

/*
class point { // d�claration des membres priv�s
    int x ;
	int y ;
		public :
		//void initialise (int, int) ;
    point (); // Constructeur Vide
	point (int, int) ; // Constructeur avec des param�tres
    void deplace (int, int) ;
	void affiche () ;
};
	point::point() {
            x= 20; y=30;
 			cout << "x= " << x <<" y= " << y << endl;   }
	point::point (int abs, int ord): x(abs),y(ord){
        cout <<  x << " & " << y << endl;
	}

	void point::deplace (int dx=10, int dy=10) {
			x = x + dx ;
			y = y + dy ;            }
	void point::affiche () {
 			cout << "Je suis en " << x << " " << y << "\n" ;        }
main(){
	point p1;   point p2(3,6);      //p1.affiche();
	p2.deplace(5,5);
	//point p2(150,150);
	p2.affiche();
	//p2.affiche();
}
*/

/*
class Demo{
   int a, b;
    public:
    Demo()   // default constructor
    {
        cout << "Default Constructor" << endl;
    }
    Demo(int a, int b):a(a),b(b)  //parameterised constructor
    {
        cout << "parameterized constructor -values " << a  << " "<< b << endl;
    }

} inst;
//instance(4,5);
int main() {
	//Demo inst;
	//Demo instance(1,2);
	inst.x;

    return 0;
}
*/
/*
#include <iostream>
using namespace std;

class Demo {
    int a, b;

public:
    Demo() {  // Default constructor
        cout << "Default Constructor" << endl;
    }

    Demo(int a, int b) : a(a), b(b) {  // Parameterized constructor
        cout << "Parameterized constructor - values: " << a << " " << b << endl;
    }

    void display() const {
        cout << "a: " << a << ", b: " << b << endl;
    }
} inst(4, 5);  // Instantiating an object right after the class definition

int main() {
    // Additional objects can be created in main if needed
    Demo anotherInstance(1, 2);  // Calls parameterized constructor for another instance

    cout << "Displaying inst object values: ";
    inst.display();

    cout << "Displaying anotherInstance object values: ";
    anotherInstance.display();

    return 0;
}
*/


