#ifndef _string_buffer_h_defined_
#define _string_buffer_h_defined_

typedef struct string_buffer * string_buffer;


/* Add the given character to the end of the string literal. */

   extern void sb_add_char(string_buffer, char);


/* Add the given string to the end of the string literal. */

   extern void sb_add_string(string_buffer, const char *);


/* Set the given string buffer to the empty string. */

   extern void sb_empty(string_buffer);


/* Free the given string buffer. */

   extern void sb_free(string_buffer);


/* Return a copy of the contents of the given string buffer.  The allocated
   storage returned should be manged by the caller. */

   extern const char * sb_get(string_buffer);


/* Return a new, empty string buffer. */

   extern string_buffer sb_new(void);


#endif
