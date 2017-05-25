#include <stdio.h>
#include <stdlib.h>
int main(int argc, char** argv) {

	int i =0;
	int arr[200];
	for (i = 1; i < argc; i++) {
		
		arr[i] = atoi( argv[i] );
	}
	for (i = 1; i < argc; i++) {
		printf("%d ",arr[i]);
	}
	printf("\n");
	for (i = 1; i < argc; i++) {
		printf("%c",arr[i]);
	}
	printf("\n");
	return 0;

}
