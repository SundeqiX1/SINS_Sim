/*  File    : simomex.c
 *  Abstract:
 *
 *      Example mex file for single-input, two output state-space system.
 *
 *      Syntax  [sys, x0] = simomex(t,x,u,flag)
 *
 *  Copyright 1990-2013 The MathWorks, Inc.
 */

#define S_FUNCTION_NAME hydraulic_plant
#define S_FUNCTION_LEVEL 2

#include "simstruc.h"
#include "DataType.h"

#define U(element) (*uPtrs[element])  /* Pointer to Input Port0 */
//宏定义声明
#define N 32//32位二进制
#define J 8//8位阶码
#define W 24//24位尾数（1+23）

/*====================*
 * S-function methods *
 *====================*/

/* Function: mdlInitializeSizes ===============================================
 * Abstract:
 *    The sizes information is used by Simulink to determine the S-function
 *    block's characteristics (number of inputs, outputs, states, etc.).
 */
static void mdlInitializeSizes(SimStruct *S)
{
    ssSetNumSFcnParams(S, 0);  /* Number of expected parameters */
    if (ssGetNumSFcnParams(S) != ssGetSFcnParamsCount(S)) {
        return; /* Parameter mismatch will be reported by Simulink */
    }

    ssSetNumContStates(S, 3);
    ssSetNumDiscStates(S, 0);

    if (!ssSetNumInputPorts(S, 1)) return;
    ssSetInputPortWidth(S, 0, 29);
    //ssSetNumInputs(S, 7);
    ssSetInputPortDirectFeedThrough(S, 0, 0);

    if (!ssSetNumOutputPorts(S, 1)) return;
    ssSetOutputPortWidth(S, 0, 6);
    //ssSetNumOutputs(S, 2);
    ssSetNumSampleTimes(S, 1);
    ssSetNumRWork(S, 0);
    ssSetNumIWork(S, 0);
    ssSetNumPWork(S, 0);
    ssSetNumModes(S, 0);
    ssSetNumNonsampledZCs(S, 0);
    //ssSetSimStateCompliance(S, USE_DEFAULT_SIM_STATE);

    ssSetOptions(S, SS_OPTION_EXCEPTION_FREE_CODE);
}



/* Function: mdlInitializeSampleTimes =========================================
 * Abstract:
 *    S-function is comprised of only continuous sample time elements
 */
static void mdlInitializeSampleTimes(SimStruct *S)
{
    ssSetSampleTime(S, 0, CONTINUOUS_SAMPLE_TIME);
    ssSetOffsetTime(S, 0, 0.0);
    ssSetModelReferenceSampleTimeDefaultInheritance(S);
    
}



#define MDL_INITIALIZE_CONDITIONS
/* Function: mdlInitializeConditions ========================================
 * Abstract:
 *    Initialize continuous states to zero
 */
static void mdlInitializeConditions(SimStruct *S)
{
    real_T *x0 = ssGetContStates(S);
    int_T  i;

    for (i=0; i<2; i++) { 
        *x0++ = 0; 
    }
    
}



/* Function: mdlOutputs =======================================================
 * Abstract:
 *      y[0] = x[0] + x[1]
 *      y[1] = x[0] - 3.0 * x[1] + x[2] + u[0]
 */
static void mdlOutputs(SimStruct *S, int_T tid)
{
 
    real_T *y=ssGetOutputPortRealSignal(S,0);
    real_T *x=ssGetContStates(S);
    int i=0,j=0,k=0,t=0,JM=0;//i,j,k,t均为定义的循环变量，JM为阶码位移数
	float F=0;//定义最终的计算值（此处float精度有限，小数点后六位）
	int ax[N]={0};//定义arr数组用来存放32位二进制
    int xs[N]={0};
    int xss[N]={0};
	float bx[W]={0};//定义brr数组用来存放24位尾数
    for(i=0;i<29;i++)
    {
        xs[i]=(uint8)(x[i]);
        xss[i]=(uint8)(x[i]);
    }
    for(i=0;i<8;i++)//16进制转2进制
	{
	    ax[N-1-i]=xs[4]%2;
        ax[N-9-i]=xs[5]%2;
        ax[N-17-i]=xs[6]%2;
        ax[N-25-i]=xs[7]%2;
		xs[4]/=2;xs[5]/=2;xs[6]/=2;xs[7]/=2;
	}
    for(j=1;j<=J;j++)//计算8位阶码的十进制值
	{
	    JM=JM+ax[j]*pow((double)2,J-j);
	}
	JM-=127;//计算最终阶码的位移值
    bx[0]=1;//定义隐藏尾数位（第一位）
    for(k=1;k<W;k++)//存放23位尾数
	{
		bx[k]=ax[k+8];
	}
    for(t=1;t<=23;t++)//计算初值小数（0.……）
	{
		F=F+ax[t]/pow((double)2,t);
	}
   if(JM>0)//往右移位
		{
			F=F*pow((double)2,JM);
		}
		else if(JM<0)//往左移位
		{
			F=F/pow((double)2,(-1)*JM);
		}
    if(ax[0]==1)
   {
       F=(-1)*F;
   }
    y[0]=xss[0];
    y[1]=0;
    y[2]=0;
    y[3]=0;
    y[4]=0;
    y[5]=0;
}

#define MDL_DERIVATIVES
/* Function: mdlDerivatives =================================================
 * Abstract:
 *      Calculate state-space derivatives
 */
static void mdlDerivatives(SimStruct *S)
{

    real_T *dx=ssGetdX(S);
    real_T *x=ssGetContStates(S);
    InputRealPtrsType uPtrs = ssGetInputPortRealSignalPtrs(S,0);
    //UNUSED_ARG(tid);  
    
    
    
    dx[0]=x[1];
    dx[1]=U(0)*x[2]-U(1)*x[1]-U(6)+U(7);
    dx[2]=-U(2)*x[1]-U(3)*x[2]+U(4)*U(5);
    
    
}



/* Function: mdlTerminate =====================================================
 * Abstract:
 *    No termination needed, but we are required to have this routine.
 */
static void mdlTerminate(SimStruct *S)
{
    UNUSED_ARG(S); /* unused input argument */
}

#ifdef  MATLAB_MEX_FILE    /* Is this file being compiled as a MEX-file? */
#include "simulink.c"      /* MEX-file interface mechanism */
#else
#include "cg_sfun.h"       /* Code generation registration function */
#endif
