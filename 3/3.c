#include <stdio.h>
#include <string.h>

#define BUFFER_SIZE 256

int main(int argc, char **argv) {
    if (argc < 3) {
        printf("Uso: %s <archivo> <key>\n", argv[0]);
        return 1;
    }

    char *archivo = argv[1];
    char *key = argv[2];
    int key_num = 0;

    FILE *fp = fopen(archivo, "r");

    char buffer[BUFFER_SIZE];
    while (fgets(buffer, BUFFER_SIZE, fp)) {
        for (char *posicion = buffer; (posicion = strstr(posicion, key)) != NULL; posicion += strlen(key))
            key_num++;
    }

    printf("%s se repite %d veces en el texto.\n", key, key_num);

    fclose(fp);
    return 0;
}

