#encoding:utf-8
import os 
import os.path
basedir = "***/"
rootdir = basedir+"oddImgList_label"
newdir = basedir+"newImgList_label"

for parent,dirnames,filenames in os.walk(rootdir): #三个参数：分别返回1.父目录 2.所有文件夹名字（不含路径） 3.所有文件名字
    i=0
    for file in filenames:

        boolTxt = os.path.splitext(file)
        # while boolTxt[1] != "txt":
        #     continue
        #



        #In order not to damage the original tag file, 
        #create a new tag file with the same name in another folder
        
        # linux/unix：
        # if os.path.isfile(newdir+file) == 1:
        #     continue
        # else:
        #     os.mknod(newdir+file)

        OfileHandle = open(rootdir +"/"+ file, "r")
        # odd file
        NfileHandle = open(newdir+"/"+file, "w")
        #new file
        for fileLine in OfileHandle.readlines():
            fileLine = fileLine.strip()
            listFromLine = fileLine.split(' ')
            if listFromLine.__len__() == 2 and eval(listFromLine[1]) != 0:
                print(listFromLine)
                #
                NfileHandle.write(listFromLine[0]+" "+listFromLine[1])
                NfileHandle.write("\n" )

        print(file+"   is done")
        i+=1
        OfileHandle.close()
        NfileHandle.close()
print("There are"+str(i))
print("every thing  is done")
