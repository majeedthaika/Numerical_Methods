import numpy as np
cimport numpy as np
cdef float diff(float[:,:,:] img, int i, int j, int nc, int ioffset, int joffset):
    cdef float d = 0
    for ic in range(nc):
        d +=(img[i+ioffset,j+joffset,ic] - img[i,j,ic])**2
    return d


def sobel(float[:,:,:] img):
    cdef size_t nx,ny,nc
    cdef int ix,iy
    cdef float s
    nx,ny,nc = img.shape[:3]
    cdef float[:,:] ret = np.empty((nx-2,ny-2),dtype=np.float32) #get rid of the boundaries
    for ix in range(1,nx-1):
        for iy in range(1, ny-1):
            s=0
            s+=diff(img, ix, iy, nc, -1, 0) #left
            s+=diff(img, ix, iy, nc, +1, 0)#right
            s+=diff(img, ix, iy, nc, 0, +1)#up
            s+=diff(img, ix, iy, nc, 0, -1)#down
            ret[ix-1,iy-1] = s
    return ret