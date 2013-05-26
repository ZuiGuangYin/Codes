/**
*��Ŀ���ƣ�ͬѧͨѶ¼ϵͳ3.0
*���ܽ��ܣ����ļ��洢ͬѧ��Ϣ����������ɾ���ģ��鹦�ܣ�
*�������ڣ�2011��5��20��
*���ߣ������  
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define INSERT 1   //����ĳ��ͬѧ
#define QUERY 2    //����ĳ��ͬѧ 
#define UPDATE 3   //�޸�ĳ��ͬѧ
#define DELETE 4   //ɾ��ĳ��ͬѧ
#define LIST 5     //�г�����ͬѧ
#define QUIT 0     //�˳�ϵͳ 

FILE *fp;

typedef struct
{
        char name[100];      //ͬѧ����
        char addr[100];      //��ͥסַ
        char phone[100];     //��ϵ�绰
        char workfor[100];   //������λ 
} TX;

TX tx1[100];    //��¼ͬѧ¼�����飬���100��ͬѧ
int last=0;     //��ǰͬѧ¼������

void showMenu();
void doChoice();
int getChoice(); 
void doQuit();
void doInsert();
void doQuery();
void doUpdate();
void doDelete();
void doListAll();
void init();

int main(int argc, char *argv[])
{
  int choice;      //�û��Ĺ���ѡ��
  init();          //���ļ��ж����ʼ��ͬѧ¼��Ϣ
  
  while(1)
  {
          //1.��ʾ���ܲ˵�
          showMenu();
          
          //2.��ȡ�û�����ѡ��
          choice = getChoice();
          
          //3.����ѡ��ִ����Ӧ�Ĺ���
          doChoice(choice);
          
          //��ͣ�����û�������������������
           system("PAUSE");
  }
  	
  return 0;
}

void init()
{
     int i = 0;
     
     if((fp=fopen("tx1.dat","rb")) == NULL)
     {
         //printf("���ܴ�ͬѧ¼��Ϣ�ļ�tx1.dat,���飡");
         //exit(0);
         last = 0; //�����������ļ���ͬѧ¼Ϊ�� 
     }
     else
     {
         while(!feof(fp))
         {
             if(fread(&tx1[i],sizeof(TX),1,fp) == 1)
             {
                 //printf("��ȡ��%d��ͬѧ\n",i);
                 //system("pause");
                 i++;
             }
         }
         last = i;
     }
     fclose(fp);
}

void save()     //����ͬѧ¼���ļ�tx1.dat��
{
     int i = 0;
     
     if((fp = fopen("tx1.dat","wb")) == NULL)
     {
            printf("���ܴ�ͬѧ¼��Ϣ�ļ�tx1.dat,���飡");
            exit(0);
     }
     
     while(i < last)
     {
          fwrite(&tx1[i],sizeof(TX),1,fp);
          //printf("�����%d��ͬѧ\n",i);
          //system("pause");
          i++;        
     }
     fclose(fp);
 } 
 
 void showMenu()
 {
      system("cls"); //����DOS����cls����
      printf("=====ͬѧ¼������Ϣϵͳ======\n");
      printf("\t1.����ͬѧ��Ϣ\n");
      printf("\t2.����ͬѧ��Ϣ\n");
      printf("\t3.�޸�ͬѧ��Ϣ\n");
      printf("\t4.ɾ��ͬѧ��Ϣ\n");
      printf("\t5.�г�����ͬѧ\n");
      printf("\t0.�˳�ϵͳ\n");
      printf("===============================\n");
      printf("���������ѡ��0-5����"); 
 }
 
 void doQuit()
 {
      printf("\n��ӭ�´�ʹ�ñ�ϵͳ���ټ���");
      exit(0);
 }
  
 void doInsert()
 {
      printf("��������......\n");
      printf("������");
      scanf("%s",&tx1[last].name);
      printf("סַ��");
      scanf("%s",&tx1[last].addr);
      printf("�绰��");
      scanf("%s",&tx1[last].phone);
      printf("��λ��");
      scanf("%s",&tx1[last].workfor);
      printf("����ͬѧ�ɹ���\n");
      last++;                    //�ɹ�����һ��ͬѧ��������1.
      save(); 
 }
  
 void doUpdate()
 {
      char tname[100];           //��ʱ������������
      int i;
      int find = 0;              // �Ƿ��ҵ�ͬѧ
      
      printf("�����޸�......\n");
      printf("������Ҫ�޸ĵ�ͬѧ������");
      scanf("%s",&tname);
      
      for(i = 0; i< last && !find; i++)
      {
            if(!strcmp(tname,tx1[i].name))
            {
                find = 1;
                printf("���ҵ�ͬѧ��Ϣ���£�\n");
                printf("==============================\n");
                printf("������%s\t",tx1[i].name);
                printf("סַ��%s\t",tx1[i].addr);
                printf("�绰: %s\t",tx1[i].phone);
                printf("��λ��%s\n",tx1[i].workfor);
                printf("==================================\n");
                printf("\n�������޸ĺ����Ϣ:\n");
                printf("������");
                scanf("%s",&tx1[i].name);
                printf("סַ��");
                scanf("%s",&tx1[i].addr);
                printf("�绰��");
                scanf("%s",&tx1[i].phone);
                printf("��λ��");
                scanf("%s",&tx1[i].workfor);
            }
      }  
      if(!find)
      {
          printf("��Ǹ������Ϊ%s��ͬѧ��û����ͬѧ¼�С�",tname);
      }  
      else
      {
          printf("����Ϊ%s��ͬѧ����Ϣ�Ѿ��ɹ��޸ģ�",tname);
          save();
      }
 }
 
 void doListAll()
 {
      int i;
      printf("ͬѧ¼�й���%d��ͬѧ����Ϣ: \n",last);
      
      for(i = 0; i < last; i++)
      {
             printf("==============================\n");
             printf("������%s\t",tx1[i].name);
             printf("סַ��%s\t",tx1[i].addr);
             printf("�绰: %s\t",tx1[i].phone);
             printf("��λ��%s\n",tx1[i].workfor);
      }
      printf("=======================================\n");
 }
 
 void doQuery()
 {
      char tname[100];       //��ʱ������������ 
      int i;
      int find = 0;
      
      printf("�����ѯ��....\n");
      printf("������ͬѧ������");
      scanf("%s",&tname);
      
      for(i = 0;i < last && !find ;i++)
      {
            if(!strcmp(tname,tx1[i].name))
            {
                find = 1;
                printf("���ҵ�ͬѧ��Ϣ���£�\n");
                printf("==============================\n");
                printf("������%s\t",tx1[i].name);
                printf("סַ��%s\t",tx1[i].addr);
                printf("�绰: %s\t",tx1[i].phone);
                printf("��λ��%s\n",tx1[i].workfor);
                printf("==================================\n");
            }
      }
      if(!find)
      {
               printf("��Ǹ������Ϊ%s��ͬѧ��û����ͬѧ¼�С�",tname);
      }
 }
 
 void doDelete()
 {
      char tname[100];         //��ʱ�����ɾ��ͬѧ����
      int i;
      int find = 0;
      int index;               // ��¼��ɾͬѧ�������е��±�
      
      printf("����ɾ��....\n");
      printf("������ͬѧ������");
      scanf("%s",&tname);
      
      for(i = 0; i < last &&!find ; i++)
      {
            if(!strcmp(tname,tx1[i].name))
            {
                find = 1;
                index = i; //�洢��ɾ��ͬѧ���±�λ��
                break; 
            }
      } 
       if(!find)
      {
               printf("��Ǹ������Ϊ%s��ͬѧ��û����ͬѧ¼�С�",tname);
      }
      else
      {
          //ִ��ɾ����ͬѧ�Ĳ���
          for(i = index; i <= last;i++)
          {
                //��ԭ���ĵ�i+1��ͬѧ����Ϣ���Ƶ���i��λ��
                strcpy(tx1[i].name,tx1[i+1].name);
                strcpy(tx1[i].addr,tx1[i+1].addr);
                strcpy(tx1[i].phone,tx1[i+1].phone);
                strcpy(tx1[i].workfor,tx1[i+1].workfor); 
          } 
          last--;//ͬѧ¼�м���һ��ͬѧ
          printf("����Ϊ%s��ͬѧ��Ϣ�Ѿ��ɹ���ͬѧ¼��ɾ����",tname); 
          save();
      }
 }
 
int getChoice()
{
    int choice;
    
    scanf("%d",&choice);
    return choice;
}

void doChoice(int choice)
{
     printf("���ڴ����%d��ѡ��!\n",choice);
     switch(choice)
     {
         case INSERT:
              doInsert();
              break;
         case QUERY:
              doQuery();
              break;
         case UPDATE:
              doUpdate();
              break;
         case DELETE:
              doDelete();
              break;
         case LIST:
              doListAll();
              break;
         case QUIT:
              doQuit();
     }
}