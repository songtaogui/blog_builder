+++
title = "photoshop_gif_wechat"
showall = true
summary = """
  用photoshop修改gif, 制作微信表情
  """

# img = "/assets/img/preview.jpg"  # preview
# hero = "/assets/img/cover.jpg"   # cover

hasnutshell = false
hasplotly = false
hasmermaid = false
tags = ["windows", "random"]
pubdate = Date("2016-12-29")
+++

{{page_tags}}

# 1. Photoshop 修改 GIF 

打开以后, 勾选:

`窗口`-`时间轴` 以显示时间轴:

![](https://leanote.com/api/file/getImage?fileId=5863666aab64417ecb0005f2)

时间轴可以更改每一帧的属性,如显示时间等

**删除帧**: shift多选后 点击时间轴上删除按钮:

![](https://leanote.com/api/file/getImage?fileId=5863666aab64417ecb0005f0)

**更改大小 和 裁剪** 跟普通图片操作一致(红圈为裁剪,蓝色选择为更改像素大小):

![](https://leanote.com/api/file/getImage?fileId=5863666aab64417ecb0005f1)

**保存**:

不能简单的`另存为..`,否则GIF不动!

应该选择`存储为web所用格式`, 可以预览,确认无误后 点存储:

![](https://leanote.com/api/file/getImage?fileId=5863666aab64417ecb0005f3)

![](https://leanote.com/api/file/getImage?fileId=5863666aab64417ecb0005ee)

# 2. PS 制作简单GIF

- 准备多张图片作为GIF的每一帧
- 导入到PS中:多个图层
- `时间轴` - `帧动画` - `复制时间轴` - `点击每个时间轴,设置要显示的图层,设置其他参数`
- 保存为web格式

**NOTE** 微信支持的GIF表情好像是不能超过1m大小的

# 3. 微信上的表情的GIF文件获取:

需要: 微信电脑版

打开微信电脑版`设置`中的`通用设置`,查看微信文件存储位置并打开该位置下的个人文件夹下的`CustomEmotions`目录:

![](https://leanote.com/api/file/getImage?fileId=586369b0ab644103a00005f6)

![](https://leanote.com/api/file/getImage?fileId=5863666aab64417ecb0005ef)

里面全是你存储的表情,但是没有后缀名,添加后缀名后可以打开,全部复制到另一个文件夹,添加后缀为`.gif` (就算有的表情是静态图,添加gif后缀也一样可以打开), 就Okay啦!


