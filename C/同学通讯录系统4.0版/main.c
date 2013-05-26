/**
*��Ŀ���ƣ�ͬѧͨѶ¼ϵͳ4.0�� 
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

struct Node
{
        char name[100];      //ͬѧ����
        char addr[100];      //��ͥסַ
        char phone[100];     //��ϵ�绰
        char workfor[100];   //������λ 
        struct Node *next;
};

struct Node *tx1,*tail;    //tx1ָ���1��ͬѧ��tailָ�����һ��ͬѧ 
int last=0;     //��ǰͬѧ¼������

void showMenu();
void doChoice(int);
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
     struct Node *p;//��ʱ����ָ�� 
     tx1 = tail = NULL;
     
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
             if((p = (struct Node *)malloc(sizeof(struct Node))) == NULL)
             {
                   //�޷����뵽�ڴ棬ϵͳ���������˳� 
                 printf("ϵͳ�ڴ���ϣ����˳�����");
                 exit(0);
             }
             if(fread(p,sizeof(struct Node),1,fp) == 1)
             {
                 if(i == 0)
                 {
                      //��һ��ͬѧ
                      tx1 = tail = p; 
                 }
                 i++;
                 tail->next = p;
                 tail = p;
             }
         }
         tail->next = NULL;
         last = i;
     }
     fclose(fp);
}

void save()     //����ͬѧ¼���ļ�tx1.dat��
{
     struct Node *p = tx1;
     
     if((fp = fopen("tx1.dat","wb")) == NULL)
     {
            printf("���ܴ�ͬѧ¼��Ϣ�ļ�tx1.dat,���飡");
            exit(0);
     }
     
     while(p != NULL)
     {
          if(fwrite(p,sizeof(struct Node),1,fp) == 1);
          {
              p = p->next;
          }
             
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
      struct Node *p;  //��ʱ����ָ�� 
      if((p = (struct Node *)malloc(sizeof(struct Node))) == NULL)
      {
            printf("ϵͳ�ڴ�����������������ͬѧ��Ϣ��");
            return;
      } 
      printf("��������......\n");
      printf("������");
      scanf("%s",p->name);
      printf("סַ��");
      scanf("%s",p->addr);
      printf("�绰��");
      scanf("%s",p->phone);
      printf("��λ��");
      scanf("%s",p->workfor);
      printf("����ͬѧ�ɹ���\n");
      if(tail != NULL)
      {
              tail->next = p;//����ͬѧ����Ϣ����tx1�����β��
              tail = tail->next;//tail��Զָ�����һ��ͬѧ 
      }
      else
      {
          tx1 = tail = p;//��һ��ͬѧ 
      }
      tail->next = NULL;
      last++;                    //�ɹ�����һ��ͬѧ��������1.
      save(); 
 }
  
 void doUpdate()
 {
      char tname[100];           //��ʱ������������
      int find = 0;              // �Ƿ��ҵ�ͬѧ
      struct Node *p = tx1; //��ʱ����ָ�� 
      
      printf("�����޸�......\n");
      printf("������Ҫ�޸ĵ�ͬѧ������");
      scanf("%s",&tname);
      
      while((p != NULL) &&( !find))
      {
            if(!strcmp(tname,p->name))
            {
                find = 1;
                printf("���ҵ�ͬѧ��Ϣ���£�\n");
                printf("==============================\n");
                printf("������%s\t",p->name);
                printf("סַ��%s\t",p->addr);
                printf("�绰: %s\t",p->phone);
                printf("��λ��%s\n",p->workfor);
                printf("==================================\n");
                printf("\n�������޸ĺ����Ϣ:\n");
                printf("������");
                scanf("%s",p->name);
                printf("סַ��");
                scanf("%s",p->addr);
                printf("�绰��");
                scanf("%s",p->phone);
                printf("��λ��");
                scanf("%s",p->workfor);
            }
            p = p->next;
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
      struct Node *p = tx1; //��ʱ����ָ�� 
      printf("ͬѧ¼�й���%d��ͬѧ����Ϣ: \n",last);
      
      while(p != NULL)
      {
             printf("==============================\n");
             printf("������%s\t",p->name);
             printf("סַ��%s\t",p->addr);
             printf("�绰: %s\t",p->phone);
             printf("��λ��%s\n",p->workfor);
             p = p->next;
      }
      printf("=======================================\n");
 }
 
 void doQuery()
 {
      char tname[100];       //��ʱ������������ 
      int i;
      int find = 0;
      struct Node *p = tx1;
      
      printf("�����ѯ��....\n");
      printf("������ͬѧ������");
      scanf("%s",&tname);
      
      while((p != NULL)&& (!find))
      {
            if(!strcmp(tname,p->name))
            {
                find = 1;
                printf("���ҵ�ͬѧ��Ϣ���£�\n");
                printf("==============================\n");
                printf("������%s\t",p->name);
                printf("סַ��%s\t",p->addr);
                printf("�绰: %s\t",p->phone);
                printf("��λ��%s\n",p->workfor);
                printf("==================================\n");
            }
            p = p->next;
      }
      if(!find)
      {
               printf("��Ǹ������Ϊ%s��ͬѧ��û����ͬѧ¼�С�",tname);
      }
 }
 
 void doDelete()
 {
      char tname[100];         //��ʱ�����ɾ��ͬѧ����
      int find = 0;
      struct Node *p = tx1;
      struct Node *pre = tx1;
      
      printf("����ɾ��....\n");
      printf("������ͬѧ������");
      scanf("%s",&tname);
      
      while((p != NULL) &&!find)
      {
            if(!strcmp(tname,p->name))
            {
                find = 1;
                break; 
            }
            pre = p;
            p = p->next;
      } 
       if(!find)
      {
               printf("��Ǹ������Ϊ%s��ͬѧ��û����ͬѧ¼�С�",tname);
      }
      else
      {
          //ִ��ɾ����ͬѧ�Ĳ���
          if(p == pre)
          {
               tx1 = NULL;
               last = 0;
          }
          else
          {
              pre->next = p->next;
              last--;//ͬѧ¼�м���һ��ͬѧ
              printf("����Ϊ%s��ͬѧ��Ϣ�Ѿ��ɹ���ͬѧ¼��ɾ����",tname); 
              save();
          }
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