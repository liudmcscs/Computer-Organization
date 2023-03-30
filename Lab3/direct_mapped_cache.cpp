#include <iostream>
#include <stdio.h>
#include <math.h>

using namespace std;

struct cache_content
{
	bool v;
	unsigned int tag;
    // unsigned int	data[16];
};

const int K = 1024;
/*
double log2(double n)
{
    // log(n) / log(2) is log2.
    return log(n) / log(double(2));
}*/
/*
int log2 (int n) {

    int m = 0;
	//int c=0;
	//nt u=n;
	//int u;
	//cout<<"start:  ";
	cout<<"n: "<<n<<endl;
    while (n >>= 1)
	{
		//u=u>>1;
		//c++;
		++m;
		cout<<"n: "<<n<<endl;
		//cout<<"c: "<<c<<endl;
	}
	//u=u>>1;
	//cout<<"u: "<<u<<endl;
	cout<<" n: "<<n<<endl;
    return m;

}
*/

int log2 (int n) {

    int m = 0;
	int y;
	y=0;
	//cout<<"n: "<<n<<endl;
    while (n!=0)
	{
		n>>=1;
		//if(n==1/*||n==2||n==3||n==0||n==4*//*)y=1;
		if(n==0)break;
		m++;
		//cout<<"m: "<<m<<endl;
		//cout<<"n: "<<n<<endl;
	}
			//cout<<"n: "<<n<<endl;
	//m++;

    return m;

}


void simulate(int cache_size, int block_size,int choosefile)
{
	unsigned int tag, index, x;
	int offset_bit = (int)log2(block_size);
	int index_bit = (int)log2(cache_size / block_size);
	int line = cache_size >> (offset_bit);
	double hit=0;
    double access=0;
    double miss=0;
    double missrate;
	cache_content *cache = new cache_content[line];

    //cout << "cache line: " << line <<"     ";

	for(int j = 0; j < line; j++)
		cache[j].v = false;
	FILE *fp;
    if(choosefile==0)
    {
        fp = fopen("ICACHE.txt", "r");      // read file
    }
    else if(choosefile==1)
    {
        fp = fopen("DCACHE.txt", "r");
    }
    else
    {

    }


	while(fscanf(fp, "%x", &x) != EOF)
    {
        access++;
		//cout << hex << x << " ";
		index = (x >> offset_bit) & (line - 1);
		tag = x >> (index_bit + offset_bit);
		if(cache[index].v && cache[index].tag == tag)
        {
			cache[index].v = true;    // hit
			hit++;
        }

		else
        {
			cache[index].v = true;  // miss
			cache[index].tag = tag;
			miss++;
		}
		//cout<<"aa"<<endl;
	}
	fclose(fp);
	//cout<<"acess: "<<access<<"  ";
	//cout<<"hit: "<<hit<<"  ";
	//cout<<"miss: "<<miss<<"  ";
    missrate=miss/access;
    cout<<"missrate: "<<100*missrate<<endl;
	delete [] cache;
}

int main()
{
	// Let us simulate 4KB cache with 16B blocks
	int choosefile;
    /*cout<<"0 FOR ICACHE ,1 FOR DCACHE: ";
    cin>>choosefile;
    cout<<endl;*/
	choosefile=0;
	cout<<"===ORIGINAL==="<<endl;
	cout<<"ICACHE: "<<endl;
    cout<<"  4* K    4: ";		simulate(   4* K,  4, choosefile);
    cout<<"  4* K   16: ";		simulate(   4* K, 16, choosefile);
	cout<<"  4* K   64: ";		simulate(   4* K, 64, choosefile);
	cout<<"  4* K  128: ";		simulate(   4* K,128, choosefile);
	cout<<"  4* K  256: ";		simulate(   4* K,256, choosefile);
	cout<<" 16* K    4: ";		simulate(  16* K,  4, choosefile);
	cout<<" 16* K   16: ";		simulate(  16* K, 16, choosefile);
	cout<<" 16* K   64: ";		simulate(  16* K, 64, choosefile);
    cout<<" 16* K  128: ";		simulate(  16* K,128, choosefile);
	cout<<" 16* K  256: ";		simulate(  16* K,256, choosefile);
	cout<<" 64* K    4: ";		simulate(  64* K,  4, choosefile);
	cout<<" 64* K   16: ";		simulate(  64* K, 16, choosefile);
	cout<<" 64* K   64: ";		simulate(  64* K, 64, choosefile);
	cout<<" 64* K  128: ";		simulate(  64* K,128, choosefile);
	cout<<" 64* K  256: ";		simulate(  64* K,256, choosefile);
	cout<<"128* K    4: ";		simulate( 128* K,  4, choosefile);
	cout<<"128* K   16: ";		simulate( 128* K, 16, choosefile);
	cout<<"128* K   64: ";		simulate( 128* K, 64, choosefile);
	cout<<"128* K  128: ";		simulate( 128* K,128, choosefile);
	cout<<"128* K  256: ";		simulate( 128* K,256, choosefile);
	cout<<"256* K    4: ";		simulate( 256* K,  4, choosefile);
	cout<<"256* K   16: ";		simulate( 256* K, 16, choosefile);
	cout<<"256* K   64: ";		simulate( 256* K, 64, choosefile);
	cout<<"256* K  128: ";		simulate( 256* K,128, choosefile);
	cout<<"256* K  256: ";		simulate( 256* K,256, choosefile);

	choosefile=1;
	cout<<"======================"<<endl;
	cout<<"DCACHE: "<<endl;
	cout<<"  4* K    4: ";		simulate(   4* K,  4, choosefile);
	cout<<"  4* K   16: ";		simulate(   4* K, 16, choosefile);
	cout<<"  4* K   64: ";		simulate(   4* K, 64, choosefile);
	cout<<"  4* K  128: ";		simulate(   4* K,128, choosefile);
	cout<<"  4* K  256: ";		simulate(   4* K,256, choosefile);
	cout<<" 16* K    4: ";		simulate(  16* K,  4, choosefile);
	cout<<" 16* K   16: ";		simulate(  16* K, 16, choosefile);
	cout<<" 16* K   64: ";		simulate(  16* K, 64, choosefile);
	cout<<" 16* K  128: ";		simulate(  16* K,128, choosefile);
	cout<<" 16* K  256: ";		simulate(  16* K,256, choosefile);
	cout<<" 64* K    4: ";		simulate(  64* K,  4, choosefile);
	cout<<" 64* K   16: ";		simulate(  64* K, 16, choosefile);
	cout<<" 64* K   64: ";		simulate(  64* K, 64, choosefile);
	cout<<" 64* K  128: ";		simulate(  64* K,128, choosefile);
	cout<<" 64* K  256: ";		simulate(  64* K,256, choosefile);
	cout<<"128* K    4: ";		simulate( 128* K,  4, choosefile);
	cout<<"128* K   16: ";		simulate( 128* K, 16, choosefile);
	cout<<"128* K   64: ";		simulate( 128* K, 64, choosefile);
	cout<<"128* K  128: ";		simulate( 128* K,128, choosefile);
	cout<<"128* K  256: ";		simulate( 128* K,256, choosefile);
	cout<<"256* K    4: ";		simulate( 256* K,  4, choosefile);
	cout<<"256* K   16: ";		simulate( 256* K, 16, choosefile);
	cout<<"256* K   64: ";		simulate( 256* K, 64, choosefile);
	cout<<"256* K  128: ";		simulate( 256* K,128, choosefile);
	cout<<"256* K  256: ";		simulate( 256* K,256, choosefile);
/*cout<<"========8"<<endl;
//simulate( 8,2,1);
simulate( 8,4,1);
simulate( 8,8,1);
//simulate( 16,16,1);
cout<<"========16"<<endl;
//simulate( 16,2,1);
simulate( 16,4,1);
simulate( 16,8,1);
simulate( 16,16,1);
//simulate( 16,32,1);*/



	cout<<"================================================================="<<endl;
	cout<<"===MODIFIED==="<<endl;
	choosefile=0;
	cout<<"ICACHE: "<<endl;
	cout<<" 32	  4: ";		simulate(   32,  4, choosefile);
	cout<<" 32	  8: ";		simulate(   32,  8, choosefile);
	cout<<" 32	 16: ";		simulate(   32, 16, choosefile);
	cout<<"=========="<<endl;
	cout<<" 64	  4: ";		simulate(   64,  4, choosefile);
	cout<<" 64	  8: ";		simulate(   64,  8, choosefile);
	cout<<" 64	 16: ";		simulate(   64, 16, choosefile);
	cout<<" 64	 32: ";		simulate(   64, 32, choosefile);
	cout<<"=========="<<endl;
	cout<<"128	  4: ";		simulate(  128,  4, choosefile);
	cout<<"128	  8: ";		simulate(  128,  8, choosefile);
	cout<<"128	 16: ";		simulate(  128, 16, choosefile);
	cout<<"128	 32: ";		simulate(  128, 32, choosefile);
	cout<<"128	 64: ";		simulate(  128, 64, choosefile);
	cout<<"=========="<<endl;
	cout<<"256	  4: ";		simulate(  256,  4, choosefile);
	cout<<"256	  8: ";		simulate(  256,  8, choosefile);
	cout<<"256	 16: ";		simulate(  256, 16, choosefile);
	cout<<"256	 32: ";		simulate(  256, 32, choosefile);
	cout<<"256	 64: ";		simulate(  256, 64, choosefile);



	choosefile=1;
	cout<<"======================"<<endl;
	cout<<"DCACHE: "<<endl;
	cout<<" 32	  4: ";		simulate(   32,  4, choosefile);
	cout<<" 32	  8: ";		simulate(   32,  8, choosefile);
	cout<<" 32	 16: ";		simulate(   32, 16, choosefile);
	cout<<"=========="<<endl;
	cout<<" 64	  4: ";		simulate(   64,  4, choosefile);
	cout<<" 64	  8: ";		simulate(   64,  8, choosefile);
	cout<<" 64	 16: ";		simulate(   64, 16, choosefile);
	cout<<" 64	 32: ";		simulate(   64, 32, choosefile);
	cout<<"=========="<<endl;
	cout<<"128	  4: ";		simulate(  128,  4, choosefile);
	cout<<"128	  8: ";		simulate(  128,  8, choosefile);
	cout<<"128	 16: ";		simulate(  128, 16, choosefile);
	cout<<"128	 32: ";		simulate(  128, 32, choosefile);
	cout<<"128	 64: ";		simulate(  128, 64, choosefile);
	cout<<"=========="<<endl;
	cout<<"256	  4: ";		simulate(  256,  4, choosefile);
	cout<<"256	  8: ";		simulate(  256,  8, choosefile);
	cout<<"256	 16: ";		simulate(  256, 16, choosefile);
	cout<<"256	 32: ";		simulate(  256, 32, choosefile);
	cout<<"256	 64: ";		simulate(  256, 64, choosefile);

/*
cout<<"========32"<<endl;
//simulate( 32,2,1);
simulate( 32,4,1);
simulate( 32,8,1);
simulate( 32,16,1);
//simulate( 32,32,1);
cout<<"========64"<<endl;
//simulate( 64,2,1);
simulate( 64,4,1);
simulate( 64,8,1);
simulate( 64,16,1);
simulate( 64,32,1);
//simulate( 64,64,1);
cout<<"========128"<<endl;
//simulate(128,2,1);
simulate(128,4,1);
simulate(128,8,1);
simulate(128,16,1);
simulate(128,32,1);
simulate(128,64,1);
cout<<"========256"<<endl;
//simulate(256,2,1);
simulate(256,4,1);
simulate(256,8,1);
simulate(256,16,1);
simulate(256,32,1);
simulate(256,64,1);
*/

/*
cout<<"||||||||||||||"<<endl;


cout<<"========16"<<endl;
//simulate( 16,2,0);
simulate( 16,4,0);
simulate( 16,8,0);
simulate( 16,16,0);
simulate( 16,32,0);
cout<<"========32"<<endl;
//simulate( 32,2,0);
simulate( 32,4,0);
simulate( 32,8,0);
simulate( 32,16,0);
simulate( 32,32,0);
cout<<"========64"<<endl;
//simulate( 64,2,0);
simulate( 64,4,0);
simulate( 64,8,0);
simulate( 64,16,0);
simulate( 64,32,0);
simulate( 64,64,0);
cout<<"========128"<<endl;
//simulate(128,2,0);
simulate(128,4,0);
simulate(128,8,0);
simulate(128,16,0);
simulate(128,32,0);
simulate(128,64,0);
cout<<"========256"<<endl;
//simulate(256,2,0);
simulate(256,4,0);
simulate(256,8,0);
simulate(256,16,0);
simulate(256,32,0);
simulate(256,64,0);
simulate(256,128,0);
cout<<"========512"<<endl;
//simulate(256,2,0);
simulate(512,4,0);
simulate(512,8,0);
simulate(512,16,0);
simulate(512,32,0);
simulate(512,64,0);
simulate(512,128,0);
simulate(512,256,0);*/
return 0;
}
