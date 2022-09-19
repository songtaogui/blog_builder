+++
title = "window_UAC"
showall = true
summary = """
  how to setup UAC for windows users
  """

# img = "/assets/img/preview.jpg"  # preview
# hero = "/assets/img/cover.jpg"   # cover

hasnutshell = false
hasplotly = false
hasmermaid = false
tags = ["windows", "random"]
pubdate = Date("2017-04-13")
+++
{{page_tags}}


---

>2017年4月13日 更新: 用 [QuickAdmin](http://raymai97.github.io/QuickAdmin/index.html) 更强

---

Windows下 UAC(User Account Control，用户帐户控制) 可以帮助防止恶意软件和间谍软件在未经许可的情况下在计算机上进行安装或对计算机进行更改。但是，对于很多用户来说，这个功能也带来了很多困扰。其实除了停止UAC，还可以通过微软公司出品的Microsoft Application Compatibility Toolkit 5.6将信任程序加入系统白名单。

# 下载安装

[下载Application Compatibility Toolkit](http://www.microsoft.com/en-us/download/details.aspx?id=7352)

安装:

![](https://leanote.com/api/file/getImage?fileId=5860b3a7ab644175ca00483c)

# 配置白名单程序

安装成功后, 以管理员的权限运行`Compatibility Administrator`(有x32和x64两个版本,根据你的白名单程序打开对应版本):

在Custom DataBases中右键新建数据库，添加一个Application Fix:

![](https://leanote.com/api/file/getImage?fileId=5860b3a7ab644175ca00483b)

弹出窗口中:

**`填写程序名，公司名称，程序路径` -> `下一步` -> `勾选 "RunAsInvoker"` -> `一直下一步直到完成` -> `Save` -> `输入名字和路径` -> `File` -> `install` -> `完事!`**

![](https://leanote.com/api/file/getImage?fileId=5860b3a7ab644175ca00483f)

![](https://leanote.com/api/file/getImage?fileId=5860b3a7ab644175ca00483e)

![](https://leanote.com/api/file/getImage?fileId=5860b3a7ab644175ca00483d)


