#include <iostream>

using namespace std;

// **********************  STATIC VARIABLES  ****************************

/*
void demo()
{
	//  variable
	static  int count = 0;
	cout << count << " ";
	count++;
}

int main()
{
	for (int i=0; i<5; i++)
		demo();
	return 0;
}
*/

/*
class cpte_obj {
public :  static int ctr;        int f;
        cpte_obj () ;           ~cpte_obj () ;          } ;
int cpte_obj::ctr = 0 ; //initialisation du membre statique ctr
cpte_obj::cpte_obj ()      { ++ctr; this->f=100;
cout << ctr << " | @ de CTR "<< &ctr << " | @ f "<< &f << " | " << this <<endl; }
cpte_obj::~cpte_obj ()   {
cout << "OUT OF " << endl; cout << "-- DEST: reste" << --ctr << " objets\n" ;
				 if(ctr == 0) cout << "Bye, bye!" <<endl;   }
void fct();
main() {
		cpte_obj a ; cout << "@ de a | "<< &a << endl;
		cpte_obj b ; cout << "@ de b | "<< &b << endl;
		a.f=500;
		cout << " a.ctr = " << cpte_obj::ctr<< endl;
		fct () ;
		cout << " b.ctr = " << cpte_obj::ctr << endl;       }
	void fct () {
		cout << "IN FUNC "  << endl;      cpte_obj u;
		cout << " u.ctr = " << cpte_obj::ctr << endl;    cpte_obj v;
		cout << " v.ctr = " << cpte_obj::ctr << endl;
        }
*/

// *************** STATIC VARIABLE MUST BE PRIVATE (for protection)
/*
class cpte_obj {
		static int ctr;
	public:
		cpte_obj() { ++ctr ;
				}
		~cpte_obj() {    --ctr ;
				if(ctr == 0)
					cout << "Bye, bye!" << endl ;
				}
		void HowMany () {
			cout << ctr << " instances" << endl ;   }
	};
int cpte_obj::ctr = 0;
main() {
	cpte_obj a;cpte_obj c;
	cpte_obj b;
	c.HowMany();
	cpte_obj d;
	d.HowMany();
}
*/
		//********************** Static FUNCTIONS *********************

/*
class cpte_obj {
		public : static int ctr; int var;
	public:
		cpte_obj() :var(700) {
					++ctr ;     }
		~cpte_obj() {       --ctr ; cout << "ok" << endl;
				if(ctr == 0)
					cout << "Bye, bye!" << endl ;
				}
	static void HowMany () {
			cout << ctr << " instances" << var << endl ;
		}
	};
int cpte_obj::ctr = 0;
static cpte_obj taha;
main() {
    cpte_obj::HowMany();
cout << cpte_obj::ctr; << endl;
taha.HowMany();cpte_obj a;
	cpte_obj b;
	a.HowMany();
	cpte_obj c;
	cpte_obj d;
	d.HowMany();
}
*/
