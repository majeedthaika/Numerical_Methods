import numpy as np
cimport numpy as np
def cy_cdf(np.ndarray[np.float64_t, ndim=2] a):
    cdef double s = 0.
    cdef size_t nrow, ncol #yah you would have imagine int but you need size_t
    cdef int irow, icol
    nrow = a.shape[0]
    ncol = a.shape[1]
    cdef np.ndarray[np.float64_t, ndim=2] ret = np.zeros((nrow, ncol))

    
    for irow in range(nrow):
        for icol in range(ncol):
            s += a[irow, icol]
            ret[irow,icol] = s
    return ret
