#include <iostream>
using namespace std;


class Point {
public:
    int x;
    int y;

    Point() :x(0),y(0){cout << "constructed " << this << endl;}
    Point(int abs, int ord) {
        x = abs;
        y = ord;
    }
    void deplace(int dx, int dy) {
        x += dx;
        y += dy;
    }

    void affiche() const {
        cout << "Address in class: " << this;
        cout << " || Coordinates: (" << x << ", " << y << ")\n";
    }
    ~Point(){
    cout << " destructing " << this << endl;
    }

    Point operator+(const Point other) const {
        Point result; cout <<"@d resylt " << this<< endl;
        result.x = x + other.x;
        result.y = y + other.y;
        return result;
    }

    // Operator Overloading: -
    Point operator-(const Point& other) const {
        Point result;
        result.x = x - other.x;
        result.y = y - other.y;
        return result;
    }

    // Operator Overloading: a++
    Point operator++(int) {
        Point temp = *this; // Save current state
        x++;
        y++;
        return temp; // Return the old state
    }

    // Operator Overloading: ++a
    Point& operator++() {
        x++;
        y++;
        return *this; // Return the updated object
    }

    // Operator Overloading: ==
    bool operator==(const Point& other) const {
        return (x == other.x && y == other.y);
    }

    // Operator Overloading: <<
    friend ostream& operator<<(ostream& os, const Point& point) {
        os << "(" << point.x << ", " << point.y << ")";
        return os;
    }

    // Operator Overloading: >>
    friend istream& operator>>(istream& is, Point& point) {
        cout << "Enter x: ";
        is >> point.x;
        cout << "Enter y: ";
        is >> point.y;
        return is;
    }
   //  Point& operator=(const Point& other) {
     //  cout << "f = " << this << " w other" << &other << endl;
       //if (this == &other) {
         // cout << "Self-assignment detected, returning *this" << endl;
           // return *this;
        //}
      //}
};

int main() {
    Point p1(1,2);
    Point p2(3,4);

    // Display initial points
    cout << "Point 1: " << p1 << endl;
    cout << "Point 2: " << p2 << endl;
    //Point p3;
    // Test +

    Point p3 = p1 + p2;
    //Point p3 = p1 + p2;
    cout << "Point 3 (p1 + p2): " << p3 << endl;
    cout << "@ dial point p3 "<< &p3 << endl;

    // Test -
    p3 = p1 - p2;
    cout << "Point 3 (p1 - p2): " << p3 << endl;
    // Test a++
    Point p4 = p1++;
    cout << "Point 4 (p1++): " << p4 << " | Point 1 after p1++: " << p1 << endl;

    // Test ++a
    Point p5 = ++p4;
    cout << "Point 5 (++p1): " << p5 << " | Point 1 after ++p1: " << p4 << endl;

    // Test ==
    cout << "p1 == p2: " << (p1 == p2 ? "True" : "False") << endl;

    // Test <<
    cout << "Point 1: " << p1 << endl;

    // Test >>
    cout << "Enter a new point (p6):" << endl;
    Point p6;
    cin >> p6;
    cout << "You entered: " << p6 << endl;

    return 0;
}


/*
class point {
	public :
				int x;
				int y ;
		public :
			initialise (int abs, int ord) {
 					x = abs ;
					y = ord ;	}
			void deplace (int dx, int dy) {
					x = x + dx ;
					y = y + dy ; }
			void affiche () { cout << "address dans class " << this;
 					cout << " || Je suis en " << x << " | " << y << "\n" ;}
} ;
int main() {
	point obj; obj.initialise(5,6);; cout <<&obj << &obj.x;
	point* objet1 = new point; (*objet1).x=5;objet1->y=5;

	(*objet1).affiche();
	cout << "Adresse du pointeur normale " << &objet1 << endl;
		cout << "La valeur de l@adr sur pointe le pointeur  " << objet1 << endl;
	cout << &objet1->x << endl;	cout << &objet1->y << endl;
	delete objet1;
}
*/
/*
class point { // d�claration des membres priv�s
				 int x ;
				 int y ;
		public :
		point (); // Constructeur Vide
		point (int, int) ;  // Constructeur avec des param�tres
		point (const point &); // Constructeur de copie
		~point(); 	// Destructeur
		void deplace (int, int) ;
		void affiche () ;
	 		} ;
point::point(){
	//		x=200; y=300;
 			cout << "x= " << x <<" y= " << y << endl;
}
point::point (int abs, int ord) {
			x = abs ;
			y = ord ;
			}
point :: point (const point &t){
		cout << "Copy" << endl;
			x=t.x; y=t.y;
		}
point::~point(){	cout << " Destructor destroyed " << "Address of that object is :" << this << endl;
}
void point::deplace (int dx, int dy) {
			x = x + dx ;
			y = y + dy ;
						}
void point::affiche () {
 			cout << "Address of this object is :" << this << " || Je suis en " << x << " " << y << "\n" ;
			 			}
main() {
		point* obj= new point();		obj->affiche();
		point* Object = new point (400,500);
	//	point *Object;	Object = new point(400,500);
		(*Object).affiche () ; // Object -> affiche();
		point *obj2=Object;
		obj2->affiche();
	delete Object;	delete obj;	delete obj2;
		}
*/



/*
class Shallow {
public:
    int *data;
    Shallow(int d) {
        data = new int;     *data = d;
        cout << data << " Constructor \t " << this << endl; }
   Shallow(const Shallow &source) : data(source.data) {
       cout << data << " Shallow Copy Constructor \t " << this << endl;  }
    ~Shallow() {
        delete data;
        cout << "Destructor \t " << this << endl; }
    void set(int d) { *data = d; }
    int get() { return *data; }
};
void displaySh(Shallow s) {
    cout << "Value: " << s.get() << endl;   cout << "Temporary object address: " << &s << endl;
}
int main() {
    Shallow obj(100); displaySh(obj);
    cout << "Back in main.\n";
    Shallow objShallow = obj;  // Shallow copy
    cout << "Shallow copied object data: " << objShallow.get() << endl;
    objShallow.set(200);  // Modify shallow copy
    cout << "Original object data after shallow copy modification: " << obj.get() << endl;

    Shallow objDeep(obj);  // Deep copy
    cout << "Deep copied object data: " << objDeep.get() << endl;
    objDeep.set(300);  // Modify deep copy
    cout << "Original object data after deep copy modification: " << obj.get() << endl;

    return 0;
}
*/
  //  Shallow(const Shallow &source) {
    //    data = new int;        *data = *source.data;
      //  cout << data << " Deep Copy Constructor \t " << this << endl;
    //}
