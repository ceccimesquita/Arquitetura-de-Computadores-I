#include <stdio.h>

int main(){
    int array[20] = {1,2,3,4,5,6,7,8,9,10, 11,12,13,14,15,16,17,18,19,20};
    int copy[20];

    for(int k = 0; k < 20; k++){
        copy[k] = array[k];
    }
    
    for(int k = 0; k < 20; k++){
        printf("%d ", array[k]);

    }

    for(int k = 0; k < 20; k++){
        printf("%d ", copy[k]);

    }


}