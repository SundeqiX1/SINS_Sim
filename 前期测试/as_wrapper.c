

/*
 * Include Files
 *
 */
#if defined(MATLAB_MEX_FILE)
#include "tmwtypes.h"
#include "simstruc_types.h"
#else
#include "rtwtypes.h"
#endif

/* %%%-SFUNWIZ_wrapper_includes_Changes_BEGIN --- EDIT HERE TO _END */
#include <math.h>
#include <stdio.h>
/* %%%-SFUNWIZ_wrapper_includes_Changes_END --- EDIT HERE TO _BEGIN */
#define u_width 1
#define y_width 1
/*
 * Create external references here.  
 *
 */
/* %%%-SFUNWIZ_wrapper_externs_Changes_BEGIN --- EDIT HERE TO _END */
/* extern double func(double a); */
/* %%%-SFUNWIZ_wrapper_externs_Changes_END --- EDIT HERE TO _BEGIN */

/*
 * Output functions
 *
 */
void as_Outputs_wrapper(real_T *y0)
{
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_BEGIN --- EDIT HERE TO _END */
/* This sample sets the output equal to the input
      y0[0] = u0[0]; 
 For complex signals use: y0[0].re = u0[0].re; 
      y0[0].im = u0[0].im;
      y1[0].re = u1[0].re;
      y1[0].im = u1[0].im;
*/
//宏定义声明
#define N 32//32位二进制
#define J 8//8位阶码
#define W 24//24位尾数（1+23）

int main(void)
{
	int i=0,j=0,k=0,t=0,JM=0;//i,j,k,t均为定义的循环变量，JM为阶码位移数
	float F=0;//定义最终的计算值（此处float精度有限，小数点后六位）
	unsigned int H=0;//定义输入的16进制数（用uint最大FFFFFFFF）
	int arr[N]={0};//定义arr数组用来存放32位二进制
	float brr[W]={0};//定义brr数组用来存放24位尾数

for(i=0;i<8;i++)//16进制转2进制
	{
	    arr[N-1-i]=u0%2;
		H/=2;
	}
}
y0=arr[N]
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_END --- EDIT HERE TO _BEGIN */
}
