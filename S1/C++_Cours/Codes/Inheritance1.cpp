#include <iostream>

using namespace std;
/*
class point {
    protected: int x,y;
	public :
		point (): x(5),y(5) {cout << " Point_Construit : \n";		}
	void set_X(int abs) {	x= abs;	}
	void set_Y(int ord) {	y= ord;	}
	int get_X(){	cout  << "abs = ";  return x;		}
	int get_Y(){	cout  << " ord = "; return y;		}
	~point(){	cout << "Destructed POINT\n" ;
	}
};
class pointcolor : public point{
	string couleur;
	public :
		pointcolor ():couleur(" "){ cout << " point col \n"; }
		void set_Col(string couleur) {	this->couleur= couleur;		}
void get_Col(){ cout <<"abs ="<<x<<" |ord =" <<y<<" | couleur = " << couleur<< endl; }
~pointcolor(){	cout << "Destructed COOOOOL\n" ;}
};
int main(){
	pointcolor pc;   pc.get_Col(); pc.set_X(10);  pc.set_Y(10); pc.set_Col("VERT"); pc.get_Col();
		return 0;
}

/*
class Vehicule {
  	protected :
    	string brand = "FORD";
	public :
		Vehicule(){cout << " CONSTRUCTED ! ";	}
    	void honk() {
      		cout <<  "CLAXON SOUND " + brand + "\n" ;	}
};
// Derived class
class Car: public Vehicule {
  public:
  string model = "FOCUS";
  	Car():Vehicule(){cout << " CONSTRUCTED ! ";	}
    void fct(void) {
    	cout << " brand = " << brand << endl;
						}
};
int main() {
	Car myCar;
  	myCar.honk(); myCar.fct();
	//cout << " BRAND IS : | " + myCar.brand << endl;
  	cout << " Model is : " + myCar.model;
  return 0;
}
*/
/*
class MyClass {
    public : MyClass(){cout << " MY CLASS \n";}
    void myFunction() {
      cout << "Some content in parent class." ;
    }
};

// Derived class (child)
class MyChild: public MyClass {
    public : MyChild(){cout << " MY CHILD \n";}
};

// Derived class (grandchild)
class MyGrandChild: public MyChild {
   public : MyGrandChild(){cout << " MY GRANDCHILD \n";}
};

int main() {
  MyGrandChild myObj;
  myObj.myFunction();
  return 0;
}

*/
/*
class point {
 protected:		int x, y ;
public :
		point (){ x=0;y=0;	cout << x << " " << y << endl;	}
		void initialise (int abs, int ord) { x=abs; y=ord;}
		void deplace (int dx, int dy) { x += dx; y += dy;}
		void affiche (){ cout << " x = " << x <<  " y= " <<  y << endl; }
		~point(){	cout <<" DESTRUCTED BASE" << endl;	}
} ;
class pointcol : public point {
	short couleur ;
	public :
		pointcol():couleur(0){}
	void colore (short cl) { couleur = cl ; }
	void affiche () ;
	void initialise (int, int, short) ;
	~pointcol ();
	} ;
void pointcol::affiche () {  point::affiche (); cout << " et ma couleur est : " << couleur << "\n" ; }
void pointcol::initialise (int abs, int ord, short cl)	{ x=abs; y=ord;	couleur = cl ; }
pointcol::~pointcol (){	cout <<" DESTRUCTED Derived" << endl;	}
main() {
	point a; 	a.affiche();
	pointcol p ; 	p.initialise (10,20, 5) ; p.affiche () ;
	p.deplace (2,4) ; p.affiche () ; 	p.colore (2) ; p.affiche () ;
	p.point::affiche () ;
	}
*/
/*
class point {int x, y ;
	public :
	point (int abs=0,int ord=0) //constructeur de point ("inline")
		{ cout << "++ constr. point : " << abs << " " << ord << "\n" ;
				x = abs ; y =ord ; }
	~point () { cout << "-- destr. point : " << x << " " << y << "\n" ; } } ;
// ************ classe pointcol ******************
class pointcol : public point {
	short couleur ;
	public :
			pointcol (int abs=0,int ord=0,short cl=1):point(abs,ord)
				{ cout<<"++ constr.pointcol: "<<abs<< " "<<ord<<" "<<cl <<"\n" ;
						couleur = cl ; }
			~pointcol ()
				{ cout << "-- dest. pointcol - couleur :" << couleur << "\n" ; } } ;
// ************ programme d�essai ****************
main() {
	pointcol a(10,15,3) ; // objets
	pointcol b (2,3) ; // automatiques
pointcol c (12) ; // .....
pointcol * adr ; adr = new pointcol (12,25) ;
delete adr ;
}
*/
/*
class Chien {
public:
	virtual void Aboie()
	{	cout << "\nSOUND " ;	}
	void Show()	{ cout << "\nThis is Show() method of BaseClass";	}
};
class GermanSh : public Chien	{
public:
	void Aboie()	{
		cout << " \n Aboiiiiiiiiiiiiiie";	}
};
class Shiwawa : public Chien	{
public:
	void Aboie()	{
		cout << " Ghir A ";	}
};
int main()
{
    Chien s; s.Aboie();     GermanSh e; e.Aboie();
	Chien& bs = e; Chien* f= new Shiwawa(); f->Aboie();
	bs.Aboie();
	e.Show();
}
*/
/*
class Shape{
	string color;   public :
	Shape(string c) { 	color =c; 	}
	virtual int area(){		cout << "Area of Base class \n";    return 0; 	}
	void erase(){	cout << " Erase the Base Shape \n";	} virtual ~Shape(){cout<<"SHAPE\n";}	                };
class Rectangle : public Shape {
	int width, length;  public :
Rectangle(int l, int w, string c):Shape(c){length=l; width=w;}~Rectangle(){cout<<"RECC\n";}
int area(){cout <<"Rectangle is: " <<width*length << endl;	return width*length ;	}
		void draw(){ cout << " Draw Rectangle \n";	}
		void erase(){ cout << " The Rectangle  erased \n";	}       };
class Circle : public Shape {
	int radius; public :
		Circle(int r, string c) : Shape(c){	radius=r; } ~Circle(){cout<<"CIRCLE\n";}
int area(){cout <<"CircleArea " <<3.14*(radius*radius)<<endl;return 3.14*(radius*radius) ;	}
		void draw(){ cout << " Draw Circle \n";	}
		void erase(){ cout << " The Circle  erased \n";	}
};
int main(){
Shape* ptr;  Rectangle rc(2,4,"Blue"); Circle crc(4, "WHITE");
	ptr=&rc; ptr->area(); ptr=&crc; ptr->area();
	Shape* f= new Rectangle(10,20,"BLUE");
	f->area(); f->erase();
	delete f;
	return 0;
}

