# TurnScreen
本项目只是示例如果打开一个新的ViewController默认是什么屏显示，并且可以旋转的方向或者不可旋转
针对在一个ViewController中对于设备坚模屏相互转换的相应处理并没有实现

# 声明
本项目代码主要参考学习了以下作品:  
1.[iOS旋转视图实践](http://rdc.taobao.org/?p=408)  
2.[How to force view controller orientation in iOS 8?](http://stackoverflow.com/questions/26357162/how-to-force-view-controller-orientation-in-ios-8)  
3.[总结如何在竖屏模式强制转换为横屏模式](http://www.cocoachina.com/bbs/read.php?tid-39663.html)  

# 使用

1.下载项目
``` bash
$ git clone git@github.com:caochuncheng/TurnScreen.git
```

2.Config.h可以配置坚屏和横屏方动启动
``` bash
#define kAppHomeViewController @"LandscapeViewController" //横屏
```
``` bash
#define kAppHomeViewController @"PortraitViewController" //坚屏
```

3.编译到开发机可以测试效果

# 小结
本项目目前会实现相好的效果，还需继续学习开发  
1.真机设备手动旋转与程序旋转同时触会出现，界面显示不正常情况  
2.真机设备旋转时，界面相应的处理还需理解和学习  



祝：开心、简单！