#!/bin/bash
# Create the imagenet lmdb inputs
cd /home/graydove/Datasets/AADB
mkdir $1
#EXAMPLE为lmdb/leveldb路径
EXAMPLE=/home/graydove/Datasets/AADB/$1
#原始数据路径
DATA=/home/graydove/Datasets/AADB
TOOLS=/home/graydove/ZHY/caffe/.build_release/tools

TRAIN_DATA_ROOT=$DATA/originalSize_train/
VAL_DATA_ROOT=$DATA/originalSize_test/
LABEL_ROOT=$DATA/newImgList_label/


# Set RESIZE=true to resize the images to 256x256. Leave as false if images have
# already been resized using another tool.
RESIZE=true
if $RESIZE; then
  RESIZE_HEIGHT=227
  RESIZE_WIDTH=227
else
  RESIZE_HEIGHT=0
  RESIZE_WIDTH=0
fi

if [ ! -d "$TRAIN_DATA_ROOT" ]; then
  echo "Error: TRAIN_DATA_ROOT is not a path to a directory: $TRAIN_DATA_ROOT"
  echo "Set the TRAIN_DATA_ROOT variable in create_imagenet.sh to the path" \
       "where the ImageNet training data is stored."
  exit 1
fi

if [ ! -d "$VAL_DATA_ROOT" ]; then
  echo "Error: VAL_DATA_ROOT is not a path to a directory: $VAL_DATA_ROOT"
  echo "Set the VAL_DATA_ROOT variable in create_imagenet.sh to the path" \
       "where the ImageNet validation data is stored."
  exit 1
fi

rm -rf $EXAMPLE/train_lmdb
rm -rf $EXAMPLE/test_lmdb

echo "Creating train lmdb..."

GLOG_logtostderr=1 $TOOLS/convert_imageset \
    --resize_height=$RESIZE_HEIGHT \
    --resize_width=$RESIZE_WIDTH \
    --shuffle \
    $TRAIN_DATA_ROOT \
    $LABEL_ROOT/imgListTrainRegression_$1.txt \
    $EXAMPLE/train_lmdb \

echo "Creating test lmdb..."

GLOG_logtostderr=1 $TOOLS/convert_imageset \
   --resize_height=$RESIZE_HEIGHT \
   --resize_width=$RESIZE_WIDTH \
   --shuffle \
   $VAL_DATA_ROOT \
   $LABEL_ROOT/imgListTestRegression_$1.txt \
   $EXAMPLE/test_lmdb \

echo "Done."

