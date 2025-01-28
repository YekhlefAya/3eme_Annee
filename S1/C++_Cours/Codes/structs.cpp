/*
#include <iostream>
using namespace std;
struct car {
  string brand;
  string model;
  int year;
  char c;
}tomobile={"DACIA","AMG", 2050,'C'},MyC;

int main() {
    cout <<tomobile.brand << endl;
    MyC.brand="LAMBO";
  car myCar1;
  myCar1={"BMW","X6",1999,'B'};
  cout<< MyC.brand << endl;
  //myCaar.model="x5";
  //myCaaar1.brand="Dacia";
 // cout << myCaar.model << "KANDIROUUUUHA " << endl;
  // Create another car structure and store it in myCar2;
  car myCar2;
  myCar2.brand = "Ford";
  myCar2.model = "Mustang";
  myCar2.year = 1969;
  cout << " adding 2 cars year model" << 2024 - myCar1.year << endl;
  myCar2.c='D';
  cout << myCar1.brand << " " << myCar1.model << " " << myCar1.year << " " << myCar1.c << "\n";
  cout << myCar2.brand << " " << myCar2.model << " " << myCar2.year << " " << myCar2.c  << "\n";
  return 0;
}
*/

/*
class point {

    int x;
    int y;
public :
	void initialise (int, int);
    void deplace(int, int);
    void affiche();
 }pp;
	void point::initialise (int x, int ord):x(abs),y(ord)  { x=abs; y=ord; }
	void point::deplace (int dx, int dy) { x += dx ; y += dy ; }
	void point::affiche () { cout << "Je suis en " << x << " " << y << "\n" ; }

int main() {        int x=20;//obj.initialise(10,20):
	point a; point b ;          //  a.x=5,a.y=7;
	a.initialise(70,30);
	a.initialise(40,80);
	b.initialise (5, 2) ;
	a.affiche() ;
	a.deplace (-2, 4) ; a.affiche() ;
	b.initialise (1,-1) ; b.affiche() ;
	return 0;
}
*/
/*
#include <iostream>
using namespace std;
class point {
    private:
    int x ;
	int y ;
		public :
    point ();
	point (int, int) ;
	~point();
    void deplace (int, int) ;
	void affiche () ;
}oobj;
	point::point() {
        this->x= 20; y=30;
 			cout << "x= " << this->x <<" y= " << y << endl;   }
	point::point (int abs, int ord) : x(abs),y(ord)    {
        cout <<  this->x << " & " << y << endl;
	}
	point::~point(){
            cout << " destructed object : " << x << " | " << y << endl;
	}
	void point::deplace (int dx=10, int dy=10) {
			x = x + dx ;
			y = y + dy ;            }
	void point::affiche () {
 			cout << "Je suis en " << x << " " << y << "\n" ;        }

    point::point(const point& other) : x(other.x), y(other.y){

    }
main(){
	point p1;   point p2(3,6);    point p3(p2); p3.affiche();   //p1.affiche();
	//p2.deplace(5,5);    p1.deplace(40);         	p2.affiche();
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

#include <iostream>
using namespace std;
class test {
    string nom;
    int num ;
		public :
			test();
			test (string, int);
			test (const test& );
			~test () ;
		 	void affiche();
				  } ;
void test::affiche() const{		cout << this-> num << "----- ok ------" << endl; }
test::test()  {
	cout << "EMPTY CONS" << endl;             }
test::test (const string& nom, int num) :  num(num)  { this->nom=nom;
			cout << "++ Appel constructeur - num = " << this->num << "\n" ; }
test::~test ()
{ 			cout << "-- Appel destructeur - num = " << num << "\n" ;
				}
test::test (const test& other): num(other.num) {
            cout << " Bien copie" << endl;}
void fct (int) ;
main() {
	test obj;   test a("HELLO", 10);    test e(a);
	for (int i=1 ; i<=2 ; i++) {
				fct(i) ; cout << "Je suis tjr la" << endl; } }
void fct (int p)
{ cout << " INFUNCTION p = " << p << endl;
	test x(3*p) ; x.affiche(); // notez l�expression (non constante) : 2*p
	cout << " FUNCTION WILL BE OUT " << endl;
}


