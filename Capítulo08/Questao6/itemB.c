#include <stdio.h>

void bubbleSort(int arr[], int size) {
    int i, j;
    int controle;
    for (i = 0; i < size - 1; i++) {
        controle = 1;
        for (j = 0; j < size - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                int temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
                controle = 0;
            }
        }
        if (controle){
            break;
        }
    }
}

int main() {
    int arr[] = {64, 34, 25, 12, 22, 11, 90};
    int size = 7;
    
    bubbleSort(arr, size);
    
    printf("Array ordenado: \n");
    for (int i = 0; i < size; i++) {
        printf("%d ", arr[i]);
    }
    
    return 0;
}
