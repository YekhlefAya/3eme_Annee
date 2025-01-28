   #include <iostream>
   using namespace std;


   /*    class Base1   {
        protected:
        int SampleDataOne;
        public:
        Base1()
        {     SampleDataOne = 100;  }
        ~Base1() {cout << "Base1 Des \n"; }
        int SampleFunctOne() {
            return SampleDataOne;  }
    };
    class Base2  {
        protected:
        int SampleDataTwo;
        public:
        Base2() {
            SampleDataTwo = 200;
        }
        ~Base2(){ cout << "Base2 Des \n";}
        int SampleFunctTwo(){
            return SampleDataTwo;  }
};
   class Derived1 : public Base1, public Base2  {
        int MyData;
        public:
        Derived1()  {
            MyData = 300; }
        ~Derived1() {cout << "Der1 Des \n";}
        int MyFunct() {
            return (MyData + SampleDataOne + SampleDataTwo); }
};
    int main() {
        Base1 SampleObjOne;
        Base2 SampleObjTwo;
        Derived1 SampleObjThree;
       cout << SampleObjThree.Base1 :: SampleFunctOne() << endl;
       cout << SampleObjThree.Base2 :: SampleFunctTwo() << endl;
       cout << SampleObjThree.Derived1::MyFunct() << endl;
        return 0;
  }
  */

  /*
class point {
	int abs, ord;
	public :

    Q1: Créer un constructeur avec param
    Q2: Créer un constructeur de copie
    Q3: Créer un destructeur


class droite {
	point s1, s2;
	public :

        Q4: Créer un constructeur

        Créer MAIN PROGRAM
*/



/*
class point {
	int abs, ord;
	public :
	point(int a, int b):abs(a),ord(b) { abs=a; this->ord=b;
	 cout << "++Const point | " << this  <<" x est: " <<abs << " y est:" <<ord << endl; 	}
	point (const point &p): abs(p.abs), ord(p.ord) {
		cout << "++Const point COPY " << this << " x est: " <<abs << " y est:" <<ord <<  endl;	}
	~point(){	cout << "--Dest point " << this << endl;		}
};
class droite {
	point s1, s2;
	public :
    droite (const point& f, const point& h):s1(f),s2(h) { s1=f; s2=h;
	cout << "++Const d2 " << this  << " @S1: " << &s1<< endl; }
	~droite (){	cout << " --dest droite " << this << endl;	}
	 droite(int z, int f, int c, int d):s1(z,f), s2(c,d){
      cout << "DR : " << this << endl;		 	cout <<" S1 @ \t " << &s1 << endl;
		cout << " Ok \t"; 			cout << " ++Const droit-II " << endl;
	     }
};
int main(){
	point a(10,20), b(50,60); point c=a; cout << " ******** \n";
//	droite DT(50,60,70,4);
	droite X(a,b);	cout <<" Addd A :  " << &X << endl;
	cout << " BYE !!  \n";
	return 0;
}
*/
/*
     droite(int z, int f, int c, int d):s1(z,f), s2(c,d){
      cout << "DR : " << this << endl;		 	cout <<" S1 @ \t " << &s1 << endl;
		cout << " Ok \t"; 			cout << " ++Const droit-II " << endl;
	     }
	     */
/*

class Pet {
	protected:
		string name;
	public	:
	 	Pet (string name ) { cout << "Pet Constructor \n";
			this-> name = name ; }
	virtual	void MakeSound (void ) {
			cout << name << " is silent :" << endl ; }
};
class	Dog : public Pet {
	public:
		Dog (string name ) : Pet (name) {  cout << "Dog Constructor \n";}
		void MakeSound (void) {
			cout <<	name << " says : BONJOUR !" << endl ; }
void aboie(){ cout << "aboie";}

};
class GermanShepherd : public Dog {
	public:
		GermanShepherd (string name ) :	Dog( name ) {  cout << "GerShe Constructor \n"; }
		void MakeSound (void ) {
			cout << name << " says : NOO !" << endl ; }
};
class MastinEspanol:public Dog {
	public:
MastinEspanol(string name): Dog(name)
{  cout << "MasEsp Constructor \n";}
void MakeSound (void ) {
cout << name << "  OK !" << endl ; }
};
void adr_PlayWithPet (Pet *pet){
		pet->MakeSound();   }
	void ref_PlaywithPet (Pet& pet){
		pet.MakeSound();
}
int main( void ) {
Pet p("PET");Pet& rp= p;	cout << "***** \n";
Pet* pet = new Dog("CHIEN");//pet->aboie();
cout << "***** \n";
Dog* dog = new Dog("Dog");
cout << "***** \n";	Pet& pp= *dog;
Pet* f=dog;
GermanShepherd* gs = new GermanShepherd ("Hund ");	 cout << "***** \n";
MastinEspanol* mes = new MastinEspanol ("Perro");	 cout << "***** \n";
adr_PlayWithPet (pet);	ref_PlaywithPet(rp);
adr_PlayWithPet (dog);	ref_PlaywithPet(pp);
adr_PlayWithPet (gs);
adr_PlayWithPet (mes);
cout << "***************** \n";
static_cast<Dog *>(pet)->MakeSound();
dynamic_cast<Dog *>(pet)->aboie();
dynamic_cast<Pet *>(gs)->MakeSound();
static_cast<Dog &>(pp).MakeSound();

	return 0;
	}
*/
