#include <stdio.h>
#include <string.h>

main(){
	char typeTwo[] = "P2";
	char typeOne[3];
	int columns, rows, maxPPM, r, g, b, grey, i, maxPGM = 255;

	for(i = 0; i < 3; i++){
		scanf("%c", &typeOne[i]);
	}

	scanf("%d%d%d", &columns, &rows, &maxPPM);

	for(i = 0; i < 2; i++){
		printf("%c", typeTwo[i]);
	}

	printf("\n");
	printf("%d\n", columns);
	printf("%d\n", rows);
	printf("%d\n", maxPGM);

	for(i = 0; i < (rows*columns); i++){
		scanf("%d%d%d", &r, &g, &b);
		grey = ((r*30 + g*59 + b*11) * 255) / (100 * maxPPM);
		printf("%d\n", grey);
	}
}