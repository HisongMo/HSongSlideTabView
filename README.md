# HSongSlideTabView
## 让TabView变的更酷!
### 1.展示效果
<br />
<div>
<img src="/DIsplayImage/noImgDisplay.gif" width = "250" height = "541" alt="" align=center />
<img src="/DIsplayImage/haveImgDisplay.gif" width = "250" height = "541" alt="" align=center />
<div />

### 2.使用
  
#### ①首先引入HSongSlideTabView
    import HSongSlideTabView
#### ②定义TabView样式
##### 无图标
    struct ContentView: View {
        let manager: Manager = Manager(leftTitle: "你好", rightTitle: "欢迎")
        var body: some View {
            HSongSlideTabView(manager: manager) {
                AView()
                BView()
            }
        }
    }
