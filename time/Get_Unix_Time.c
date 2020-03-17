/**************************************************************************
 * file name : Get_Unix_Time.c
 * author    : Dingjiang Zhou
 * date      : Nov 26th, 2012
 * purpose   : used in the matlab function, to get the system time by mex
 *             function, in order to replace the function "clock" in matalb
 *************************************************************************/

#include "mex.h"
#include <sys/time.h>

void mexFunction( int nlhs, mxArray* plhs[], int nrhs, const mxArray* prhs[] ) {
/* macros input output mapping            */
#define UnixTimeSec plhs[0]
#define UnixTimeuSec plhs[1]
    /* create space for the output variables  */
    UnixTimeSec  = mxCreateDoubleScalar( 1 );
    UnixTimeuSec = mxCreateDoubleScalar( 1 );

    struct timeval getTime;
    double *       seconds, *useconds;

    /* mapping to the output space            */
    seconds  = mxGetPr( UnixTimeSec );
    useconds = mxGetPr( UnixTimeuSec );

    /* the real C language section            */
    gettimeofday( &getTime, NULL );
    /* don't do experience at the end of the month    */
    seconds[0] = getTime.tv_sec - 1350000000;
    /* micro-second, us                               */
    useconds[0] = getTime.tv_usec;
    return;
}

/* usage
 * in matlab *.m file, use it as
 * [a,b]=Get_Unix_Time
 * then a is the second and b is the micro-second
 */
