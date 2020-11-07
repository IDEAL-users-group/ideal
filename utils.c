#include <stdlib.h>
#include <stdio.h>
#include "utils.h"


extern void impossible(const char *);


void *
mlc(unsigned size, const char * caller) {

  void * mp = malloc(size);

  if (!mp) {
    const unsigned ms = 1024;
    char msg[ms];
    snprintf(msg, ms, "%s malloc(%u) failed", caller, size);
    impossible(msg);
    }

  return mp;
  }
