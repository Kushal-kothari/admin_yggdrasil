#include<iostream>
using namespace std;

// int factorial(int n){
//         int ans = 1;
//         int i =1;
//         while(i<=n){
//                 ans=ans*i;
//                 i++;
//         }
//         return ans;
// }


// int main(){

//         int n,r;
//         cin >> n >> r;
//         int fact_n = factorial(n);
//         int fact_r = factorial(r);
//         int fact_n_r = factorial(n-r);
//         int ans = fact_n/(fact_r*fact_n_r);
//         cout << ans << endl;        
// }


int main(){
        int scount = 0,dcount = 0,acount = 0;
        char daebe;
        daebe = cin.get();
        cout << daebe <<"check" << endl;
        while(daebe != '$'){

        
                if('1'<= daebe<='9'){
                        cout<< daebe;
                        dcount ++;
                }
                if('a'<= daebe <= 'z'){
                        // cout << daebe;
                        acount ++;
                
                }        

                if(daebe == ' '){
                        scount ++;
                }
                daebe = cin.get();
        }
        cout << acount << endl;
        cout << dcount<< endl;
        cout << scount;
}


