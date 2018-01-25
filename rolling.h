// Enable ECB, CTR and CBC mode. Note this can be done before including aes.h or at compile-time.
// E.g. with GCC by using the -D flag: gcc -c aes.c -DCBC=0 -DCTR=1 -DECB=1

#define CBC 1
#define CTR 1
#define ECB 1

#include "aes.h"

static void phex(uint8_t* str);
static void test_encrypt_cbc(void);
static void test_decrypt_cbc(void);
static void test_encrypt_ctr(void);
static void test_decrypt_ctr(void);
static void test_encrypt_ecb(void);
static void test_decrypt_ecb(void);
static void test_encrypt_ecb_verbose(void);
