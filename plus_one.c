#include <stdio.h>

int* plusOne(int* digits, int digitsSize, int* returnSize)
{
	int i;
	int* ren = (int*)malloc((digitsSize + 1)*sizeof(int));
	for (i = digitsSize - 1; i >= 0; i--)
	{
		if (digits[i] < 9)       //判斷進位
		{
			digits[i] = digits[i] + 1;
			break;
		}
		else                      //進位
		{
			digits[i] = 0;
		}
	}
	if (digits[0] == 0)    //增加陣列長度
	{
		int j;
		for (j = i; j < digitsSize + 1; j++)
		{
			ren[j] = 0;
		}
		ren[0] = 1;
		*returnSize = digitsSize + 1;
		return ren;
	}
	else                      //不增加陣列長度
	{
		for (int i = 0; i < digitsSize; i++)  //拷貝
		{
			ren[i] = digits[i];
		}
		*returnSize = digitsSize;
		return ren;
	}
}

void arryprint(int *arry, int* size)//列印函式
{
	for (int i = 0; i < (*size); i++)
	{
		printf("%d ", arry[i]);
	}
	printf("\n");
}

int main()
{
	int arry1[] = { 1, 2, 3 };
	int arry2[] = { 4, 3, 2, 1 };
	int arry3[] = { 9 };

	int *size1 = (int *)malloc(sizeof(int));
	int*rn1 = plusOne(arry1, 3, size1);
	arryprint(rn1, size1);

	int *size2 = (int *)malloc(sizeof(int));
	int*rn2 = plusOne(arry2, 4, size2);
	arryprint(rn2, size2);

	int *size3 = (int *)malloc(sizeof(int));
	int*rn3 = plusOne(arry3, 1, size3);
	arryprint(rn3, size3);
	
	system("pause");
	return 0;
}
