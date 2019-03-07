# ImageAestheticsAnalysis
AADB AestheticsAnalysis

# 数据集处理 #

1. 有很多标签
2. 有很多图像的概率为0

	delZero.py 

	尚未解决非TXT的处理

# 产生LMDB#

- autoCreate.sh 参数为属性值
- 将会在特定目录产生LMDB

```
sh all.sh Repetition   #attibute
```
# createMean #

- make_imagenet_mean.sh 参数为属性值
- 将会在特定目录产生binaryproto文件

```
sh make_imagenet_mean.sh Repetition   #attibute
```
 