#include  <stdio.h>

void __cyg_profile_func_enter (void *this_fn, void *call_site) {
    printf( "entering %p\n", this_fn );
}

void __cyg_profile_func_exit (void *this_fn, void *call_site) {
    printf( "leaving %p\n", this_fn );
}
