#include <stdio.h>
#include <math.h>

//�궨������
#define N 32//32λ������
#define J 8//8λ����
#define W 24//24λβ����1+23��

int main(void)
{
	int i=0,j=0,k=0,t=0,JM=0;//i,j,k,t��Ϊ�����ѭ��������JMΪ����λ����
	float F=0;//�������յļ���ֵ���˴�float�������ޣ�С�������λ��
	unsigned int H=0;//���������16����������uint���FFFFFFFF��
	int arr[N]={0};//����arr�����������32λ������
	float brr[W]={0};//����brr�����������24λβ��
	printf("������Ҫת����16��������");
	scanf("%x",&H);//����8��16������
	for(i=0;i<N;i++)//16����ת2����
	{
	    arr[N-1-i]=H%2;
		H/=2;
	}
	for(j=1;j<=J;j++)//����8λ�����ʮ����ֵ
	{
	    JM=JM+arr[j]*pow((double)2,J-j);
	}
	JM-=127;//�������ս����λ��ֵ
	printf("���������λ��%d\n",JM);
	brr[0]=1;//��������β��λ����һλ��
	for(k=1;k<W;k++)//���23λβ��
	{
		brr[k]=arr[k+8];
	}
	for(t=1;t<=23;t++)//�����ֵС����0.������
	{
		F=F+brr[t]/pow((double)2,t);
	}
	F=F+brr[0];//�����ֵС��
	printf("��ʼֵС��Ϊ��%lf\n",F);
	if(arr[0]==0)//��������Ϊ����
	{
		if(JM>0)//������λ
		{
			F=F*pow((double)2,JM);
		}
		else if(JM<0)//������λ
		{
			F=F/pow((double)2,(-1)*JM);
		}
		else 
		F=1*F;
	}
	if(arr[0]==1)//��������Ϊ����
	{
		if(JM>0)//������λ
		{
			F=(-1)*F*pow((double)2,JM);
		}
		else if(JM<0)//������λ
		{
			F=(-1)*F/pow((double)2,(-1)*JM);
		}
		else
		F=(-1)*F;
	}
	printf("����%lf",F);//��ӡ���ռ���ֵ
}