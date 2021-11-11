#include <stdio.h>
#include <math.h>

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
	printf("请输入要转换的16进制数：");
	scanf("%x",&H);//输入8个16进制数
	for(i=0;i<N;i++)//16进制转2进制
	{
	    arr[N-1-i]=H%2;
		H/=2;
	}
	for(j=1;j<=J;j++)//计算8位阶码的十进制值
	{
	    JM=JM+arr[j]*pow((double)2,J-j);
	}
	JM-=127;//计算最终阶码的位移值
	printf("阶码计算移位：%d\n",JM);
	brr[0]=1;//定义隐藏尾数位（第一位）
	for(k=1;k<W;k++)//存放23位尾数
	{
		brr[k]=arr[k+8];
	}
	for(t=1;t<=23;t++)//计算初值小数（0.……）
	{
		F=F+brr[t]/pow((double)2,t);
	}
	F=F+brr[0];//计算初值小数
	printf("初始值小数为：%lf\n",F);
	if(arr[0]==0)//最终数据为正数
	{
		if(JM>0)//往右移位
		{
			F=F*pow((double)2,JM);
		}
		else if(JM<0)//往左移位
		{
			F=F/pow((double)2,(-1)*JM);
		}
		else 
		F=1*F;
	}
	if(arr[0]==1)//最终数据为负数
	{
		if(JM>0)//往右移位
		{
			F=(-1)*F*pow((double)2,JM);
		}
		else if(JM<0)//往左移位
		{
			F=(-1)*F/pow((double)2,(-1)*JM);
		}
		else
		F=(-1)*F;
	}
	printf("最终%lf",F);//打印最终计算值
}