#include <strings.h>
#include <string.h>
#include <stdlib.h>
#include "string-buffer.h"
#include "utils.h"


struct string_buffer {
  unsigned
    size,		/* total capacity, in characters. */
    end;		/* index of the next free location. */
  char * buffer;
  };


static void
resize(string_buffer sb, unsigned n) {

  /* Make sure the given string buffer has enough space for the given number of
     characters. */
  
  if (sb->end + n >= sb->size) {
    char * b;

    do sb->size *= 2;
    while (sb->end + n >= sb->size);
    
    b = mlc(sb->size, "string-buffer buffer");
    strncpy(b, sb->buffer, sb->end);
    free(sb->buffer);
    sb->buffer = b;
    }

  }


void
sb_add_char(string_buffer sb, char c) {

  resize(sb, 1);

  sb->buffer[sb->end++] = c;
  }


void
sb_add_string(string_buffer sb, const char * str) {

  const unsigned n = strlen(str);
  
  resize(sb, n);
  
  strncpy(sb->buffer + sb->end, str, n);
  sb->end += n;
  }


void
sb_empty(string_buffer sb) {
  sb->end = 0;
  }


void
sb_free(string_buffer sb) {
  free(sb->buffer);
  bzero(sb, sizeof(struct string_buffer));
  free(sb);
  }


const char *
sb_get(string_buffer sb) {
  
  char * str = mlc(sb->end + 1, "string-buffer copy");

  strncpy(str, sb->buffer, sb->end);
  str[sb->end] = '\0';

  return str;
  }


string_buffer
sb_new(void) {

  string_buffer sb = mlc(sizeof(struct string_buffer), "string buffer");

  sb->end = 0;
  sb->size = 64;
  sb->buffer = mlc(sb->size, "string-buffer buffer");

  return sb;
  }
