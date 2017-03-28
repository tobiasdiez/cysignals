# Auto-generated file setting the correct include directories
cimport cysignals.__init__

# NOTE: these functions are actually defined in "macros.h".
# However, we intentionally do not mention that file here, because
# every .pyx file using interrupt functions *must* also call
# import_cysignals__signals() which is done automatically
# if signals.pxi is included.
#
# A failure to include signals.pxi will therefore lead to a compiler
# error (since sig_on() will not be defined) or an ImportError due to a
# missing symbol but hopefully not an obscure segmentation fault.
#
cdef extern from * nogil:
    int sig_on() except 0
    int sig_str(char*) except 0
    int sig_check() except 0
    void sig_off()
    void sig_retry()  # Does not return
    void sig_error()  # Does not return
    void sig_block()
    void sig_unblock()

    # Macros behaving exactly like sig_on, sig_str and sig_check but
    # which are *not* declared "except 0".  This is useful if some
    # low-level Cython code wants to do its own exception handling.
    int sig_on_no_except "sig_on"()
    int sig_str_no_except "sig_str"(char*)
    int sig_check_no_except "sig_check"()

# This function does nothing, but it is declared cdef except *, so it
# can be used to make Cython check whether there is a pending exception
# (PyErr_Occurred() is non-NULL). To Cython, it will look like
# cython_check_exception() actually raised the exception.
cdef inline void cython_check_exception() nogil except *:
    pass


# Private stuff below, do not use directly
cdef extern from "struct_signals.h":
    ctypedef struct cysigs_t:
        int sig_on_count
        const char* s

cdef api:
    cysigs_t cysigs "cysigs"
    void print_backtrace() nogil
    void _sig_on_interrupt_received() nogil
    void _sig_on_recover() nogil
    void _sig_off_warning(const char*, int) nogil
