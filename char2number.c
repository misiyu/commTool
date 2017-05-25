#include <stdio.h>
#include <string.h>
int main(int argc,char** argv) {
	int i=argc;
	int len = strlen(argv[1]);
	printf ("%s\n",argv[1]);
	for (i = 0; i < len; i++) {
		printf("%d ",argv[1][i]);
	}
	printf("\n");
	return 0;
}
