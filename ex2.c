#include <stdio.h>
#include <string.h>

main(){
	int x1, x2, y1, y2;
	char type[] = "P2";
	int columns, rows, grey, i, j, maxPGM, newColumns, newRows;

	scanf("%d%d%d%d", &x1, &x2, &y1, &y2);

	for(i = 0; i < 2; i++){
		printf("%c", type[i]);
	}

	scanf("%d%d%d", &columns, &rows, &maxPGM);

	newColumns = x2 - x1 + 1;
	newRows = y2 - y1 + 1;

	printf("\n");
	printf("%d\n", newColumns);
	printf("%d\n", newRows);
	printf("%d\n", maxPGM);

	for(i = 0; i < rows; i++){
		for(j = 0; j < columns; j++){
			scanf("%d", &grey);
			if(i >= y1 && i <= y2 && j >= x1 && j <= x2){
				printf("%d\n", grey);
			}
		}
	}
}