#include <stdio.h>
#include <math.h>
#include <string.h>

int initial;
int final;
char n[1000];
char nint[1000];
char nfloat[1000];
int c = 0;
int c2 = 0;
int l = 0;
int p = -1;
long long num;
double  sum = 0;
double sum2 = 0;

void ten();
void passNum();
int dele();

int main()
{
    int verificacion;
	int casos;
    scanf("%d", &casos);
    
    while(casos--)
	{
    	c = 0; 
		c2 = 0; 
		l = 0; 
		p = -1;
		sum = 0;
		sum2 = 0;
    	memset(n, 0, 1000);
    	memset(nint, 0, 1000);
    	memset(nfloat, 0, 1000);
	    scanf("%d", &initial);
		scanf("%s", n);
		
		while (n[l])
		{
			if (n[l] == '.')
			{
				p = l;
			}
			n[l] = (char) toupper(n[l]);
			l++;
		}
		
		if (p == -1)
		{
			p= l;
		}
		scanf("%d", &final);
		if(1)
		{
			if(initial== final)
			{
				int i;	
				for(i= 0; i < l; i++)
				{
					printf("%c", toupper(n[i]));
				}				
				printf("\n");
			}
			else if (check())
			{
					ten();
					int make = 0;
					char h = '0';
					if (1)
					{
						passNum();
						int i;
						for (i = c; i >-1; i--)
						{
							if(i == c)
							{   
								while((nint[i] == '0' || nint[i] ==' ') && i>1)
								{
									i--;
								}
							}							
							if (i != c-2)
							{
								printf("%c", tolower (nint[i]));
								make= 1;
							}
						}						
						if(make == 0)
						{
							printf("%c", h);
						}
						if(c2 > 0)
						{
							printf(".");
							int j;	
							for (i= 0; i < c2 && i<15; i++)
							{
								j = i;	
								if (i < 14)
								{
									while (nfloat[j] == '0' && j < c2 && j <15) j++;
									if(j < c2 && j < 15) 
									{
										printf("%c", tolower(nfloat[i]));
									}
									else
									{
										break;
									}
								}								
								else 
								{
									printf("%c", tolower(nfloat[i]));
								}
							}
						}
						printf("\n");
					}
				}
			}
		}
    return 0;
}

void passNum()
{
	long long int div = sum;
	int res;
	int d;
	double numfloatd = sum2;
	res = div%final;
	div = div/final;
	
	while (div >= final)
	{    
		if (res > 9) 
		{
			nint[c] = res+'0'+7;
		}
		else{
			nint[c] = res+'0';
		}
		c++;
		res = div%final;
		div = div/final;
	}
	c++;
	if (res > 9) 
	{
		nint[c] = res+'0'+7;
	}
	else
	{
		nint[c] = res+'0';
	}	
	c++;
	if (div > 9)
	{
		nint[c] = div+'0'+7;
	}
	else
	{
		nint[c] = div+'0';
	}
	if (p != -1)
	{
		c2 = 0;
		double ep = 0.00000000000000000001;
		
		while (c2 < 20 && numfloatd >= ep)
		{
			d = floor(numfloatd*final);
			numfloatd = (numfloatd*final)-d;
			if (d > 9){
				nfloat[c2]= '0' + d+7;
			}
			else{
				nfloat[c2] = d+'0';
			}
			c2++;
		}
	}
}

void  ten()
{
	int lon;
	int cont = -1;	
	for (lon = 0; lon < p; lon++)
	{    
		if (n[lon] >= 65)
		{
			num = n[lon]-7-'0';
		}
		else{
			num = n[lon]-'0';
		}
		sum += num*pow(initial,p-lon-1);
	}
	double res;
	for (lon = p+1; lon < l; lon++)
	{    
		if (n[lon] >= 65)
		{
			num = n[lon]-7-'0';
		}
		else 
		{
			num = n[lon]-'0';
		}
		res = num*pow(initial,cont);
		sum2 += res;
		cont--;
	}
}

int dele(char n[1000])
{
	int poszeros = 1000;
	int longitud = strlen(n);

	int i;
	for(i=0;i<longitud;i++)
	{
		if(n[i]!='0' && i<poszeros)
		{
			poszeros=i;
		}
	}

	char nn[(l-poszeros)];

	int k=0;
	for(i=poszeros;i<l;i++)
	{
		nn[k]=n[i];
		k++;
	}
	printf("%s\n",nn);
	return 1;
}


int check()
{
	int i;
	int po= 1;
	char v;	
	if (initial > 9) 
	{
		v = initial+7+'0';
	}
	else{
		v = initial+'0';
	}
	for (i = 0; i < l; i++)
	{    
		if ( ('0' <= n[i] && n[i] < v) || n[i] == '.')
		{
			po= 1;
		}
		else 
		{
			po = 0;
			return po;
		}
	}
	return po;
}



