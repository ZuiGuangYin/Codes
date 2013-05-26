#使用python进行文本处理
#!/usr/bin/python
#coding=utf-8

f = open("d:\log.txt","r")

dl = ''.join(f.readlines()).split('='*82) #根据长'='字串分割产list

f.close()

d = {}

lc = 0

for p in dl: #遍历list中每个图片信息
	if p.strip().spliit('\n')[1].split('\\').__len__()==1:break

	#如果第二项不是一个图片路径，就跳过
	for i in p.strip.split('\n'):  #遍历图片信息各项属性
		if i.split('\t\t').__len__() <> 2:continue
		#如果不是属性和值的表示就执行下一个循环
		p,v = i.split('\t\t') #分离每个属性名称及数据值
		p = p.lstrip('\xef\xbb\xbf')
		if d.has_key(p):
			d[p] = d[p] + float(v)
		else:
			d[p] float(v)
	lc += 1  #记录统计的图片次数
print d

