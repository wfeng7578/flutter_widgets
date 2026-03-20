# Material 系列

## 1. MaterialApp

------

### 一、概述

MaterialApp 是整个 Flutter 应用的**根组件**，负责初始化 Material Design 风格的全局环境，并统一管理主题、导航路由、国际化等应用级别的核心配置。

------

### 二、核心属性

| 属性名                         | 数据类型                        | 属性说明                                                     |
| :----------------------------- | :------------------------------ | :----------------------------------------------------------- |
| **home**                       | Widget                          | 应用启动后默认展示的第一个页面                               |
| **title**                      | String                          | 应用名称，显示在系统任务切换器（多任务列表）中               |
| **theme**                      | ThemeData                       | 应用的亮色（浅色）主题配置，统一控制全局颜色、字体、形状等视觉风格 |
| **darkTheme**                  | ThemeData                       | 应用的暗色（深色）主题配置                                   |
| **themeMode**                  | ThemeMode                       | 决定当前使用亮色主题、暗色主题还是跟随系统设置，默认跟随系统 |
| **color**                      | Color                           | 操作系统层面用于标识该应用的主色调                           |
| **routes**                     | Map<String, WidgetBuilder>      | 静态路由表，以名称为键、页面为值，预先注册应用中所有固定页面 |
| **initialRoute**               | String                          | 应用启动时要打开的第一个路由名称，与 routes 配合使用         |
| **onGenerateRoute**            | RouteFactory                    | 当跳转的路由名称在静态路由表中找不到时，由此函数动态生成路由 |
| **onUnknownRoute**             | RouteFactory                    | 所有路由匹配都失败后的最终兜底处理，通常用来展示"页面不存在"的提示 |
| **navigatorObservers**         | List<NavigatorObserver>         | 路由导航的观察者列表，可用于监听页面进出、埋点统计等         |
| **builder**                    | TransitionBuilder               | 在导航器之上、在整个页面外层再包裹一层自定义组件，常用于全局弹窗、适配文字缩放等 |
| **locale**                     | Locale                          | 手动指定应用当前使用的语言和地区                             |
| **localizationsDelegates**     | Iterable<LocalizationsDelegate> | 注册国际化翻译的代理，告诉应用去哪里查找各语言的翻译资源     |
| **supportedLocales**           | Iterable<Locale>                | 声明应用支持哪些语言和地区                                   |
| **debugShowCheckedModeBanner** | bool                            | 是否在右上角显示 "DEBUG" 横幅标签，默认开启，正式截图时通常关闭 |
| **scrollBehavior**             | ScrollBehavior                  | 全局滚动行为配置，可统一控制滚动物理效果、滚动条样式等       |
| **themeAnimationDuration**     | Duration                        | 切换主题时过渡动画的时长                                     |
| **themeAnimationCurve**        | Curve                           | 切换主题时过渡动画的速度曲线                                 |
| **shortcuts**                  | Map<ShortcutActivator, Intent>  | 全局键盘快捷键的映射表                                       |
| **actions**                    | Map<Type, Action>               | 全局意图与动作的映射表，与 shortcuts 搭配响应快捷键触发的行为 |

------

### 三、构造函数

#### MaterialApp.router

**使用场景**：当你采用声明式路由方案（例如配合 GoRouter 等第三方路由库）管理页面导航时，应使用此构造函数替代默认构造函数。它放弃了传统的命令式导航（即手动 push / pop 页面），转而将路由交给 Router 系统统一管理。

**独有核心参数**：

| 参数名                       | 数据类型                 | 参数说明                                                     |
| :--------------------------- | :----------------------- | :----------------------------------------------------------- |
| **routerConfig**             | RouterConfig             | 一次性传入完整的路由配置对象，内部已包含路由解析器和路由代理，是最推荐的简洁写法 |
| **routerDelegate**           | RouterDelegate           | 路由代理，负责根据当前路由状态构建对应的页面，当不使用 routerConfig 时才需单独提供 |
| **routeInformationParser**   | RouteInformationParser   | 路由信息解析器，负责将系统传入的原始路径字符串解析为应用可识别的路由数据 |
| **routeInformationProvider** | RouteInformationProvider | 路由信息提供者，负责监听和提供来自平台（如浏览器地址栏）的路由变化信息 |
| **backButtonDispatcher**     | BackButtonDispatcher     | 系统返回按钮的事件分发器，决定按下返回键时由谁来处理         |

> **要点**：如果你使用的路由库已经提供了完整的 routerConfig 对象，只需传入这一个参数即可，无需再分别设置 routerDelegate 和 routeInformationParser。





## 2. Scaffold

------

### 一、概述

Scaffold 是 Material Design 风格下**单个页面的骨架容器**，它预先划分好了顶部栏、底部栏、侧边栏、浮动按钮、主体内容等标准区域，开发者只需将对应组件放入指定位置即可快速搭建出一个完整的页面结构。

------

### 二、核心属性

| 属性名                             | 数据类型                     | 属性说明                                                     |
| :--------------------------------- | :--------------------------- | :----------------------------------------------------------- |
| **appBar**                         | PreferredSizeWidget          | 页面顶部的应用栏区域，通常放置标题、返回按钮、操作菜单等     |
| **body**                           | Widget                       | 页面的主体内容区域，是用户看到的核心显示区，占据除各栏位之外的全部剩余空间 |
| **floatingActionButton**           | Widget                       | 悬浮操作按钮，通常是一个圆形按钮，用于承载页面中最重要的那个操作 |
| **floatingActionButtonLocation**   | FloatingActionButtonLocation | 控制悬浮操作按钮在页面中的摆放位置，例如右下角、底部居中等   |
| **floatingActionButtonAnimator**   | FloatingActionButtonAnimator | 控制悬浮操作按钮在切换位置时的过渡动画效果                   |
| **drawer**                         | Widget                       | 从页面**左侧**滑出的侧边抽屉面板，常用于放置导航菜单         |
| **endDrawer**                      | Widget                       | 从页面**右侧**滑出的侧边抽屉面板，用法与 drawer 对称         |
| **bottomNavigationBar**            | Widget                       | 页面底部的导航栏区域，常用于放置多个标签页切换入口           |
| **bottomSheet**                    | Widget                       | 固定显示在页面底部的面板，不会随用户手势消失，适合展示持久性的补充信息 |
| **backgroundColor**                | Color                        | 整个 Scaffold 页面的背景颜色                                 |
| **resizeToAvoidBottomInset**       | bool                         | 当软键盘弹出时，是否自动调整 body 的大小以避免被键盘遮挡，默认为开启 |
| **extendBody**                     | bool                         | body 的内容是否向下延伸到 bottomNavigationBar 的背后，常用于实现底部栏半透明效果 |
| **extendBodyBehindAppBar**         | bool                         | body 的内容是否向上延伸到 appBar 的背后，常用于实现顶部栏透明、背景图贯穿顶部的效果 |
| **drawerEnableOpenDragGesture**    | bool                         | 是否允许用户通过从屏幕左边缘向右滑动来打开左侧抽屉，默认开启 |
| **endDrawerEnableOpenDragGesture** | bool                         | 是否允许用户通过从屏幕右边缘向左滑动来打开右侧抽屉，默认开启 |
| **drawerEdgeDragWidth**            | double                       | 从屏幕边缘向内多少像素范围内的滑动手势可以触发打开抽屉       |
| **persistentFooterButtons**        | List<Widget>                 | 固定显示在 body 下方、bottomNavigationBar 上方的一排按钮     |
| **onDrawerChanged**                | DrawerCallback               | 左侧抽屉的打开或关闭状态发生变化时触发的回调                 |
| **onEndDrawerChanged**             | DrawerCallback               | 右侧抽屉的打开或关闭状态发生变化时触发的回调                 |





## 3. Text

------

### 一、概述

Text 是 Flutter 中用于在界面上**显示一段文本内容**的基础组件，支持对文字的样式、对齐方式、行数限制及溢出处理等进行全面控制。

------

### 二、核心属性

| 属性名             | 数据类型      | 属性说明                                                     |
| :----------------- | :------------ | :----------------------------------------------------------- |
| **data**           | String        | 要显示的文本字符串，是默认构造函数的第一个必传参数           |
| **style**          | TextStyle     | 文字的视觉样式，详见下方补充说明                             |
| **textAlign**      | TextAlign     | 文本在水平方向上的对齐方式，如左对齐、居中、右对齐、两端对齐等 |
| **maxLines**       | int           | 文本最多显示的行数，超出后的处理方式由 overflow 决定         |
| **overflow**       | TextOverflow  | 文本溢出可见区域时的处理策略，如截断、省略号、渐隐等         |
| **softWrap**       | bool          | 文本遇到边界时是否自动换行，默认开启；关闭后文本将在单行内延伸 |
| **textDirection**  | TextDirection | 文本的书写方向，从左到右或从右到左                           |
| **textScaler**     | TextScaler    | 文本缩放因子，可在系统字体大小的基础上进一步控制文字缩放比例 |
| **selectionColor** | Color         | 文本被选中时的高亮背景颜色                                   |
| **semanticsLabel** | String        | 为无障碍辅助功能提供的替代朗读文本，屏幕阅读器会读出此内容而非实际显示的文字 |

------

#### TextStyle 常用子属性

style 属性接收一个 TextStyle 对象，它是控制文字外观的核心，以下是最常用的子属性：

| 子属性名            | 数据类型            | 属性说明                                                     |
| :------------------ | :------------------ | :----------------------------------------------------------- |
| **fontSize**        | double              | 字体大小，单位为逻辑像素                                     |
| **color**           | Color               | 文字颜色                                                     |
| **fontWeight**      | FontWeight          | 文字粗细程度，如正常、加粗、极细等                           |
| **fontStyle**       | FontStyle           | 是否使用斜体                                                 |
| **letterSpacing**   | double              | 每个字符之间的额外间距                                       |
| **wordSpacing**     | double              | 每个单词之间的额外间距                                       |
| **height**          | double              | 行高倍数，相对于字体大小的倍率值                             |
| **decoration**      | TextDecoration      | 装饰线类型，如下划线、删除线、上划线等                       |
| **decorationColor** | Color               | 装饰线的颜色                                                 |
| **decorationStyle** | TextDecorationStyle | 装饰线的样式，如实线、虚线、双线、波浪线等                   |
| **fontFamily**      | String              | 指定字体名称，可使用系统字体或项目中导入的自定义字体         |
| **shadows**         | List<Shadow>        | 文字阴影效果列表，可叠加多层阴影                             |
| **backgroundColor** | Color               | 文字背景色，紧贴文字区域填充                                 |
| **overflow**        | TextOverflow        | 在 TextStyle 层级控制溢出处理，效果与 Text 组件的 overflow 属性一致 |

------

### 三、构造函数

#### Text.rich

**使用场景**：当一段文本中需要出现**多种不同样式**时使用。例如同一行文字中部分加粗、部分变色，或在文字中间插入小图标，这类"富文本混排"需求就需要通过此构造函数，用多个 TextSpan 嵌套拼接来实现。

**独有核心参数**：

| 参数名       | 数据类型   | 参数说明                                                     |
| :----------- | :--------- | :----------------------------------------------------------- |
| **textSpan** | InlineSpan | 替代默认构造函数的纯字符串参数，接收一个文本片段树（通常为 TextSpan）。每个 TextSpan 可拥有独立的文字内容、样式和手势识别，并可嵌套子片段实现多层混排 |







## 4. Container

------

### 一、概述

Container 是一个**集尺寸、边距、装饰、变换于一体的综合型单子容器组件**，本质上是对 Padding、Align、DecoratedBox、ConstrainedBox、Transform 等多个基础组件的封装聚合，用于快速实现对子组件的尺寸控制与视觉修饰。

------

### 二、核心属性

| 属性名                   | 数据类型            | 属性说明                                                 |
| :----------------------- | :------------------ | :------------------------------------------------------- |
| **child**                | Widget?             | 容器内承载的唯一子组件                                   |
| **width**                | double?             | 容器的固定宽度（逻辑像素）                               |
| **height**               | double?             | 容器的固定高度（逻辑像素）                               |
| **color**                | Color?              | 容器背景色。与 decoration 互斥，不可同时使用             |
| **alignment**            | AlignmentGeometry?  | 子组件在容器内部的对齐方式                               |
| **padding**              | EdgeInsetsGeometry? | 内边距：容器内壁与子组件之间的间距                       |
| **margin**               | EdgeInsetsGeometry? | 外边距：容器外壁与周围其他组件之间的间距                 |
| **decoration**           | Decoration?         | 背景装饰（绘制在子组件下方），最常用类型为 BoxDecoration |
| **foregroundDecoration** | Decoration?         | 前景装饰（绘制在子组件上方），常用于遮罩效果             |
| **constraints**          | BoxConstraints?     | 额外的尺寸约束，可设定最小/最大宽高                      |
| **transform**            | Matrix4?            | 对容器整体施加矩阵变换，如旋转、缩放、平移               |
| **transformAlignment**   | AlignmentGeometry?  | 矩阵变换的锚点位置，默认左上角                           |
| **clipBehavior**         | Clip                | 子组件溢出容器装饰区域时的裁剪策略，默认为 Clip.none     |

------

#### 🔹 alignment 常用取值

| 取值                   | 说明     |
| :--------------------- | :------- |
| Alignment.topLeft      | 左上角   |
| Alignment.topCenter    | 顶部居中 |
| Alignment.topRight     | 右上角   |
| Alignment.centerLeft   | 左侧居中 |
| Alignment.center       | 正中央   |
| Alignment.centerRight  | 右侧居中 |
| Alignment.bottomLeft   | 左下角   |
| Alignment.bottomCenter | 底部居中 |
| Alignment.bottomRight  | 右下角   |

> 特别注意：一旦设置了 alignment，即使未指定宽高，Container 也会尽可能**撑满父级给予的空间**。

------

#### 🔹 padding / margin 常用构造方式（EdgeInsets）

| 构造方式                                   | 说明                               |
| :----------------------------------------- | :--------------------------------- |
| EdgeInsets.all(值)                         | 四边设置相同间距                   |
| EdgeInsets.symmetric(horizontal, vertical) | 水平方向与垂直方向分别设置对称间距 |
| EdgeInsets.only(left, top, right, bottom)  | 分别独立设置四边间距               |
| EdgeInsets.fromLTRB(左, 上, 右, 下)        | 按左、上、右、下顺序依次传入间距值 |

------

#### 🔹 decoration 常用子属性（BoxDecoration）

| 子属性名         | 数据类型              | 说明                                                         |
| :--------------- | :-------------------- | :----------------------------------------------------------- |
| **color**        | Color?                | 背景填充色（设置此项后，Container 顶层的 color 属性就不能再设） |
| **gradient**     | Gradient?             | 渐变填充，支持线性渐变、径向渐变、扫描渐变                   |
| **borderRadius** | BorderRadiusGeometry? | 圆角半径                                                     |
| **border**       | BoxBorder?            | 边框，可用 Border.all 统一设置或分别设置四边                 |
| **boxShadow**    | List<BoxShadow>?      | 阴影列表，每个 BoxShadow 可设颜色、偏移量、模糊半径、扩展半径 |
| **shape**        | BoxShape              | 形状，默认 BoxShape.rectangle（矩形），可选 BoxShape.circle（圆形）。选择圆形时不可再设 borderRadius |
| **image**        | DecorationImage?      | 背景图片，可设置填充模式、对齐方式等                         |

------

#### 🔹 constraints 常用构造方式（BoxConstraints）

| 构造方式                                                 | 说明                                     |
| :------------------------------------------------------- | :--------------------------------------- |
| BoxConstraints(minWidth, maxWidth, minHeight, maxHeight) | 分别设置最小/最大宽高                    |
| BoxConstraints.expand(width, height)                     | 强制容器撑满父级空间，可选传入固定宽高   |
| BoxConstraints.tightFor(width, height)                   | 将指定方向设为固定值，未指定方向保持自由 |

> 当同时设置了 width/height 与 constraints 时，width/height 会优先覆盖 constraints 中对应的值。

------

#### 🔹 clipBehavior 常用取值

| 取值                        | 说明                                 |
| :-------------------------- | :----------------------------------- |
| Clip.none                   | 不裁剪（默认值）                     |
| Clip.hardEdge               | 硬边裁剪，速度快但边缘无抗锯齿       |
| Clip.antiAlias              | 抗锯齿裁剪，边缘更平滑，性能略低     |
| Clip.antiAliasWithSaveLayer | 最高质量裁剪，性能开销最大，极少使用 |

------

#### 🔹 Container 的尺寸行为规则

| 条件                                    | 行为                               |
| :-------------------------------------- | :--------------------------------- |
| 无 child、无 width/height、无 alignment | 尽可能**撑满**父级空间             |
| 有 child、无 width/height、无 alignment | **收缩包裹**子组件                 |
| 有 alignment（无论有无 child）          | 尽可能**撑满**父级空间             |
| 设置了 width/height                     | 以指定尺寸为准，但仍受父级约束限制 |









## 5. Column

------

### 一、概述

Column 是一个将多个子组件沿**垂直方向（从上到下）**依次排列的多子组件布局容器，是 Flutter 中最基础、最高频的线性布局组件之一。

------

### 二、核心属性

| 属性名                 | 数据类型           | 属性说明                                                     |
| :--------------------- | :----------------- | :----------------------------------------------------------- |
| **children**           | List<Widget>       | 子组件列表，按列表顺序从上往下依次排列                       |
| **mainAxisAlignment**  | MainAxisAlignment  | 主轴（垂直方向）上子组件的排列与分布方式                     |
| **crossAxisAlignment** | CrossAxisAlignment | 交叉轴（水平方向）上子组件的对齐方式                         |
| **mainAxisSize**       | MainAxisSize       | 主轴方向上 Column 自身占据的空间大小策略                     |
| **verticalDirection**  | VerticalDirection  | 子组件在垂直方向上的排列起点，默认从上往下                   |
| **textDirection**      | TextDirection      | 交叉轴方向上的文本排列方向，影响 start/end 的具体朝向        |
| **textBaseline**       | TextBaseline?      | 文本基线对齐方式，当 crossAxisAlignment 设为 baseline 时必须指定 |

------

#### 🔹 mainAxisAlignment 常用取值

> 控制所有子组件在**垂直方向**上如何分布。

| 取值                           | 说明                                                         |
| :----------------------------- | :----------------------------------------------------------- |
| MainAxisAlignment.start        | 所有子组件靠顶部紧挨排列（默认值）                           |
| MainAxisAlignment.end          | 所有子组件靠底部紧挨排列                                     |
| MainAxisAlignment.center       | 所有子组件整体居中排列                                       |
| MainAxisAlignment.spaceBetween | 首尾子组件紧贴顶部和底部，中间剩余空间在子组件之间均分       |
| MainAxisAlignment.spaceAround  | 每个子组件两侧分配等量空间，首尾子组件与边缘的间距是相邻子组件间距的一半 |
| MainAxisAlignment.spaceEvenly  | 所有间距完全均等，包括首尾子组件与边缘的间距                 |

> 注意：mainAxisAlignment 只有在 Column 主轴方向存在**剩余空间**时才有可见效果。若 mainAxisSize 为 min 且子组件刚好填满，则分布效果不可见。

------

#### 🔹 crossAxisAlignment 常用取值

> 控制每个子组件在**水平方向**上如何对齐。

| 取值                        | 说明                                               |
| :-------------------------- | :------------------------------------------------- |
| CrossAxisAlignment.center   | 子组件在水平方向居中对齐（默认值）                 |
| CrossAxisAlignment.start    | 子组件靠左对齐（受 textDirection 影响）            |
| CrossAxisAlignment.end      | 子组件靠右对齐（受 textDirection 影响）            |
| CrossAxisAlignment.stretch  | 子组件在水平方向上被强制拉伸至与 Column 同宽       |
| CrossAxisAlignment.baseline | 按文本基线对齐，此时必须同时设置 textBaseline 属性 |

------

#### 🔹 mainAxisSize 常用取值

> 决定 Column 自身在垂直方向上占多大空间。

| 取值             | 说明                                          |
| :--------------- | :-------------------------------------------- |
| MainAxisSize.max | Column 尽可能撑满父级给予的垂直空间（默认值） |
| MainAxisSize.min | Column 仅收缩包裹所有子组件所需的最小垂直空间 |

------

#### 🔹 verticalDirection 常用取值

| 取值                   | 说明                                                         |
| :--------------------- | :----------------------------------------------------------- |
| VerticalDirection.down | 子组件从上往下排列（默认值）                                 |
| VerticalDirection.up   | 子组件从下往上排列，同时 mainAxisAlignment 的 start 与 end 含义也随之颠倒 |





## 6. Row

------

### 一、概述

Row 是一个将多个子组件沿**水平方向（从左到右）**依次排列的多子组件布局容器，与 Column 互为方向上的对应组件，是 Flutter 中最基础、最高频的线性布局组件之一。

------

### 二、核心属性

| 属性名                 | 数据类型           | 属性说明                                                     |
| :--------------------- | :----------------- | :----------------------------------------------------------- |
| **children**           | List<Widget>       | 子组件列表，按列表顺序从左往右依次排列                       |
| **mainAxisAlignment**  | MainAxisAlignment  | 主轴（水平方向）上子组件的排列与分布方式                     |
| **crossAxisAlignment** | CrossAxisAlignment | 交叉轴（垂直方向）上子组件的对齐方式                         |
| **mainAxisSize**       | MainAxisSize       | 主轴方向上 Row 自身占据的空间大小策略                        |
| **textDirection**      | TextDirection?     | 子组件在水平方向上的排列起点方向，影响 start/end 的具体朝向  |
| **verticalDirection**  | VerticalDirection  | 交叉轴方向上的排列起点，影响 crossAxisAlignment 中 start/end 的含义 |
| **textBaseline**       | TextBaseline?      | 文本基线对齐方式，当 crossAxisAlignment 设为 baseline 时必须指定 |

------

#### 🔹 mainAxisAlignment 常用取值

> 控制所有子组件在**水平方向**上如何分布。

| 取值                           | 说明                                                         |
| :----------------------------- | :----------------------------------------------------------- |
| MainAxisAlignment.start        | 所有子组件靠左紧挨排列（默认值，受 textDirection 影响）      |
| MainAxisAlignment.end          | 所有子组件靠右紧挨排列                                       |
| MainAxisAlignment.center       | 所有子组件整体居中排列                                       |
| MainAxisAlignment.spaceBetween | 首尾子组件紧贴左右两端，剩余空间在子组件之间均分             |
| MainAxisAlignment.spaceAround  | 每个子组件两侧分配等量空间，首尾子组件与边缘的间距是相邻子组件间距的一半 |
| MainAxisAlignment.spaceEvenly  | 所有间距完全均等，包括首尾子组件与边缘的间距                 |

> 注意：mainAxisAlignment 只有在 Row 主轴方向存在**剩余空间**时才有可见效果。

------

#### 🔹 crossAxisAlignment 常用取值

> 控制每个子组件在**垂直方向**上如何对齐。

| 取值                        | 说明                                               |
| :-------------------------- | :------------------------------------------------- |
| CrossAxisAlignment.center   | 子组件在垂直方向居中对齐（默认值）                 |
| CrossAxisAlignment.start    | 子组件靠顶部对齐（受 verticalDirection 影响）      |
| CrossAxisAlignment.end      | 子组件靠底部对齐                                   |
| CrossAxisAlignment.stretch  | 子组件在垂直方向上被强制拉伸至与 Row 同高          |
| CrossAxisAlignment.baseline | 按文本基线对齐，此时必须同时设置 textBaseline 属性 |

------

#### 🔹 mainAxisSize 常用取值

> 决定 Row 自身在水平方向上占多大空间。

| 取值             | 说明                                       |
| :--------------- | :----------------------------------------- |
| MainAxisSize.max | Row 尽可能撑满父级给予的水平空间（默认值） |
| MainAxisSize.min | Row 仅收缩包裹所有子组件所需的最小水平空间 |

------

#### 🔹 textDirection 常用取值

> 决定子组件的水平排列起点方向，同时影响 mainAxisAlignment 中 start/end 的朝向。

| 取值              | 说明                                                         |
| :---------------- | :----------------------------------------------------------- |
| TextDirection.ltr | 从左到右排列（默认值，跟随系统语言环境）                     |
| TextDirection.rtl | 从右到左排列，适用于阿拉伯语、希伯来语等从右向左书写的语言场景 |

------

## 7. Center

------

### 一、概述

Center 是一个将其子组件在自身空间内**水平和垂直同时居中对齐**的单子组件布局容器，本质上是 Align 组件在对齐方式固定为正中央时的便捷简写。

------

### 二、核心属性

| 属性名           | 数据类型 | 属性说明                                                     |
| :--------------- | :------- | :----------------------------------------------------------- |
| **child**        | Widget?  | 需要被居中放置的唯一子组件                                   |
| **widthFactor**  | double?  | 宽度收缩因子，Center 的宽度 = 子组件宽度 × widthFactor。不设置时，Center 会在水平方向上尽可能撑满父级空间 |
| **heightFactor** | double?  | 高度收缩因子，Center 的高度 = 子组件高度 × heightFactor。不设置时，Center 会在垂直方向上尽可能撑满父级空间 |

------

#### 🔹 尺寸行为规则

| 条件                               | 行为                                                         |
| :--------------------------------- | :----------------------------------------------------------- |
| 未设置 widthFactor 和 heightFactor | Center 在水平和垂直方向上都**撑满父级空间**，子组件处于正中央 |
| 设置了 widthFactor                 | Center 宽度收缩为子组件宽度的指定倍数，子组件在这个缩小后的区域内居中 |
| 设置了 heightFactor                | Center 高度收缩为子组件高度的指定倍数，子组件在这个缩小后的区域内居中 |
| 无 child，也无 factor              | Center 尽可能撑满父级全部空间                                |
| 无 child，设置了 factor            | 因子无法生效（无子组件尺寸可参照），Center 尺寸为零          |

> 关键理解：widthFactor 和 heightFactor 并不改变子组件本身的大小，只改变 Center 自身的大小，从而间接影响 Center 在父级中的占位范围。

------

## 8. Padding

------

### 一、概述

Padding 是一个专门用来给子组件添加**内边距**的布局组件，它在子组件与其父组件边界之间撑出一段空白区域，从而让子组件不会紧贴边缘显示。

------

### 二、核心属性

| 属性名      | 数据类型           | 属性说明                                                     |
| :---------- | :----------------- | :----------------------------------------------------------- |
| **padding** | EdgeInsetsGeometry | **必填属性**。定义内边距的大小与方向，决定子组件四周各留出多少空白空间。常用以下几种方式设置： |
|             |                    | ● `EdgeInsets.all(值)` — 四个方向设置相同的间距              |
|             |                    | ● `EdgeInsets.only(left, top, right, bottom)` — 单独指定某一侧或某几侧的间距，未指定的方向默认为零 |
|             |                    | ● `EdgeInsets.symmetric(vertical, horizontal)` — 按垂直方向和水平方向分别对称设置间距 |
|             |                    | ● `EdgeInsets.fromLTRB(左, 上, 右, 下)` — 按左、上、右、下的固定顺序依次指定四个方向的间距 |
| **child**   | Widget?            | 可选属性。放在 Padding 内部的那个子组件，也就是需要被添加内边距的目标组件 |

------





## 9. SizedBox

------

### 一、概述

SizedBox 是一个用来**强制指定固定宽度和/或高度**的布局组件，它可以给子组件施加精确的尺寸约束，也常被用作组件之间的固定间距占位。

------

### 二、核心属性

| 属性名     | 数据类型 | 属性说明                                                     |
| :--------- | :------- | :----------------------------------------------------------- |
| **width**  | double?  | 设置组件的固定宽度，单位为逻辑像素。若不指定则宽度由子组件自身或父级约束决定 |
| **height** | double?  | 设置组件的固定高度，单位为逻辑像素。若不指定则高度由子组件自身或父级约束决定 |
| **child**  | Widget?  | 可选属性。被包裹的子组件。若不放任何子组件，SizedBox 就充当一个纯粹的空白占位区域 |

------

### 三、构造函数

#### 1. SizedBox.expand

**场景**：希望组件尽可能撑满父级给予的全部可用空间时使用。

**说明**：无需手动设置宽高，该构造函数会自动将宽度和高度都设为无限大，从而在父级允许的范围内最大化扩展。

> 无独有参数，宽高均已被内部自动设定为无穷大。

------

#### 2. SizedBox.shrink

**场景**：希望组件收缩到尽可能小（宽高均为零）时使用，常用于需要一个"存在但不可见"的占位组件的情形。

**说明**：自动将宽度和高度都设为零。

> 无独有参数，宽高均已被内部自动设定为零。

------

#### 3. SizedBox.square

**场景**：需要创建一个**正方形**区域时使用，免去分别设置宽高的重复操作。

| 独有属性名    | 数据类型 | 属性说明                                 |
| :------------ | :------- | :--------------------------------------- |
| **dimension** | double?  | 正方形的边长，该值会同时作用于宽度和高度 |

------

#### 4. SizedBox.fromSize

**场景**：当你已经持有一个 Size 对象（包含宽和高的组合数据）时，可以直接传入，无需拆开再分别赋值。

| 独有属性名 | 数据类型 | 属性说明                                                     |
| :--------- | :------- | :----------------------------------------------------------- |
| **size**   | Size?    | 一个同时包含宽度和高度的尺寸对象，传入后会自动拆解并分别应用到宽和高上 |



## 10. Icon

------

### 一、概述

Icon 是一个用来**显示图标**的组件，它从图标字体库中渲染出一个指定的矢量图标，并支持自定义大小、颜色等视觉表现。

------

### 二、核心属性

| 属性名                     | 数据类型       | 属性说明                                                     |
| :------------------------- | :------------- | :----------------------------------------------------------- |
| **icon**（第一个位置参数） | IconData?      | 指定要显示的具体图标。Flutter 内置了 Material Design 图标库，通过 Icons 类可直接访问上千个现成图标，例如 Icons.home、Icons.search、Icons.settings 等 |
| **size**                   | double?        | 图标的尺寸，单位为逻辑像素，宽高相等。若不指定，默认值为 24.0 |
| **color**                  | Color?         | 图标的填充颜色。若不指定，会自动继承最近的 IconTheme 中设定的颜色；如果也没有 IconTheme，则跟随主题的默认图标颜色 |
| **semanticLabel**          | String?        | 语义标签，专门为无障碍辅助功能（如屏幕阅读器）提供对该图标的文字描述，不会在界面上显示 |
| **textDirection**          | TextDirection? | 控制图标的文本方向性。对于某些具有方向含义的图标（如箭头），可通过此属性指定其朝向应遵循从左到右还是从右到左的规则 |
| **fill**                   | double?        | 图标的填充程度，取值范围 0.0 到 1.0。0.0 为轮廓样式，1.0 为完全填充样式。仅对支持可变字体特性的图标有效 |
| **weight**                 | double?        | 图标笔画的粗细权重，数值越大笔画越粗。仅对支持可变字体特性的图标有效 |
| **opticalSize**            | double?        | 图标的光学尺寸，用于在不同显示大小下优化图标的视觉清晰度。仅对支持可变字体特性的图标有效 |
| **grade**                  | double?        | 图标的视觉重量等级，可在不改变整体尺寸的前提下微调笔画粗细，用于强调或弱化图标的视觉存在感。仅对支持可变字体特性的图标有效 |





## 11. Image

------

### 一、概述

Image 是一个用来**显示图片**的组件，它支持从多种来源（网络、本地资源、文件系统、内存）加载并渲染位图图像，同时提供丰富的尺寸适配与视觉控制能力。

------

### 二、核心属性

| 属性名             | 数据类型              | 属性说明                                                     |
| :----------------- | :-------------------- | :----------------------------------------------------------- |
| **image**          | ImageProvider         | **必填属性**。图片的数据来源提供者，负责告诉 Image 组件从哪里获取图片数据。实际使用中通常不直接操作此属性，而是通过命名构造函数自动生成 |
| **width**          | double?               | 图片的显示宽度，单位为逻辑像素。若不指定，则根据图片本身的固有宽度或父级约束来决定 |
| **height**         | double?               | 图片的显示高度，单位为逻辑像素。若不指定，则根据图片本身的固有高度或父级约束来决定 |
| **fit**            | BoxFit?               | 控制图片在给定宽高区域内的**缩放与裁剪方式**，常用取值如下： |
|                    |                       | ● `BoxFit.contain` — 等比缩放，完整显示图片，可能留白        |
|                    |                       | ● `BoxFit.cover` — 等比缩放，填满区域，超出部分裁剪          |
|                    |                       | ● `BoxFit.fill` — 拉伸填满区域，不保持比例，图片可能变形     |
|                    |                       | ● `BoxFit.fitWidth` — 以宽度为基准等比缩放                   |
|                    |                       | ● `BoxFit.fitHeight` — 以高度为基准等比缩放                  |
|                    |                       | ● `BoxFit.none` — 不缩放，以原始尺寸居中显示                 |
|                    |                       | ● `BoxFit.scaleDown` — 仅在图片超出区域时缩小，否则保持原始尺寸 |
| **alignment**      | AlignmentGeometry     | 当图片未完全填满显示区域时，控制图片在区域内的**对齐位置**，默认居中 |
| **repeat**         | ImageRepeat           | 当图片小于显示区域时，控制是否以及如何平铺重复。默认不重复。可选水平重复、垂直重复或双向重复 |
| **color**          | Color?                | 与 colorBlendMode 配合使用，对图片叠加一层颜色。单独使用时图片会被该颜色覆盖 |
| **colorBlendMode** | BlendMode?            | 定义 color 与图片之间的混合模式，例如叠加、正片叠底、滤色等，实现调色、着色等视觉效果 |
| **filterQuality**  | FilterQuality         | 图片缩放时的渲染质量。默认为 FilterQuality.low。值越高图片越平滑但性能开销越大 |
| **semanticLabel**  | String?               | 语义标签，为无障碍辅助功能提供图片的文字描述，不会在界面上显示 |
| **errorBuilder**   | Widget Function(...)? | 当图片加载失败时的回调，可返回一个替代组件来展示错误状态，避免界面出现空白或报错 |
| **loadingBuilder** | Widget Function(...)? | 图片加载过程中的回调，可返回一个加载中的占位组件（如进度指示器），提升用户等待体验 |
| **frameBuilder**   | Widget Function(...)? | 每一帧图片准备好时的回调，可用于实现淡入动画等过渡效果       |

------

### 三、构造函数

#### 1. Image.network

**场景**：从**网络 URL** 加载图片时使用，是最常见的远程图片加载方式。

| 独有属性名                | 数据类型             | 属性说明                                                     |
| :------------------------ | :------------------- | :----------------------------------------------------------- |
| **src**（第一个位置参数） | String               | 图片的网络地址，即完整的 URL 链接                            |
| **headers**               | Map<String, String>? | 发起网络请求时附带的 HTTP 请求头，适用于需要鉴权或携带自定义头信息的场景 |
| **scale**                 | double               | 图片的缩放因子，默认为 1.0。值为 2.0 时表示将图片当作二倍图处理，显示尺寸为实际像素的一半 |

------

#### 2. Image.asset

**场景**：加载**项目内置资源**图片时使用，图片需预先放置在项目目录中并在 pubspec.yaml 中声明。

| 独有属性名                 | 数据类型     | 属性说明                                         |
| :------------------------- | :----------- | :----------------------------------------------- |
| **name**（第一个位置参数） | String       | 资源图片的路径，与 pubspec.yaml 中声明的路径一致 |
| **package**                | String?      | 当图片资源来自某个依赖包时，需指定该包的名称     |
| **bundle**                 | AssetBundle? | 自定义资源包加载器，绝大多数情况下无需设置       |

------

#### 3. Image.file

**场景**：从设备的**本地文件系统**加载图片时使用，适用于用户拍照、下载到本地等场景获取的图片文件。

| 独有属性名                 | 数据类型 | 属性说明                                                     |
| :------------------------- | :------- | :----------------------------------------------------------- |
| **file**（第一个位置参数） | File     | 一个指向本地文件的 File 对象，指明图片文件在设备存储中的具体路径 |
| **scale**                  | double   | 图片的缩放因子，默认为 1.0                                   |

> 注意：此构造函数在 Web 平台上不可用。

------

#### 4. Image.memory

**场景**：从**内存中的二进制数据**直接加载图片时使用，适用于图片数据已经以字节形式存在于内存中的场景（如从数据库读取、解密后的图片数据等）。

| 独有属性名                  | 数据类型  | 属性说明                   |
| :-------------------------- | :-------- | :------------------------- |
| **bytes**（第一个位置参数） | Uint8List | 图片的原始字节数据         |
| **scale**                   | double    | 图片的缩放因子，默认为 1.0 |



## 12. ListView

------

### 一、概述

ListView 是 Flutter 中用于在单一方向（垂直或水平）上排列一组可滚动子元素的列表组件，是构建长列表、动态列表、信息流等场景最核心的滚动容器。

------

### 二、核心属性

| 属性名                      | 数据类型                          | 属性说明                                                     |
| :-------------------------- | :-------------------------------- | :----------------------------------------------------------- |
| **scrollDirection**         | Axis                              | 列表滚动方向。默认垂直滚动；设为水平则变成横向列表           |
| **reverse**                 | bool                              | 是否反转滚动方向。为 true 时列表从底部/右侧开始排列，常用于聊天界面 |
| **controller**              | ScrollController                  | 滚动控制器，可监听滚动位置、手动跳转到指定位置等             |
| **primary**                 | bool                              | 是否使用父级提供的主滚动控制器。为 true 时无需手动传 controller |
| **physics**                 | ScrollPhysics                     | 控制滚动的物理行为，如弹性回弹（BouncingScrollPhysics）、固定边界（ClampingScrollPhysics）、禁止滚动（NeverScrollableScrollPhysics） |
| **shrinkWrap**              | bool                              | 是否根据子元素总长度来决定自身尺寸，而非占满父容器。嵌套滚动视图时常需开启，但会牺牲性能 |
| **padding**                 | EdgeInsetsGeometry                | 列表内容区域的内边距，作用于整个列表而非单个子项             |
| **itemExtent**              | double                            | 强制指定每个子项在滚动方向上的固定尺寸。设定后滚动性能显著提升，因为框架无需逐个测量子项 |
| **prototypeItem**           | Widget                            | 提供一个原型子项，框架会测量它的尺寸并假设所有子项都一样大。与 itemExtent 作用类似但更灵活，两者不可同时使用 |
| **clipBehavior**            | Clip                              | 内容溢出时的裁剪方式。默认为硬边裁剪                         |
| **cacheExtent**             | double                            | 可视区域之外预渲染的像素范围。值越大预加载越多，滚动越流畅，但内存消耗更大 |
| **keyboardDismissBehavior** | ScrollViewKeyboardDismissBehavior | 滚动时是否自动收起键盘。可设为拖拽时收起，非常适合带输入框的列表页面 |

------

### 三、构造函数

#### 1. ListView（默认构造）

**场景：** 子项数量少且固定的短列表，如设置页面、关于页面。

**独有属性：**

| 属性名       | 数据类型     | 属性说明                                                     |
| :----------- | :----------- | :----------------------------------------------------------- |
| **children** | List<Widget> | 直接传入一个子组件列表。所有子项在构建时会被一次性全部创建，不具备懒加载能力 |

> **注意：** 因为一次性创建所有子项，当列表项超过几十个时会产生明显的性能问题，此时应改用 builder 构造。

------

#### 2. ListView.builder

**场景：** 子项数量较多或不确定的长列表，如商品列表、联系人列表、动态信息流。这是实际开发中使用频率最高的构造方式。

**独有属性：**

| 属性名          | 数据类型                           | 属性说明                                                     |
| :-------------- | :--------------------------------- | :----------------------------------------------------------- |
| **itemBuilder** | Widget Function(BuildContext, int) | 子项构建器。框架在需要显示某一项时才调用该函数，传入当前索引，按需创建，实现懒加载 |
| **itemCount**   | int                                | 列表子项的总数量。若不指定则视为无限列表，会持续调用构建器直到返回空值 |

> **核心优势：** 只有即将进入屏幕可视区域的子项才会被创建，滑出屏幕的子项会被销毁回收，内存占用极低。

------

#### 3. ListView.separated

**场景：** 需要在每两个子项之间插入分隔元素的列表，如带分割线的聊天列表、带间距装饰的卡片列表。

**独有属性：**

| 属性名               | 数据类型                           | 属性说明                                                     |
| :------------------- | :--------------------------------- | :----------------------------------------------------------- |
| **itemBuilder**      | Widget Function(BuildContext, int) | 与 builder 构造相同，按需构建每一个子项                      |
| **itemCount**        | int                                | 列表子项的总数量，此构造中为必传参数                         |
| **separatorBuilder** | Widget Function(BuildContext, int) | 分隔器构建函数。在第 n 项与第 n+1 项之间自动插入一个分隔组件，传入的索引为前一项的索引 |

> **与 builder 的区别：** 分隔元素独立于列表项存在，不占用 itemCount 的计数，逻辑更清晰。同样具备懒加载能力。

------

#### 4. ListView.custom

**场景：** 需要完全自定义子项的创建、复用和回收策略时使用，属于高级用法，日常开发中较少直接使用。

**独有属性：**

| 属性名               | 数据类型            | 属性说明                                                     |
| :------------------- | :------------------ | :----------------------------------------------------------- |
| **childrenDelegate** | SliverChildDelegate | 子项委托对象，由开发者自行实现子项的构建逻辑和生命周期管理，提供最大程度的灵活控制 |

> **定位：** 当 builder 和 separated 无法满足特殊需求（如需要保持特定子项状态不被销毁、自定义复用策略）时，才考虑此构造。





## 13. AppBar

------

### 一、概述

AppBar 是 Flutter 中位于页面顶部的应用栏组件，用于承载页面标题、导航按钮、操作按钮等核心信息，通常放置在 Scaffold 的 appBar 属性中。

------

### 二、核心属性

| 属性名                        | 数据类型             | 属性说明                                                     |
| :---------------------------- | :------------------- | :----------------------------------------------------------- |
| **leading**                   | Widget               | 标题栏最左侧的组件，通常用于放置返回按钮或菜单图标。若不设置，框架会根据上下文自动推断（如有侧边栏则显示菜单图标，有上一页则显示返回箭头） |
| **automaticallyImplyLeading** | bool                 | 是否允许框架自动推断 leading 的内容。默认为 true；设为 false 后即使有上一页也不会自动出现返回按钮 |
| **title**                     | Widget               | 标题栏的主标题区域，虽然通常放文字组件，但实际上可以放置任意组件，如搜索框、下拉选择器等 |
| **centerTitle**               | bool                 | 标题是否居中显示。在不同平台有不同默认值：iOS 默认居中，Android 默认靠左 |
| **actions**                   | List<Widget>         | 标题栏右侧的操作按钮列表，可放置多个图标按钮，如搜索、分享、更多菜单等，从左到右依次排列 |
| **bottom**                    | PreferredSizeWidget  | 标题栏底部附加区域，通常用于放置 TabBar 实现页签切换，该组件必须具备固定的首选尺寸 |
| **elevation**                 | double               | 标题栏底部阴影的高度。设为 0 则完全无阴影，呈现扁平效果      |
| **scrolledUnderElevation**    | double               | 当页面内容滚动到标题栏下方时所显示的阴影高度。Material 3 中默认会有此效果，设为 0 可禁用 |
| **shadowColor**               | Color                | 阴影的颜色。Material 3 中默认为透明，需手动设定颜色才能看到传统阴影效果 |
| **surfaceTintColor**          | Color                | Material 3 的表面着色层颜色，会在背景色之上叠加一层色调。设为透明色可消除 Material 3 默认的色调覆盖 |
| **backgroundColor**           | Color                | 标题栏的背景颜色                                             |
| **foregroundColor**           | Color                | 标题栏中文字和图标的默认颜色，一次性统一控制，无需逐个设置   |
| **toolbarHeight**             | double               | 标题栏工具区域的高度，默认为 56 逻辑像素。不包含 bottom 区域的高度 |
| **leadingWidth**              | double               | leading 组件的宽度限制，默认为 56 逻辑像素。当自定义 leading 内容较宽时需要调大此值 |
| **titleSpacing**              | double               | 标题与 leading 之间的水平间距。设为 0 可让标题紧贴 leading   |
| **shape**                     | ShapeBorder          | 标题栏的外形轮廓，可设置圆角等自定义形状                     |
| **systemOverlayStyle**        | SystemUiOverlayStyle | 控制状态栏（手机顶部显示时间、电量的区域）的图标和文字是亮色还是暗色，确保与标题栏背景形成对比不被遮挡 |
| **forceMaterialTransparency** | bool                 | 是否强制标题栏的材质层完全透明。为 true 时标题栏无任何背景填充和阴影，适合悬浮于内容之上的场景 |
| **clipBehavior**              | Clip                 | 内容溢出标题栏边界时的裁剪方式                               |
| **titleTextStyle**            | TextStyle            | 专门控制 title 组件中文字的样式，如字号、字重、颜色等        |
| **toolbarTextStyle**          | TextStyle            | 控制标题栏中除 title 以外其他文字组件的默认样式              |
| **iconTheme**                 | IconThemeData        | 标题栏中所有图标的默认主题，可统一设定图标大小、颜色、透明度 |
| **actionsIconTheme**          | IconThemeData        | 单独控制 actions 区域内图标的主题，优先级高于 iconTheme      |
| **flexibleSpace**             | Widget               | 填充在标题栏整个背后的组件，会覆盖从状态栏到标题栏底部的全部空间，常用于实现渐变背景或配合 SliverAppBar 实现伸缩效果 |



## 14. ElevatedButton

------

### 一、概述

ElevatedButton 是 Flutter 中带有背景填充色和阴影的凸起按钮组件，用于触发用户交互操作，在 Material Design 按钮体系中视觉层级最高，适合承载页面中的主要操作。

------

### 二、核心属性

| 属性名               | 数据类型                                 | 属性说明                                                     |
| :------------------- | :--------------------------------------- | :----------------------------------------------------------- |
| **onPressed**        | VoidCallback?                            | 按钮点击时触发的回调。设为 null 时按钮自动进入禁用状态，呈现灰色且不可交互 |
| **onLongPress**      | VoidCallback?                            | 按钮被长按时触发的回调                                       |
| **child**            | Widget?                                  | 按钮内部显示的内容，通常放置文字组件，也可放置任意组件组合   |
| **style**            | ButtonStyle?                             | 按钮的完整视觉样式对象，可精细控制以下常用子属性：           |
| ↳ backgroundColor    | WidgetStateProperty<Color?>              | 按钮背景填充色，可根据不同交互状态（按下、悬停、禁用等）返回不同颜色 |
| ↳ foregroundColor    | WidgetStateProperty<Color?>              | 按钮前景色，统一控制文字和图标的颜色                         |
| ↳ overlayColor       | WidgetStateProperty<Color?>              | 按下或悬停时覆盖在背景之上的水波纹/高亮色                    |
| ↳ elevation          | WidgetStateProperty<double?>             | 按钮阴影高度，可根据交互状态动态变化                         |
| ↳ padding            | WidgetStateProperty<EdgeInsetsGeometry?> | 按钮内容区域的内边距                                         |
| ↳ minimumSize        | WidgetStateProperty<Size?>               | 按钮的最小尺寸，默认有一个最小宽高限制                       |
| ↳ fixedSize          | WidgetStateProperty<Size?>               | 按钮的固定尺寸，设定后按钮不再自适应内容大小                 |
| ↳ maximumSize        | WidgetStateProperty<Size?>               | 按钮的最大尺寸上限                                           |
| ↳ side               | WidgetStateProperty<BorderSide?>         | 按钮的边框样式，可设置边框颜色、宽度                         |
| ↳ shape              | WidgetStateProperty<OutlinedBorder?>     | 按钮的外形轮廓，如圆角矩形、圆形、体育场形等                 |
| ↳ textStyle          | WidgetStateProperty<TextStyle?>          | 按钮内文字的字体样式，如字号、字重（注意颜色由 foregroundColor 控制） |
| ↳ iconColor          | WidgetStateProperty<Color?>              | 单独控制按钮内图标的颜色                                     |
| ↳ iconSize           | WidgetStateProperty<double?>             | 按钮内图标的大小                                             |
| ↳ shadowColor        | WidgetStateProperty<Color?>              | 阴影的颜色                                                   |
| ↳ surfaceTintColor   | WidgetStateProperty<Color?>              | Material 3 的表面色调叠加层颜色，设为透明可消除默认色调      |
| **autofocus**        | bool                                     | 页面构建时是否自动获取焦点，默认为 false                     |
| **clipBehavior**     | Clip                                     | 内容溢出按钮边界时的裁剪方式，默认不裁剪                     |
| **statesController** | WidgetStatesController?                  | 交互状态控制器，可从外部监听或主动控制按钮当前处于哪种交互状态（按下、悬停、聚焦等） |

> **关于 WidgetStateProperty：** ButtonStyle 中的大部分子属性并非固定值，而是一个"根据当前交互状态返回对应值"的响应式对象。这意味着同一个属性可以在按下、悬停、禁用等不同状态下呈现不同的视觉效果。可通过 WidgetStateProperty.all 快速设定所有状态统一的值，也可通过 WidgetStateProperty.resolveWith 对各状态分别定义。

------

### 三、构造函数

#### ElevatedButton.icon

**场景：** 需要在按钮中同时展示一个图标和一段文字的组合布局，图标在前、文字在后，自动处理好间距和对齐。

**独有属性：**

| 属性名    | 数据类型 | 属性说明                 |
| :-------- | :------- | :----------------------- |
| **icon**  | Widget   | 按钮前方的图标组件       |
| **label** | Widget   | 图标右侧的文字或内容组件 |

> **与默认构造的区别：** 默认构造使用 child 放置内容，需要自行组合图标与文字的排列；而 icon 构造函数通过 icon 和 label 两个独立属性自动完成图文排版，间距和对齐由框架内部处理。



## 15. TextField

------

### 一、概述

TextField 是 Flutter 中用于接收用户键盘输入的文本输入框组件，是表单场景中最基础、最高频使用的交互组件。

------

### 二、核心属性

#### 基础控制类

| 属性名     | 数据类型               | 属性说明                                                     |
| :--------- | :--------------------- | :----------------------------------------------------------- |
| controller | TextEditingController? | 文本控制器，用于读取、设置、监听输入框中的文本内容。若不传，组件内部会自动创建一个 |
| focusNode  | FocusNode?             | 焦点控制器，用于手动控制输入框的获焦与失焦，也可监听焦点变化 |
| autofocus  | bool                   | 页面加载后是否自动弹出键盘并聚焦到此输入框，默认为 false     |
| enabled    | bool?                  | 是否启用该输入框。设为 false 时，输入框变为灰色不可交互状态  |
| readOnly   | bool                   | 是否只读。与 enabled 的区别在于：只读状态下输入框仍可被选中、复制，但不可编辑 |

#### 外观装饰类

| 属性名       | 数据类型         | 属性说明                                                     |
| :----------- | :--------------- | :----------------------------------------------------------- |
| decoration   | InputDecoration? | 输入框的整体视觉装饰，是控制外观最重要的属性，详见下方子属性说明。设为 null 可移除所有装饰 |
| style        | TextStyle?       | 用户正在输入的文本的样式，如字号、颜色、字重等               |
| cursorColor  | Color?           | 光标的颜色                                                   |
| cursorWidth  | double           | 光标的粗细，默认为 2.0 逻辑像素                              |
| cursorRadius | Radius?          | 光标的圆角半径                                               |
| cursorHeight | double?          | 光标的高度                                                   |
| textAlign    | TextAlign        | 文本的水平对齐方式，默认为起始位置对齐                       |

**InputDecoration 高频子属性说明：**

| 子属性名       | 数据类型            | 属性说明                                                     |
| :------------- | :------------------ | :----------------------------------------------------------- |
| labelText      | String?             | 标签文字。未聚焦时显示在输入区内部，聚焦后自动缩小并浮动到输入框上方 |
| hintText       | String?             | 提示占位文字，输入内容后自动消失，类似"请输入手机号"这类引导语 |
| helperText     | String?             | 显示在输入框下方的辅助说明文字                               |
| errorText      | String?             | 显示在输入框下方的错误提示文字，一旦赋值，输入框边框自动变为红色错误样式 |
| prefixIcon     | Widget?             | 输入框内部最左侧的图标，如搜索图标、手机图标                 |
| suffixIcon     | Widget?             | 输入框内部最右侧的图标，常用于放置清除按钮或密码可见性切换按钮 |
| prefix         | Widget?             | 紧贴在输入文字左侧的自定义组件，仅在聚焦或有内容时才显示     |
| suffix         | Widget?             | 紧贴在输入文字右侧的自定义组件，仅在聚焦或有内容时才显示     |
| border         | InputBorder?        | 默认状态下的边框样式。常用 OutlineInputBorder（四周边框）和 UnderlineInputBorder（仅底部横线） |
| enabledBorder  | InputBorder?        | 启用但未聚焦状态下的边框样式                                 |
| focusedBorder  | InputBorder?        | 聚焦状态下的边框样式                                         |
| errorBorder    | InputBorder?        | 存在错误时且未聚焦状态下的边框样式                           |
| filled         | bool                | 是否填充输入框背景色，默认为 false                           |
| fillColor      | Color?              | 背景填充色，需将 filled 设为 true 才生效                     |
| contentPadding | EdgeInsetsGeometry? | 输入框内容区域的内边距                                       |
| constraints    | BoxConstraints?     | 对输入框整体施加宽高约束                                     |

#### 键盘与输入行为类

| 属性名               | 数据类型                  | 属性说明                                                     |
| :------------------- | :------------------------ | :----------------------------------------------------------- |
| keyboardType         | TextInputType?            | 弹出的键盘类型。如 number 弹数字键盘、emailAddress 弹带 @ 的键盘、phone 弹电话键盘等 |
| textInputAction      | TextInputAction?          | 键盘右下角动作按钮的类型，如 done（完成）、search（搜索）、next（下一项）、send（发送）等 |
| obscureText          | bool                      | 是否以圆点遮挡输入内容，用于密码输入场景，默认为 false       |
| obscuringCharacter   | String                    | 遮挡时使用的替代字符，默认为实心圆点"•"                      |
| autocorrect          | bool                      | 是否启用系统自动纠错功能，默认为 true                        |
| enableSuggestions    | bool                      | 是否启用键盘的输入建议（联想词），默认为 true                |
| inputFormatters      | List<TextInputFormatter>? | 输入格式化器列表，可实时拦截并改写用户的输入内容，如限制只能输入数字、自动插入空格等 |
| maxLength            | int?                      | 允许输入的最大字符数，设置后输入框右下角自动出现字数计数器   |
| maxLengthEnforcement | MaxLengthEnforcement?     | 超出最大字符数时的强制策略：直接截断、不限制、或截断但保留组合字符的完整性 |
| maxLines             | int?                      | 最大行数。默认为 1（单行）。设为 null 则不限行数，可无限换行 |
| minLines             | int?                      | 最小行数，输入框初始至少显示的行数高度                       |

#### 回调事件类

| 属性名            | 数据类型              | 属性说明                                                     |
| :---------------- | :-------------------- | :----------------------------------------------------------- |
| onChanged         | ValueChanged<String>? | 每次输入内容发生变化时立即触发，回传当前输入框中的完整文本   |
| onSubmitted       | ValueChanged<String>? | 用户按下键盘上的动作按钮（如完成、搜索）时触发               |
| onTap             | GestureTapCallback?   | 用户点击输入框时触发                                         |
| onTapOutside      | TapRegionCallback?    | 用户点击输入框外部区域时触发，常用于主动收起键盘             |
| onEditingComplete | VoidCallback?         | 用户按下键盘动作按钮时触发，与 onSubmitted 的区别在于它不回传文本内容，且默认行为会保持焦点 |

#### 文本选择与交互类

| 属性名                     | 数据类型                        | 属性说明                                                   |
| :------------------------- | :------------------------------ | :--------------------------------------------------------- |
| contextMenuBuilder         | EditableTextContextMenuBuilder? | 自定义长按或右键弹出的上下文菜单（如复制、粘贴、全选菜单） |
| enableInteractiveSelection | bool?                           | 是否允许用户通过长按或双击来选中文本，默认为 true          |
| selectionControls          | TextSelectionControls?          | 自定义文本选中时的拖拽手柄和工具栏样式                     |
| magnifierConfiguration     | TextMagnifierConfiguration?     | 文本选择时放大镜的配置                                     |
| undoController             | UndoHistoryController?          | 撤销与重做操作的控制器                                     |
| clipBehavior               | Clip                            | 内容溢出时的裁剪行为，默认为 hardEdge                      |





## 16. TextFormField

------

### 一、概述

TextFormField 是 TextField 的表单增强版，在保留所有文本输入能力的基础上，额外提供了数据校验、自动验证和与 Form 表单联动的能力，是构建登录、注册等表单页面的核心组件。

------

### 二、核心属性

#### 表单专属属性（TextFormField 独有）

| 属性名           | 数据类型                    | 属性说明                                                     |
| :--------------- | :-------------------------- | :----------------------------------------------------------- |
| validator        | FormFieldValidator<String>? | 校验函数。接收当前输入的文本，返回 null 表示校验通过，返回一个字符串则表示校验失败，该字符串会自动显示为输入框下方的红色错误提示 |
| onSaved          | FormFieldSetter<String>?    | 当所属的 Form 调用 save 方法时触发，通常用于将输入框的值统一收集保存到数据模型中 |
| autovalidateMode | AutovalidateMode?           | 自动校验的触发时机。详见下方说明                             |
| initialValue     | String?                     | 输入框的初始文本值。注意：当同时传入了 controller 时，不可再使用此属性，否则会报错，二者互斥 |

**AutovalidateMode 可选值说明：**

| 枚举值            | 说明                                                         |
| :---------------- | :----------------------------------------------------------- |
| disabled          | 不自动校验，只有在手动调用 Form 的 validate 方法时才触发校验 |
| always            | 始终自动校验，输入框一出现就立即执行校验                     |
| onUserInteraction | 用户首次与输入框交互之后才开始自动校验，这是最常用、体验最友好的模式 |
| onUnfocus         | 输入框失去焦点时自动触发校验                                 |

#### 继承自 TextField 的高频属性

TextFormField 内部包裹了一个 TextField，因此 TextField 的所有属性它都支持，以下仅列出日常最常用的部分作为速查：

| 属性名            | 数据类型                  | 属性说明                                                     |
| :---------------- | :------------------------ | :----------------------------------------------------------- |
| controller        | TextEditingController?    | 文本控制器，用于读取、设置、监听输入内容。注意与 initialValue 互斥，二者只能用其一 |
| focusNode         | FocusNode?                | 焦点控制器，用于手动控制聚焦、失焦及监听焦点状态             |
| decoration        | InputDecoration?          | 输入框的整体视觉装饰，控制边框、提示文字、图标等外观         |
| style             | TextStyle?                | 用户输入文本的样式                                           |
| keyboardType      | TextInputType?            | 弹出的键盘类型，如数字键盘、邮箱键盘等                       |
| textInputAction   | TextInputAction?          | 键盘右下角动作按钮的类型，如完成、搜索、下一项               |
| obscureText       | bool                      | 是否以圆点遮挡输入内容，用于密码场景                         |
| maxLength         | int?                      | 允许输入的最大字符数                                         |
| maxLines          | int?                      | 最大行数，默认为 1                                           |
| inputFormatters   | List<TextInputFormatter>? | 输入格式化器，用于实时拦截和改写用户的输入                   |
| enabled           | bool?                     | 是否启用该输入框                                             |
| readOnly          | bool                      | 是否只读                                                     |
| autofocus         | bool                      | 是否自动获取焦点                                             |
| onChanged         | ValueChanged<String>?     | 输入内容每次变化时立即触发                                   |
| onTap             | GestureTapCallback?       | 点击输入框时触发                                             |
| onTapOutside      | TapRegionCallback?        | 点击输入框外部时触发                                         |
| onEditingComplete | VoidCallback?             | 按下键盘动作按钮时触发，不回传文本                           |
| onFieldSubmitted  | ValueChanged<String>?     | 按下键盘动作按钮时触发，回传当前完整文本（等同于 TextField 的 onSubmitted） |

**InputDecoration 高频子属性速查：**

| 子属性名       | 数据类型            | 属性说明                                                     |
| :------------- | :------------------ | :----------------------------------------------------------- |
| labelText      | String?             | 浮动标签文字，聚焦时自动缩小上移                             |
| hintText       | String?             | 占位提示文字，有输入后自动消失                               |
| helperText     | String?             | 输入框下方的辅助说明文字                                     |
| errorText      | String?             | 手动设置的错误提示文字。但在 TextFormField 中通常不需要手动设置，因为 validator 返回的字符串会自动填入此处 |
| prefixIcon     | Widget?             | 输入框内部左侧图标                                           |
| suffixIcon     | Widget?             | 输入框内部右侧图标                                           |
| border         | InputBorder?        | 边框样式                                                     |
| filled         | bool                | 是否填充背景色                                               |
| fillColor      | Color?              | 背景填充色                                                   |
| contentPadding | EdgeInsetsGeometry? | 内容区域的内边距                                             |

------

### 三、构造函数

TextFormField 在 Flutter 3.x 中仅提供默认构造函数，没有其他命名构造函数。所有功能均通过上述属性直接配置。

------

> **与 TextField 的关系**

| 对比维度 | TextField                      | TextFormField                                   |
| :------- | :----------------------------- | :---------------------------------------------- |
| 本质     | 独立的文本输入组件             | 对 TextField 的封装，外层包裹了 FormField       |
| 校验能力 | 无内置校验，需自行实现         | 内置 validator，可直接声明校验规则              |
| 表单联动 | 不能与 Form 组件联动           | 可与 Form 配合，实现统一校验、统一保存          |
| 初始值   | 只能通过 controller 设置       | 可通过 initialValue 直接设置，也可用 controller |
| 适用场景 | 搜索框、聊天输入等独立输入场景 | 登录、注册、信息填写等需要校验的表单场景        |



## 17. GestureDetector

------

### 一、概述

GestureDetector 是 Flutter 中用于识别用户手势操作的组件，它本身不产生任何视觉效果，而是包裹在其他组件外层，为其赋予点击、双击、长按、拖拽、缩放等手势交互能力。

------

### 二、核心属性

#### 基础配置

| 属性名               | 数据类型         | 属性说明                                                     |
| :------------------- | :--------------- | :----------------------------------------------------------- |
| child                | Widget?          | 被包裹的子组件，手势识别的作用区域就是这个子组件所占据的范围 |
| behavior             | HitTestBehavior? | 命中测试行为，决定手势响应的区域规则，详见下方说明           |
| excludeFromSemantics | bool             | 是否将手势回调从语义树中排除，默认为 false。设为 true 后辅助功能（如屏幕阅读器）将忽略这些手势 |

**HitTestBehavior 可选值说明：**

| 枚举值       | 说明                                                         |
| :----------- | :----------------------------------------------------------- |
| deferToChild | 默认值。只有当手指触碰到 child 实际绘制的像素区域时才响应，空白区域不响应 |
| opaque       | 整个 GestureDetector 的范围都可响应手势，即使点击的是 child 以外的空白区域，同时会阻止事件继续向下层传递 |
| translucent  | 整个范围都可响应手势，但与 opaque 不同的是，事件仍会继续向下层组件传递 |

#### 点击手势回调

| 属性名                | 数据类型                            | 属性说明                                                     |
| :-------------------- | :---------------------------------- | :----------------------------------------------------------- |
| onTap                 | GestureTapCallback?                 | 单击（按下后快速抬起）时触发，最常用的手势回调               |
| onTapDown             | GestureTapDownCallback?             | 手指按下瞬间触发，回传按下位置等详细信息                     |
| onTapUp               | GestureTapUpCallback?               | 手指抬起瞬间触发，回传抬起位置等详细信息                     |
| onTapCancel           | GestureTapCancelCallback?           | 按下后手指滑出区域或被系统取消时触发，常用于重置按下态的视觉反馈 |
| onDoubleTap           | GestureTapCallback?                 | 快速双击时触发                                               |
| onDoubleTapDown       | GestureTapDownCallback?             | 双击中第二次按下时触发，回传位置信息                         |
| onDoubleTapCancel     | GestureTapCancelCallback?           | 双击过程被取消时触发                                         |
| onLongPress           | GestureLongPressCallback?           | 长按（按住不动达到一定时长）时触发                           |
| onLongPressStart      | GestureLongPressStartCallback?      | 长按开始时触发，回传起始位置信息                             |
| onLongPressMoveUpdate | GestureLongPressMoveUpdateCallback? | 长按后手指移动时持续触发，回传移动的位置信息                 |
| onLongPressEnd        | GestureLongPressEndCallback?        | 长按后手指抬起时触发                                         |
| onLongPressUp         | GestureLongPressUpCallback?         | 长按结束并抬起手指时触发，不回传位置信息                     |
| onSecondaryTap        | GestureTapCallback?                 | 鼠标右键单击时触发（桌面端场景）                             |
| onSecondaryTapDown    | GestureTapDownCallback?             | 鼠标右键按下时触发                                           |
| onSecondaryTapUp      | GestureTapUpCallback?               | 鼠标右键抬起时触发                                           |
| onSecondaryLongPress  | GestureLongPressCallback?           | 鼠标右键长按时触发                                           |
| onTertiaryTapDown     | GestureTapDownCallback?             | 鼠标中键按下时触发                                           |
| onTertiaryTapUp       | GestureTapUpCallback?               | 鼠标中键抬起时触发                                           |
| onTertiaryLongPress   | GestureLongPressCallback?           | 鼠标中键长按时触发                                           |

#### 拖拽手势回调（垂直方向）

| 属性名               | 数据类型                   | 属性说明                                           |
| :------------------- | :------------------------- | :------------------------------------------------- |
| onVerticalDragDown   | GestureDragDownCallback?   | 手指接触屏幕并可能开始垂直拖拽时触发               |
| onVerticalDragStart  | GestureDragStartCallback?  | 垂直拖拽正式开始时触发                             |
| onVerticalDragUpdate | GestureDragUpdateCallback? | 垂直拖拽过程中手指移动时持续触发，回传偏移量等信息 |
| onVerticalDragEnd    | GestureDragEndCallback?    | 垂直拖拽结束（手指抬起）时触发，回传速度等信息     |
| onVerticalDragCancel | GestureDragCancelCallback? | 垂直拖拽被取消时触发                               |

#### 拖拽手势回调（水平方向）

| 属性名                 | 数据类型                   | 属性说明                                 |
| :--------------------- | :------------------------- | :--------------------------------------- |
| onHorizontalDragDown   | GestureDragDownCallback?   | 手指接触屏幕并可能开始水平拖拽时触发     |
| onHorizontalDragStart  | GestureDragStartCallback?  | 水平拖拽正式开始时触发                   |
| onHorizontalDragUpdate | GestureDragUpdateCallback? | 水平拖拽过程中持续触发，回传偏移量等信息 |
| onHorizontalDragEnd    | GestureDragEndCallback?    | 水平拖拽结束时触发                       |
| onHorizontalDragCancel | GestureDragCancelCallback? | 水平拖拽被取消时触发                     |

#### 拖拽手势回调（任意方向）

| 属性名      | 数据类型                   | 属性说明                     |
| :---------- | :------------------------- | :--------------------------- |
| onPanDown   | GestureDragDownCallback?   | 手指接触屏幕时触发，不限方向 |
| onPanStart  | GestureDragStartCallback?  | 任意方向拖拽开始时触发       |
| onPanUpdate | GestureDragUpdateCallback? | 任意方向拖拽过程中持续触发   |
| onPanEnd    | GestureDragEndCallback?    | 任意方向拖拽结束时触发       |
| onPanCancel | GestureDragCancelCallback? | 任意方向拖拽被取消时触发     |

> **注意**：垂直拖拽、水平拖拽和任意方向拖拽三者之间互斥，不可同时监听。例如设置了 onPanUpdate，就不能再设置 onVerticalDragUpdate 或 onHorizontalDragUpdate。

#### 缩放手势回调

| 属性名        | 数据类型                    | 属性说明                                         |
| :------------ | :-------------------------- | :----------------------------------------------- |
| onScaleStart  | GestureScaleStartCallback?  | 缩放手势开始时触发（通常是双指触碰屏幕）         |
| onScaleUpdate | GestureScaleUpdateCallback? | 缩放过程中持续触发，回传缩放比例、旋转角度等信息 |
| onScaleEnd    | GestureScaleEndCallback?    | 缩放手势结束时触发                               |

> **注意**：缩放手势与任意方向拖拽（Pan 系列）互斥，不可同时使用。因为缩放手势在单指操作时实际上就等同于拖拽行为。

#### 力度按压回调（仅 iOS 支持 3D Touch 的设备）

| 属性名             | 数据类型                         | 属性说明                 |
| :----------------- | :------------------------------- | :----------------------- |
| onForcePressStart  | GestureForcePressStartCallback?  | 按压力度达到阈值时触发   |
| onForcePressPeak   | GestureForcePressPeakCallback?   | 按压力度达到最大值时触发 |
| onForcePressUpdate | GestureForcePressUpdateCallback? | 按压力度变化时持续触发   |
| onForcePressEnd    | GestureForcePressEndCallback?    | 力度按压结束时触发       |

> **使用要点提醒**

| 要点            | 说明                                                         |
| :-------------- | :----------------------------------------------------------- |
| 无视觉效果      | GestureDetector 本身不会渲染任何可见内容，也不会提供点击水波纹等反馈。若需要点击时的水波纹效果，应使用 InkWell 或 InkResponse |
| behavior 很关键 | 当 child 没有铺满 GestureDetector 的范围时，默认空白区域不响应点击。此时需将 behavior 设为 opaque 才能让整个区域都可点击 |
| 手势竞争机制    | 当多个 GestureDetector 嵌套或重叠时，Flutter 的手势竞技场机制会决定哪个手势胜出。通常内层组件优先获胜 |
| 与按钮的区别    | 按钮类组件（如 ElevatedButton）自带手势识别和视觉反馈。GestureDetector 适用于需要给任意非交互组件（如图片、容器、文字）添加手势的场景 |



## 18. SafeArea

------

### 一、概述

SafeArea 是一个自动为子组件添加内边距的组件，用于避免内容被设备的状态栏、刘海屏缺口、底部导航条、圆角等系统级遮挡区域所覆盖。

------

### 二、核心属性

| 属性名                    | 数据类型   | 属性说明                                                     |
| :------------------------ | :--------- | :----------------------------------------------------------- |
| child                     | Widget     | 被包裹的子组件，SafeArea 会确保该子组件被推移到安全区域内显示 |
| top                       | bool       | 是否避开顶部的系统遮挡区域（如状态栏、刘海缺口），默认为 true |
| bottom                    | bool       | 是否避开底部的系统遮挡区域（如 iPhone 底部的横条指示器），默认为 true |
| left                      | bool       | 是否避开左侧的系统遮挡区域（如横屏时的刘海），默认为 true    |
| right                     | bool       | 是否避开右侧的系统遮挡区域（如横屏时的刘海），默认为 true    |
| minimum                   | EdgeInsets | 各方向的最小内边距。当系统安全区间距小于此值时，使用此值；当系统安全区间距更大时，使用系统的值。默认为零 |
| maintainBottomViewPadding | bool       | 是否在软键盘弹出时仍保留底部安全区的内边距，默认为 false。设为 true 后，键盘弹出时底部不会因安全区消失而产生界面跳动 |

> **使用要点提醒**

| 要点               | 说明                                                         |
| :----------------- | :----------------------------------------------------------- |
| 工作原理           | SafeArea 内部通过读取 MediaQuery 提供的 viewPadding 数据，自动计算出各方向需要避让的距离，然后用 Padding 将子组件推入安全区域 |
| 典型场景           | 当页面不使用 Scaffold（或使用了 Scaffold 但内容需要延伸到状态栏区域）时，用 SafeArea 包裹页面根组件可以防止内容被遮挡 |
| 与 Scaffold 的关系 | Scaffold 的 AppBar 和 BottomNavigationBar 已经内部处理了安全区域，因此使用了这些组件时对应方向无需再套 SafeArea。但 Scaffold 的 body 部分默认不处理底部安全区，必要时仍需手动包裹 |
| 按方向精细控制     | 如果只想避开顶部状态栏而不避开底部，将 bottom 设为 false 即可；反之亦然。四个方向可独立开关 |
| minimum 的作用     | 当你希望安全区内边距至少为某个值时使用。例如设计要求内容距离屏幕边缘最少 16 像素，即使某些设备的安全区为 0，也能保证最小间距 |

## 19. Stack

### 一、概述

Stack 是一个允许多个子组件按层级**堆叠重叠**放置的布局组件，子组件按照列表顺序从底向上依次叠放，后声明的子组件显示在最上层。

------

### 二、核心属性

| 属性名           | 数据类型          | 属性说明                                                     |
| :--------------- | :---------------- | :----------------------------------------------------------- |
| **children**     | List<Widget>      | 子组件列表。列表中**越靠后**的子组件，在视觉上**越靠前**（覆盖在上方）。 |
| **alignment**    | AlignmentGeometry | 控制所有**未使用 Positioned 包裹**的子组件在 Stack 内的对齐方式。默认值为左上角对齐。常用取值如 center（居中）、bottomRight（右下）等。 |
| **fit**          | StackFit          | 决定**未使用 Positioned 包裹**的子组件如何确定自身尺寸。有三个取值：**loose** 表示子组件可以自行决定大小（默认值）；**expand** 表示子组件被强制撑满整个 Stack；**passthrough** 表示将 Stack 父级传来的约束原样传递给子组件。 |
| **clipBehavior** | Clip              | 控制子组件超出 Stack 边界时的裁剪行为。默认值为 **hardEdge**，即直接裁剪掉溢出部分。设为 **none** 则允许子组件超出边界可见。 |

> **关键补充 — Positioned 组件：**
>
> Positioned 是 Stack 的专属定位搭档，只能作为 Stack 的直接子组件使用。它通过 **top**、**bottom**、**left**、**right** 四个方向的距离值，将某个子组件精确钉在 Stack 内的指定位置。还可同时设定 **width** 和 **height** 来指定该子组件的尺寸。若同一轴向上同时设定了两端距离（例如同时设了 left 和 right），则子组件会被拉伸以满足两端约束。

------

### 三、核心要点

**Stack 的尺寸如何确定：**
Stack 会先找到所有**未被 Positioned 包裹**的子组件，从中选出最大的那个，以它的尺寸作为自身的尺寸。如果所有子组件都被 Positioned 包裹了，Stack 会尽可能撑到父级允许的最大尺寸。

**两类子组件的区别：**

- 未被 Positioned 包裹的子组件，统一受 alignment 和 fit 属性控制。
- 被 Positioned 包裹的子组件，完全由 Positioned 的方向距离值独立定位，不受 alignment 影响。



## 20. Positioned

### 一、概述

Positioned 是专门在 Stack 内部使用的定位组件，用于通过指定与 Stack 四条边的距离，将子组件精确放置到 Stack 中的任意位置。

------

### 二、核心属性

| 属性名     | 数据类型 | 属性说明                                                     |
| :--------- | :------- | :----------------------------------------------------------- |
| **child**  | Widget   | 需要被定位的子组件。                                         |
| **left**   | double?  | 子组件左边缘距离 Stack **左边缘**的距离。为 null 时表示不约束该方向。 |
| **right**  | double?  | 子组件右边缘距离 Stack **右边缘**的距离。为 null 时表示不约束该方向。 |
| **top**    | double?  | 子组件上边缘距离 Stack **上边缘**的距离。为 null 时表示不约束该方向。 |
| **bottom** | double?  | 子组件下边缘距离 Stack **下边缘**的距离。为 null 时表示不约束该方向。 |
| **width**  | double?  | 直接指定子组件的宽度。若同时设置了 left 和 right，则不可再设置 width，否则产生冲突。 |
| **height** | double?  | 直接指定子组件的高度。若同时设置了 top 和 bottom，则不可再设置 height，否则产生冲突。 |

> **尺寸约束的三种情况（以水平方向为例，垂直方向同理）：**
>
> - **只设 left 或只设 right**：子组件靠指定的一侧定位，宽度由子组件自身决定。
> - **同时设 left 和 right**：子组件被左右两端"拉住"，宽度由 Stack 宽度减去左右距离自动算出，子组件被拉伸。
> - **设一侧方向 + width**：子组件靠指定一侧定位，同时宽度被强制为 width 的值。

------

### 三、构造函数

#### 1. Positioned.fill

**场景：** 需要让子组件完全铺满整个 Stack 区域，或在四个方向上设置统一的内缩距离。

| 独有参数   | 说明                                                         |
| :--------- | :----------------------------------------------------------- |
| 无独有参数 | 它本质上是将 left、right、top、bottom 同时默认设为 **0**，从而让子组件撑满 Stack。你仍然可以手动修改其中任意方向的值来控制内缩距离。 |

------

#### 2. Positioned.directional

**场景：** 在需要适配从左到右（LTR）和从右到左（RTL）两种文字方向的国际化场景中使用。

| 独有参数          | 数据类型      | 说明                                                         |
| :---------------- | :------------ | :----------------------------------------------------------- |
| **textDirection** | TextDirection | 必填。指定文字方向为 LTR 或 RTL。                            |
| **start**         | double?       | 子组件在文字**起始方向**一侧与 Stack 边缘的距离。LTR 下等同于 left，RTL 下等同于 right。 |
| **end**           | double?       | 子组件在文字**结束方向**一侧与 Stack 边缘的距离。LTR 下等同于 right，RTL 下等同于 left。 |

------

### 四、核心要点

**使用限制：**
Positioned 只能作为 Stack（或其子类）的**直接子组件**，放在其他布局组件中会直接报错。

**与 alignment 的关系：**
一旦子组件被 Positioned 包裹，Stack 的 alignment 属性对该子组件**完全失效**，位置完全由 Positioned 的方向值控制。





## 21. Expanded

### 一、概述

Expanded 是一个用于在 Row、Column 或 Flex 内部，让子组件沿主轴方向**强制填满剩余可用空间**的弹性布局组件。

------

### 二、核心属性

| 属性名    | 数据类型 | 属性说明                                                     |
| :-------- | :------- | :----------------------------------------------------------- |
| **child** | Widget   | 需要被扩展填充的子组件。该子组件将被强制拉伸以占满分配到的空间。 |
| **flex**  | int      | 弹性权重因子，默认值为 **1**。当同一个 Row 或 Column 中存在多个 Expanded 时，剩余空间会按照各自 flex 值的**比例**进行分配。例如两个 Expanded 的 flex 分别为 1 和 2，则剩余空间按 1:2 分配。 |

------

### 三、核心要点

**剩余空间的计算方式：**
父级（如 Row 或 Column）会先让所有**非弹性子组件**（未被 Expanded 或 Flexible 包裹的组件）按自身尺寸完成布局，然后将主轴上剩下的全部空间，按 flex 比例分配给各个 Expanded 子组件。

**使用限制：**
Expanded 只能作为 Row、Column 或 Flex 的**直接子组件**使用，放在其他组件内部会直接报错。

**与 Flexible 的区别：**
Expanded 本质上是 Flexible 的一个特例——它等同于将 Flexible 的 fit 属性设为 FlexFit.tight。这意味着 Expanded 的子组件**必须**完全占满分配到的空间，不允许比分配空间更小。而 Flexible 默认的 fit 为 FlexFit.loose，子组件可以比分配空间小，只是不能超过分配空间。



## 22. SingleChildScrollView

### 一、概述

SingleChildScrollView 是一个当单个子组件的内容超出可视区域时，为其提供**滚动能力**的容器组件。

------

### 二、核心属性

| 属性名                      | 数据类型                          | 属性说明                                                     |
| :-------------------------- | :-------------------------------- | :----------------------------------------------------------- |
| **child**                   | Widget?                           | 需要被赋予滚动能力的单个子组件。通常内部会放置一个 Column 或 Padding 等包含大量内容的布局组件。 |
| **scrollDirection**         | Axis                              | 滚动方向。**Axis.vertical** 为垂直滚动（默认值），**Axis.horizontal** 为水平滚动。 |
| **reverse**                 | bool                              | 是否反转滚动方向。默认为 **false**。设为 true 时，内容从末尾开始显示，常用于聊天列表等需要默认定位到底部的场景。 |
| **padding**                 | EdgeInsetsGeometry?               | 在滚动区域内部、子组件外部添加内边距。建议直接在此处设置，而非在外部额外嵌套 Padding 组件，这样滚动条和边距的交互表现更自然。 |
| **physics**                 | ScrollPhysics?                    | 控制滚动的物理效果。常用取值：**BouncingScrollPhysics** 提供 iOS 风格的弹性回弹效果；**ClampingScrollPhysics** 提供 Android 风格的边缘阻尼效果；**NeverScrollableScrollPhysics** 完全禁止用户滚动。 |
| **controller**              | ScrollController?                 | 滚动控制器。用于监听滚动位置、手动跳转到指定位置、获取当前滚动偏移量等程序化控制需求。 |
| **primary**                 | bool?                             | 是否使用父级 PrimaryScrollController。当为 true 且未设置 controller 时，会自动关联祖先提供的主滚动控制器。垂直滚动方向下默认为 true（前提是未手动指定 controller）。 |
| **clipBehavior**            | Clip                              | 控制子组件超出滚动区域边界时的裁剪行为。默认值为 **Clip.hardEdge**，即裁剪溢出内容。 |
| **keyboardDismissBehavior** | ScrollViewKeyboardDismissBehavior | 控制滚动时是否自动收起键盘。**manual** 为默认值，不自动收起；**onDrag** 表示用户开始拖动滚动时自动收起键盘，在表单页面中非常实用。 |

------

### 三、核心要点

**适用场景：**
内容总量有限但可能超出屏幕的页面，例如表单页、设置页、详情页。当内容未超出可视区域时，不会产生滚动行为；超出时自动启用滚动。

**与 ListView 的区别：**
SingleChildScrollView 会**一次性**将所有子组件全部渲染，不具备懒加载能力。而 ListView 只渲染当前可视区域内的子项，具备按需构建和回收机制。因此，当列表项数量非常多或不确定时，应使用 ListView 而非 SingleChildScrollView。

**常见搭配：**
在 SingleChildScrollView 内部放置 Column 时，Column 的 mainAxisSize 应保持默认的 min，让 Column 的高度由内容撑开，这样滚动行为才能正常生效。





## 23. TextButton

### 一、概述

TextButton 是一个没有边框和背景色的纯文字按钮组件，用于触发优先级较低或辅助性的交互操作，如"取消"、"了解更多"、"跳过"等。

------

### 二、核心属性

| 属性名           | 数据类型      | 属性说明                                                     |
| :--------------- | :------------ | :----------------------------------------------------------- |
| **child**        | Widget        | 按钮内部显示的内容，通常是一个 Text 组件，也可以是 Icon 或任意自定义组合布局。 |
| **onPressed**    | VoidCallback? | 按钮被点击时触发的回调。设为 **null** 时按钮进入**禁用状态**，视觉上会自动变灰且无法响应点击。 |
| **onLongPress**  | VoidCallback? | 按钮被长按时触发的回调。与 onPressed 独立，两者可同时设置。  |
| **style**        | ButtonStyle?  | 按钮的完整样式配置对象，可精细控制按钮在不同状态下的外观。常用子属性如下： |
|                  |               | **foregroundColor** — 文字与图标的颜色。                     |
|                  |               | **backgroundColor** — 按钮背景色，TextButton 默认为透明。    |
|                  |               | **overlayColor** — 点击、悬停、聚焦时的水波纹叠加色。        |
|                  |               | **padding** — 按钮内边距。                                   |
|                  |               | **minimumSize** — 按钮最小尺寸，默认有一个最小点击区域（64×36）。 |
|                  |               | **shape** — 按钮形状，如圆角矩形、圆形等。                   |
|                  |               | **textStyle** — 按钮内文字的字体样式（字号、字重等，但颜色由 foregroundColor 控制）。 |
|                  |               | **side** — 边框样式，可为 TextButton 添加描边效果。          |
| **autofocus**    | bool          | 是否在页面加载时自动获取焦点，默认为 **false**。             |
| **clipBehavior** | Clip          | 内容超出按钮边界时的裁剪方式，默认为 **Clip.none**。         |

> **关于 ButtonStyle 中的 WidgetStateProperty：**
>
> style 中的大部分属性类型为 **WidgetStateProperty**，它可以根据按钮当前所处的状态（如正常、按下、悬停、禁用、聚焦）返回不同的值。快捷方式 **WidgetStateProperty.all()** 可为所有状态设置统一值，**WidgetStateProperty.resolveWith()** 则可根据不同状态分别返回不同值。

------

### 三、构造函数

#### TextButton.icon

**场景：** 需要创建一个同时包含图标和文字的文字按钮，图标在前、文字在后，无需手动组合 Row 布局。

| 独有参数          | 数据类型      | 说明                                                         |
| :---------------- | :------------ | :----------------------------------------------------------- |
| **icon**          | Widget        | 显示在文字前方的图标组件，通常传入一个 Icon。                |
| **label**         | Widget        | 显示在图标后方的文字组件，通常传入一个 Text。此参数替代了默认构造函数中的 child。 |
| **iconAlignment** | IconAlignment | 控制图标相对于 label 的位置，可设为 start 或 end，默认为 **start**（图标在前）。 |

------

### 四、核心要点

**与其他按钮的关系：**
Flutter 的 Material 3 按钮体系中，**ElevatedButton**（有阴影和背景色，用于最高优先级操作）、**FilledButton**（有背景色无阴影，用于高优先级操作）、**OutlinedButton**（有边框无背景色，用于中等优先级操作）、**TextButton**（无边框无背景色，用于最低优先级操作）四者共享完全一致的属性结构和 API，区别仅在于默认样式不同。

**全局样式定制：**
可以在 ThemeData 中通过 **textButtonTheme** 属性统一设置全局所有 TextButton 的默认样式，避免在每个按钮上重复配置 style。



## 24. IconButton

------

### 一、概述

IconButton 是一个以图标为视觉主体的可点击按钮，用于在界面中提供一个用户可交互的图标操作入口，点击后触发指定的回调逻辑。

------

### 二、核心属性

| 属性名             | 数据类型            | 属性说明                                                     |
| :----------------- | :------------------ | :----------------------------------------------------------- |
| **icon**           | Widget              | **必填。** 按钮内展示的图标内容，通常传入一个 Icon 组件      |
| **onPressed**      | VoidCallback?       | 用户点击按钮后执行的回调函数；传入 null 则按钮自动变为禁用态（变灰、不可点击） |
| **iconSize**       | double?             | 图标的尺寸，默认值为 24.0                                    |
| **color**          | Color?              | 图标的前景颜色（仅影响正常可用状态下的图标颜色）             |
| **tooltip**        | String?             | 长按或鼠标悬停时弹出的文字提示，用于辅助解释按钮含义         |
| **padding**        | EdgeInsetsGeometry? | 图标与按钮边界之间的内间距，默认为上下左右各 8 像素          |
| **constraints**    | BoxConstraints?     | 控制按钮的最小宽高约束，默认最小宽高均为 48 像素以满足 Material 可触摸区域规范 |
| **style**          | ButtonStyle?        | 全面控制按钮的视觉样式，包括背景色、前景色、形状、阴影、内边距、叠加层颜色等。优先级高于 color 等单项属性 |
| **isSelected**     | bool?               | 标记按钮当前是否处于选中状态；为 true 时按钮自动呈现选中态的视觉效果 |
| **selectedIcon**   | Widget?             | 当 isSelected 为 true 时替换显示的图标；未设置则选中态依然显示 icon 中的图标 |
| **alignment**      | AlignmentGeometry?  | 图标在按钮区域内的对齐方式，默认居中                         |
| **visualDensity**  | VisualDensity?      | 调整按钮的视觉密度，使其整体布局更紧凑或更宽松               |
| **enableFeedback** | bool?               | 是否在点击时触发设备的触觉反馈（如振动），默认为 true        |

------

### 三、构造函数

> 以下三个命名构造函数与默认构造函数的**参数列表完全一致**，不存在独有参数。它们的核心区别在于**默认视觉风格不同**，对应 Material 3 设计规范中四种不同等级的图标按钮样式。

------

#### 1. IconButton.filled

------

#### 2. IconButton.filledTonal

------

#### 3. IconButton.outlined



## 25. Card

------

### 一、概述

Card 是一个带有圆角、阴影和背景色的面板容器组件，用于将一组相关内容聚合包裹在一个视觉上独立的区域中呈现。

------

### 二、核心属性

| 属性名               | 数据类型            | 属性说明                                                     |
| :------------------- | :------------------ | :----------------------------------------------------------- |
| **child**            | Widget?             | 卡片内部承载的子组件内容，Card 本身不提供布局能力，通常在内部嵌套 Column、ListTile 等组件来组织内容结构 |
| **color**            | Color?              | 卡片的背景填充颜色，未设置时取当前主题中的 surface 颜色      |
| **elevation**        | double?             | 卡片的阴影高度，数值越大投影越明显、卡片看起来越"悬浮"；设为 0 则无阴影 |
| **shadowColor**      | Color?              | 阴影的颜色，可配合 elevation 一起调整阴影的视觉效果          |
| **surfaceTintColor** | Color?              | Material 3 下根据 elevation 自动叠加在背景上的色调覆盖色；设为透明色可关闭此效果 |
| **shape**            | ShapeBorder?        | 卡片的形状与边框，默认为带圆角的矩形（RoundedRectangleBorder）。可通过此属性自定义圆角半径或改为其他形状 |
| **margin**           | EdgeInsetsGeometry? | 卡片与外部周围元素之间的外间距，默认四周各 4 像素            |
| **clipBehavior**     | Clip?               | 内容超出卡片边界时的裁剪方式。默认不裁剪；当子组件可能溢出圆角区域时，建议设为 Clip.antiAlias 以沿圆角边缘平滑裁切 |

------

### 三、构造函数

> 以下两个命名构造函数与默认构造函数的**参数列表完全一致**，不存在独有参数。核心区别在于**默认呈现的视觉风格不同**，对应 Material 3 设计规范中三种卡片变体。

------

#### 1. Card.filled

------

#### 2. Card.outlined



## 26. ListTile

------

### 一、概述

ListTile 是一个固定结构的行级布局组件，用于将图标、标题、副标题、尾部操作等内容按照 Material 规范组织成一行标准化的列表项。

------

### 二、核心属性

| 属性名                 | 数据类型                  | 属性说明                                                     |
| :--------------------- | :------------------------ | :----------------------------------------------------------- |
| **title**              | Widget?                   | 列表项的主标题区域，通常放置一个 Text 组件，显示为最醒目的一行文字 |
| **subtitle**           | Widget?                   | 显示在 title 下方的副标题区域，通常用于补充说明信息，字号和颜色比标题更弱 |
| **leading**            | Widget?                   | 位于整行最前端（左侧）的组件，通常放置头像、图标等           |
| **trailing**           | Widget?                   | 位于整行最末端（右侧）的组件，通常放置箭头图标、开关、文字等 |
| **onTap**              | GestureTapCallback?       | 点击整个列表项时触发的回调函数；未设置时列表项不会有点击水波纹反馈 |
| **onLongPress**        | GestureLongPressCallback? | 长按整个列表项时触发的回调函数                               |
| **enabled**            | bool                      | 控制列表项是否可交互，设为 false 时整行变灰且 onTap、onLongPress 均不响应，默认为 true |
| **selected**           | bool                      | 标记列表项是否处于选中状态；为 true 时标题、图标等前景元素自动切换为主题选中色，默认为 false |
| **isThreeLine**        | bool                      | 是否允许副标题占据两行空间（使整个列表项呈现三行高度）。设为 true 时需确保 subtitle 不为空，默认为 false |
| **dense**              | bool?                     | 是否启用紧凑模式，为 true 时整行高度缩减、字号变小，适合信息密集的列表 |
| **contentPadding**     | EdgeInsetsGeometry?       | 列表项内容区域的水平内边距，默认左右各 16 像素               |
| **horizontalTitleGap** | double?                   | leading 组件与 title/subtitle 区域之间的水平间距，默认为 16 像素 |
| **minVerticalPadding** | double?                   | title/subtitle 区域与列表项上下边缘之间的最小垂直间距        |
| **minLeadingWidth**    | double?                   | leading 区域的最小宽度，默认为 40 像素                       |
| **tileColor**          | Color?                    | 列表项在正常状态下的背景颜色                                 |
| **selectedTileColor**  | Color?                    | 列表项在 selected 为 true 时的背景颜色                       |
| **selectedColor**      | Color?                    | 列表项在 selected 为 true 时，标题文字和图标等前景元素使用的颜色 |
| **iconColor**          | Color?                    | 正常状态下 leading 和 trailing 中图标的默认颜色              |
| **textColor**          | Color?                    | 正常状态下标题和副标题文字的默认颜色                         |
| **titleTextStyle**     | TextStyle?                | 直接指定 title 的文字样式，可精细控制字号、字重、行高等      |
| **subtitleTextStyle**  | TextStyle?                | 直接指定 subtitle 的文字样式                                 |
| **shape**              | ShapeBorder?              | 列表项的外形与边框，可自定义圆角等形状效果                   |
| **titleAlignment**     | ListTileTitleAlignment?   | 当列表项高度较大时，控制 title/subtitle 区域在垂直方向上的对齐方式（顶部、居中、跟随 leading 等） |
| **visualDensity**      | VisualDensity?            | 调节列表项的视觉密度，使整行在垂直和水平方向上更紧凑或更宽松 |



## 27. Flexible

### 一、概述

Flexible 是专门用在 Row、Column 或 Flex 内部的布局控制组件，它的作用是告诉父级"这个子组件可以按照一定的比例去分配剩余空间，并且允许子组件的实际尺寸小于所分配到的空间"。

------

### 二、核心属性

|  属性名   | 数据类型  | 属性说明                                                     |
| :-------: | :-------: | :----------------------------------------------------------- |
| **flex**  |   `int`   | 弹性因子，决定该子组件在剩余空间中占多少**份额**。默认值为 1。当同级存在多个 Flexible 时，各自按 flex 值的比例瓜分剩余空间。例如两个子组件 flex 分别为 2 和 1，则前者获得剩余空间的 2/3，后者获得 1/3 |
|  **fit**  | `FlexFit` | 控制子组件对所分配到的空间的**填充方式**。有两个可选值：① `FlexFit.loose`（默认）——子组件**可以**小于分配到的空间，按自身需要的大小展示；② `FlexFit.tight`——子组件**必须**完全填满分配到的空间，不留空隙 |
| **child** | `Widget`  | 被包裹的子组件，即需要参与弹性分配的那个组件                 |

------

### 三、关键理解要点

#### 1. 与 Expanded 的关系

Expanded 本质上就是一个 fit 被固定为 `FlexFit.tight` 的 Flexible。换句话说：

- **Flexible**（默认 loose）：分到空间后，子组件**不一定**撑满，可以更小。
- **Expanded**（强制 tight）：分到空间后，子组件**必须**撑满整个分配区域。

所以 Flexible 是更底层、更灵活的版本，Expanded 是它的一种特定快捷用法。

#### 2. 只能在特定父组件中使用

Flexible 只能作为 **Row、Column、Flex** 这三种弹性布局组件的直接子组件。放在其他任何组件内部都会报错。

#### 3. "剩余空间"的含义

父组件（如 Row）会先让所有**没有**被 Flexible 或 Expanded 包裹的子组件按自身大小排列，排完之后**剩下的空白区域**才是"剩余空间"。Flexible 的 flex 值只在这部分剩余空间上生效。

#### 4. flex 为 0 的特殊情况

当 flex 设为 0 时，该子组件不会参与剩余空间的分配，它会完全按照自身固有尺寸来展示，等同于没有被 Flexible 包裹。

## 28. InkWell

### 一、概述

InkWell 是一个矩形的可触摸响应区域，当用户点击时会在其表面产生 Material Design 规范的水波纹扩散效果，用于为任意子组件添加带视觉反馈的手势交互能力。

------

### 二、核心属性

|       属性名        |            数据类型             | 属性说明                                                     |
| :-----------------: | :-----------------------------: | :----------------------------------------------------------- |
|      **child**      |            `Widget?`            | 被包裹的子组件，即需要拥有点击水波纹效果的内容               |
|      **onTap**      |         `VoidCallback?`         | 单击回调。用户轻点一下时触发，是最常用的交互回调             |
|   **onDoubleTap**   |         `VoidCallback?`         | 双击回调。用户快速连点两下时触发                             |
|   **onLongPress**   |         `VoidCallback?`         | 长按回调。用户按住不松手一段时间后触发                       |
|    **onTapDown**    |    `GestureTapDownCallback?`    | 手指刚接触屏幕的瞬间触发，早于 onTap                         |
|     **onTapUp**     |     `GestureTapUpCallback?`     | 手指抬起的瞬间触发，晚于 onTapDown，早于 onTap               |
|   **onTapCancel**   |         `VoidCallback?`         | 手指按下后滑出区域或被系统中断时触发，表示本次点击被取消     |
|     **onHover**     |      `ValueChanged<bool>?`      | 鼠标指针进入或离开区域时触发（桌面端、Web 端常用），传入布尔值表示是否悬停中 |
|  **overlayColor**   | `WidgetStateProperty<Color?>?`  | 统一控制不同交互状态下的覆盖层颜色，包括按压时的水波纹色、高亮色、悬停色、聚焦色。它是一个状态感知属性，可以根据 pressed、hovered、focused 等状态返回不同颜色 |
|   **splashColor**   |            `Color?`             | 单独指定水波纹扩散时的颜色。若同时设置了 overlayColor 中的 pressed 状态颜色，则 overlayColor 优先 |
| **highlightColor**  |            `Color?`             | 单独指定按压时整个区域的高亮蒙层颜色。同样会被 overlayColor 覆盖 |
|   **hoverColor**    |            `Color?`             | 鼠标悬停时的背景色（桌面端/Web 端可见）                      |
|   **focusColor**    |            `Color?`             | 通过键盘获得焦点时的背景色                                   |
|  **splashFactory**  | `InteractiveInkFeatureFactory?` | 控制水波纹的样式与动画效果。可使用系统内置的 `InkRipple.splashFactory`（经典扩散）或 `InkSparkle.splashFactory`（Material 3 闪烁效果）等 |
|  **borderRadius**   |         `BorderRadius?`         | 为水波纹效果指定圆角裁剪范围，确保波纹不会溢出圆角容器       |
|  **customBorder**   |         `ShapeBorder?`          | 当区域不是简单圆角矩形时，可用此属性指定任意形状边界来裁剪波纹 |
|   **mouseCursor**   |         `MouseCursor?`          | 鼠标悬停时显示的光标样式，默认为手型指针                     |
| **enableFeedback**  |             `bool`              | 是否启用系统级的触觉/声音反馈，默认为 true                   |
| **canRequestFocus** |             `bool`              | 是否允许该组件获取焦点，默认为 true                          |

------

## 29. FloatingActionButton

### 一、概述

FloatingActionButton（简称 FAB）是一个悬浮在页面内容之上的圆形按钮，用于承载当前页面中最重要、最常用的那一个主要操作，是 Material Design 的核心交互组件之一。

------

### 二、核心属性

|         属性名         |    数据类型     | 属性说明                                                     |
| :--------------------: | :-------------: | :----------------------------------------------------------- |
|       **child**        |    `Widget?`    | 按钮内部显示的内容，通常放置一个 Icon 图标                   |
|     **onPressed**      | `VoidCallback?` | 点击按钮时触发的回调。设为 null 时按钮自动进入禁用状态，视觉上会变灰且不响应任何触摸 |
|      **tooltip**       |    `String?`    | 长按或鼠标悬停时弹出的文字提示，用于辅助说明按钮功能         |
|  **backgroundColor**   |    `Color?`     | 按钮的背景填充色                                             |
|  **foregroundColor**   |    `Color?`     | 按钮内部子组件（如图标、文字）的默认颜色                     |
|    **splashColor**     |    `Color?`     | 按下按钮时水波纹扩散的颜色                                   |
|     **elevation**      |    `double?`    | 按钮在常态下的阴影高度，数值越大投影越明显，悬浮感越强       |
| **highlightElevation** |    `double?`    | 按钮被按压时的阴影高度，通常设置为比 elevation 更大的值以增强按压反馈 |
|       **shape**        | `ShapeBorder?`  | 按钮的外形边框。默认在 Material 3 下为带圆角的矩形，可自定义为圆形、圆角矩形或其他任意形状 |
|        **mini**        |     `bool`      | 是否使用小尺寸版本。默认为 false（标准尺寸 56×56），设为 true 后缩小为 40×40 |
|      **heroTag**       |    `Object?`    | 页面跳转时的 Hero 动画标识。当同一页面存在多个 FAB 时，必须为每个 FAB 设置不同的 heroTag，否则会报错 |
|   **enableFeedback**   |     `bool?`     | 是否启用系统级触觉/声音反馈，默认为 true                     |
|    **mouseCursor**     | `MouseCursor?`  | 鼠标悬停时的光标样式（桌面端/Web 端适用）                    |

------

### 三、构造函数

#### 1. FloatingActionButton.small

**场景**：需要一个比 mini 更加精简紧凑的小型圆形 FAB 时使用，适合空间受限或次要操作场景。

**独有说明**：该构造函数内部自动将尺寸设为更小的规格，无需手动设置 mini 属性。

------

#### 2. FloatingActionButton.large

**场景**：需要一个比标准尺寸更大、更醒目的 FAB 时使用，适合需要强烈吸引用户注意力的首要操作。

**独有说明**：该构造函数内部自动将尺寸设为 96×96 的大型规格，图标也会相应放大。

------

#### 3. FloatingActionButton.extended

**场景**：当单个图标不足以表达按钮含义，需要同时展示图标和文字说明时使用。按钮形状从圆形变为药丸形（左右两端为半圆的矩形）。

|     属性名     | 数据类型  | 属性说明                                                     |
| :------------: | :-------: | :----------------------------------------------------------- |
|   **label**    | `Widget`  | 必填项，按钮上显示的文字内容，通常使用 Text 组件             |
|    **icon**    | `Widget?` | 显示在文字左侧的图标，可省略。省略后按钮只显示文字           |
| **isExtended** |  `bool`   | 控制按钮是否展开显示完整内容，默认为 true。设为 false 时按钮会收缩，可配合动画实现展开/收缩效果 |

## 30. Wrap

### 一、概述

Wrap 是一个流式布局组件，当子元素在主轴方向上排列空间不足时，会自动换到下一行（或下一列）继续排列。

------

### 二、核心属性

| 属性名                 | 数据类型             | 属性说明                                                     |
| :--------------------- | :------------------- | :----------------------------------------------------------- |
| **direction**          | `Axis`               | 主轴方向。设为水平时子元素从左到右排列，放不下则换行；设为垂直时子元素从上到下排列，放不下则换列。默认水平。 |
| **alignment**          | `WrapAlignment`      | 主轴方向上每一行（或每一列）内部子元素的对齐方式。可选值包括：起始对齐、居中对齐、末尾对齐、均匀分布等。默认起始对齐。 |
| **spacing**            | `double`             | 主轴方向上相邻子元素之间的间距。                             |
| **runAlignment**       | `WrapAlignment`      | 交叉轴方向上各行（或各列）之间的整体对齐方式。例如多行内容在垂直方向上是靠顶、居中还是靠底。默认起始对齐。 |
| **runSpacing**         | `double`             | 交叉轴方向上相邻行（或相邻列）之间的间距。                   |
| **crossAxisAlignment** | `WrapCrossAlignment` | 同一行（或同一列）内子元素在交叉轴方向上的对齐方式，例如当同一行中子元素高度不一致时，决定它们是顶部对齐、居中对齐还是底部对齐。默认起始对齐。 |
| **textDirection**      | `TextDirection`      | 水平方向的排列顺序，控制子元素是从左往右排还是从右往左排。主要影响国际化场景下阿拉伯语等右到左语言的布局。 |
| **verticalDirection**  | `VerticalDirection`  | 垂直方向的排列顺序，控制行的堆叠方向是从上往下还是从下往上。默认从上往下。 |
| **clipBehavior**       | `Clip`               | 当子元素超出 Wrap 边界时的裁剪行为。默认进行硬边缘裁剪。     |
| **children**           | `List<Widget>`       | 需要进行流式排列的子组件列表。                               |

## 31. Align

### 一、概述

Align 是一个用于控制单个子组件在其父组件空间内精确定位对齐方式的布局组件。

------

### 二、核心属性

| 属性名           | 数据类型            | 属性说明                                                     |
| :--------------- | :------------------ | :----------------------------------------------------------- |
| **alignment**    | `AlignmentGeometry` | 控制子组件在父组件空间中的对齐位置。默认居中。常用取值见下方补充说明。 |
| **widthFactor**  | `double?`           | 宽度因子。设定后，Align 自身的宽度等于子组件宽度乘以该因子。不设定时，Align 会尽可能占满父组件给予的最大宽度。 |
| **heightFactor** | `double?`           | 高度因子。设定后，Align 自身的高度等于子组件高度乘以该因子。不设定时，Align 会尽可能占满父组件给予的最大高度。 |
| **child**        | `Widget?`           | 需要被对齐的子组件。                                         |

#### alignment 常用取值说明

| 取值                     | 含义             |
| :----------------------- | :--------------- |
| `Alignment.topLeft`      | 左上角           |
| `Alignment.topCenter`    | 顶部居中         |
| `Alignment.topRight`     | 右上角           |
| `Alignment.centerLeft`   | 左侧居中         |
| `Alignment.center`       | 正中心（默认值） |
| `Alignment.centerRight`  | 右侧居中         |
| `Alignment.bottomLeft`   | 左下角           |
| `Alignment.bottomCenter` | 底部居中         |
| `Alignment.bottomRight`  | 右下角           |

> **补充**：alignment 的坐标体系以父组件的中心为原点，水平方向从 -1.0（最左）到 1.0（最右），垂直方向从 -1.0（最上）到 1.0（最下）。因此除了上述九个预设值外，也可以传入任意小数来实现更精细的自定义定位。





## 32. Spacer

### 一、概述

Spacer 是一个专门用在 Flex 布局（Row、Column、Flex）中占据剩余可用空间的空白弹性组件。

------

### 二、核心属性

| 属性名   | 数据类型 | 属性说明                                                     |
| :------- | :------- | :----------------------------------------------------------- |
| **flex** | `int`    | 弹性权重值，决定该 Spacer 占据剩余空间的比例。默认值为 1。当存在多个 Spacer 或 Expanded 时，各自按照 flex 值的比例瓜分剩余空间。 |

> **补充说明**：Spacer 本质上是一个内部没有子组件的 Expanded。它不渲染任何可见内容，唯一的作用就是"撑开空白区域"。因此它只能作为 Row、Column 或 Flex 的直接子组件使用，放在其他组件内部会报错。

## 33. Divider

### 一、概述

Divider 是一个用于在垂直方向的布局中绘制水平分隔线的组件，常用于在列表项或内容块之间添加视觉分隔。

------

### 二、核心属性

| 属性名        | 数据类型  | 属性说明                                                     |
| :------------ | :-------- | :----------------------------------------------------------- |
| **height**    | `double?` | Divider 组件自身占据的总高度，即分隔线加上其上下空白区域的总和。注意这不是线条的粗细，而是整个组件在垂直方向上占用的空间。默认值为 16。 |
| **thickness** | `double?` | 分隔线条本身的粗细（线的实际绘制高度）。默认值为 0，此时实际渲染为 1 个物理像素的细线。 |
| **indent**    | `double?` | 分隔线左侧（起始端）的留白距离，即线条距离左边缘的缩进量。默认值为 0，表示紧贴左边缘。 |
| **endIndent** | `double?` | 分隔线右侧（末尾端）的留白距离，即线条距离右边缘的缩进量。默认值为 0，表示紧贴右边缘。 |
| **color**     | `Color?`  | 分隔线的颜色。不设置时会使用当前主题中 DividerThemeData 定义的颜色，若主题也未定义则回退到 Theme 的 dividerColor。 |

> **补充说明**：height 与 thickness 的关系容易混淆。height 是整个 Divider 组件在布局中占据的垂直空间，线条居中绘制在这个空间内；thickness 才是那条可见线的实际粗细。例如 height 为 20、thickness 为 2 时，线条上下各有 9 个逻辑像素的空白。

## 34. Form

### 一、概述

Form 是一个用于将多个表单输入字段组织在一起，并对它们进行统一验证、保存和重置的容器组件。

------

### 二、核心属性

| 属性名                     | 数据类型                        | 属性说明                                                     |
| :------------------------- | :------------------------------ | :----------------------------------------------------------- |
| **child**                  | `Widget`                        | Form 内部的子组件树，通常包含一个或多个 TextFormField 等表单字段组件。 |
| **autovalidateMode**       | `AutovalidateMode`              | 控制表单自动验证的时机。常用取值见下方补充说明。默认值为 disabled，即不自动验证。 |
| **onChanged**              | `VoidCallback?`                 | 当 Form 内任意一个表单字段的值发生变化时触发的回调。适合用于实时监听整个表单的变动状态。 |
| **canPop**                 | `bool?`                         | 控制当前页面是否允许被弹出（返回）。设为 false 时可拦截用户的返回操作，常用于表单有未保存内容时阻止离开。 |
| **onPopInvokedWithResult** | `PopInvokedWithResultCallback?` | 当用户尝试返回（弹出页面）时触发的回调，可在此回调中判断表单是否有未保存的修改，并决定是否允许离开或弹出提示。 |

#### autovalidateMode 常用取值说明

| 取值                                 | 含义                                                     |
| :----------------------------------- | :------------------------------------------------------- |
| `AutovalidateMode.disabled`          | 不自动验证，只有手动调用验证方法时才触发校验（默认值）。 |
| `AutovalidateMode.always`            | 表单字段始终自动验证，每次内容变化都立即校验。           |
| `AutovalidateMode.onUserInteraction` | 仅在用户首次与该字段交互后才开始自动验证，体验最友好。   |

------

### 三、关键机制：FormState

> Form 组件本身不提供命名构造函数，但理解它的核心在于掌握 **FormState**，这是使用 Form 的关键。

通过给 Form 设置一个 GlobalKey，可以获取到它内部的 FormState 对象。FormState 提供了三个最核心的方法：

| 方法名         | 作用说明                                                     |
| :------------- | :----------------------------------------------------------- |
| **validate()** | 遍历 Form 内所有表单字段，逐一执行它们各自的 validator 验证函数。全部通过返回 true，任意一个不通过返回 false 并显示错误提示。 |
| **save()**     | 遍历 Form 内所有表单字段，逐一触发它们各自的 onSaved 回调，通常用于将用户输入的值收集到变量中。 |
| **reset()**    | 将 Form 内所有表单字段恢复到初始状态，清空用户输入的内容和错误提示信息。 |

> **补充说明**：Form 必须与 TextFormField（而非普通 TextField）配合使用，因为只有 TextFormField 才具备 validator 和 onSaved 等能够被 FormState 统一调度的能力。



## 35. CircularProgressIndicator

------

### 一、概述

CircularProgressIndicator 是 Flutter 中用于展示**圆形加载进度**的组件，可表示一个操作正在进行中，也可展示具体的完成百分比。

------

### 二、核心属性

| 属性名              | 数据类型             | 属性说明                                                     |
| :------------------ | :------------------- | :----------------------------------------------------------- |
| **value**           | `double?`            | 当前进度值，取值范围为 0.0 到 1.0。传入具体数值时表示**确定进度**（如 0.5 代表 50%）；设为 null 时进入**不确定模式**，圆环会持续旋转动画，表示"加载中但不知道还要多久" |
| **backgroundColor** | `Color?`             | 圆环**轨道**的背景颜色，即进度尚未填充部分所显示的底色       |
| **color**           | `Color?`             | 进度圆弧本身的颜色，即已完成部分的前景色                     |
| **valueColor**      | `Animation<Color?>?` | 用动画方式控制进度圆弧的颜色，可实现颜色渐变过渡效果。当同时设置了 color 时，valueColor 优先级更高 |
| **strokeWidth**     | `double`             | 圆环线条的**粗细**，默认值为 4.0，数值越大圆环越粗           |
| **strokeCap**       | `StrokeCap?`         | 圆弧两端的**端点形状**。可选圆头（rounded）或平头（butt/square），圆头视觉上更柔和 |
| **strokeAlign**     | `double`             | 圆环线条相对于组件边界的**对齐方式**。默认居中对齐，可向内或向外偏移，影响圆环在可用空间中的实际绘制位置 |
| **semanticsLabel**  | `String?`            | 为无障碍辅助功能提供的**标签文本**，屏幕阅读器会朗读此内容，帮助视障用户理解该指示器的用途 |
| **semanticsValue**  | `String?`            | 为无障碍辅助功能提供的**进度值描述**，例如描述当前完成了多少，供屏幕阅读器播报 |

------

### 三、构造函数

#### CircularProgressIndicator.adaptive

**使用场景：** 希望应用在不同平台上自动呈现原生风格的加载指示器时使用。在 iOS 和 macOS 平台上，它会自动切换为 Cupertino 风格（即苹果原生的菊花转圈样式）；在 Android 等其他平台上，则保持 Material Design 的标准圆环样式。这样一个组件就能实现跨平台的视觉适配，无需手动判断平台。

**独有说明：** 该构造函数本身无额外独有参数，其核心价值在于**自动适配平台原生外观**这一行为差异。



## 36. Opacity

------

### 一、概述

Opacity 是 Flutter 中用于**控制子组件透明度**的组件，通过设定一个透明度数值来让子组件呈现从完全透明到完全不透明之间的任意视觉效果。

------

### 二、核心属性

| 属性名                     | 数据类型  | 属性说明                                                     |
| :------------------------- | :-------- | :----------------------------------------------------------- |
| **opacity**                | `double`  | 透明度值，取值范围为 0.0 到 1.0。0.0 表示完全透明（不可见），1.0 表示完全不透明（正常显示），0.5 则为半透明。这是该组件最核心、唯一必传的属性 |
| **child**                  | `Widget?` | 需要被施加透明效果的子组件，Opacity 会将设定的透明度应用到这个子组件及其所有后代组件上 |
| **alwaysIncludeSemantics** | `bool`    | 是否在透明度为 0（完全不可见）时仍然保留无障碍语义信息。默认为 false，即完全透明时屏幕阅读器会忽略该组件；设为 true 后，即使看不见，辅助功能依然能感知它的存在 |

## 37. ClipRRect

------

### 一、概述

ClipRRect 是 Flutter 中用于将子组件按**圆角矩形**进行裁剪的组件，超出圆角矩形边界的部分会被切掉、不予显示。

------

### 二、核心属性

| 属性名           | 数据类型                | 属性说明                                                     |
| :--------------- | :---------------------- | :----------------------------------------------------------- |
| **borderRadius** | `BorderRadiusGeometry?` | 圆角的半径大小，决定四个角的弧度程度。默认值为零（即直角无圆角）。可以统一设置四角相同的圆角值，也可以分别对左上、右上、左下、右下四个角单独指定不同的圆角半径，灵活度很高 |
| **clipper**      | `CustomClipper<RRect>?` | 自定义裁剪路径的裁剪器。当 borderRadius 无法满足需求时，可通过它提供一个完全自定义的圆角矩形裁剪区域。设置了 clipper 后，borderRadius 将被忽略 |
| **clipBehavior** | `Clip`                  | 裁剪的**抗锯齿策略**，控制裁剪边缘的平滑程度。默认值为 Clip.antiAlias（抗锯齿），裁剪边缘较平滑；可设为 Clip.hardEdge 以牺牲边缘平滑度换取更好的性能；也可设为 Clip.antiAliasWithSaveLayer 获得最高质量但性能开销最大 |
| **child**        | `Widget?`               | 需要被裁剪的子组件。该子组件及其所有后代中超出圆角矩形范围的内容都会被裁掉 |

------

### 三、clipBehavior 三种模式对比

| 模式                            | 边缘质量                                           | 性能 | 适用场景                                           |
| :------------------------------ | :------------------------------------------------- | :--- | :------------------------------------------------- |
| **Clip.hardEdge**               | 边缘有锯齿感，较粗糙                               | 最优 | 裁剪区域较大或对边缘精度要求不高时使用             |
| **Clip.antiAlias**              | 边缘平滑，视觉效果好                               | 适中 | 绝大多数日常场景的默认选择                         |
| **Clip.antiAliasWithSaveLayer** | 边缘最平滑，且能正确处理子组件内部的重叠透明度问题 | 最差 | 仅在子组件存在半透明叠加且出现视觉瑕疵时才考虑使用 |

## 38. Drawer

------

### 一、概述

Drawer 是 Flutter 中从屏幕边缘**水平滑出的侧边导航面板**，通常用于承载应用的主导航菜单、用户信息或设置入口等内容。

------

### 二、核心属性

| 属性名               | 数据类型       | 属性说明                                                     |
| :------------------- | :------------- | :----------------------------------------------------------- |
| **child**            | `Widget?`      | Drawer 内部显示的具体内容。通常会放置一个 ListView，里面包含用户头像区域（DrawerHeader / UserAccountsDrawerHeader）以及若干导航选项（ListTile）组成的菜单列表 |
| **backgroundColor**  | `Color?`       | Drawer 面板的背景颜色。不设置时将跟随当前主题的默认配色      |
| **elevation**        | `double?`      | Drawer 面板的阴影高度，数值越大投射的阴影越明显，视觉上离背后页面的"悬浮感"越强 |
| **shadowColor**      | `Color?`       | 阴影的颜色，配合 elevation 使用，可以自定义阴影的色调        |
| **surfaceTintColor** | `Color?`       | Material 3 设计体系下的表面着色叠加色，会根据 elevation 值自动在背景上叠加一层微妙的色调变化 |
| **shape**            | `ShapeBorder?` | Drawer 面板的外形轮廓，可以自定义圆角等形状。默认情况下在 Material 3 中右侧边缘带有大圆角 |
| **width**            | `double?`      | Drawer 面板的宽度。不设置时使用 Material 规范的默认宽度（通常为屏幕宽度的约 70%-80%，但不超过 304 逻辑像素） |
| **clipBehavior**     | `Clip?`        | 当子组件超出 Drawer 的 shape 边界时的裁剪行为，与 shape 设置圆角时配合使用，确保内容不会溢出圆角区域 |
| **semanticLabel**    | `String?`      | 为无障碍辅助功能提供的语义标签，屏幕阅读器会朗读此文本，帮助视障用户理解这是一个侧边导航面板 |

------

### 三、使用方式与关联机制

Drawer 组件本身不会独立使用，它需要与 **Scaffold** 配合工作：

| 挂载位置 | Scaffold 属性 | 滑出方向               |
| :------- | :------------ | :--------------------- |
| 左侧抽屉 | **drawer**    | 从屏幕**左侧**向右滑出 |
| 右侧抽屉 | **endDrawer** | 从屏幕**右侧**向左滑出 |

**打开方式有三种：**

- 用户从屏幕对应边缘**向内滑动手势**触发
- 点击 AppBar 左侧的**菜单图标**（Scaffold 自动生成）打开左侧 Drawer
- 通过 ScaffoldState 的 openDrawer 或 openEndDrawer 方法程序化打开

**关闭方式：**

- 点击 Drawer 之外的**半透明遮罩区域**
- 从 Drawer 内部**向边缘方向滑动**
- 通过 Navigator 的 pop 方法程序化关闭

------

### 四、常用内部搭配组件

| 组件名                       | 用途                                                         |
| :--------------------------- | :----------------------------------------------------------- |
| **DrawerHeader**             | Drawer 顶部的装饰区域，用于放置标题、Logo 等信息             |
| **UserAccountsDrawerHeader** | Drawer 顶部的用户信息区域，内置了头像、用户名、邮箱的标准布局 |
| **ListTile**                 | 导航菜单中的每一个选项条目，支持图标、标题、点击事件         |
| **ListView**                 | 作为 child 的最佳容器，当菜单项过多时可自动滚动，避免内容溢出 |

## 39. TabBar

### 一、概述

TabBar 是一个水平排列的选项卡栏组件，用于在多个同级内容页面之间提供可点击的标签式导航，通常与 TabBarView 配合使用来实现页面切换。

------

### 二、核心属性

| 属性名                   | 数据类型                      | 属性说明                                                     |
| :----------------------- | :---------------------------- | :----------------------------------------------------------- |
| **tabs**                 | `List<Widget>`                | 必填项。每个选项卡的内容，通常传入一组 Tab 组件，每个 Tab 可设置文字、图标或两者兼有 |
| **controller**           | `TabController`               | 选项卡控制器，负责协调 TabBar 与 TabBarView 的同步切换。若外层有 DefaultTabController 则可省略 |
| **isScrollable**         | `bool`                        | 标签栏是否可横向滚动。为 false 时所有标签平分宽度；为 true 时每个标签按自身内容宽度排列，超出屏幕可滑动 |
| **onTap**                | `ValueChanged<int>`           | 点击某个选项卡时触发的回调，参数为被点击标签的索引值         |
| **tabAlignment**         | `TabAlignment`                | 控制标签在横向方向上的对齐方式，如起始对齐、居中、填满等，在可滚动模式下尤其有用 |
| **indicator**            | `Decoration`                  | 完全自定义选中指示器的外观装饰，可用 BoxDecoration 实现圆角、渐变等任意效果，设置后会覆盖 indicatorColor 和 indicatorWeight |
| **indicatorColor**       | `Color`                       | 选中标签下方指示器横线的颜色                                 |
| **indicatorWeight**      | `double`                      | 选中指示器横线的粗细（厚度），默认为 2 像素                  |
| **indicatorSize**        | `TabBarIndicatorSize`         | 指示器的宽度模式：`tab` 表示与标签等宽，`label` 表示仅与文字等宽 |
| **indicatorPadding**     | `EdgeInsetsGeometry`          | 指示器的内边距，可微调指示器相对于标签的位置与大小           |
| **labelColor**           | `Color`                       | 被选中标签的文字与图标颜色                                   |
| **unselectedLabelColor** | `Color`                       | 未选中标签的文字与图标颜色                                   |
| **labelStyle**           | `TextStyle`                   | 被选中标签的文字样式，如字号、字重等                         |
| **unselectedLabelStyle** | `TextStyle`                   | 未选中标签的文字样式                                         |
| **labelPadding**         | `EdgeInsetsGeometry`          | 每个标签内部的内边距，控制文字或图标与标签边界的间距         |
| **dividerColor**         | `Color`                       | 标签栏底部分割线的颜色，设为透明可隐藏分割线                 |
| **dividerHeight**        | `double`                      | 标签栏底部分割线的高度，设为 0 同样可隐藏分割线              |
| **overlayColor**         | `WidgetStateProperty<Color?>` | 标签被按压、悬停、聚焦时的水波纹覆盖色，可针对不同交互状态分别指定颜色 |
| **splashBorderRadius**   | `BorderRadius`                | 点击水波纹效果的圆角半径                                     |
| **padding**              | `EdgeInsetsGeometry`          | 整个标签栏外部的内边距                                       |
| **enableFeedback**       | `bool`                        | 点击标签时是否触发设备的触觉反馈（如震动）                   |
| **mouseCursor**          | `MouseCursor`                 | 鼠标悬停在标签上时显示的光标样式，桌面端和 Web 端适用        |

------

### 三、构造函数

#### TabBar.secondary

**使用场景：** 用于创建 Material 3 设计规范中的「次级选项卡」。次级选项卡在视觉上比主选项卡更为低调、素雅，适用于内容区域内部的子层级分类导航。例如，主选项卡已经区分了"音乐"与"播客"两大板块，在"音乐"板块内部再用次级选项卡区分"推荐""排行榜""歌单"等子分类。

**与默认构造函数的差异：** 该构造函数不引入任何独有参数，所有属性与默认构造函数完全一致。其本质区别在于默认的视觉风格不同——指示器、文字颜色、间距等默认值均遵循 Material 3 次级选项卡的设计标准，呈现出更柔和、更内敛的外观，无需手动调整样式即可直接获得符合规范的次级标签效果。

------

### 四、使用要点

1. **必须提供 TabController：** TabBar 要正常工作，必须有一个控制器。最简单的方式是在 TabBar 和 TabBarView 的共同祖先节点放置一个 DefaultTabController，这样两者会自动获取控制器而无需手动创建。若需要更精细的控制（如监听切换事件、通过代码跳转标签），则需自行创建 TabController 并传入。
2. **与 TabBarView 成对使用：** TabBar 只负责显示标签和响应点击，真正切换页面内容的是 TabBarView。两者通过同一个 TabController 保持同步——点击标签时页面跟着切，滑动页面时标签也跟着动。
3. **常驻位置：** TabBar 最常见的放置位置是 AppBar 的 bottom 属性中，这样标签栏会紧贴在应用栏下方。当然也可以放在页面的任意位置，此时需要用 Material 或其他容器包裹以获得正确的主题样式。
4. **tabs 的数量必须匹配：** TabBar 中 tabs 列表的数量必须与 TabBarView 中 children 列表的数量严格一致，也必须与 TabController 的 length 一致，否则会报错。



## 40. TabBarView

### 一、概述

TabBarView 是一个可左右滑动切换的页面容器组件，用于展示与 TabBar 各标签一一对应的内容页面，并与 TabBar 保持联动同步。

------

### 二、核心属性

| 属性名                | 数据类型            | 属性说明                                                     |
| :-------------------- | :------------------ | :----------------------------------------------------------- |
| **children**          | `List<Widget>`      | 必填项。每个标签页对应的内容组件列表，数量必须与 TabBar 的 tabs 数量及 TabController 的 length 严格一致 |
| **controller**        | `TabController`     | 选项卡控制器，负责协调 TabBarView 与 TabBar 的同步切换。若祖先节点已有 DefaultTabController 则可省略 |
| **physics**           | `ScrollPhysics`     | 控制页面滑动的物理效果。例如传入 NeverScrollableScrollPhysics 可禁止手势滑动，仅允许通过点击标签切换；传入 BouncingScrollPhysics 可获得 iOS 风格的弹性回弹效果 |
| **dragStartBehavior** | `DragStartBehavior` | 决定拖拽手势的起始判定时机。设为 start 时从手指按下即开始计算位移，设为 down 时从首次检测到移动意图才开始计算，影响滑动的跟手精度 |
| **viewportFraction**  | `double`            | 每个页面占据视口宽度的比例，默认为 1.0 即占满全宽。设为小于 1 的值时，相邻页面的边缘会露出来，形成卡片式的预览效果 |
| **clipBehavior**      | `Clip`              | 内容超出边界时的裁剪方式。默认为 hardEdge，即硬裁剪；可按需调整为抗锯齿裁剪或不裁剪 |



## 41. DefaultTabController

### 一、概述

DefaultTabController 是一个继承式组件，用于自动创建并向其所有后代节点共享一个 TabController，使得 TabBar 和 TabBarView 无需手动创建控制器即可实现联动同步。

------

### 二、核心属性

| 属性名                | 数据类型   | 属性说明                                                     |
| :-------------------- | :--------- | :----------------------------------------------------------- |
| **length**            | `int`      | 必填项。标签页的总数量，必须与 TabBar 的 tabs 数量及 TabBarView 的 children 数量严格一致 |
| **initialIndex**      | `int`      | 初始选中的标签页索引，默认为 0 即第一个标签页。值必须在 0 到 length-1 的范围内 |
| **animationDuration** | `Duration` | 标签页切换时的动画过渡时长。默认为 300 毫秒的 kTabScrollDuration。设为 Duration.zero 可关闭切换动画 |
| **child**             | `Widget`   | 必填项。子组件树，TabBar 和 TabBarView 都必须放在这个子树内部，它们才能自动获取到共享的 TabController |

## 42. BottomNavigationBar

### 一、概述

BottomNavigationBar 是一个固定在屏幕底部的导航栏组件，用于在三到五个顶级页面之间进行快速切换，是 Material 2 设计规范下的底部导航方案。

------

### 二、核心属性

| 属性名                   | 数据类型                             | 属性说明                                                     |
| :----------------------- | :----------------------------------- | :----------------------------------------------------------- |
| **items**                | `List<BottomNavigationBarItem>`      | 必填项。导航栏中的各个导航项列表，至少需要两个。每个 BottomNavigationBarItem 可设置 icon（必填图标）、activeIcon（选中时的图标）、label（文字标签）、backgroundColor（shifting 模式下该项的背景色）、tooltip（长按提示文字） |
| **currentIndex**         | `int`                                | 当前选中的导航项索引，默认为 0。需要在 onTap 回调中手动更新此值来驱动界面切换 |
| **onTap**                | `ValueChanged<int>?`                 | 点击某个导航项时触发的回调，参数为被点击项的索引值。通常在此回调中调用 setState 更新 currentIndex 并切换页面内容 |
| **type**                 | `BottomNavigationBarType`            | 导航栏的显示模式。`fixed` 模式下所有项等宽排列、始终显示文字标签；`shifting` 模式下仅选中项显示标签文字，且背景色会随选中项变化产生过渡动画。项数小于等于三个时默认为 fixed，超过三个默认为 shifting |
| **backgroundColor**      | `Color`                              | 导航栏的整体背景颜色                                         |
| **selectedItemColor**    | `Color`                              | 选中导航项的图标与文字颜色                                   |
| **unselectedItemColor**  | `Color`                              | 未选中导航项的图标与文字颜色                                 |
| **selectedFontSize**     | `double`                             | 选中项文字标签的字号，默认为 14。若不希望选中时文字放大，可将此值与 unselectedFontSize 设为一致 |
| **unselectedFontSize**   | `double`                             | 未选中项文字标签的字号，默认为 12                            |
| **iconSize**             | `double`                             | 导航项图标的大小，默认为 24                                  |
| **selectedIconTheme**    | `IconThemeData`                      | 选中项图标的主题配置，可设置大小、颜色、透明度等，设置后会覆盖 selectedItemColor 对图标的影响 |
| **unselectedIconTheme**  | `IconThemeData`                      | 未选中项图标的主题配置                                       |
| **selectedLabelStyle**   | `TextStyle`                          | 选中项文字标签的样式，可控制字重、字体等。注意：其中的 fontSize 会被 selectedFontSize 覆盖，color 会被 selectedItemColor 覆盖 |
| **unselectedLabelStyle** | `TextStyle`                          | 未选中项文字标签的样式                                       |
| **showSelectedLabels**   | `bool`                               | 是否显示选中项的文字标签，默认为 true                        |
| **showUnselectedLabels** | `bool`                               | 是否显示未选中项的文字标签。fixed 模式下默认为 true，shifting 模式下默认为 false |
| **elevation**            | `double`                             | 导航栏的阴影高度，默认为 8，值越大阴影越明显                 |
| **enableFeedback**       | `bool`                               | 点击导航项时是否触发设备的触觉反馈                           |
| **landscapeLayout**      | `BottomNavigationBarLandscapeLayout` | 横屏模式下导航项的排列方式：spread 表示均匀分散、centered 表示居中聚拢、linear 表示图标与文字水平排列而非上下排列 |
| **mouseCursor**          | `MouseCursor`                        | 鼠标悬停时的光标样式，适用于桌面端和 Web 端                  |



## 43. NavigationBar

### 一、概述

`NavigationBar` 是 Flutter 中遵循 Material 3 设计规范的**底部导航栏**组件，用于在应用底部展示若干个导航入口，让用户在几个顶层页面之间快速切换。

------

### 二、核心属性

#### NavigationBar 本体属性

| 属性名                    | 数据类型                              | 属性说明                                                     |
| :------------------------ | :------------------------------------ | :----------------------------------------------------------- |
| **destinations**          | `List<NavigationDestination>`         | **（必填）** 导航栏中的各个导航项列表，至少需要提供两个，每一项就是底部的一个可点击入口 |
| **selectedIndex**         | `int`                                 | 当前被选中的导航项索引，从 0 开始计数，默认值为 0            |
| **onDestinationSelected** | `ValueChanged<int>?`                  | 用户点击某个导航项时触发的回调，会传回被点击项的索引值，开发者在此更新 `selectedIndex` 以切换页面 |
| **backgroundColor**       | `Color?`                              | 整个导航栏的背景颜色                                         |
| **elevation**             | `double?`                             | 导航栏的阴影高度，数值越大投影越明显                         |
| **shadowColor**           | `Color?`                              | 阴影的颜色                                                   |
| **surfaceTintColor**      | `Color?`                              | Material 3 中对背景色叠加的色调，设为透明可消除默认的色调混合效果 |
| **indicatorColor**        | `Color?`                              | 选中项下方（或背后）那个"药丸形"指示器的填充颜色             |
| **indicatorShape**        | `ShapeBorder?`                        | 指示器的形状，可自定义为圆角矩形、圆形等任意形状             |
| **height**                | `double?`                             | 导航栏的整体高度，默认值为 80 逻辑像素                       |
| **labelBehavior**         | `NavigationDestinationLabelBehavior?` | 控制文字标签的显示策略，有三种模式：始终显示、仅选中时显示、全部隐藏 |
| **animationDuration**     | `Duration?`                           | 切换导航项时指示器和图标的过渡动画时长                       |
| **overlayColor**          | `WidgetStateProperty<Color?>?`        | 用户按压、悬停、聚焦导航项时的水波纹叠加色，可针对不同交互状态分别设定 |

------

#### NavigationDestination 导航项属性

每一个导航项都是一个 `NavigationDestination` 对象，以下是它的常用属性：

| 属性名           | 数据类型  | 属性说明                                                     |
| :--------------- | :-------- | :----------------------------------------------------------- |
| **icon**         | `Widget`  | **（必填）** 未选中状态下显示的图标                          |
| **selectedIcon** | `Widget?` | 选中状态下显示的图标，若不设置则选中和未选中时共用 `icon`    |
| **label**        | `String`  | **（必填）** 显示在图标下方的文字标签                        |
| **tooltip**      | `String?` | 长按或鼠标悬停时弹出的提示文字，默认使用 `label` 的值        |
| **enabled**      | `bool`    | 该导航项是否可交互，设为否后点击无反应且呈灰态，默认为可交互 |



## 44. Scrollbar

### 一、概述

`Scrollbar` 是一个包裹在可滚动组件外层的 Material Design 滚动条组件，用于在内容滚动时显示一个可视化的滑块轨道，帮助用户感知当前的滚动位置和内容总量。

------

### 二、核心属性

| 属性名                    | 数据类型                       | 属性说明                                                     |
| :------------------------ | :----------------------------- | :----------------------------------------------------------- |
| **child**                 | `Widget`                       | **（必填）** 被包裹的可滚动子组件，例如 `ListView`、`SingleChildScrollView`、`GridView` 等，滚动条会跟随该子组件的滚动状态联动 |
| **controller**            | `ScrollController?`            | 与子组件共用的滚动控制器。当页面中存在多个可滚动区域时，必须通过此属性明确指定滚动条要绑定哪一个，否则会报错 |
| **thumbVisibility**       | `bool?`                        | 滑块是否始终可见。默认情况下滑块只在滚动时短暂出现然后自动淡出，设为 true 则让滑块常驻显示 |
| **trackVisibility**       | `bool?`                        | 滑块所在的轨道背景是否始终可见。设为 true 后，滑块底部会显示一条完整的轨道线，便于用户感知可滚动范围 |
| **thickness**             | `double?`                      | 滑块的粗细（宽度），单位为逻辑像素。数值越大滚动条越粗       |
| **radius**                | `Radius?`                      | 滑块四角的圆角半径，用于控制滑块是方角还是圆角的视觉效果     |
| **interactive**           | `bool?`                        | 滑块是否支持用户直接拖拽交互。设为 true 后用户可以直接拖动滑块来快速滚动内容，而不仅仅是被动展示 |
| **scrollbarOrientation**  | `ScrollbarOrientation?`        | 滚动条的摆放位置，可指定为左侧、右侧、顶部或底部。默认情况下垂直滚动时在右侧，水平滚动时在底部 |
| **notificationPredicate** | `ScrollNotificationPredicate?` | 滚动通知的过滤条件，用于决定滚动条响应哪一层嵌套滚动组件的通知。默认只响应最近一层的滚动 |



## 45. FutureBuilder

### 一、概述

`FutureBuilder` 是一个根据异步操作（`Future`）的执行状态自动重建界面的组件，用于将"等待中、已完成、出错"等不同阶段映射为对应的 UI 展示。

------

### 二、核心属性

#### FutureBuilder 本体属性

| 属性名          | 数据类型                | 属性说明                                                     |
| :-------------- | :---------------------- | :----------------------------------------------------------- |
| **future**      | `Future<T>?`            | 需要监听的异步操作对象，例如一次网络请求或数据库查询。组件会跟踪这个异步操作从开始到结束的全过程 |
| **builder**     | `AsyncWidgetBuilder<T>` | **（必填）** 构建函数，框架会在异步操作的状态每次发生变化时调用它。该函数接收两个参数：上下文和一个 `AsyncSnapshot` 快照对象，开发者根据快照中的状态信息决定返回什么样的界面 |
| **initialData** | `T?`                    | 在异步操作尚未返回任何结果之前，提供的一个默认初始值。设置后，快照中的 `data` 在等待阶段就不会为空 |

------

#### AsyncSnapshot 快照对象核心属性

`builder` 函数中拿到的快照对象是理解 `FutureBuilder` 的关键，以下是它最常用的属性：

| 属性名              | 数据类型          | 属性说明                                                     |
| :------------------ | :---------------- | :----------------------------------------------------------- |
| **connectionState** | `ConnectionState` | 当前异步操作的连接状态，共有四种取值：`none`（未传入 future）、`waiting`（正在等待结果）、`active`（仅在 StreamBuilder 中有意义）、`done`（已完成） |
| **data**            | `T?`              | 异步操作成功完成后返回的数据。在等待阶段为空，除非设置了 `initialData` |
| **error**           | `Object?`         | 异步操作失败时抛出的错误对象。只有出错时才有值               |
| **hasData**         | `bool`            | 快捷判断属性，`data` 不为空时返回 true                       |
| **hasError**        | `bool`            | 快捷判断属性，`error` 不为空时返回 true                      |



## 46. Navigator

### 一、概述

`Navigator` 是 Flutter 中管理页面路由栈的核心组件，负责控制页面的进栈（打开新页面）、出栈（返回上一页）以及替换等一系列页面跳转操作。

------

### 二、核心属性

#### Navigator 组件属性

| 属性名                 | 数据类型                      | 属性说明                                                     |
| :--------------------- | :---------------------------- | :----------------------------------------------------------- |
| **initialRoute**       | `String?`                     | 应用启动时显示的第一个路由名称。若未设置，默认值为 `"/"`，即根路由 |
| **onGenerateRoute**    | `RouteFactory?`               | 当通过路由名称进行导航时，框架调用此函数来生成对应的路由对象。开发者在此根据传入的名称决定跳转到哪个页面 |
| **onUnknownRoute**     | `RouteFactory?`               | 当 `onGenerateRoute` 无法识别目标路由名称时的兜底回调，通常用来展示一个"页面不存在"的 404 界面 |
| **pages**              | `List<Page<dynamic>>`         | 声明式导航的核心属性，以列表形式描述当前路由栈中应该存在哪些页面。列表变化时，框架会自动计算差异并执行进栈或出栈 |
| **onDidRemovePage**    | `DidRemovePageCallback?`      | 当声明式导航中某个页面被移除时触发的回调，开发者在此同步更新自己维护的页面列表 |
| **observers**          | `List<NavigatorObserver>`     | 导航观察者列表，可以监听所有路由的进栈、出栈、替换等事件，常用于埋点统计和日志记录 |
| **transitionDelegate** | `TransitionDelegate<dynamic>` | 声明式导航中控制页面切换动画策略的委托对象，决定新旧页面列表差异时使用何种过渡效果 |
| **requestFocus**       | `bool`                        | 新路由入栈后是否自动获取焦点，默认为 true                    |

------

#### 常用静态方法（通过 Navigator.of(context) 调用）

日常开发中，开发者极少直接配置 `Navigator` 组件的属性（因为 `MaterialApp` 内部已经自动创建了一个），而是通过以下静态方法来操作路由栈：

| 方法名                      | 功能说明                                                     |
| :-------------------------- | :----------------------------------------------------------- |
| **push**                    | 将一个新的路由压入栈顶，即打开一个新页面，新页面覆盖在当前页面之上 |
| **pop**                     | 将栈顶路由弹出，即关闭当前页面，返回上一个页面。可以携带返回值传递给上一页 |
| **pushReplacement**         | 将当前页面替换为新页面。新页面入栈的同时，原页面被销毁，用户无法再返回原页面 |
| **pushAndRemoveUntil**      | 压入一个新页面，并从栈中持续移除旧页面直到满足指定条件为止。常用于登录成功后跳转到首页并清除所有登录流程页面 |
| **pushNamed**               | 通过路由名称（字符串）而非路由对象来打开新页面，需要配合 `onGenerateRoute` 或 `MaterialApp` 的 `routes` 表使用 |
| **pushReplacementNamed**    | 与 `pushReplacement` 功能相同，但通过路由名称导航            |
| **pushNamedAndRemoveUntil** | 与 `pushAndRemoveUntil` 功能相同，但通过路由名称导航         |
| **popUntil**                | 连续弹出栈顶页面，直到满足指定条件才停止。常用于一次性返回到某个特定页面 |
| **canPop**                  | 判断当前路由栈是否还能弹出。如果栈中只剩一个页面则返回 false |
| **maybePop**                | 安全的弹出操作——如果可以弹出则执行弹出，如果不能弹出（已经是最后一个页面）则什么都不做，不会导致应用退出 |

## 47. Visibility

### 一、概述

`Visibility` 是一个控制子组件是否可见的组件，可以在不将子组件从组件树中移除的前提下，灵活地隐藏或显示它，并精细控制隐藏后是否仍占据布局空间、是否响应交互等行为。

------

### 二、核心属性

| 属性名                    | 数据类型 | 属性说明                                                     |
| :------------------------ | :------- | :----------------------------------------------------------- |
| **child**                 | `Widget` | **（必填）** 被控制可见性的子组件                            |
| **visible**               | `bool`   | 核心开关属性。设为 true 时子组件正常显示；设为 false 时子组件被隐藏，具体隐藏方式由下方几个属性共同决定。默认值为 true |
| **replacement**           | `Widget` | 当 `visible` 为 false 时，用来替代子组件显示的占位组件。默认是一个零尺寸的 `SizedBox`，即什么都不显示 |
| **maintainState**         | `bool`   | 隐藏后是否保留子组件的内部状态。设为 true 时，子组件虽然不可见，但其 State 对象仍然存活，不会被销毁。默认为 false |
| **maintainAnimation**     | `bool`   | 隐藏后是否继续运行子组件中的动画。设为 true 时，动画会在后台持续播放，等重新可见时动画进度是连续的。启用此项必须同时将 `maintainState` 设为 true。默认为 false |
| **maintainSize**          | `bool`   | 隐藏后是否仍然占据原有的布局空间。设为 true 时，子组件虽然看不见，但它的尺寸仍被保留，周围组件的布局不会因此发生变化。启用此项必须同时将 `maintainState` 和 `maintainAnimation` 都设为 true。默认为 false |
| **maintainSemantics**     | `bool`   | 隐藏后是否保留子组件的语义信息（供屏幕阅读器等无障碍工具使用）。仅在 `maintainSize` 为 true 时有效。默认为 false |
| **maintainInteractivity** | `bool`   | 隐藏后是否仍然允许子组件接收触摸和点击事件。仅在 `maintainSize` 为 true 时有效。默认为 false |

## 48. AnimatedContainer

### 一、概述

AnimatedContainer 是一个**自带动画能力的容器组件**，当你修改它的任何可视属性（如宽高、颜色、边距等）时，它会自动在旧值和新值之间生成平滑的过渡动画，而无需你手动管理任何动画控制器。

------

### 二、核心属性

| 属性名                 | 数据类型           | 属性说明                                                     |
| :--------------------- | :----------------- | :----------------------------------------------------------- |
| **duration**           | Duration           | **必填。** 动画从旧状态过渡到新状态所需的时长，例如设置为300毫秒，则属性变化时会用300毫秒完成动画 |
| **curve**              | Curve              | 动画的速度曲线，控制动画的节奏感。默认为线性匀速。常用值如 easeIn（先慢后快）、easeOut（先快后慢）、bounceOut（弹跳效果）等 |
| **width**              | double             | 容器的宽度。当值发生变化时，宽度会以动画形式过渡             |
| **height**             | double             | 容器的高度。当值发生变化时，高度会以动画形式过渡             |
| **color**              | Color              | 容器的背景色。当颜色改变时，会平滑地从旧颜色渐变到新颜色。注意：若同时设置了 decoration，则不可再单独设置此属性 |
| **decoration**         | Decoration         | 容器的装饰，可设置背景色、圆角、边框、阴影、渐变等。变化时所有装饰属性都会以动画过渡。常用 BoxDecoration 来配置 |
| **padding**            | EdgeInsetsGeometry | 内边距。变化时子组件会以动画形式移动到新的内边距位置         |
| **margin**             | EdgeInsetsGeometry | 外边距。变化时容器自身会以动画形式移动到新的外边距位置       |
| **alignment**          | AlignmentGeometry  | 子组件在容器内部的对齐方式。变化时子组件会以动画形式滑动到新的对齐位置 |
| **constraints**        | BoxConstraints     | 对容器施加的额外尺寸约束，如最小宽度、最大高度等。变化时同样会动画过渡 |
| **transform**          | Matrix4            | 对容器施加矩阵变换，可实现旋转、缩放、平移等效果。变化时会以动画过渡 |
| **transformAlignment** | AlignmentGeometry  | 变换的锚点位置，决定 transform 以哪个点为中心进行变换        |
| **child**              | Widget             | 容器内部承载的子组件。child 本身不会被动画化，动画作用于容器的外观属性 |
| **onEnd**              | VoidCallback       | 动画播放完毕时触发的回调，可用于在动画结束后执行后续逻辑，如链式触发下一段动画 |
| **clipBehavior**       | Clip               | 当子组件超出容器边界时的裁剪行为。默认为 Clip.none（不裁剪） |



## 49. GridView

### 一、概述

GridView 是一个将子组件按照**行列二维网格**排列的可滚动列表组件，用于展示需要多列并排布局的内容集合。

------

### 二、核心属性

| 属性名                      | 数据类型                          | 属性说明                                                     |
| :-------------------------- | :-------------------------------- | :----------------------------------------------------------- |
| **gridDelegate**            | SliverGridDelegate                | **核心必填。** 控制网格的列数与每个格子的尺寸规则。Flutter 提供了两个常用实现类，详见下方说明 |
| **children**                | List<Widget>                      | 直接传入所有子组件列表。适用于子组件数量较少且固定的场景     |
| **scrollDirection**         | Axis                              | 网格的滚动方向。默认为垂直滚动（Axis.vertical），也可设为水平滚动（Axis.horizontal） |
| **reverse**                 | bool                              | 是否反转滚动方向。默认 false。设为 true 后内容从尾部开始排列 |
| **controller**              | ScrollController                  | 滚动控制器，可用于监听滚动位置、手动跳转到指定位置等         |
| **primary**                 | bool                              | 是否使用父级提供的主滚动控制器。当页面只有一个可滚动区域时一般设为 true |
| **physics**                 | ScrollPhysics                     | 滚动的物理行为。常用值：BouncingScrollPhysics（iOS 弹性回弹）、ClampingScrollPhysics（Android 边缘阻尼）、NeverScrollableScrollPhysics（禁止滚动） |
| **shrinkWrap**              | bool                              | 是否根据子组件总量收缩自身高度。默认 false（占满可用空间）。设为 true 时仅占所需高度，但会牺牲性能 |
| **padding**                 | EdgeInsetsGeometry                | 网格区域与外部边界之间的内边距                               |
| **cacheExtent**             | double                            | 可视区域外的预渲染距离（像素），用于提前构建即将进入屏幕的格子，提升滚动流畅度 |
| **clipBehavior**            | Clip                              | 子组件超出边界时的裁剪方式。默认 Clip.hardEdge               |
| **keyboardDismissBehavior** | ScrollViewKeyboardDismissBehavior | 滚动时是否自动收起键盘。可选择拖拽时收起或手动收起           |

------

#### gridDelegate 两大实现类详解

| 实现类                                        | 属性说明                                                     |
| :-------------------------------------------- | :----------------------------------------------------------- |
| **SliverGridDelegateWithFixedCrossAxisCount** | 按**固定列数**排列网格                                       |
| ↳ crossAxisCount                              | **必填。** 交叉轴方向上的列数（垂直滚动时即为每行几列）      |
| ↳ mainAxisSpacing                             | 主轴方向上相邻格子之间的间距，默认 0                         |
| ↳ crossAxisSpacing                            | 交叉轴方向上相邻格子之间的间距，默认 0                       |
| ↳ childAspectRatio                            | 每个格子的宽高比，默认 1.0（正方形）。大于 1 则扁宽，小于 1 则窄高 |
| ↳ mainAxisExtent                              | 直接指定每个格子在主轴方向上的固定尺寸（像素），设置后 childAspectRatio 失效 |
| **SliverGridDelegateWithMaxCrossAxisExtent**  | 按**格子最大宽度**自动计算列数                               |
| ↳ maxCrossAxisExtent                          | **必填。** 每个格子在交叉轴方向上允许的最大宽度，框架会据此自动算出最合适的列数 |
| ↳ mainAxisSpacing                             | 同上                                                         |
| ↳ crossAxisSpacing                            | 同上                                                         |
| ↳ childAspectRatio                            | 同上                                                         |
| ↳ mainAxisExtent                              | 同上                                                         |

------

### 三、构造函数

------

#### 1. GridView.count

**场景：** 最快捷地创建一个固定列数的网格，无需手动构建 gridDelegate 对象。

| 独有属性             | 数据类型 | 属性说明                                                     |
| :------------------- | :------- | :----------------------------------------------------------- |
| **crossAxisCount**   | int      | 直接指定交叉轴列数，构造函数内部自动创建 SliverGridDelegateWithFixedCrossAxisCount |
| **mainAxisSpacing**  | double   | 主轴方向格子间距，默认 0                                     |
| **crossAxisSpacing** | double   | 交叉轴方向格子间距，默认 0                                   |
| **childAspectRatio** | double   | 格子宽高比，默认 1.0                                         |

> 本质上是对 SliverGridDelegateWithFixedCrossAxisCount 的语法糖封装，适合列数固定、子组件数量不多的快速搭建。

------

#### 2. GridView.extent

**场景：** 最快捷地创建一个根据格子最大宽度自动计算列数的网格。

| 独有属性               | 数据类型 | 属性说明                                       |
| :--------------------- | :------- | :--------------------------------------------- |
| **maxCrossAxisExtent** | double   | 每个格子允许的最大交叉轴宽度，框架自动计算列数 |
| **mainAxisSpacing**    | double   | 主轴方向格子间距，默认 0                       |
| **crossAxisSpacing**   | double   | 交叉轴方向格子间距，默认 0                     |
| **childAspectRatio**   | double   | 格子宽高比，默认 1.0                           |

> 本质上是对 SliverGridDelegateWithMaxCrossAxisExtent 的语法糖封装，适合需要在不同屏幕宽度下自动适配列数的场景。

------

#### 3. GridView.builder

**场景：** 子组件数量庞大或不确定时使用，按需懒加载构建，只有即将出现在屏幕中的格子才会被创建，极大节省内存。

| 独有属性        | 数据类型                           | 属性说明                                                     |
| :-------------- | :--------------------------------- | :----------------------------------------------------------- |
| **itemCount**   | int                                | 格子总数量。可不传（表示无限），但一般建议明确指定以避免越界 |
| **itemBuilder** | Widget Function(BuildContext, int) | 根据索引按需构建每个格子的回调函数。框架仅在格子即将可见时才调用此函数 |

> 这是生产项目中**使用频率最高**的构造函数，处理长列表、网络数据分页等场景的首选方案。

------

#### 4. GridView.custom

**场景：** 需要完全自定义子组件的创建、回收及复用策略时使用，灵活度最高。

| 独有属性             | 数据类型            | 属性说明                                                     |
| :------------------- | :------------------ | :----------------------------------------------------------- |
| **childrenDelegate** | SliverChildDelegate | 自定义的子组件管理代理。常用实现为 SliverChildBuilderDelegate（等同 builder 的效果）和 SliverChildListDelegate（等同直接传 children 的效果），也可自行继承实现更精细的控制逻辑 |

> 适合对性能有极致要求、或需要自定义组件缓存策略的高级场景。

## 50. PageView

### 一、概述

PageView 是一个可以让用户通过**左右或上下滑动**来逐页切换内容的可滚动组件，每次滑动后会自动对齐停靠到某一页，常用于引导页、轮播图、标签页内容区等场景。

------

### 二、核心属性

| 属性名                     | 数据类型           | 属性说明                                                     |
| :------------------------- | :----------------- | :----------------------------------------------------------- |
| **controller**             | PageController     | 页面控制器，用于控制初始显示哪一页、监听当前页码、通过程序跳转到指定页面等。其核心子属性见下方补充 |
| **children**               | List<Widget>       | 直接传入所有页面组件列表。每个子组件占满一整页               |
| **scrollDirection**        | Axis               | 页面的滑动方向。默认 Axis.horizontal（水平左右翻页），可设为 Axis.vertical（垂直上下翻页） |
| **reverse**                | bool               | 是否反转页面顺序。默认 false。设为 true 后水平方向从右往左排列，垂直方向从下往上排列 |
| **physics**                | ScrollPhysics      | 滑动的物理效果。常用值：BouncingScrollPhysics（弹性回弹）、ClampingScrollPhysics（边缘阻尼）、NeverScrollableScrollPhysics（完全禁止手势滑动，仅通过控制器翻页） |
| **pageSnapping**           | bool               | 是否开启页面吸附效果。默认 true，松手后自动对齐到最近一页。设为 false 后可自由停在任意位置，不再有"整页翻动"的感觉 |
| **onPageChanged**          | void Function(int) | 页面切换完成后的回调，参数为当前页面的索引值（从 0 开始），常用于同步更新页码指示器 |
| **allowImplicitScrolling** | bool               | 是否允许辅助功能（无障碍）隐式滚动到相邻页面。默认 false。设为 true 后屏幕阅读器可识别前后页 |
| **clipBehavior**           | Clip               | 页面内容超出边界时的裁剪方式。默认 Clip.hardEdge             |
| **padEnds**                | bool               | 是否在首尾页面两端添加内边距使其居中。默认 true。当 viewportFraction 小于 1 时可观察到效果 |

------

#### PageController 常用子属性

| 属性名               | 数据类型 | 属性说明                                                     |
| :------------------- | :------- | :----------------------------------------------------------- |
| **initialPage**      | int      | 初始显示的页面索引，默认 0（第一页）                         |
| **viewportFraction** | double   | 每页在视窗中所占的比例。默认 1.0（占满整个视窗）。设为小于 1 的值（如 0.85）时，当前页两侧会露出相邻页面的边缘，形成卡片预览效果 |
| **keepPage**         | bool     | 是否在滚动视图被销毁重建后记住上次停留的页码。默认 true      |

#### PageController 常用方法

| 方法名                           | 说明                                           |
| :------------------------------- | :--------------------------------------------- |
| **jumpToPage(int page)**         | 无动画地直接跳转到指定页                       |
| **animateToPage(int page, ...)** | 带动画地平滑滚动到指定页，可指定动画时长和曲线 |
| **nextPage(...)**                | 带动画地翻到下一页                             |
| **previousPage(...)**            | 带动画地翻到上一页                             |

------

### 三、构造函数

------

#### 1. PageView.builder

**场景：** 页面数量较多或不确定时使用，按需懒加载构建，只有当前页及相邻页才会被创建，节省内存开销。

| 独有属性        | 数据类型                           | 属性说明                                                     |
| :-------------- | :--------------------------------- | :----------------------------------------------------------- |
| **itemCount**   | int                                | 页面总数。可不传（表示无限页面，常用于实现无限循环轮播），但通常建议指定明确数量 |
| **itemBuilder** | Widget Function(BuildContext, int) | 根据页面索引按需构建对应页面的回调函数，仅在页面即将可见时才被调用 |

> 这是实际项目中**最常用**的构造方式，尤其适合数据驱动的动态页面和需要无限滚动的轮播场景。

------

#### 2. PageView.custom

**场景：** 需要完全自定义页面的创建、缓存与回收策略时使用，灵活度最高。

| 独有属性             | 数据类型            | 属性说明                                                     |
| :------------------- | :------------------ | :----------------------------------------------------------- |
| **childrenDelegate** | SliverChildDelegate | 自定义的子组件管理代理。可使用 SliverChildBuilderDelegate（等同 builder 效果）或 SliverChildListDelegate（等同直接传 children 效果），也可自行继承实现更精细的缓存复用逻辑 |

> 适合对页面生命周期管理有特殊需求的高级场景。



## 51. StreamBuilder

### 一、概述

StreamBuilder 是一个能够**监听数据流（Stream）并在每次流中有新数据到达时自动重新构建界面**的组件，用于将持续推送的异步数据实时反映到 UI 上。

------

### 二、核心属性

| 属性名          | 数据类型                                        | 属性说明                                                     |
| :-------------- | :---------------------------------------------- | :----------------------------------------------------------- |
| **stream**      | Stream<T>                                       | 要监听的数据流。每当该流发出新数据、错误或完成信号时，组件都会自动触发重建。可以为 null，此时组件只使用 initialData 展示静态内容 |
| **initialData** | T                                               | 在流尚未发出任何数据之前，提供给 builder 使用的初始值。若不设置，首次构建时 snapshot.data 为 null |
| **builder**     | Widget Function(BuildContext, AsyncSnapshot<T>) | **必填。** 根据当前流的最新状态构建界面的回调函数。每当流中有新事件到达，此函数都会被重新调用。第二个参数 AsyncSnapshot 携带了流的全部状态信息，详见下方说明 |

------

#### AsyncSnapshot 核心属性详解

AsyncSnapshot 是 builder 回调中接收到的**数据快照对象**，它完整描述了当前流的最新状态：

| 属性名              | 数据类型        | 属性说明                                                     |
| :------------------ | :-------------- | :----------------------------------------------------------- |
| **connectionState** | ConnectionState | 当前与流的连接状态，有四种取值，详见下方说明                 |
| **data**            | T               | 流中最近一次成功发出的数据。若流尚未发出任何数据且未设置 initialData，则为 null |
| **error**           | Object          | 流中最近一次发出的错误对象。无错误时为 null                  |
| **stackTrace**      | StackTrace      | 与 error 对应的堆栈追踪信息                                  |
| **hasData**         | bool            | 是否已收到过有效数据（data 不为 null），可直接用于判断是否展示数据内容 |
| **hasError**        | bool            | 是否收到过错误（error 不为 null），可直接用于判断是否展示错误提示 |
| **requireData**     | T               | 与 data 相同，但若 data 为 null 时会直接抛出异常，适合在已确认有数据时安全取值 |

#### ConnectionState 四种状态

| 状态值      | 含义                                                   |
| :---------- | :----------------------------------------------------- |
| **none**    | 未连接到任何流（stream 为 null）                       |
| **waiting** | 已连接到流，但流尚未发出任何数据，正在等待中           |
| **active**  | 流已发出过数据且仍处于活跃状态，随时可能继续推送新数据 |
| **done**    | 流已关闭，不会再有新数据到达                           |

------

#### builder 中的典型判断逻辑（自然语言描述）

在 builder 回调中，通常按以下优先级依次判断：

1. **先检查是否有错误**（hasError 为 true）→ 展示错误提示界面
2. **再检查连接状态是否为 waiting** → 展示加载中的指示器
3. **再检查是否有数据**（hasData 为 true）→ 用 data 构建正常的数据展示界面
4. **兜底处理** → 展示空状态或默认占位界面



## 52. Hero

### 一、概述

Hero 是 Flutter 中用于实现**跨页面共享元素过渡动画**的组件——当两个页面中各存在一个相同标识的 Hero 时，在页面跳转过程中，该元素会自动从上一个页面的位置、大小平滑地飞行过渡到下一个页面的对应位置与大小。

------

### 二、核心属性

| 属性名                       | 数据类型                    | 属性说明                                                     |
| :--------------------------- | :-------------------------- | :----------------------------------------------------------- |
| **tag**                      | `Object`                    | Hero 的唯一标识。两个页面中的 Hero 必须设置**相同的 tag**，Flutter 才能将它们配对并触发飞行动画。可以是字符串、数字或任何对象，只要两端一致即可 |
| **child**                    | `Widget`                    | Hero 所包裹的子组件，即参与飞行过渡动画的那个实际界面元素（如一张图片、一个头像等） |
| **createRectTween**          | `CreateRectTween?`          | 自定义飞行路径的插值方式。默认情况下元素沿直线飞行，通过此属性可以改为弧线等曲线路径，让动画更自然 |
| **flightShuttleBuilder**     | `HeroFlightShuttleBuilder?` | 自定义飞行过程中实际显示的组件。默认飞行时显示的是目标页面的 child，通过此属性可以在飞行途中显示一个完全不同的过渡组件 |
| **placeholderBuilder**       | `HeroPlaceholderBuilder?`   | 当 child 已"飞走"后，在原页面留下的占位组件。默认是一个空的 SizedBox 来保持原有布局空间不塌陷 |
| **transitionOnUserGestures** | `bool`                      | 是否在用户手势触发的导航中也执行飞行动画（如 iOS 的右滑返回手势）。默认为 false，设为 true 后手势返回时也能看到平滑过渡 |



## 53. AlertDialog

### 一、概述

AlertDialog 是 Flutter 中遵循 Material Design 规范的**模态对话框组件**，用于在当前页面上方弹出一个浮层，向用户展示重要信息、警告提示或要求用户做出确认/取消等决策操作。

------

### 二、核心属性

| 属性名                           | 数据类型              | 属性说明                                                     |
| :------------------------------- | :-------------------- | :----------------------------------------------------------- |
| **icon**                         | `Widget?`             | 显示在对话框顶部居中位置的图标，通常用于直观表达对话框的性质（如警告、成功等） |
| **iconColor**                    | `Color?`              | 自定义 icon 的颜色，不设置则跟随主题                         |
| **iconPadding**                  | `EdgeInsetsGeometry?` | icon 周围的内边距                                            |
| **title**                        | `Widget?`             | 对话框的标题区域，通常放置一个简短的文本组件来说明对话框的主题 |
| **titlePadding**                 | `EdgeInsetsGeometry?` | 标题区域的内边距                                             |
| **titleTextStyle**               | `TextStyle?`          | 标题文本的样式（字号、颜色、粗细等）                         |
| **content**                      | `Widget?`             | 对话框的正文内容区域，用于放置详细的提示信息或表单输入等任意组件 |
| **contentPadding**               | `EdgeInsetsGeometry?` | 正文内容区域的内边距                                         |
| **contentTextStyle**             | `TextStyle?`          | 正文文本的样式                                               |
| **actions**                      | `List<Widget>?`       | 对话框底部的操作按钮列表，通常放置"取消"和"确认"等按钮       |
| **actionsAlignment**             | `MainAxisAlignment?`  | 操作按钮的水平对齐方式，如居末尾、居中、两端分散等           |
| **actionsPadding**               | `EdgeInsetsGeometry?` | 操作按钮区域整体的内边距                                     |
| **actionsOverflowDirection**     | `VerticalDirection?`  | 当按钮一行排不下而溢出时，按钮纵向排列的方向（从上往下或从下往上） |
| **actionsOverflowButtonSpacing** | `double?`             | 按钮溢出为纵向排列时，各按钮之间的间距                       |
| **backgroundColor**              | `Color?`              | 对话框的背景颜色                                             |
| **elevation**                    | `double?`             | 对话框的阴影高度，数值越大投影越明显，立体感越强             |
| **shadowColor**                  | `Color?`              | 阴影的颜色                                                   |
| **surfaceTintColor**             | `Color?`              | Material 3 中用于表面色调叠加的颜色，影响对话框表面的最终视觉色彩 |
| **shape**                        | `ShapeBorder?`        | 对话框的外形轮廓，可设置圆角矩形、圆形等，默认是带圆角的矩形 |
| **alignment**                    | `AlignmentGeometry?`  | 对话框在屏幕中的对齐位置，默认居中显示                       |
| **insetPadding**                 | `EdgeInsets?`         | 对话框与屏幕边缘之间的最小外边距，控制对话框的最大可用宽度   |
| **clipBehavior**                 | `Clip`                | 内容超出对话框边界时的裁剪行为，默认为 Clip.none             |
| **scrollable**                   | `bool`                | 当 title 和 content 内容过长时，是否允许它们可滚动，默认为 false |

------

### 三、构造函数

#### `AlertDialog.adaptive()`

**使用场景**：需要根据运行平台自动切换对话框风格时使用。在 iOS 和 macOS 上会自动渲染为 Cupertino 风格（苹果原生风格）的对话框，在 Android 及其他平台上则渲染为标准 Material 风格的对话框，无需手动判断平台。

**独有说明**：该构造函数的参数列表与默认构造函数完全一致，没有额外独有参数。其核心差异在于内部的渲染逻辑——会自动感知当前平台并选择对应的原生视觉风格。





## 54. SnackBar

### 一、概述

SnackBar 是 Flutter 中遵循 Material Design 规范的**轻量级临时消息提示条组件**，用于在屏幕底部短暂弹出一条提示信息，告知用户某个操作的结果或状态，并可附带一个可交互的操作按钮。

------

### 二、核心属性

| 属性名                      | 数据类型              | 属性说明                                                     |
| :-------------------------- | :-------------------- | :----------------------------------------------------------- |
| **content**                 | `Widget`              | **必填属性**。消息提示的主体内容，通常放置一个文本组件来展示提示信息，也可放置任意组件 |
| **action**                  | `SnackBarAction?`     | 提示条右侧附带的操作按钮（如"撤销""重试"），用户可点击执行对应逻辑。SnackBarAction 需设置 label（按钮文字）和 onPressed（点击回调） |
| **duration**                | `Duration`            | 提示条自动消失前的停留时长，默认为 4 秒。可自行缩短或延长    |
| **backgroundColor**         | `Color?`              | 提示条的背景颜色                                             |
| **elevation**               | `double?`             | 提示条的阴影高度，数值越大立体感越强                         |
| **behavior**                | `SnackBarBehavior?`   | 提示条的展示形态。**fixed** 表示紧贴底部且与屏幕等宽；**floating** 表示悬浮在底部上方并带有圆角和边距，视觉上更现代 |
| **shape**                   | `ShapeBorder?`        | 提示条的外形轮廓，可设置圆角矩形等，通常在 floating 模式下使用效果更佳 |
| **margin**                  | `EdgeInsetsGeometry?` | 提示条与屏幕边缘的外边距，仅在 behavior 为 floating 时生效   |
| **padding**                 | `EdgeInsetsGeometry?` | 提示条内部内容的内边距                                       |
| **width**                   | `double?`             | 提示条的固定宽度，仅在 behavior 为 floating 时生效。设置后 margin 的左右值会被忽略 |
| **showCloseIcon**           | `bool`                | 是否在提示条右侧显示一个关闭图标，点击后可立即手动关闭提示条，默认为 false |
| **closeIconColor**          | `Color?`              | 关闭图标的颜色                                               |
| **dismissDirection**        | `DismissDirection`    | 用户通过滑动手势关闭提示条的方向，默认为向下滑动关闭         |
| **clipBehavior**            | `Clip`                | 内容超出提示条边界时的裁剪行为，默认为 Clip.hardEdge         |
| **onVisible**               | `VoidCallback?`       | 提示条完全显示出来后触发的回调，可用于埋点统计或联动其他逻辑 |
| **actionOverflowThreshold** | `double?`             | 当 content 占据提示条宽度超过此比例（0 到 1 之间）时，action 按钮会自动换行到下一行显示，避免内容被挤压 |

## 55. ColoredBox

### 一、概述

ColoredBox 是 Flutter 中一个**只负责绘制纯色背景**的极简组件，它在子组件的背后填充一块指定的纯色区域，且不附加任何其他布局或装饰功能。

------

### 二、核心属性

| 属性名    | 数据类型  | 属性说明                                                     |
| :-------- | :-------- | :----------------------------------------------------------- |
| **color** | `Color`   | **必填属性**。指定要填充的背景颜色，该颜色会覆盖 ColoredBox 所占据的全部区域 |
| **child** | `Widget?` | 可选的子组件。ColoredBox 的尺寸由子组件撑开决定；若不传子组件，则自身尺寸为零，看不到任何颜色效果 |

### 三、使用要点

1. **与 Container 的关系**：当你使用 Container 仅设置了 color 属性而没有使用其他任何功能（如边距、边框、圆角、对齐等）时，Flutter 内部实际上就是创建了一个 ColoredBox。因此，如果你的需求仅仅是"给背景加一个颜色"，直接使用 ColoredBox 比 Container 更直接、更轻量。
2. **尺寸由外部或子组件决定**：ColoredBox 自身不具备设定宽高的能力。它的大小要么由其子组件撑开，要么由父组件的约束决定。如果需要指定尺寸，应在外层包裹 SizedBox 等约束组件。
3. **仅支持纯色**：ColoredBox 只能填充单一颜色，不支持渐变、圆角、边框、阴影等任何装饰效果。如需这些能力，应改用 DecoratedBox 或 Container。



## 56. SliverAppBar

### 一、概述

SliverAppBar 是 Flutter 中专门用于**可滚动视图内的应用栏组件**，它能够随着列表内容的滚动而自动展开、折叠、悬浮或隐藏，从而实现丰富的顶部栏滚动联动效果。

------

### 二、核心属性

| 属性名                        | 数据类型               | 属性说明                                                     |
| :---------------------------- | :--------------------- | :----------------------------------------------------------- |
| **title**                     | `Widget?`              | 应用栏的标题区域，通常放置文本组件，也可放置任意组件         |
| **leading**                   | `Widget?`              | 应用栏左侧的组件，通常用于放置返回按钮或菜单图标             |
| **automaticallyImplyLeading** | `bool`                 | 是否自动推断 leading 组件（如有上级路由则自动显示返回箭头），默认为 true |
| **actions**                   | `List<Widget>?`        | 应用栏右侧的操作按钮列表，如搜索、分享、更多菜单等图标       |
| **flexibleSpace**             | `Widget?`              | 应用栏展开区域中填充的组件，通常搭配 FlexibleSpaceBar 使用，可实现大图背景随滚动渐变折叠的效果 |
| **expandedHeight**            | `double?`              | 应用栏**完全展开时**的总高度。未设置则等同于普通 AppBar 的高度，设置后会在展开状态下显示更大的区域 |
| **collapsedHeight**           | `double?`              | 应用栏**完全折叠后**的高度，默认等于工具栏（toolbar）的高度  |
| **floating**                  | `bool`                 | 是否开启"浮动"模式。设为 true 时，用户只要稍微向下滑动，应用栏就会立刻完整出现，而不需要滚回列表顶部。默认为 false |
| **pinned**                    | `bool`                 | 是否开启"固定"模式。设为 true 时，应用栏折叠后仍然会有一个最小高度的工具栏固定钉在顶部，永远不会完全消失。默认为 false |
| **snap**                      | `bool`                 | 是否开启"吸附"模式。必须在 floating 为 true 时才能使用。设为 true 后，应用栏在浮出过程中会自动完成展开或收起的动画，不会停留在中间状态。默认为 false |
| **stretch**                   | `bool`                 | 是否允许用户在列表已经滚动到顶部后继续下拉时，应用栏产生过度拉伸效果。默认为 false |
| **onStretchTrigger**          | `AsyncCallback?`       | 拉伸到一定程度后触发的回调，可用于实现下拉刷新等联动逻辑     |
| **stretchTriggerOffset**      | `double`               | 触发 onStretchTrigger 回调所需的拉伸距离，默认为 100.0       |
| **backgroundColor**           | `Color?`               | 应用栏的背景颜色                                             |
| **foregroundColor**           | `Color?`               | 应用栏内标题及图标的前景颜色                                 |
| **elevation**                 | `double?`              | 应用栏的阴影高度                                             |
| **shadowColor**               | `Color?`               | 阴影颜色                                                     |
| **surfaceTintColor**          | `Color?`               | Material 3 中表面色调叠加颜色                                |
| **shape**                     | `ShapeBorder?`         | 应用栏的外形轮廓                                             |
| **toolbarHeight**             | `double`               | 工具栏部分（title、leading、actions 所在区域）的高度，默认为 56.0 |
| **centerTitle**               | `bool?`                | 标题是否居中显示                                             |
| **titleSpacing**              | `double?`              | 标题与 leading 之间的水平间距                                |
| **clipBehavior**              | `Clip?`                | 内容超出边界时的裁剪行为                                     |
| **forceMaterialTransparency** | `bool`                 | 是否强制移除应用栏的 Material 背景层，使其完全透明，默认为 false |
| **bottom**                    | `PreferredSizeWidget?` | 应用栏底部附加的组件，通常放置 TabBar 实现选项卡导航         |

------

### 三、构造函数

#### `SliverAppBar.medium()`

**使用场景**：需要实现 Material 3 中等规格标题应用栏的效果。展开时标题以较大字号显示在应用栏下方区域，折叠后标题自动过渡到工具栏的标准位置并缩小为常规字号。

**独有说明**：无额外独有参数，其核心差异在于内部自动配置了 FlexibleSpaceBar 并预设了中等规格的展开高度与标题过渡动画。

------

#### `SliverAppBar.large()`

**使用场景**：需要实现 Material 3 大规格标题应用栏的效果。与 medium 类似，但展开时标题字号更大、展开区域更高，视觉层级更突出，适合作为页面的主标题展示。

**独有说明**：无额外独有参数，其核心差异在于预设了更大的展开高度和更大号的标题字体样式。

------

### 四、三大模式组合说明

| 模式组合                        | 滚动效果                                                     |
| :------------------------------ | :----------------------------------------------------------- |
| 三者均为 false（默认）          | 向上滚动时应用栏随内容一起滚出屏幕，完全消失                 |
| 仅 **pinned** 为 true           | 向上滚动时应用栏折叠到最小高度后固定在顶部，不会消失         |
| 仅 **floating** 为 true         | 向上滚动时应用栏完全消失，但稍微向下滑就立刻完整浮出         |
| **floating + snap** 均为 true   | 在 floating 基础上增加吸附动画，应用栏浮出时自动弹到完全展开状态 |
| **pinned + floating** 均为 true | 折叠后钉在顶部，向下滑时立刻展开到完整高度                   |

------

### 五、使用要点

1. **必须在 CustomScrollView 中使用**：SliverAppBar 是一个 Sliver 系列组件，只能作为 CustomScrollView 的 slivers 列表成员使用，不能像普通 AppBar 那样直接放在 Scaffold 的 appBar 属性中。
2. **搭配 FlexibleSpaceBar**：要实现经典的大图折叠效果，需将 FlexibleSpaceBar 赋值给 flexibleSpace 属性，并设置合适的 expandedHeight。
3. **snap 依赖 floating**：snap 只有在 floating 同时为 true 时才能设为 true，否则会报错。
4. **与其他 Sliver 组件配合**：SliverAppBar 后面通常跟随 SliverList、SliverGrid 等 Sliver 组件，共同构成完整的可滚动页面布局。



## 57. CustomScrollView

------

### 一、概述

`CustomScrollView` 是一个允许你将多种**Sliver系列组件**（如 SliverList、SliverGrid、SliverAppBar 等）自由组合在同一个滚动视图中的滚动容器，从而实现统一的、协调的滚动效果。

------

### 二、核心属性

| 属性名                      | 数据类型                            | 属性说明                                                     |
| :-------------------------- | :---------------------------------- | :----------------------------------------------------------- |
| **slivers**                 | `List<Widget>`                      | 最核心的属性。放入的必须是 Sliver 系列组件（如 SliverList、SliverGrid、SliverAppBar、SliverToBoxAdapter 等），它们共享同一个滚动上下文，实现统一滚动 |
| **scrollDirection**         | `Axis`                              | 滚动方向。`Axis.vertical` 为纵向滚动（默认），`Axis.horizontal` 为横向滚动 |
| **reverse**                 | `bool`                              | 是否反转滚动方向。设为 `true` 时，内容从底部向顶部排列（纵向时）或从右向左排列（横向时），默认为 `false` |
| **controller**              | `ScrollController`                  | 滚动控制器，用于监听滚动位置、手动跳转到指定位置等。当 `primary` 为 `true` 时不应手动设置此属性 |
| **primary**                 | `bool`                              | 是否作为与父级 `PrimaryScrollController` 关联的主滚动视图。设为 `true` 时会自动获取上层提供的控制器，在 iOS 中点击状态栏可回到顶部 |
| **physics**                 | `ScrollPhysics`                     | 控制滚动的物理行为。常用值：`BouncingScrollPhysics` 弹性回弹效果（iOS 风格）、`ClampingScrollPhysics` 到边缘即停（Android 风格）、`NeverScrollableScrollPhysics` 禁止滚动 |
| **shrinkWrap**              | `bool`                              | 是否根据子组件的实际总长度来决定自身大小，而非尽可能占满可用空间。默认 `false`。设为 `true` 会有性能开销，仅在必要时使用 |
| **anchor**                  | `double`                            | 滚动偏移量的零点在视口中的相对位置，取值 0.0 到 1.0。默认 `0.0` 表示零点在视口起始端。配合 `center` 属性可实现双向滚动 |
| **center**                  | `Key`                               | 指定某个 Sliver 子组件的 Key，使其作为滚动的零点基准。该组件之前的 Sliver 会反向排列，之后的 Sliver 正向排列，从而实现双向无限滚动效果 |
| **cacheExtent**             | `double`                            | 视口前后额外缓存渲染的区域大小（以像素为单位）。值越大，提前渲染的内容越多，滚动越流畅，但内存消耗越高 |
| **clipBehavior**            | `Clip`                              | 内容超出边界时的裁剪方式。默认为 `Clip.hardEdge` 进行硬裁剪。设为 `Clip.none` 可关闭裁剪以提升性能，但超出部分会可见 |
| **keyboardDismissBehavior** | `ScrollViewKeyboardDismissBehavior` | 滚动时键盘的收起策略。`manual` 为手动管理（默认），`onDrag` 为用户一拖动就自动收起键盘 |
| **semanticChildCount**      | `int`                               | 提供给无障碍系统的子项语义数量，帮助辅助功能（如屏幕阅读器）正确播报列表总数 |

------

### 三、关键理解要点

> **为什么需要 CustomScrollView？**

在 Flutter 中，`ListView` 和 `GridView` 各自拥有独立的滚动上下文。如果你想在同一个页面中让一个顶部的可折叠标题栏、一段列表、再加一段网格全部作为**一个整体**协调滚动，直接嵌套多个独立的滚动组件是行不通的——它们会各自为政，出现滚动冲突。

`CustomScrollView` 正是为解决这个问题而生的。它提供了一个统一的滚动舞台，你只需把各类 Sliver 组件放入 `slivers` 列表中，它们就会像一条传送带上的货物一样，按照顺序排列，共享一套完整的滚动逻辑。

> **什么是 Sliver？**

Sliver 是 Flutter 中一类专门为"懒加载滚动"设计的特殊组件。它们不会一次性渲染所有内容，而是只构建当前视口内可见的部分。所有 Sliver 组件的名称都以 "Sliver" 开头，常见的包括：

- **SliverAppBar**：可折叠、可固定的顶部标题栏
- **SliverList**：滚动列表（对应普通的 ListView）
- **SliverGrid**：滚动网格（对应普通的 GridView）
- **SliverToBoxAdapter**：将任意普通组件包装成 Sliver，用于插入非 Sliver 组件
- **SliverPersistentHeader**：滚动时可吸顶或收缩的头部区域
- **SliverFillRemaining**：填充视口剩余空间的 Sliver

> **核心规则：slivers 中只能放 Sliver 组件**

如果你想在 `CustomScrollView` 中放一个普通的 `Container` 或 `Text`，必须先用 `SliverToBoxAdapter` 将其包裹起来，否则会报错。





## 58. SliverList

------

### 一、概述

`SliverList` 是专门在 `CustomScrollView` 中使用的 Sliver 列表组件，用于将多个子组件沿主轴方向线性排列，并且只渲染当前视口内可见的部分以保障性能。

------

### 二、核心属性

| 属性名                     | 数据类型              | 属性说明                                                     |
| :------------------------- | :-------------------- | :----------------------------------------------------------- |
| **delegate**               | `SliverChildDelegate` | 默认构造函数的核心属性，负责控制子组件如何被创建和管理。常用两种实现：① `SliverChildBuilderDelegate`——按需懒加载构建，适合大量或不确定数量的列表项；② `SliverChildListDelegate`——一次性接收固定的子组件列表，适合少量已知的列表项 |
| **addAutomaticKeepAlives** | `bool`                | 是否用 `AutomaticKeepAlive` 包裹每个子项。设为 `true`（默认）时，滑出视口的子项可以在特定场景（如 TabBarView 切换）下保持状态不被销毁 |
| **addRepaintBoundaries**   | `bool`                | 是否为每个子项添加重绘边界。默认 `true`，使每个子项拥有独立的绘制区域，避免某个子项变化时牵连其他子项一起重绘，从而提升渲染性能 |
| **addSemanticIndexes**     | `bool`                | 是否为每个子项自动添加语义索引，供无障碍辅助功能（如屏幕阅读器）使用。默认 `true` |
| **findChildIndexCallback** | `ChildIndexGetter?`   | 当列表数据发生增删或重新排序时，通过此回调根据子项的 Key 快速定位其索引，帮助框架正确复用和匹配已有子项，避免状态错乱 |

------

### 三、构造函数

#### 1. `SliverList.builder`

**场景**：列表项数量较多或不确定时使用，子项按需懒加载构建，只有即将进入视口的子项才会被创建，性能最优。这是最常用的构造方式。

| 独有属性        | 数据类型                       | 属性说明                                                     |
| :-------------- | :----------------------------- | :----------------------------------------------------------- |
| **itemBuilder** | `NullableIndexedWidgetBuilder` | 必需。根据索引按需构建每一个列表项的回调，当返回 `null` 时表示列表到此结束 |
| **itemCount**   | `int?`                         | 列表项的总数。传入具体数字则为有限列表；不传（为 `null`）则依赖 `itemBuilder` 返回 `null` 来终止，可用于无限滚动场景 |

------

#### 2. `SliverList.separated`

**场景**：需要在每两个列表项之间插入分隔元素（如分割线、间距）时使用，无需手动计算索引偏移，框架自动处理分隔元素的插入逻辑。

| 独有属性             | 数据类型                       | 属性说明                                                     |
| :------------------- | :----------------------------- | :----------------------------------------------------------- |
| **itemBuilder**      | `NullableIndexedWidgetBuilder` | 必需。根据索引构建每一个列表项的回调                         |
| **separatorBuilder** | `NullableIndexedWidgetBuilder` | 必需。根据索引构建每两个列表项之间的分隔组件的回调，索引值对应其前方列表项的索引 |
| **itemCount**        | `int?`                         | 列表项的总数（不含分隔元素的数量）                           |

------

#### 3. `SliverList.list`

**场景**：子组件数量少且已经明确时使用，直接传入一个固定的组件列表即可。所有子项会被一次性创建，因此不适用于大量数据。

| 独有属性     | 数据类型       | 属性说明                                                 |
| :----------- | :------------- | :------------------------------------------------------- |
| **children** | `List<Widget>` | 必需。直接传入的完整子组件列表，所有组件在构建时即被创建 |



## 59. SliverGrid

------

### 一、概述

`SliverGrid` 是专门在 `CustomScrollView` 中使用的 Sliver 网格组件，用于将多个子组件按行列二维网格方式排列，并且只渲染当前视口内可见的部分以保障性能。

------

### 二、核心属性

| 属性名                     | 数据类型              | 属性说明                                                     |
| :------------------------- | :-------------------- | :----------------------------------------------------------- |
| **delegate**               | `SliverChildDelegate` | 控制子组件如何被创建和管理。常用两种实现：① `SliverChildBuilderDelegate`——按需懒加载构建，适合大量数据；② `SliverChildListDelegate`——一次性传入固定子组件列表，适合少量数据 |
| **gridDelegate**           | `SliverGridDelegate`  | 控制网格的排列布局策略，决定每行放几个、子项尺寸和间距等。常用两种实现见下方详述 |
| **addAutomaticKeepAlives** | `bool`                | 是否用 `AutomaticKeepAlive` 包裹子项，使其滑出视口后在特定场景下保持状态不被销毁。默认 `true` |
| **addRepaintBoundaries**   | `bool`                | 是否为每个子项添加独立的重绘边界，避免单个子项变化导致其他子项跟着重绘。默认 `true` |
| **addSemanticIndexes**     | `bool`                | 是否自动为子项添加语义索引，供无障碍辅助功能使用。默认 `true` |
| **findChildIndexCallback** | `ChildIndexGetter?`   | 数据增删或重排序时，根据子项的 Key 快速定位索引，帮助框架正确复用已有子项，避免状态错乱 |

------

#### gridDelegate 的两种常用实现

| 实现类                                        | 核心参数             | 说明                                                         |
| :-------------------------------------------- | :------------------- | :----------------------------------------------------------- |
| **SliverGridDelegateWithFixedCrossAxisCount** | `crossAxisCount`     | 直接指定交叉轴方向上固定放置几个子项（即固定列数），每个子项等分剩余宽度 |
|                                               | `mainAxisSpacing`    | 主轴方向（滚动方向）上相邻子项之间的间距                     |
|                                               | `crossAxisSpacing`   | 交叉轴方向上相邻子项之间的间距                               |
|                                               | `childAspectRatio`   | 子项的宽高比，默认 `1.0` 即正方形。大于 1 则偏扁，小于 1 则偏高 |
|                                               | `mainAxisExtent`     | 子项在主轴方向上的固定尺寸。若设置此值，则 `childAspectRatio` 失效 |
| **SliverGridDelegateWithMaxCrossAxisExtent**  | `maxCrossAxisExtent` | 指定每个子项在交叉轴方向上的最大宽度，框架会自动计算每行能放下几个子项，实现响应式布局 |
|                                               | `mainAxisSpacing`    | 同上                                                         |
|                                               | `crossAxisSpacing`   | 同上                                                         |
|                                               | `childAspectRatio`   | 同上                                                         |
|                                               | `mainAxisExtent`     | 同上                                                         |

------

### 三、构造函数

#### 1. `SliverGrid.builder`

**场景**：子项数量较多或不确定时使用，按需懒加载构建，性能最优。这是最推荐的构造方式。

| 独有属性        | 数据类型                       | 属性说明                                                     |
| :-------------- | :----------------------------- | :----------------------------------------------------------- |
| **itemBuilder** | `NullableIndexedWidgetBuilder` | 必需。根据索引按需构建每一个网格项的回调，返回 `null` 表示列表结束 |
| **itemCount**   | `int?`                         | 网格项的总数。传入具体值为有限网格；不传则依赖 `itemBuilder` 返回 `null` 来终止 |

> 注：此构造函数仍需传入 `gridDelegate` 来控制网格布局。

------

#### 2. `SliverGrid.count`

**场景**：想要快速创建一个**固定列数**的网格，且子项数量较少时使用。内部自动使用 `SliverGridDelegateWithFixedCrossAxisCount`，无需手动创建 gridDelegate。

| 独有属性             | 数据类型       | 属性说明                                                 |
| :------------------- | :------------- | :------------------------------------------------------- |
| **crossAxisCount**   | `int`          | 必需。交叉轴方向上固定放几个子项（即列数）               |
| **mainAxisSpacing**  | `double`       | 主轴方向相邻子项的间距，默认 `0.0`                       |
| **crossAxisSpacing** | `double`       | 交叉轴方向相邻子项的间距，默认 `0.0`                     |
| **childAspectRatio** | `double`       | 子项宽高比，默认 `1.0`                                   |
| **children**         | `List<Widget>` | 必需。直接传入的完整子组件列表，所有组件在构建时即被创建 |

------

#### 3. `SliverGrid.extent`

**场景**：希望子项根据屏幕宽度**自适应排列**时使用。你只需指定每个子项的最大宽度，框架会自动计算每行能放多少个，非常适合需要适配多种屏幕尺寸的响应式布局。

| 独有属性               | 数据类型       | 属性说明                                                     |
| :--------------------- | :------------- | :----------------------------------------------------------- |
| **maxCrossAxisExtent** | `double`       | 必需。每个子项在交叉轴方向上的最大允许宽度，框架据此自动决定每行的数量 |
| **mainAxisSpacing**    | `double`       | 主轴方向相邻子项的间距，默认 `0.0`                           |
| **crossAxisSpacing**   | `double`       | 交叉轴方向相邻子项的间距，默认 `0.0`                         |
| **childAspectRatio**   | `double`       | 子项宽高比，默认 `1.0`                                       |
| **children**           | `List<Widget>` | 必需。直接传入的完整子组件列表                               |



## 60. SliverToBoxAdapter

------

### 一、概述

`SliverToBoxAdapter` 是一个将任意普通组件（非 Sliver 组件）包装为 Sliver 的适配器，使其能够被放入 `CustomScrollView` 的 `slivers` 列表中参与统一滚动。

------

### 二、核心属性

| 属性名    | 数据类型  | 属性说明                                                     |
| :-------- | :-------- | :----------------------------------------------------------- |
| **child** | `Widget?` | 唯一核心属性。传入任何一个普通组件（如 Container、Text、Column、Image 等），该组件就会被包装成 Sliver，从而可以放入 CustomScrollView 中与其他 Sliver 组件协同滚动 |



## 61. LayoutBuilder

------

### 一、概述

LayoutBuilder 是一个能够在构建子组件时，**获取到父组件分配给自己的布局约束（可用空间大小）** 的组件，从而让你根据可用空间的大小来决定构建不同的子组件或布局方案。

------

### 二、核心属性

|   属性名    |                    数据类型                     | 属性说明                                                     |
| :---------: | :---------------------------------------------: | :----------------------------------------------------------- |
| **builder** | `Widget Function(BuildContext, BoxConstraints)` | 核心且唯一的必传属性。它是一个构建函数，Flutter 在布局阶段会调用它，并将**父组件施加的约束信息**通过第二个参数传入，你需要在这个函数中返回一个 Widget |

#### BoxConstraints 常用子属性说明

builder 函数的第二个参数类型是 **BoxConstraints**，它描述了父组件允许当前组件使用的空间范围，包含以下四个关键信息：

|   子属性名    | 数据类型 | 说明                                                         |
| :-----------: | :------: | :----------------------------------------------------------- |
| **maxWidth**  | `double` | 父组件允许的**最大宽度**，最常用的属性，用来判断当前可用宽度 |
| **maxHeight** | `double` | 父组件允许的**最大高度**                                     |
| **minWidth**  | `double` | 父组件要求的**最小宽度**，多数场景下为 0                     |
| **minHeight** | `double` | 父组件要求的**最小高度**，多数场景下为 0                     |

------

### 三、关键机制理解

#### 1. 它解决什么问题

在 Flutter 中，很多时候你需要知道"我这个组件实际能用多大的空间"。比如，当空间宽度足够时你想横向并排放置两个面板，空间不够时你想纵向堆叠。**LayoutBuilder 就是让你在构建阶段拿到这个空间信息的唯一官方手段。**

#### 2. 约束从哪来

约束完全由**父组件决定**。LayoutBuilder 自身不产生任何约束，它只是一个"传话者"，把父组件给它的约束原封不动地通过 builder 函数暴露给你。

#### 3. 何时会重新构建

当父组件施加的约束发生变化时（例如屏幕旋转、窗口大小调整、父容器尺寸改变），LayoutBuilder 的 builder 函数会被重新调用，你就能根据新的约束返回不同的布局。

#### 4. 与 MediaQuery 的区别

MediaQuery 获取的是**整个屏幕**的尺寸信息，而 LayoutBuilder 获取的是**父组件实际分配给自己**的空间大小。在嵌套布局中，两者的值往往差异巨大，LayoutBuilder 提供的信息更精准、更局部化。



## 62. Builder

------

### 一、概述

Builder 是一个**纯粹为了获取当前位置的 BuildContext** 而存在的组件，它自身不提供任何视觉效果或布局能力，唯一的作用是通过回调函数将其所在位置的上下文对象暴露出来，以便正确地向上查找祖先组件的数据或功能。

------

### 二、核心属性

|   属性名    |            数据类型             | 属性说明                                                     |
| :---------: | :-----------------------------: | :----------------------------------------------------------- |
| **builder** | `Widget Function(BuildContext)` | 唯一的必传属性。Flutter 调用此函数时，会传入 Builder **自身所在位置**的 BuildContext，你需要在函数内返回一个 Widget |

------

### 三、关键机制理解

#### 1. 它解决什么问题

在 Flutter 中，很多操作需要通过 BuildContext **向上查找**祖先组件。但有一个常见的陷阱：当你在某个组件的 build 方法中，拿到的 context 代表的是**这个组件自身**，而不是它的子级。如果你想查找的目标恰好是在**同一个 build 方法中创建的**，那么这个 context 就找不到它——因为 context 的位置在目标的**上方或同级**，而非下方。

Builder 的作用就是在目标组件的**内部（子树中）创建一个新的 context 锚点**，这个新的 context 位于目标组件的下方，因此能够正确地向上找到目标。

#### 2. BuildContext 到底是什么

BuildContext 本质上是每个组件在 Widget 树中的**位置标识**。通过它可以向上查找最近的祖先组件所提供的数据或功能。不同位置的 context 能"看到"的祖先范围不同，这就是为什么有时候需要 Builder 来提供一个**更精确位置**的 context。

#### 3. 最典型的场景

你在一个 build 方法中同时创建了一个 Scaffold，又想在同一个方法里调用依赖 Scaffold 的功能（例如弹出底部弹窗、打开侧边抽屉）。此时 build 方法自带的 context 在 Scaffold 的**上方**，找不到 Scaffold。用 Builder 包裹一下，就能得到一个位于 Scaffold **下方**的 context，从而顺利找到它。

#### 4. 它与 LayoutBuilder 的区别

LayoutBuilder 的 builder 回调会额外提供父组件的**布局约束信息**，用于响应式布局。而 Builder 的 builder 回调**只提供 BuildContext**，不涉及任何尺寸或约束信息，纯粹解决上下文定位问题。



## 63. CircleAvatar

------

### 一、概述

CircleAvatar 是一个 Material Design 风格的**圆形头像**组件，用于在圆形区域内展示图片、文字（如用户名首字母）或其他子组件。

------

### 二、核心属性

|           属性名           |       数据类型        | 属性说明                                                     |
| :------------------------: | :-------------------: | :----------------------------------------------------------- |
|         **child**          |       `Widget?`       | 圆形区域内显示的子组件，通常用来放置文字（如用户姓名首字母）。当设置了 backgroundImage 且图片加载成功时，child 会被图片遮挡 |
|         **radius**         |       `double?`       | 圆的**半径**，直接控制头像的大小。与 minRadius、maxRadius 互斥，设置了 radius 就不要再设置另外两个 |
|       **minRadius**        |       `double?`       | 最小半径，用于在弹性布局中约束头像最小尺寸，不可与 radius 同时使用 |
|       **maxRadius**        |       `double?`       | 最大半径，用于在弹性布局中约束头像最大尺寸，不可与 radius 同时使用 |
|    **backgroundColor**     |       `Color?`        | 圆形区域的**背景颜色**。未设置图片时作为底色显示；未指定时，Flutter 会根据主题自动选取颜色 |
|    **foregroundColor**     |       `Color?`        | child 中**文字的默认颜色**，同时也影响默认的文字大小样式     |
|    **backgroundImage**     |   `ImageProvider?`    | 填充整个圆形区域的**背景图片**，接收 ImageProvider 类型（如 NetworkImage、AssetImage 等），图片会自动裁剪为圆形 |
|    **foregroundImage**     |   `ImageProvider?`    | 显示在 backgroundImage **之上**的前景图片。可用于实现"主图加载失败时显示备用底图"的效果：将主图设为 foregroundImage，备用图设为 backgroundImage |
| **onBackgroundImageError** | `ImageErrorListener?` | 当 backgroundImage 加载失败时的错误回调，避免图片加载异常导致界面崩溃 |
| **onForegroundImageError** | `ImageErrorListener?` | 当 foregroundImage 加载失败时的错误回调                      |

------

### 三、显示优先级机制

CircleAvatar 内部存在明确的**图层叠加顺序**，从底到顶依次为：

1. **backgroundColor**（最底层的纯色背景）
2. **backgroundImage**（覆盖在背景色上的底图）
3. **foregroundImage**（覆盖在底图上的前景图）
4. **child**（最顶层的子组件）

当 foregroundImage 加载成功时，它会遮挡 backgroundImage 和 backgroundColor。利用这个特性，可以将 backgroundImage 作为兜底的占位图，foregroundImage 作为真正要显示的图片，实现优雅的降级展示。



## 64. PopupMenuButton

------

### 一、概述

PopupMenuButton 是一个 Material Design 风格的**弹出式菜单按钮**组件，点击后会在按钮附近弹出一个包含多个选项的浮动菜单列表，用户选择某项后菜单自动关闭并回传所选值。

------

### 二、核心属性

|      属性名      |                     数据类型                     | 属性说明                                                     |
| :--------------: | :----------------------------------------------: | :----------------------------------------------------------- |
| **itemBuilder**  | `List<PopupMenuEntry<T>> Function(BuildContext)` | **必传属性**。构建菜单项列表的回调函数，返回一个由 PopupMenuEntry 组成的列表，定义菜单中有哪些选项 |
|  **onSelected**  |               `void Function(T)?`                | 用户**选中某个菜单项**后触发的回调，参数为该菜单项携带的值   |
|  **onCanceled**  |                 `VoidCallback?`                  | 用户**未选择任何项**就关闭菜单时触发的回调（如点击菜单外部区域） |
| **initialValue** |                       `T?`                       | 菜单弹出时默认**高亮显示**的菜单项的值，同时菜单会尽量将该项定位在按钮附近 |
|     **icon**     |                    `Widget?`                     | 用图标替代默认的三点竖排图标。设置后按钮显示为 IconButton 样式。不可与 child 同时使用 |
|    **child**     |                    `Widget?`                     | 用完全自定义的组件替代默认按钮外观。不可与 icon 同时使用。设置后点击该组件即弹出菜单 |
|   **enabled**    |                      `bool`                      | 是否启用按钮，设为 false 时按钮变灰且点击无响应，默认为 true |
|    **offset**    |                     `Offset`                     | 控制弹出菜单相对于按钮的**偏移量**，可以调整菜单弹出的位置，默认为 Offset.zero |
|  **elevation**   |                    `double?`                     | 弹出菜单的**阴影高度**，数值越大阴影越明显                   |
|    **color**     |                     `Color?`                     | 弹出菜单的**背景颜色**                                       |
|    **shape**     |                  `ShapeBorder?`                  | 弹出菜单的**外形边框**，可设置圆角等效果                     |
| **constraints**  |                `BoxConstraints?`                 | 对弹出菜单施加**宽高约束**，可控制菜单的最小或最大宽高       |
|   **position**   |               `PopupMenuPosition`                | 控制菜单弹出时的**水平对齐方式**，可选 over（覆盖按钮）或 under（在按钮下方），默认为 over |
| **clipBehavior** |                      `Clip`                      | 菜单内容的裁剪行为，默认为 Clip.none                         |
|   **tooltip**    |                    `String?`                     | 长按按钮时显示的提示文字，默认显示"显示菜单"的本地化文本     |

------

### 三、菜单项类型说明

itemBuilder 返回的列表元素必须是 **PopupMenuEntry** 的子类，Flutter 提供了三种常用的内置类型：

#### 1. PopupMenuItem

最常用的普通菜单项。

|   属性名    |    数据类型     | 说明                                         |
| :---------: | :-------------: | :------------------------------------------- |
|  **value**  |      `T?`       | 该菜单项代表的值，选中后通过 onSelected 回传 |
|  **child**  |    `Widget`     | 菜单项中显示的内容，通常为一个文本组件       |
| **enabled** |     `bool`      | 该项是否可点击，默认为 true                  |
|  **onTap**  | `VoidCallback?` | 点击该项时的回调，在 onSelected 之前触发     |

#### 2. CheckedPopupMenuItem

带有勾选标记的菜单项，适用于需要标识当前选中状态的场景。

|   属性名    | 数据类型  | 说明                           |
| :---------: | :-------: | :----------------------------- |
| **checked** |  `bool`   | 是否显示勾选标记，默认为 false |
|  **child**  | `Widget?` | 勾选标记右侧显示的内容         |

#### 3. PopupMenuDivider

菜单项之间的**水平分割线**，用于对菜单项进行视觉分组，本身不可点击、不携带值。

|   属性名   | 数据类型 | 说明                                          |
| :--------: | :------: | :-------------------------------------------- |
| **height** | `double` | 分割线占据的总高度（包含上下留白），默认为 16 |



## 65. Switch

------

### 一、概述

Switch 是一个双态切换控件，用于在"开"和"关"两种状态之间进行切换，常用于设置页面中控制某项功能的启用或禁用。

------

### 二、核心属性

| 属性名                    | 数据类型                        | 属性说明                                                     |
| :------------------------ | :------------------------------ | :----------------------------------------------------------- |
| **value**                 | `bool`                          | 开关的当前状态，true 为开启，false 为关闭。必填属性          |
| **onChanged**             | `ValueChanged<bool>?`           | 用户拨动开关时触发的回调，传回新的布尔值。设为 null 时进入禁用态 |
| **activeColor**           | `Color?`                        | 开启状态时滑块（圆形把手）的颜色                             |
| **activeTrackColor**      | `Color?`                        | 开启状态时轨道（滑槽背景）的颜色                             |
| **inactiveThumbColor**    | `Color?`                        | 关闭状态时滑块的颜色                                         |
| **inactiveTrackColor**    | `Color?`                        | 关闭状态时轨道的颜色                                         |
| **thumbColor**            | `WidgetStateProperty<Color?>?`  | 基于交互状态动态设置滑块颜色，优先级高于 activeColor 和 inactiveThumbColor |
| **trackColor**            | `WidgetStateProperty<Color?>?`  | 基于交互状态动态设置轨道颜色，优先级高于 activeTrackColor 和 inactiveTrackColor |
| **trackOutlineColor**     | `WidgetStateProperty<Color?>?`  | 轨道外边框颜色，可根据交互状态分别指定                       |
| **trackOutlineWidth**     | `WidgetStateProperty<double?>?` | 轨道外边框宽度，可根据交互状态分别指定                       |
| **thumbIcon**             | `WidgetStateProperty<Icon?>?`   | 在滑块中心显示图标，可根据开关状态展示不同图标               |
| **overlayColor**          | `WidgetStateProperty<Color?>?`  | 按压或悬停时周围水波纹光晕颜色                               |
| **splashRadius**          | `double?`                       | 水波纹光晕的半径大小                                         |
| **mouseCursor**           | `MouseCursor?`                  | 鼠标悬停时显示的光标样式                                     |
| **hoverColor**            | `Color?`                        | 鼠标悬停时的光晕颜色                                         |
| **focusColor**            | `Color?`                        | 获得键盘焦点时的光晕颜色                                     |
| **focusNode**             | `FocusNode?`                    | 手动管理键盘焦点                                             |
| **onFocusChange**         | `ValueChanged<bool>?`           | 焦点状态发生变化时的回调，传回是否获得焦点                   |
| **autofocus**             | `bool`                          | 是否自动获取焦点，默认 false                                 |
| **materialTapTargetSize** | `MaterialTapTargetSize?`        | 最小点击区域大小，影响周围留白                               |
| **dragStartBehavior**     | `DragStartBehavior`             | 拖拽手势的起始行为判定方式，默认为 start                     |

------

### 三、构造函数

#### Switch.adaptive

**使用场景：** 希望开关在不同平台上自动呈现原生风格。在 iOS / macOS 上渲染为苹果风格的 CupertinoSwitch；在 Android 及其他平台上渲染为 Material Design 风格。

**独有核心参数：**

| 属性名                  | 数据类型 | 属性说明                                                     |
| :---------------------- | :------- | :----------------------------------------------------------- |
| **applyCupertinoTheme** | `bool?`  | 仅在渲染为 CupertinoSwitch 时生效。设为 true 时，开关会自动采用当前 CupertinoTheme 中定义的颜色配置；设为 false 或不设置时，则使用 Switch 自身属性中指定的颜色 |

**需注意的行为差异：** 当运行在 iOS / macOS 上被渲染为 CupertinoSwitch 时，以下主属性表中的部分属性将**不会生效**，因为 Cupertino 风格不支持这些 Material 特性：

- **thumbIcon** — 苹果风格的滑块不支持内嵌图标
- **trackOutlineColor / trackOutlineWidth** — 苹果风格轨道无外边框概念
- **splashRadius** — 苹果风格没有水波纹效果
- **hoverColor / focusColor** — 被 Cupertino 自身的视觉反馈取代
- **overlayColor** — 苹果风格使用自身的按压反馈机制
- **materialTapTargetSize** — 点击区域由 Cupertino 规范决定

保留生效的属性包括 value、onChanged、activeColor、activeTrackColor、inactiveThumbColor、inactiveTrackColor、thumbColor、trackColor、focusNode、autofocus、dragStartBehavior 等。





## 66. Checkbox

------

### 一、概述

Checkbox 是一个复选框控件，用于让用户在"选中"与"未选中"之间切换，也可支持第三种"不确定"状态，常用于同意协议、多选列表等场景。

------

### 二、核心属性

| 属性名                    | 数据类型                       | 属性说明                                                     |
| :------------------------ | :----------------------------- | :----------------------------------------------------------- |
| **value**                 | `bool?`                        | 复选框的当前状态。true 为选中（显示对勾），false 为未选中（空白），null 表示不确定状态（显示横线）。必填属性 |
| **onChanged**             | `ValueChanged<bool?>?`         | 用户点击时触发的回调，传回新的状态值。设为 null 时复选框进入不可交互的禁用态 |
| **tristate**              | `bool`                         | 是否启用三态模式。默认 false（仅选中/未选中）；设为 true 后，状态会在 true → false → null 之间循环 |
| **activeColor**           | `Color?`                       | 选中状态时复选框的背景填充颜色                               |
| **checkColor**            | `Color?`                       | 选中状态下**对勾符号**本身的颜色                             |
| **fillColor**             | `WidgetStateProperty<Color?>?` | 基于交互状态动态设置填充颜色，优先级高于 activeColor         |
| **side**                  | `BorderSide?`                  | 未选中状态时的边框样式，可控制颜色与宽度。也支持 WidgetStateBorderSide 实现状态响应 |
| **shape**                 | `OutlinedBorder?`              | 复选框外形轮廓，默认圆角矩形，可替换为圆形等自定义形状       |
| **overlayColor**          | `WidgetStateProperty<Color?>?` | 点击或悬停时周围水波纹光晕的颜色                             |
| **splashRadius**          | `double?`                      | 水波纹光晕的半径大小                                         |
| **hoverColor**            | `Color?`                       | 鼠标悬停时的光晕颜色                                         |
| **focusColor**            | `Color?`                       | 获得键盘焦点时的光晕颜色                                     |
| **focusNode**             | `FocusNode?`                   | 手动管理键盘焦点                                             |
| **autofocus**             | `bool`                         | 是否自动获取焦点，默认 false                                 |
| **isError**               | `bool`                         | 是否以错误状态渲染，常用于表单校验未通过时的视觉警示         |
| **materialTapTargetSize** | `MaterialTapTargetSize?`       | 控制最小点击区域大小，影响周围留白                           |
| **semanticLabel**         | `String?`                      | 无障碍辅助功能的语义描述文本                                 |

------

### 三、构造函数

#### Checkbox.adaptive

**使用场景：** 希望复选框在不同平台上自动呈现原生视觉风格。在 iOS / macOS 上渲染为苹果风格的 CupertinoCheckbox；在 Android 及其他平台上渲染为 Material Design 风格。

**独有核心参数：**

| 属性名          | 数据类型                             | 属性说明                                                     |
| :-------------- | :----------------------------------- | :----------------------------------------------------------- |
| **mouseCursor** | `WidgetStateProperty<MouseCursor?>?` | 鼠标指针悬停在复选框上时显示的光标样式，可根据交互状态（如禁用、悬停）动态切换不同光标形态，桌面端体验优化时常用 |

**需注意的行为差异：** 当运行在 iOS / macOS 上被渲染为 CupertinoCheckbox 时，以下主属性表中的部分属性将**不会生效**，因为 Cupertino 风格不支持这些 Material 特性：

- **splashRadius** — 苹果风格没有水波纹效果
- **hoverColor** / **focusColor** — 被 Cupertino 自身的视觉反馈取代
- **materialTapTargetSize** — 点击区域由 Cupertino 规范决定
- **overlayColor** — 苹果风格使用自身的按压反馈机制
- **isError** — Cupertino 复选框无内置错误态概念

保留生效的属性包括 value、onChanged、tristate、activeColor、checkColor、fillColor、side、shape、focusNode、autofocus、semanticLabel 等。





## 67. Radio

### 一、概述

Radio 是 Flutter 中的单选按钮组件，用于在一组互斥的选项中让用户选择且只能选择其中一个。

------

### 二、核心属性

| 属性名                    | 数据类型                       | 属性说明                                                     |
| :------------------------ | :----------------------------- | :----------------------------------------------------------- |
| **value**                 | `T`                            | 该单选按钮所代表的值，每个 Radio 必须有一个唯一的值来标识自身 |
| **groupValue**            | `T?`                           | 当前这一组单选按钮中被选中的值。当 groupValue 等于 value 时，该按钮显示为选中状态 |
| **onChanged**             | `ValueChanged<T?>?`            | 用户点击该按钮时触发的回调，会将该按钮的 value 传出去。设为 null 时按钮变为禁用状态 |
| **toggleable**            | `bool`                         | 是否允许再次点击已选中的按钮来取消选中，默认为 false，即选中后不可取消 |
| **activeColor**           | `Color?`                       | 按钮被选中时的填充颜色                                       |
| **fillColor**             | `WidgetStateProperty<Color?>?` | 更精细地控制按钮在不同交互状态（选中、未选中、禁用、悬停等）下的填充颜色，优先级高于 activeColor |
| **hoverColor**            | `Color?`                       | 鼠标悬停在按钮上时的覆盖层颜色                               |
| **focusColor**            | `Color?`                       | 按钮获得焦点时的覆盖层颜色                                   |
| **overlayColor**          | `WidgetStateProperty<Color?>?` | 统一控制按钮在不同交互状态下的水波纹覆盖层颜色，优先级高于 hoverColor 和 focusColor |
| **splashRadius**          | `double?`                      | 点击时水波纹扩散的半径大小                                   |
| **materialTapTargetSize** | `MaterialTapTargetSize?`       | 控制按钮最小可点击区域的大小，可选择紧凑模式以减少占用空间   |
| **visualDensity**         | `VisualDensity?`               | 调整按钮的视觉紧凑程度，影响按钮在布局中实际占据的空间       |
| **autofocus**             | `bool`                         | 是否在页面加载后自动获得焦点，默认为 false                   |
| **focusNode**             | `FocusNode?`                   | 用于手动管理焦点行为的节点对象                               |

------

### 三、构造函数

#### `Radio.adaptive`

**使用场景：** 需要应用在不同平台上自动呈现原生风格时使用。在 iOS 和 macOS 上会自动渲染为 Cupertino（苹果原生）风格的单选按钮，在 Android 等其他平台上则保持 Material 风格。

**独有说明：** 该构造函数没有额外的独有参数，所有参数与主构造函数一致，其核心差异仅在于渲染时会根据运行平台自动切换外观样式。





## 68. Chip

### 一、概述

Chip 是 Flutter 中用于以紧凑的圆角小块形式展示一条信息、标签或属性的组件，可附带头像和删除按钮。

------

### 二、核心属性

| 属性名                         | 数据类型                       | 属性说明                                                     |
| :----------------------------- | :----------------------------- | :----------------------------------------------------------- |
| **label**                      | `Widget`                       | **必填**，芯片上显示的主体内容，通常是一段文本               |
| **avatar**                     | `Widget?`                      | 显示在 label 左侧的小图标或小头像，常用于放圆形图片或图标    |
| **labelStyle**                 | `TextStyle?`                   | 控制 label 文本的字体大小、颜色、粗细等样式                  |
| **labelPadding**               | `EdgeInsetsGeometry?`          | label 与芯片边缘或其他元素之间的内间距                       |
| **onDeleted**                  | `VoidCallback?`                | 删除按钮被点击时触发的回调；设置此属性后，芯片右侧会自动出现一个删除图标 |
| **deleteIcon**                 | `Widget?`                      | 自定义删除按钮的图标，默认是一个小叉号                       |
| **deleteIconColor**            | `Color?`                       | 删除图标的颜色                                               |
| **deleteButtonTooltipMessage** | `String?`                      | 长按或悬停在删除按钮上时显示的提示文字                       |
| **color**                      | `WidgetStateProperty<Color?>?` | 精细控制芯片在不同交互状态（默认、禁用、悬停等）下的背景颜色，优先级高于 backgroundColor |
| **backgroundColor**            | `Color?`                       | 芯片的背景颜色，是最简单的背景色设置方式                     |
| **side**                       | `BorderSide?`                  | 芯片的边框样式，可控制边框颜色、宽度等                       |
| **shape**                      | `OutlinedBorder?`              | 芯片的外形轮廓，默认是圆角矩形（StadiumBorder），可改为圆角矩形等其他形状 |
| **elevation**                  | `double?`                      | 芯片的阴影高度，数值越大阴影越明显，立体感越强               |
| **shadowColor**                | `Color?`                       | 阴影的颜色                                                   |
| **surfaceTintColor**           | `Color?`                       | Material 3 下根据海拔高度自动叠加在表面上的着色颜色          |
| **padding**                    | `EdgeInsetsGeometry?`          | 芯片整体内容区域的内间距                                     |
| **clipBehavior**               | `Clip`                         | 内容超出芯片边界时的裁剪方式，默认为不裁剪                   |
| **iconTheme**                  | `IconThemeData?`               | 统一控制芯片内所有图标的默认大小、颜色等主题                 |
| **visualDensity**              | `VisualDensity?`               | 调整芯片的视觉紧凑程度，影响芯片在布局中实际占据的空间       |
| **materialTapTargetSize**      | `MaterialTapTargetSize?`       | 控制芯片最小可点击区域的大小，可选紧凑模式以减少占用空间     |

------

### 三、Chip 家族说明

Chip 本身没有命名构造函数，但 Flutter 提供了四个功能各异的**同族独立组件**，它们与 Chip 共享大部分外观属性，却各自承担不同的交互职责：

#### ① `InputChip`

**使用场景：** 代表用户输入的一条信息，例如邮件收件人、搜索关键词。既可点击触发动作，也可删除移除，是功能最全面的芯片类型。

| 独有属性           | 数据类型              | 属性说明                                     |
| :----------------- | :-------------------- | :------------------------------------------- |
| **onPressed**      | `VoidCallback?`       | 点击整个芯片时触发的回调                     |
| **onSelected**     | `ValueChanged<bool>?` | 选中或取消选中时触发的回调，传出当前选中状态 |
| **selected**       | `bool`                | 是否处于选中状态，默认 false                 |
| **isEnabled**      | `bool`                | 是否可交互，默认 true                        |
| **selectedColor**  | `Color?`              | 选中状态下的背景颜色                         |
| **disabledColor**  | `Color?`              | 禁用状态下的背景颜色                         |
| **showCheckmark**  | `bool?`               | 选中时是否在头像位置显示对勾标记             |
| **checkmarkColor** | `Color?`              | 对勾标记的颜色                               |
| **pressElevation** | `double?`             | 按下时的阴影高度                             |

------

#### ② `ChoiceChip`

**使用场景：** 用于一组选项中进行单选，类似 Radio 的芯片化呈现，常见于筛选条件的选择。

| 独有属性           | 数据类型              | 属性说明                       |
| :----------------- | :-------------------- | :----------------------------- |
| **selected**       | `bool`                | **必填**，该芯片是否为选中状态 |
| **onSelected**     | `ValueChanged<bool>?` | 选中或取消选中时触发的回调     |
| **selectedColor**  | `Color?`              | 选中状态下的背景颜色           |
| **disabledColor**  | `Color?`              | 禁用状态下的背景颜色           |
| **showCheckmark**  | `bool?`               | 选中时是否显示对勾标记         |
| **checkmarkColor** | `Color?`              | 对勾标记的颜色                 |
| **pressElevation** | `double?`             | 按下时的阴影高度               |

------

#### ③ `FilterChip`

**使用场景：** 用于一组选项中进行多选筛选，例如电商平台的标签筛选，可以同时选中多个条件。

| 独有属性           | 数据类型              | 属性说明                                         |
| :----------------- | :-------------------- | :----------------------------------------------- |
| **selected**       | `bool`                | 该芯片是否为选中状态，默认 false                 |
| **onSelected**     | `ValueChanged<bool>?` | 选中或取消选中时触发的回调，设为 null 则芯片禁用 |
| **selectedColor**  | `Color?`              | 选中状态下的背景颜色                             |
| **disabledColor**  | `Color?`              | 禁用状态下的背景颜色                             |
| **showCheckmark**  | `bool?`               | 选中时是否显示对勾标记，默认 true                |
| **checkmarkColor** | `Color?`              | 对勾标记的颜色                                   |
| **pressElevation** | `double?`             | 按下时的阴影高度                                 |

------

#### ④ `ActionChip`

**使用场景：** 纯粹触发一个动作，不涉及选中状态，类似一个风格化的小按钮，例如"分享""收藏"等快捷操作。

| 独有属性           | 数据类型        | 属性说明                                   |
| :----------------- | :-------------- | :----------------------------------------- |
| **onPressed**      | `VoidCallback?` | 点击芯片时触发的回调，设为 null 则芯片禁用 |
| **pressElevation** | `double?`       | 按下时的阴影高度                           |

------

### 四、关键机制说明

**① 基础 Chip 是纯展示型的**

Chip 组件本身没有 onPressed 也没有 onSelected，它只负责静态展示一条信息。唯一的交互能力是通过 onDeleted 提供一个删除入口。如果需要点击或选中行为，应使用上述四个同族组件。

**② 删除图标的出现条件**

只要设置了 onDeleted 回调，删除图标就会自动出现在芯片右侧，无需手动控制其显隐。如果同时设置了 deleteIcon，则会替换默认的叉号图标。

**③ avatar 与 showCheckmark 的联动**

在支持选中状态的芯片（如 FilterChip、ChoiceChip）中，当 showCheckmark 为 true 且芯片被选中时，avatar 区域会被一个动画过渡的对勾图标覆盖。

**④ Material 3 下的视觉变化**

在启用 Material 3 主题的情况下，Chip 家族的默认外观会有明显变化：默认带有边框、取消了默认阴影、颜色方案跟随 ColorScheme。surfaceTintColor 属性在此体系下生效。



## 69. DropdownMenu

### 一、概述

DropdownMenu 是 Flutter 中基于 Material 3 规范的下拉选择菜单组件，将文本输入框与下拉选项列表合为一体，支持用户从预设选项中选择，同时支持输入文字进行筛选或搜索。

------

### 二、核心属性

| 属性名                   | 数据类型                     | 属性说明                                                     |
| :----------------------- | :--------------------------- | :----------------------------------------------------------- |
| **dropdownMenuEntries**  | `List<DropdownMenuEntry<T>>` | **必填**，下拉菜单中所有可选项的列表，每个条目包含一个值和一个显示标签 |
| **onSelected**           | `ValueChanged<T?>?`          | 用户选中某个选项时触发的回调，传出被选中条目的 value         |
| **initialSelection**     | `T?`                         | 菜单初始加载时默认选中的值，需与某个条目的 value 匹配        |
| **controller**           | `TextEditingController?`     | 关联的文本控制器，可用于读取或操控输入框中的文字内容         |
| **enabled**              | `bool`                       | 是否启用该菜单，设为 false 时整个组件变灰且不可交互，默认 true |
| **width**                | `double?`                    | 输入框及下拉菜单的宽度，不设置时根据内容自动计算             |
| **menuHeight**           | `double?`                    | 下拉菜单展开后的最大高度，超出后可滚动浏览                   |
| **label**                | `Widget?`                    | 输入框上方或边框上的标签，通常是一段文字用来说明该菜单的用途 |
| **hintText**             | `String?`                    | 输入框未选择且未输入时显示的灰色提示文字                     |
| **helperText**           | `String?`                    | 显示在输入框下方的辅助说明文字                               |
| **errorText**            | `String?`                    | 显示在输入框下方的红色错误提示文字，设置后输入框自动切换为错误样式 |
| **leadingIcon**          | `Widget?`                    | 显示在输入框最左侧的图标                                     |
| **trailingIcon**         | `Widget?`                    | 菜单收起时输入框最右侧的图标，默认是一个向下的箭头           |
| **selectedTrailingIcon** | `Widget?`                    | 菜单展开时输入框最右侧的图标，默认是一个向上的箭头           |
| **enableFilter**         | `bool`                       | 是否开启过滤功能，开启后用户输入文字时会隐藏不匹配的选项，默认 false |
| **enableSearch**         | `bool`                       | 是否开启搜索功能，开启后用户输入文字时会自动高亮最匹配的选项，默认 true |
| **filterCallback**       | `FilterCallback<T>?`         | 自定义过滤逻辑，决定哪些条目在用户输入时应被保留显示         |
| **searchCallback**       | `SearchCallback<T>?`         | 自定义搜索逻辑，决定用户输入时应高亮哪个条目                 |
| **textStyle**            | `TextStyle?`                 | 输入框中文字的样式                                           |
| **inputDecorationTheme** | `InputDecorationTheme?`      | 输入框的装饰主题，可统一控制边框、填充颜色、标签样式等外观   |
| **menuStyle**            | `MenuStyle?`                 | 下拉菜单弹出层的整体样式，可控制背景色、阴影、圆角、内间距等 |
| **expandedInsets**       | `EdgeInsets?`                | 设置后下拉菜单会撑满父容器宽度并向内收缩指定间距，常用于让菜单与输入框等宽 |
| **requestFocusOnTap**    | `bool?`                      | 点击时是否弹出软键盘获取焦点，桌面端默认 true，移动端默认 false |
| **textAlign**            | `TextAlign?`                 | 输入框内文字的水平对齐方式                                   |
| **alignmentOffset**      | `Offset?`                    | 下拉菜单相对于输入框默认位置的偏移量，可微调弹出位置         |

------

#### DropdownMenuEntry 条目属性

每个选项条目本身也有关键属性，需要了解：

| 属性名           | 数据类型       | 属性说明                                                     |
| :--------------- | :------------- | :----------------------------------------------------------- |
| **value**        | `T`            | **必填**，该条目代表的实际数据值，选中后通过 onSelected 传出 |
| **label**        | `String`       | **必填**，该条目在菜单中显示的文字，选中后也会填入输入框     |
| **leadingIcon**  | `Widget?`      | 显示在该条目文字左侧的图标                                   |
| **trailingIcon** | `Widget?`      | 显示在该条目文字右侧的图标                                   |
| **enabled**      | `bool`         | 该条目是否可被选中，默认 true                                |
| **style**        | `ButtonStyle?` | 该条目的按钮样式，可控制背景色、文字样式、内间距等           |
| **labelWidget**  | `Widget?`      | 替代默认 label 文本的自定义组件，用于更丰富的条目布局展示    |

------

### 三、关键机制说明

**① enableFilter 与 enableSearch 的区别**

这两个属性容易混淆。enableFilter 是"过滤"——输入文字后，不匹配的选项直接从列表中消失不见。enableSearch 是"搜索"——所有选项始终可见，但最匹配的那个会被自动高亮选中。两者可以同时启用，也可以各自独立使用。

**② 选中后输入框自动回填**

用户从下拉列表中点选某个条目后，该条目的 label 文字会自动填入输入框中，无需开发者手动处理。

**③ 与旧版 DropdownButton 的关系**

DropdownMenu 是 Flutter 在 Material 3 体系下推出的全新下拉菜单组件，功能远比旧版 DropdownButton 丰富（内置筛选、搜索、完整的输入框装饰能力等）。在新项目中推荐优先使用 DropdownMenu。

**④ expandedInsets 的妙用**

默认情况下 DropdownMenu 的宽度由内容决定，在表单场景中往往需要它撑满整行。设置 expandedInsets 后，菜单会自动占满父容器宽度，属性值代表距离父容器边缘的留白间距，设置为零即完全撑满。

**⑤ 弹出方向**

下拉菜单默认向下弹出，当下方空间不足时会自动向上弹出，开发者无需手动处理弹出方向。





## 70. DropdownButton

------

### 一、概述

`DropdownButton` 是一个 Material Design 风格的下拉选择按钮，用于让用户从一组预设的选项列表中选择一个值，点击后会弹出一个浮层菜单供用户选取。

------

### 二、核心属性

| 属性名                  | 数据类型                     | 属性说明                                                     |
| :---------------------- | :--------------------------- | :----------------------------------------------------------- |
| **items**               | `List<DropdownMenuItem<T>>?` | 下拉菜单中所有可供选择的选项列表。每个选项由 `DropdownMenuItem` 包裹，其中 `value` 代表该项的实际值，`child` 代表展示内容 |
| **value**               | `T?`                         | 当前被选中的值，必须与 `items` 中某一项的 `value` 完全匹配，否则会报错。传 `null` 表示尚未选中任何项 |
| **onChanged**           | `ValueChanged<T?>?`          | 用户选择了新选项时触发的回调，参数为用户所选项的 `value`。若设为 `null`，整个下拉按钮将变为禁用（置灰不可点击）状态 |
| **hint**                | `Widget?`                    | 当 `value` 为 `null`（即未选中任何项）时，按钮上显示的占位提示内容，通常是一段引导文字 |
| **disabledHint**        | `Widget?`                    | 当按钮处于禁用状态时显示的提示内容。若未设置，则在禁用时退而显示 `hint` |
| **icon**                | `Widget?`                    | 按钮右侧的下拉箭头图标，默认是一个向下的三角箭头，可替换为任意组件 |
| **iconSize**            | `double`                     | 下拉箭头图标的尺寸大小，默认值为 24.0                        |
| **iconEnabledColor**    | `Color?`                     | 按钮可用状态下，箭头图标的颜色                               |
| **iconDisabledColor**   | `Color?`                     | 按钮禁用状态下，箭头图标的颜色                               |
| **style**               | `TextStyle?`                 | 下拉菜单中所有选项文字的文本样式，同时也会影响按钮上已选中项的文字样式 |
| **underline**           | `Widget?`                    | 按钮底部的下划线装饰组件。默认是一条细横线，传入空容器可移除 |
| **isExpanded**          | `bool`                       | 是否让按钮在水平方向上撑满其父容器的全部可用宽度，默认为 `false` |
| **isDense**             | `bool`                       | 是否启用紧凑模式，开启后会减小按钮的垂直高度，默认为 `false` |
| **dropdownColor**       | `Color?`                     | 弹出的下拉浮层菜单的背景颜色                                 |
| **elevation**           | `int`                        | 下拉浮层菜单的阴影高度，数值越大阴影越明显，默认值为 8       |
| **borderRadius**        | `BorderRadius?`              | 下拉浮层菜单的圆角弧度                                       |
| **menuMaxHeight**       | `double?`                    | 下拉浮层菜单的最大高度。当选项过多时，超出此高度的部分将变为可滚动区域 |
| **itemHeight**          | `double`                     | 每个下拉选项的固定高度，默认值为 48.0（即 Material 规范的最小可交互高度） |
| **selectedItemBuilder** | `DropdownButtonBuilder?`     | 自定义"按钮上已选中项"的展示方式的构建器。当你希望按钮上显示的内容与菜单中的选项样式不同时使用 |
| **onTap**               | `VoidCallback?`              | 用户点击按钮（菜单弹出之前）时触发的回调，可用于在打开菜单前执行预处理逻辑 |
| **alignment**           | `AlignmentGeometry`          | 按钮内已选中项的对齐方式，默认为水平靠起始方向、垂直居中     |
| **padding**             | `EdgeInsetsGeometry?`        | 按钮外围的内边距                                             |
| **focusNode**           | `FocusNode?`                 | 用于管理该按钮焦点状态的焦点节点，常用于键盘导航场景         |
| **focusColor**          | `Color?`                     | 按钮获得焦点时的高亮背景色                                   |
| **autofocus**           | `bool`                       | 是否在页面加载时自动获取焦点，默认为 `false`                 |



## 71. DropdownButtonFormField

------

### 一、概述

`DropdownButtonFormField` 是 `DropdownButton` 的表单增强版本，它在下拉选择功能的基础上集成了 `Form` 表单体系的校验、保存与重置能力，并支持通过 `InputDecoration` 统一控制外观装饰。

------

### 二、核心属性

#### 🔹 表单专属属性

| 属性名               | 数据类型                 | 属性说明                                                     |
| :------------------- | :----------------------- | :----------------------------------------------------------- |
| **decoration**       | `InputDecoration?`       | 包裹在下拉按钮外层的装饰配置，可设置标签文字、边框样式、前后缀图标、错误提示样式等，与 `TextFormField` 的装饰体系完全一致。默认会带有下划线边框 |
| **validator**        | `FormFieldValidator<T>?` | 校验函数，在表单触发验证时被调用。接收当前选中的值，返回 `null` 表示通过校验，返回字符串则作为错误信息显示在字段下方 |
| **onSaved**          | `FormFieldSetter<T>?`    | 当所属 `Form` 调用保存操作时触发的回调，参数为当前选中的值，常用于将选中值收集到数据模型中 |
| **autovalidateMode** | `AutovalidateMode?`      | 控制何时自动执行校验。常用值：`disabled` 表示不自动校验（手动触发）；`onUserInteraction` 表示用户操作后自动校验；`always` 表示始终自动校验 |

#### 🔹 下拉功能属性

| 属性名                  | 数据类型                     | 属性说明                                                     |
| :---------------------- | :--------------------------- | :----------------------------------------------------------- |
| **items**               | `List<DropdownMenuItem<T>>?` | 下拉菜单中所有可选项的列表。每个选项由 `DropdownMenuItem` 包裹，`value` 为实际值，`child` 为展示内容 |
| **value**               | `T?`                         | 当前选中项的值，必须与 `items` 中某一项的 `value` 精确匹配。为 `null` 时表示未选中任何项 |
| **onChanged**           | `ValueChanged<T?>?`          | 用户选择新选项时触发的回调。设为 `null` 则整个字段变为禁用状态 |
| **hint**                | `Widget?`                    | 未选中任何项时，按钮上显示的占位提示内容                     |
| **disabledHint**        | `Widget?`                    | 按钮处于禁用状态时显示的提示内容                             |
| **icon**                | `Widget?`                    | 按钮右侧的下拉箭头图标，可替换为任意组件                     |
| **iconSize**            | `double`                     | 下拉箭头图标的尺寸，默认 24.0                                |
| **iconEnabledColor**    | `Color?`                     | 可用状态下箭头图标的颜色                                     |
| **iconDisabledColor**   | `Color?`                     | 禁用状态下箭头图标的颜色                                     |
| **style**               | `TextStyle?`                 | 选项文字与按钮上已选中项文字的文本样式                       |
| **isExpanded**          | `bool`                       | 是否让按钮撑满父容器的全部可用宽度，默认 `false`             |
| **isDense**             | `bool`                       | 是否启用紧凑模式以减小垂直高度，默认 `false`                 |
| **dropdownColor**       | `Color?`                     | 弹出浮层菜单的背景颜色                                       |
| **elevation**           | `int`                        | 浮层菜单的阴影高度，默认 8                                   |
| **borderRadius**        | `BorderRadius?`              | 浮层菜单的圆角弧度                                           |
| **menuMaxHeight**       | `double?`                    | 浮层菜单的最大高度，超出后可滚动                             |
| **itemHeight**          | `double`                     | 每个选项的固定高度，默认 48.0                                |
| **selectedItemBuilder** | `DropdownButtonBuilder?`     | 自定义按钮上已选中项展示样式的构建器，当希望按钮显示内容与菜单选项不同时使用 |
| **onTap**               | `VoidCallback?`              | 点击按钮、菜单弹出之前触发的回调                             |
| **alignment**           | `AlignmentGeometry`          | 按钮内已选中项的对齐方式                                     |
| **focusNode**           | `FocusNode?`                 | 焦点管理节点，用于键盘导航                                   |
| **focusColor**          | `Color?`                     | 获得焦点时的高亮背景色                                       |
| **autofocus**           | `bool`                       | 是否自动获取焦点，默认 `false`                               |
| **padding**             | `EdgeInsetsGeometry?`        | 按钮外围的内边距                                             |



## 72. RefreshIndicator

------

### 一、概述

`RefreshIndicator` 是一个实现 Material Design 下拉刷新交互的组件，当用户在可滚动内容的顶部继续向下拖拽时，会出现一个旋转的圆形进度指示器，松手后触发数据刷新操作。

------

### 二、核心属性

| 属性名                    | 数据类型                                          | 属性说明                                                     |
| :------------------------ | :------------------------------------------------ | :----------------------------------------------------------- |
| **child**                 | `Widget`                                          | 必须是一个可滚动的子组件，例如 `ListView`、`GridView`、`CustomScrollView` 等。不可滚动的子组件无法触发下拉刷新行为 |
| **onRefresh**             | `RefreshCallback`（即 `Future<void> Function()`） | 用户完成下拉手势后触发的刷新回调。必须返回一个 `Future`，当这个 `Future` 完成时，刷新指示器会自动收起。通常在此处执行网络请求等异步操作 |
| **displacement**          | `double`                                          | 刷新指示器从顶部边缘向下偏移的距离，即指示器最终停留旋转时距离顶部的位置，默认 40.0 |
| **edgeOffset**            | `double`                                          | 指示器动画的起始边缘偏移量，默认 0.0。当顶部有固定的 `SliverAppBar` 等遮挡时，可通过此属性将指示器起点下移，避免被遮盖 |
| **color**                 | `Color?`                                          | 旋转进度指示器本身（即那个圆形箭头）的前景颜色               |
| **backgroundColor**       | `Color?`                                          | 旋转进度指示器所在圆形容器的背景颜色                         |
| **strokeWidth**           | `double`                                          | 圆形进度指示器线条的粗细，默认 2.5                           |
| **triggerMode**           | `RefreshIndicatorTriggerMode`                     | 控制在何种滚动场景下允许触发刷新。`onEdge`（默认）表示仅当滚动到最顶端边缘时才可触发；`anywhere` 表示在任意滚动位置向下拖拽都可触发 |
| **notificationPredicate** | `ScrollNotificationPredicate`                     | 一个过滤函数，决定响应哪个层级的可滚动组件发出的滚动通知。默认只响应最近一层的可滚动组件。在嵌套滚动场景下可通过此属性指定监听的层级 |

------

### 三、构造函数

#### `RefreshIndicator.adaptive`

**使用场景：** 用于构建跨平台自适应的下拉刷新体验。在 iOS / macOS 平台上自动采用 Cupertino 风格的刷新指示器外观，在 Android 等其他平台上则保持标准的 Material Design 风格。当你希望应用在不同平台上呈现各自原生风格的刷新效果时，应优先选用此构造函数。

**独有说明：** 该构造函数不引入额外的独有参数，所有属性与默认构造函数一致，区别仅在于内部自动根据当前运行平台切换指示器的视觉风格。

------

> **使用要点提醒：**
>
> - `child` 必须是可滚动组件，若内容不足以滚动，需要为可滚动组件设置 `physics` 为 `AlwaysScrollableScrollPhysics`，否则无法触发下拉手势。
> - `onRefresh` 返回的 `Future` 直接决定指示器的显示时长——`Future` 未完成期间指示器持续旋转，完成后自动收起。切勿返回一个立即完成的 `Future`，否则指示器会一闪而过。
> - 该组件仅支持**垂直方向**的下拉刷新，不支持水平方向。



## 73. BottomSheet

------

### 一、概述

`BottomSheet` 是一个从屏幕底部向上滑出的面板组件，用于承载补充性内容或操作选项，通常通过 `showModalBottomSheet` 或 `showBottomSheet` 函数来间接调用和展示。

------

### 二、核心属性

| 属性名                  | 数据类型                       | 属性说明                                                     |
| :---------------------- | :----------------------------- | :----------------------------------------------------------- |
| **builder**             | `WidgetBuilder`                | **必填**。用于构建底部面板内部内容的构建函数，返回值即为面板中展示的组件 |
| **onClosing**           | `VoidCallback`                 | **必填**。当底部面板即将关闭时触发的回调，可在此处执行关闭前的清理或拦截逻辑 |
| **enableDrag**          | `bool`                         | 是否允许用户通过向下拖拽手势来关闭面板，默认为 `true`        |
| **showDragHandle**      | `bool?`                        | 是否在面板顶部居中显示一个短横条拖拽手柄，方便用户识别可拖拽区域。开启后会自动将 `enableDrag` 视为 `true` |
| **dragHandleColor**     | `Color?`                       | 拖拽手柄短横条的颜色                                         |
| **dragHandleSize**      | `Size?`                        | 拖拽手柄短横条的尺寸（宽度和高度）                           |
| **onDragStart**         | `BottomSheetDragStartHandler?` | 用户开始拖拽面板时触发的回调，参数中包含拖拽的起始位置信息   |
| **onDragEnd**           | `BottomSheetDragEndHandler?`   | 用户结束拖拽面板时触发的回调，参数中包含拖拽的速度等信息，可据此判断用户的操作意图 |
| **backgroundColor**     | `Color?`                       | 面板的背景颜色                                               |
| **shadowColor**         | `Color?`                       | 面板阴影的颜色                                               |
| **elevation**           | `double?`                      | 面板的阴影高度，数值越大阴影越明显                           |
| **shape**               | `ShapeBorder?`                 | 面板的形状，常用于设置顶部圆角                               |
| **clipBehavior**        | `Clip?`                        | 内容超出面板形状边界时的裁剪方式                             |
| **constraints**         | `BoxConstraints?`              | 面板的尺寸约束，可用于限制面板的最大或最小宽高               |
| **animationController** | `AnimationController?`         | 控制面板滑入滑出动画的动画控制器，可自定义动画时长与曲线     |



------

> **实际使用要点：**
>
> 在日常开发中，几乎不会直接将 `BottomSheet` 组件手动放入组件树中，而是通过以下两个全局函数来使用：
>
> | 函数                     | 说明                                                         |
> | :----------------------- | :----------------------------------------------------------- |
> | **showModalBottomSheet** | 弹出一个**模态**底部面板，会在面板后方覆盖一层半透明遮罩，用户点击遮罩或向下拖拽即可关闭。适用于需要用户集中注意力完成操作的场景 |
> | **showBottomSheet**      | 弹出一个**持久性**底部面板，不带遮罩层，用户仍可与页面其他区域交互。适用于展示辅助信息且不阻断主流程的场景 |
>
> 这两个函数内部会自动创建 `BottomSheet` 实例并处理动画与路由，同时提供额外的参数如 `isScrollControlled`（是否允许面板占据全屏高度）、`useSafeArea`（是否避开系统状态栏）、`barrierColor`（遮罩颜色）等，是实际开发中的推荐使用方式。



## 74. ExpansionTile

------

### 一、概述

`ExpansionTile` 是一个可展开/折叠的列表项组件，点击标题区域后会以动画形式展开显示其下方隐藏的子内容，再次点击则折叠收起，常用于构建分组列表、FAQ 问答、设置菜单等需要按需展示详细信息的场景。

------

### 二、核心属性

#### 🔹 标题与内容区域

| 属性名       | 数据类型       | 属性说明                                                     |
| :----------- | :------------- | :----------------------------------------------------------- |
| **title**    | `Widget`       | **必填**。标题区域的主要内容，始终可见，不随展开折叠状态变化。通常放置一段文字 |
| **subtitle** | `Widget?`      | 显示在标题下方的副标题内容，同样始终可见，用于补充说明       |
| **children** | `List<Widget>` | 展开后显示的子组件列表，折叠时完全隐藏。这些子组件从上到下垂直排列在标题区域下方 |
| **leading**  | `Widget?`      | 标题行最左侧的前置组件，通常放置图标或头像                   |
| **trailing** | `Widget?`      | 标题行最右侧的尾部组件。默认是一个会随展开折叠状态自动旋转的箭头图标，设置此属性后将替换默认箭头 |

#### 🔹 状态控制

| 属性名                 | 数据类型                   | 属性说明                                                     |
| :--------------------- | :------------------------- | :----------------------------------------------------------- |
| **initiallyExpanded**  | `bool`                     | 组件首次构建时是否处于展开状态，默认为 `false`（折叠）       |
| **controller**         | `ExpansionTileController?` | 展开折叠的外部控制器，可通过它在组件外部以编程方式主动调用展开或折叠操作，而不依赖用户点击 |
| **onExpansionChanged** | `ValueChanged<bool>?`      | 展开或折叠状态发生变化时的回调，参数为 `true` 表示刚展开，`false` 表示刚折叠 |
| **maintainState**      | `bool`                     | 折叠时是否保留子组件的状态。默认为 `false`，即折叠后子组件会被销毁，再展开时重新创建。设为 `true` 则即使折叠也保持子组件状态不丢失 |

#### 🔹 外观样式

| 属性名                         | 数据类型              | 属性说明                                                     |
| :----------------------------- | :-------------------- | :----------------------------------------------------------- |
| **backgroundColor**            | `Color?`              | 展开状态下整个组件的背景颜色                                 |
| **collapsedBackgroundColor**   | `Color?`              | 折叠状态下整个组件的背景颜色                                 |
| **iconColor**                  | `Color?`              | 展开状态下尾部默认箭头图标的颜色                             |
| **collapsedIconColor**         | `Color?`              | 折叠状态下尾部默认箭头图标的颜色                             |
| **textColor**                  | `Color?`              | 展开状态下标题与副标题文字的颜色                             |
| **collapsedTextColor**         | `Color?`              | 折叠状态下标题与副标题文字的颜色                             |
| **shape**                      | `ShapeBorder?`        | 展开状态下组件的边框形状，可用于设置圆角或描边               |
| **collapsedShape**             | `ShapeBorder?`        | 折叠状态下组件的边框形状                                     |
| **tilePadding**                | `EdgeInsetsGeometry?` | 标题行（包含 leading、title、subtitle、trailing）的内边距    |
| **childrenPadding**            | `EdgeInsetsGeometry?` | 展开后子组件列表区域的内边距，常用于给子内容添加左侧缩进以体现层级关系 |
| **expandedAlignment**          | `Alignment?`          | 展开后子组件列表在水平方向上的对齐方式，默认居中             |
| **expandedCrossAxisAlignment** | `CrossAxisAlignment?` | 展开后子组件列表在交叉轴（水平方向）上的对齐方式             |
| **clipBehavior**               | `Clip?`               | 子内容超出边界时的裁剪行为                                   |
| **dense**                      | `bool?`               | 是否启用紧凑模式，开启后减小标题行的垂直高度                 |
| **visualDensity**              | `VisualDensity?`      | 视觉密度，进一步微调组件的紧凑程度                           |
| **enableFeedback**             | `bool?`               | 点击时是否触发触觉反馈与音效反馈                             |



## 75. AspectRatio

### 一、概述

AspectRatio 是一个专门用来**强制其子组件保持指定宽高比**的布局组件。无论父容器给出多大的空间，它都会按照你设定的比例（如 16:9、4:3、1:1 等）来约束子组件的尺寸，确保子组件不会变形或拉伸走样。

------

### 二、核心属性

| 属性名          | 数据类型  | 属性说明                                                     |
| :-------------- | :-------- | :----------------------------------------------------------- |
| **aspectRatio** | `double`  | 宽高比的值，计算方式为"宽 ÷ 高"。例如希望宽高比为 16:9，则传入 16/9；希望正方形则传入 1.0。该值必须大于 0 |
| **child**       | `Widget?` | 被约束宽高比的子组件。AspectRatio 会将计算后的尺寸强加给这个子组件 |

------

### 三、尺寸计算逻辑（关键理解点）

AspectRatio 的工作方式并非凭空决定大小，而是**先从父容器获取可用空间，再结合你设定的宽高比，推算出最终尺寸**。具体规则如下：

1. **当父容器给了明确的宽度（宽度受约束）**：AspectRatio 会采用该宽度，然后根据宽高比自动算出高度。例如父容器宽 320，宽高比设为 16/9，则高度自动变为 180。
2. **当父容器给了明确的高度但宽度自由**：AspectRatio 会采用该高度，然后根据宽高比反推出宽度。
3. **当父容器宽高都受严格约束（宽高都被锁死）**：AspectRatio 会尽可能在约束范围内满足宽高比，但最终尺寸可能无法完美符合你设定的比例，因为父容器不允许它自由调整。

> **一句话总结**：AspectRatio 需要至少一个方向是"可伸缩的"，它才能真正发挥按比例调整的作用。

------

### 四、典型使用场景

- **视频播放器区域**：需要始终保持 16:9 的画面比例，避免黑边或画面拉伸。
- **图片展示卡片**：希望不同屏幕宽度下，图片区域始终保持统一的宽高比，视觉效果一致。
- **正方形头像容器**：将宽高比设为 1.0，无论外部空间如何变化，子组件始终是正方形。
- **响应式布局**：在不同设备上自适应宽度的同时，保持内容区域的视觉比例不变。



## 76. FittedBox

### 一、概述

FittedBox 是一个将**子组件按照指定的缩放策略，等比或非等比地缩放并放置到父容器可用空间内**的布局组件。当子组件的原始尺寸与父容器给定的空间不匹配时，由它决定如何缩放和对齐。

------

### 二、核心属性

| 属性名           | 数据类型            | 属性说明                                                     |
| :--------------- | :------------------ | :----------------------------------------------------------- |
| **fit**          | `BoxFit`            | 控制子组件如何缩放以适应父容器空间的策略，默认值为 `BoxFit.contain`。详见下方 BoxFit 各取值说明 |
| **alignment**    | `AlignmentGeometry` | 当缩放后的子组件未完全占满父容器时，决定子组件在剩余空间中的对齐位置，默认值为 `Alignment.center`（居中） |
| **clipBehavior** | `Clip`              | 当子组件缩放后超出父容器边界时的裁剪行为，默认值为 `Clip.none`（不裁剪） |
| **child**        | `Widget?`           | 需要被缩放的子组件                                           |

------

#### BoxFit 取值详解

| 取值          | 说明                                                         |
| :------------ | :----------------------------------------------------------- |
| **contain**   | 在保持宽高比的前提下，将子组件**尽可能放大**，但确保完整显示在父容器内，可能某个方向会留白 |
| **cover**     | 在保持宽高比的前提下，将子组件**放大到完全覆盖**父容器，多余部分会溢出（需配合 clipBehavior 裁剪） |
| **fill**      | **不保持宽高比**，将子组件在宽和高两个方向分别拉伸，完全填满父容器，可能导致内容变形 |
| **fitWidth**  | 保持宽高比，优先保证子组件的**宽度铺满**父容器宽度，高度按比例自动计算，可能上下溢出或留白 |
| **fitHeight** | 保持宽高比，优先保证子组件的**高度铺满**父容器高度，宽度按比例自动计算，可能左右溢出或留白 |
| **none**      | 不做任何缩放，子组件保持自身原始尺寸，直接放置在父容器中     |
| **scaleDown** | 行为与 contain 相似，但**只允许缩小，不允许放大**。当子组件本身比父容器小时，保持原始尺寸不变 |

------

### 三、典型使用场景

- **文字自适应缩放**：当一段文字可能因为内容过长而溢出容器时，用 FittedBox 包裹可以让文字自动等比缩小，避免溢出。
- **图标/图片自适应**：在不确定容器大小的响应式布局中，让图标或图片根据可用空间自动缩放。
- **防止内容溢出**：子组件尺寸超过父容器时，自动按比例缩小到刚好放得下。
- **行内多组件等比缩放**：将一个 Row 等组合组件用 FittedBox 包裹，当屏幕变窄时整体等比缩小，而非换行或溢出。

------

### 四、工作原理

FittedBox 的工作分为三步：

1. **测量子组件**：先让子组件在"无限大"的空间中自由绘制，得到子组件的原始尺寸。
2. **计算缩放**：将子组件的原始尺寸与父容器提供的实际空间对比，根据 fit 属性指定的策略计算出缩放比例。
3. **定位放置**：根据 alignment 属性将缩放后的子组件放置到父容器中的相应位置。

> **核心要点**：FittedBox 需要父容器提供**有限的约束空间**才能工作。如果父容器给出的是无限空间（比如在未设宽度的水平滚动列表中），FittedBox 将无法判断该缩放到多大，会导致布局报错。



## 77. Transform

### 一、概述

Transform 是一个对子组件施加**矩阵变换**的组件，可以实现旋转、缩放、平移、翻转、倾斜等视觉变换效果，且变换仅影响绘制层，**不影响子组件在布局中实际占据的空间位置和大小**。

------

### 二、核心属性

| 属性名                | 数据类型             | 属性说明                                                     |
| :-------------------- | :------------------- | :----------------------------------------------------------- |
| **transform**         | `Matrix4`            | 4×4 变换矩阵，定义具体的变换操作。所有变换（旋转、缩放、平移、倾斜等）最终都通过这个矩阵来描述 |
| **origin**            | `Offset?`            | 变换的原点偏移量，相对于 alignment 所确定的点再做一次偏移，用于精细调整变换中心的位置 |
| **alignment**         | `AlignmentGeometry?` | 变换的锚点对齐方式，决定变换围绕子组件的哪个位置进行。例如设为 center 表示围绕中心点变换，设为 topLeft 表示围绕左上角变换 |
| **transformHitTests** | `bool`               | 是否对点击事件也施加同样的变换。设为 true（默认）时，用户点击的判定区域会跟随变换后的视觉位置；设为 false 时，点击判定仍然在变换前的原始位置 |
| **filterQuality**     | `FilterQuality?`     | 变换时的图像采样质量。对包含图片或复杂绘制的子组件进行旋转、缩放时，设置此值可减少锯齿和模糊 |
| **child**             | `Widget?`            | 被施加变换的子组件                                           |

------

### 三、构造函数

#### 1. Transform.rotate

**场景**：专门用于**旋转**子组件，无需手动构建 Matrix4 矩阵。

| 独有属性  | 数据类型 | 属性说明                                                     |
| :-------- | :------- | :----------------------------------------------------------- |
| **angle** | `double` | 旋转角度，单位为**弧度**（非角度）。正值为顺时针旋转，负值为逆时针旋转。例如 π（约 3.14159）表示旋转 180 度 |

------

#### 2. Transform.scale

**场景**：专门用于**缩放**子组件，支持整体等比缩放或分别对横向、纵向独立缩放。

| 独有属性   | 数据类型  | 属性说明                                                     |
| :--------- | :-------- | :----------------------------------------------------------- |
| **scale**  | `double?` | 整体等比缩放倍数。1.0 为原始大小，大于 1 放大，小于 1 缩小，不可与 scaleX/scaleY 同时使用 |
| **scaleX** | `double?` | 仅水平方向的缩放倍数，可与 scaleY 配合实现非等比缩放         |
| **scaleY** | `double?` | 仅垂直方向的缩放倍数，可与 scaleX 配合实现非等比缩放         |

------

#### 3. Transform.translate

**场景**：专门用于**平移**子组件的视觉位置，使其在绘制时偏移指定的距离。

| 独有属性   | 数据类型 | 属性说明                                                     |
| :--------- | :------- | :----------------------------------------------------------- |
| **offset** | `Offset` | 平移的偏移量。dx 为水平方向偏移（正值向右），dy 为垂直方向偏移（正值向下） |

------

#### 4. Transform.flip

**场景**：专门用于**镜像翻转**子组件，可实现水平翻转、垂直翻转或同时翻转。

| 独有属性  | 数据类型 | 属性说明                               |
| :-------- | :------- | :------------------------------------- |
| **flipX** | `bool`   | 是否沿垂直轴做水平镜像翻转，默认 false |
| **flipY** | `bool`   | 是否沿水平轴做垂直镜像翻转，默认 false |

------

### 四、核心机制

**"只变外观，不变布局"** 是理解 Transform 最关键的一点：

- Transform 的变换发生在**绘制阶段**，而非**布局阶段**。子组件在布局树中依然占据原来的空间位置和大小，周围的其他组件不会因为 Transform 的变换而被推开或重新排列。
- 这意味着，如果你把一个组件用 Transform.translate 平移了 100 像素，它在视觉上移走了，但它原来的位置仍然被"占着"，周围的兄弟组件不会填补这个空缺。
- 同理，用 Transform.scale 将组件放大两倍，放大后的部分可能覆盖到相邻组件上方，但布局系统对此毫无感知。

------

### 五、典型使用场景

- **动画效果**：配合动画控制器，实现旋转加载指示器、缩放弹出效果、平移滑入动画等。
- **视觉微调**：对某个组件做细微的位置偏移或角度倾斜，而不干扰整体布局。
- **镜像翻转**：实现图标水平翻转（如将一个向右的箭头翻转为向左）或文字镜像效果。
- **3D 透视效果**：通过 Matrix4 的 perspective 方法结合旋转，实现类似卡片翻转的伪 3D 效果。



## 78. AnimatedOpacity

### 一、概述

AnimatedOpacity 是一个**隐式动画组件**，当其 opacity 属性值发生变化时，会自动在旧值与新值之间执行平滑的透明度过渡动画，无需手动创建和管理动画控制器。

------

### 二、核心属性

| 属性名                     | 数据类型        | 属性说明                                                     |
| :------------------------- | :-------------- | :----------------------------------------------------------- |
| **opacity**                | `double`        | 子组件的目标透明度，取值范围为 0.0 到 1.0。0.0 为完全透明（不可见），1.0 为完全不透明（完全可见）。每次该值变化时自动触发动画过渡 |
| **duration**               | `Duration`      | 动画从当前透明度过渡到目标透明度所需的时长，必须设置。例如设为 300 毫秒表示透明度变化会在 300 毫秒内平滑完成 |
| **curve**                  | `Curve`         | 动画的速度曲线，控制动画的节奏感。默认值为 `Curves.linear`（匀速）。常用值如 `Curves.easeIn`（先慢后快）、`Curves.easeOut`（先快后慢）、`Curves.easeInOut`（两头慢中间快） |
| **reverseDuration**        | `Duration?`     | 动画反向执行时的时长。若不设置，则反向动画与正向动画使用相同的 duration |
| **onEnd**                  | `VoidCallback?` | 动画完成时触发的回调函数，可用于在淡入淡出结束后执行后续逻辑，如移除组件、触发下一段动画等 |
| **alwaysIncludeSemantics** | `bool`          | 是否在透明度为 0（完全不可见）时仍保留子组件的语义信息（无障碍信息）。默认为 false，即完全透明时语义树中不包含该子组件 |
| **child**                  | `Widget?`       | 被施加透明度动画的子组件                                     |

------

### 三、隐式动画机制

**"隐式动画"的含义**：

- 在 Flutter 中，动画组件分为两大类——**隐式动画**和**显式动画**。AnimatedOpacity 属于隐式动画。
- 所谓"隐式"，是指你**只需要改变目标属性的值**（这里是 opacity），组件会**自动完成从旧值到新值的动画过渡**，整个动画的启动、插值计算、帧刷新、停止都由框架内部处理。
- 你不需要创建 AnimationController、不需要管理 Tween、不需要调用 forward 或 reverse 方法。只要在 setState 中把 opacity 改成新值，动画就自动开始。

**触发条件**：每次 Widget 重建时，如果 AnimatedOpacity 检测到 opacity 属性的值与上一次不同，就自动启动一次过渡动画。如果值没变，则什么都不发生。

------

### 四、典型使用场景

- **淡入效果**：页面加载完成后，将 opacity 从 0.0 改为 1.0，内容平滑地从透明渐变为可见。
- **淡出效果**：删除或隐藏某个元素前，将 opacity 从 1.0 改为 0.0，元素平滑消失，体验远优于瞬间消失。
- **状态切换提示**：如按钮禁用时降低透明度到 0.4，启用时恢复到 1.0，通过动画过渡让状态变化更自然。
- **交替显示**：配合 onEnd 回调，在一个组件淡出完成后切换内容再淡入，实现简易的内容切换过渡。



## 79. IndexedStack

### 一、概述

IndexedStack 是一个可以容纳多个子组件、但同一时刻只显示其中一个子组件的堆叠容器，通过索引值决定当前显示哪一个，而**所有未显示的子组件仍然保留在内存中并维持各自的状态**。

------

### 二、核心属性

| 属性名            | 数据类型            | 属性说明                                                     |
| :---------------- | :------------------ | :----------------------------------------------------------- |
| **index**         | `int?`              | 指定当前要显示的子组件的索引位置，从 0 开始计数。默认值为 0，即显示第一个子组件。设为 `null` 时，所有子组件均不显示 |
| **children**      | `List<Widget>`      | 需要被管理的所有子组件列表。所有子组件都会被创建并保持存活，只是仅有 index 指向的那个可见 |
| **alignment**     | `AlignmentGeometry` | 控制所有子组件在堆叠区域内的对齐方式，默认为左上角对齐       |
| **sizing**        | `StackFit`          | 决定未使用 Positioned 包裹的子组件如何确定自身大小。`loose` 表示子组件可以自由决定大小；`expand` 表示子组件被强制撑满可用空间；`passthrough` 表示直接沿用父级传入的约束 |
| **textDirection** | `TextDirection`     | 文字方向，影响 alignment 中与起始端（start/end）相关的对齐方式的实际解析方向 |
| **clipBehavior**  | `Clip`              | 当子组件超出堆叠区域边界时的裁剪策略，默认为 `hardEdge`，即硬边裁剪 |

------

### 三、关键机制与特性

**状态保持机制**
IndexedStack 与普通的条件切换显示最本质的区别在于：当你通过改变 index 来切换显示的子组件时，那些被隐藏的子组件**并不会被销毁**。它们依然存在于 Widget 树中，所有内部状态（如输入框已填入的文字、列表的滚动位置、动画的当前进度等）都会被完整保留。当 index 再次切换回来时，用户看到的依然是离开前的样子。

**尺寸占用规则**
IndexedStack 的整体大小取决于所有子组件中最大的那一个，而不是当前可见的那一个。即使当前显示的是一个很小的子组件，整个 IndexedStack 占据的空间仍然与最大的那个子组件一致。



## 80. LinearProgressIndicator

### 一、概述

LinearProgressIndicator 是一个水平方向的线性进度指示器组件，用于向用户展示某个任务的完成进度或表示正在加载中的状态。

------

### 二、核心属性

| 属性名              | 数据类型                | 属性说明                                                     |
| :------------------ | :---------------------- | :----------------------------------------------------------- |
| **value**           | `double?`               | 当前进度值，取值范围为 0.0 到 1.0。0.0 表示无进度，1.0 表示完成。设为 `null` 时进入**不确定模式**，进度条将呈现一段色块反复来回滑动的动画，表示"正在处理但不知道具体进度" |
| **backgroundColor** | `Color?`                | 进度条轨道的背景色，即尚未填充部分的颜色                     |
| **color**           | `Color?`                | 进度条已填充部分（即进度指示本身）的颜色。这是设置进度颜色最简洁直接的方式 |
| **valueColor**      | `Animation<Color?>?`    | 以动画形式控制进度条填充部分的颜色，可以实现颜色渐变过渡效果。当同时设置了 `color` 和 `valueColor` 时，`valueColor` 的优先级更高 |
| **minHeight**       | `double?`               | 进度条的最小高度（粗细），单位为逻辑像素。默认约为 4.0，可通过此属性自由调整进度条的粗细程度 |
| **borderRadius**    | `BorderRadiusGeometry?` | 进度条的圆角半径，可以将默认的直角进度条变为带圆角的样式，让视觉效果更加柔和 |
| **semanticsLabel**  | `String?`               | 无障碍语义标签，用于屏幕阅读器向视障用户描述此进度条代表什么内容 |
| **semanticsValue**  | `String?`               | 无障碍语义值，用于屏幕阅读器向视障用户播报当前的具体进度信息 |

------

### 三、两种工作模式

**确定模式（Determinate）**

当给 `value` 属性赋予一个 0.0 到 1.0 之间的具体数值时，进度条处于确定模式。此时进度条会根据数值精确地展示填充比例。适用于文件下载、上传等能够明确计算完成百分比的场景。

**不确定模式（Indeterminate）**

当 `value` 设为 `null`（即不传值）时，进度条处于不确定模式。此时进度条上会有一段色块持续来回滑动，表示任务正在进行但无法预估具体完成比例。适用于网络请求等待、初始化加载等无法量化进度的场景。





## 81. Slider

### 一、概述

Slider 是一个水平方向的滑动条组件，用户通过拖动滑块在指定的数值范围内选取一个值。

------

### 二、核心属性

| 属性名                   | 数据类型                       | 属性说明                                                     |
| :----------------------- | :----------------------------- | :----------------------------------------------------------- |
| **value**                | `double`                       | 滑块当前所处的值，必须介于 `min` 和 `max` 之间。这是一个必传属性，且需要配合 `onChanged` 回调实时更新，否则滑块不会移动 |
| **onChanged**            | `ValueChanged<double>?`        | 用户拖动滑块时持续触发的回调，参数为当前滑块所在的新值。设为 `null` 时滑块变为禁用状态（灰色不可交互） |
| **min**                  | `double`                       | 滑动条的最小值，默认为 0.0                                   |
| **max**                  | `double`                       | 滑动条的最大值，默认为 1.0                                   |
| **divisions**            | `int?`                         | 将滑动范围等分为多少段离散刻度。未设置时滑块可停在范围内任意位置（连续滑动）；设置后滑块只能停在刻度点上（离散滑动），拖动时会有吸附效果 |
| **label**                | `String?`                      | 当设置了 `divisions` 后，用户拖动滑块时会在滑块上方弹出一个气泡标签，此属性用于指定气泡中显示的文字内容，通常用来展示当前值 |
| **activeColor**          | `Color?`                       | 滑块左侧已激活部分（即从最小值到当前值之间）的轨道颜色，同时也会影响滑块圆点本身的颜色 |
| **inactiveColor**        | `Color?`                       | 滑块右侧未激活部分（即从当前值到最大值之间）的轨道颜色       |
| **thumbColor**           | `Color?`                       | 单独控制滑块圆点的颜色，优先级高于 `activeColor` 对圆点的影响 |
| **overlayColor**         | `WidgetStateProperty<Color?>?` | 用户按压或聚焦滑块时，圆点周围出现的半透明光晕的颜色，可根据不同交互状态分别设置 |
| **onChangeStart**        | `ValueChanged<double>?`        | 用户手指按下滑块、开始拖动的瞬间触发一次，参数为起始值       |
| **onChangeEnd**          | `ValueChanged<double>?`        | 用户手指松开滑块、结束拖动的瞬间触发一次，参数为最终值。常用于在拖动结束后执行一次性操作（如发起网络请求） |
| **secondaryTrackValue**  | `double?`                      | 次级轨道的值，用于在主进度之外显示第二层进度（如视频播放器中已缓冲的进度），显示范围从 `min` 到该值 |
| **secondaryActiveColor** | `Color?`                       | 次级轨道已填充部分的颜色                                     |
| **allowedInteraction**   | `SliderInteraction?`           | 控制用户与滑块的交互方式。可选值包括：仅允许拖拽滑块圆点、仅允许点击轨道任意位置跳转、或两者都允许 |

------

### 三、构造函数

#### Slider.adaptive

**使用场景**：希望滑动条在不同平台上自动呈现对应平台的原生外观风格。在 iOS / macOS 上会自动渲染为 Cupertino 风格的滑动条，在 Android 及其他平台上则保持 Material 风格。

**独有说明**：该构造函数没有额外的独有参数，所有属性与默认构造函数完全一致，唯一区别在于渲染时的平台自适应行为。

------

### 四、关键机制

**必须手动更新值**
Slider 本身不会自动记住用户拖到了哪里。你必须在 `onChanged` 回调中接收新值，并通过状态管理将新值赋给 `value` 属性触发重建，滑块才会真正移动到新位置。如果不更新，滑块会弹回原处。

**连续模式与离散模式**
不设置 `divisions` 时，用户可以将滑块拖到范围内的任意精度位置，得到的是带长小数的数值。设置 `divisions` 后，范围被均匀切分为固定的刻度段，滑块只能停在刻度上，适合需要整数或固定步长取值的场景。



## 82. CheckboxListTile

### 一、概述

CheckboxListTile 是一个将复选框（Checkbox）与列表项（ListTile）合二为一的组件，用于在一行中同时展示标题、副标题等文本信息和一个可勾选的复选框，点击整行任意区域即可切换勾选状态。

------

### 二、核心属性

| 属性名                | 数据类型                  | 属性说明                                                     |
| :-------------------- | :------------------------ | :----------------------------------------------------------- |
| **value**             | `bool?`                   | 复选框当前的勾选状态。`true` 为选中，`false` 为未选中，`null` 为半选中状态（需配合 `tristate` 使用）。必传属性 |
| **onChanged**         | `ValueChanged<bool?>?`    | 用户点击时触发的回调，参数为切换后的新状态值。设为 `null` 时整行变为禁用状态，不可交互 |
| **title**             | `Widget?`                 | 列表项的主标题区域，通常放置一个文本组件，显示该选项的主要描述信息 |
| **subtitle**          | `Widget?`                 | 主标题下方的副标题区域，用于展示补充说明文字，字号默认比主标题小 |
| **secondary**         | `Widget?`                 | 列表项中与复选框相对的另一侧显示的组件，通常放置图标或头像。复选框在右侧时它在左侧，反之亦然 |
| **controlAffinity**   | `ListTileControlAffinity` | 控制复选框在行内的位置。`leading` 表示复选框在最左侧；`trailing` 表示在最右侧；`platform` 表示跟随当前平台默认习惯 |
| **tristate**          | `bool`                    | 是否启用三态模式，默认为 `false`。开启后 `value` 可接受 `null`，复选框会呈现"横线"样式的半选中状态，点击时在 选中 → 半选 → 未选 三个状态间循环 |
| **activeColor**       | `Color?`                  | 复选框处于选中状态时填充的背景颜色                           |
| **checkColor**        | `Color?`                  | 复选框选中时内部对勾符号的颜色                               |
| **tileColor**         | `Color?`                  | 整行列表项在未选中状态下的背景颜色                           |
| **selectedTileColor** | `Color?`                  | 当 `selected` 为 `true` 时，整行列表项的背景颜色             |
| **selected**          | `bool`                    | 是否将整行标记为"选中高亮"状态，默认为 `false`。开启后标题和副标题的文字颜色会跟随主题的选中色变化，注意这与复选框的勾选状态是独立的 |
| **dense**             | `bool?`                   | 是否使用紧凑布局，开启后整行高度缩小，适合在空间有限时展示更多选项 |
| **contentPadding**    | `EdgeInsetsGeometry?`     | 整行内容区域的内边距，用于调整文字和复选框距行边缘的间距     |
| **shape**             | `ShapeBorder?`            | 整行列表项的外形轮廓，可设置圆角矩形等形状                   |
| **isThreeLine**       | `bool`                    | 是否允许副标题区域占据更多垂直空间，默认为 `false`。设为 `true` 时整行高度增大，适合副标题文字较长需要换行的场景 |
| **enabled**           | `bool`                    | 是否启用该列表项，默认为 `true`。设为 `false` 时整行呈现灰色禁用态，与 `onChanged` 设为 `null` 效果类似 |
| **checkboxShape**     | `OutlinedBorder?`         | 复选框本身的外形，可将默认的圆角方框改为圆形等其他形状       |

------

### 三、构造函数

#### CheckboxListTile.adaptive

**使用场景**：希望复选框部分在不同平台上自动适配原生外观。在 iOS / macOS 上复选框会渲染为 Cupertino 风格，在 Android 及其他平台上保持 Material 风格。

**独有说明**：无额外独有参数，所有属性与默认构造函数一致，唯一区别是复选框的渲染会进行平台自适应。



## 83. RadioListTile

### 一、概述

RadioListTile 是一个将单选按钮（Radio）与列表项（ListTile）合二为一的组件，用于在一行中同时展示标题、副标题等文本信息和一个单选圆钮，点击整行任意区域即可选中该选项，且同组中只能有一个被选中。

------

### 二、核心属性

| 属性名                | 数据类型                       | 属性说明                                                     |
| :-------------------- | :----------------------------- | :----------------------------------------------------------- |
| **value**             | `T`                            | 该单选项所代表的值。泛型 `T` 可以是任意类型（如整数、字符串、枚举等）。当 `groupValue` 与此值相等时，该项被选中。必传属性 |
| **groupValue**        | `T?`                           | 当前这一组单选按钮中，被选中的那个值。框架通过比较每个选项的 `value` 是否等于 `groupValue` 来决定谁显示为选中状态。必传属性 |
| **onChanged**         | `ValueChanged<T?>?`            | 用户点击该行时触发的回调，参数为该项的 `value` 值。你需要在回调中将该值赋给 `groupValue` 对应的状态变量并触发重建。设为 `null` 时整行变为禁用状态 |
| **title**             | `Widget?`                      | 列表项的主标题区域，通常放置文本组件，显示该选项的主要描述信息 |
| **subtitle**          | `Widget?`                      | 主标题下方的副标题区域，用于展示补充说明文字，字号默认比主标题小 |
| **secondary**         | `Widget?`                      | 列表项中与单选按钮相对的另一侧显示的组件，通常放置图标或头像。单选按钮在左侧时它在右侧，反之亦然 |
| **controlAffinity**   | `ListTileControlAffinity`      | 控制单选按钮在行内的位置。`leading` 表示在最左侧；`trailing` 表示在最右侧；`platform` 表示跟随当前平台默认习惯 |
| **activeColor**       | `Color?`                       | 单选按钮处于选中状态时的填充颜色                             |
| **tileColor**         | `Color?`                       | 整行列表项在未选中状态下的背景颜色                           |
| **selectedTileColor** | `Color?`                       | 当 `selected` 为 `true` 时，整行列表项的背景颜色             |
| **selected**          | `bool`                         | 是否将整行标记为"选中高亮"状态，默认为 `false`。开启后标题和副标题的文字颜色会跟随主题选中色变化，注意这与单选按钮本身是否被选中是两个独立的概念 |
| **toggleable**        | `bool`                         | 是否允许再次点击已选中的选项来取消选中，默认为 `false`。开启后点击已选中项会使 `groupValue` 变为 `null`，实现"可取消选择"的效果 |
| **dense**             | `bool?`                        | 是否使用紧凑布局，开启后整行高度缩小，适合空间有限时展示更多选项 |
| **contentPadding**    | `EdgeInsetsGeometry?`          | 整行内容区域的内边距，用于调整文字和单选按钮距行边缘的间距   |
| **shape**             | `ShapeBorder?`                 | 整行列表项的外形轮廓，可设置圆角矩形等形状                   |
| **isThreeLine**       | `bool`                         | 是否允许副标题区域占据更多垂直空间，默认为 `false`。设为 `true` 时整行高度增大，适合副标题文字较长需要换行的场景 |
| **enabled**           | `bool`                         | 是否启用该列表项，默认为 `true`。设为 `false` 时整行呈现灰色禁用态 |
| **fillColor**         | `WidgetStateProperty<Color?>?` | 可根据不同交互状态（选中、悬停、禁用等）分别设置单选按钮的填充颜色，比 `activeColor` 的控制粒度更细 |

------

### 三、构造函数

#### RadioListTile.adaptive

**使用场景**：希望单选按钮部分在不同平台上自动适配原生外观。在 iOS / macOS 上单选按钮会渲染为 Cupertino 风格，在 Android 及其他平台上保持 Material 风格。

**独有说明**：无额外独有参数，所有属性与默认构造函数一致，唯一区别是单选按钮的渲染会进行平台自适应。

------



## 84. SwitchListTile

------

### 一、概述

SwitchListTile 是一个将**列表项（ListTile）** 与**开关（Switch）** 组合在一起的复合组件，用于在列表中提供一个可点击整行来切换开/关状态的交互控件，最典型的应用场景是"设置页面"中的各类开关选项。

------

### 二、核心属性

| 属性名                 | 数据类型                       | 属性说明                                                     |
| :--------------------- | :----------------------------- | :----------------------------------------------------------- |
| **value**              | `bool`                         | 开关当前的状态，`true` 为开启，`false` 为关闭，必须提供      |
| **onChanged**          | `ValueChanged<bool>?`          | 用户点击开关或整行时触发的回调，传入切换后的新值；设为 `null` 则整行变为禁用（灰色不可交互） |
| **title**              | `Widget?`                      | 列表项的主标题，通常放一个文本组件来描述该开关的功能         |
| **subtitle**           | `Widget?`                      | 主标题下方的副标题，用于补充说明，字号更小、颜色更浅         |
| **secondary**          | `Widget?`                      | 显示在开关对侧的辅助控件，通常放一个图标，起到视觉提示作用   |
| **controlAffinity**    | `ListTileControlAffinity`      | 控制开关出现在行的哪一侧：`leading`（左侧）、`trailing`（右侧，默认）、`platform`（跟随系统习惯） |
| **activeColor**        | `Color?`                       | 开关处于**开启**状态时，滑块（圆形拇指）的颜色               |
| **activeTrackColor**   | `Color?`                       | 开关处于**开启**状态时，滑轨（长条背景）的颜色               |
| **inactiveThumbColor** | `Color?`                       | 开关处于**关闭**状态时，滑块的颜色                           |
| **inactiveTrackColor** | `Color?`                       | 开关处于**关闭**状态时，滑轨的颜色                           |
| **thumbColor**         | `WidgetStateProperty<Color?>?` | 以状态响应的方式统一定义滑块颜色，可针对按下、悬停、禁用等不同状态分别指定颜色，优先级高于 `activeColor` 和 `inactiveThumbColor` |
| **trackColor**         | `WidgetStateProperty<Color?>?` | 以状态响应的方式统一定义滑轨颜色，逻辑同上                   |
| **trackOutlineColor**  | `WidgetStateProperty<Color?>?` | 以状态响应的方式定义滑轨**边框轮廓**的颜色                   |
| **thumbIcon**          | `WidgetStateProperty<Icon?>?`  | 在开关滑块上显示一个小图标，可根据开/关等不同状态显示不同图标（如打勾或叉号） |
| **tileColor**          | `Color?`                       | 整行列表项的背景颜色                                         |
| **selectedTileColor**  | `Color?`                       | 当 `selected` 为 `true` 时，整行列表项的背景颜色             |
| **selected**           | `bool`                         | 是否将该行标记为"选中"状态，选中后标题和副标题会采用主题的主色调渲染，默认 `false` |
| **dense**              | `bool?`                        | 设为 `true` 时减小行的垂直高度，使布局更加紧凑               |
| **isThreeLine**        | `bool`                         | 设为 `true` 表示副标题允许占据两行空间，使整个列表项呈现三行布局，默认 `false` |
| **contentPadding**     | `EdgeInsetsGeometry?`          | 控制行内容与行边缘之间的内边距                               |
| **shape**              | `ShapeBorder?`                 | 定义整行列表项的外形轮廓，例如设为圆角矩形                   |
| **hoverColor**         | `Color?`                       | 桌面端鼠标悬停在该行上时的高亮覆盖颜色                       |
| **splashRadius**       | `double?`                      | 点击时水波纹效果的扩散半径                                   |

------

### 三、构造函数

#### SwitchListTile.adaptive

**使用场景：** 当你希望应用在不同平台上呈现原生风格的开关时使用。在 iOS 和 macOS 上会自动渲染为圆润的 Cupertino 风格开关，在 Android 和其他平台上则保持 Material 风格开关。整行列表项的布局和交互逻辑不变，仅开关控件的外观随平台自适应。

**独有说明：** 该构造函数没有额外的独有参数，其所有属性与默认构造函数完全一致。它唯一的区别在于**内部自动选择平台对应的开关样式**，无需开发者手动判断当前运行平台。



## 85. Tooltip

------

### 一、概述

Tooltip 是一个当用户**长按（移动端）或鼠标悬停（桌面端）** 某个组件时，在其附近弹出一段简短文字提示的辅助信息组件，用于解释该组件的用途或含义。

------

### 二、核心属性

| 属性名                   | 数据类型              | 属性说明                                                     |
| :----------------------- | :-------------------- | :----------------------------------------------------------- |
| **message**              | `String?`             | 弹出提示框中显示的**纯文本**内容，与 `richMessage` 二者必须提供其一且不能同时使用 |
| **richMessage**          | `InlineSpan?`         | 弹出提示框中显示的**富文本**内容，可包含不同字号、颜色、粗细混排的文字段落，与 `message` 互斥 |
| **child**                | `Widget?`             | 被 Tooltip 包裹的目标组件，用户对这个组件进行长按或悬停时就会触发提示弹出 |
| **height**               | `double?`             | 提示框的高度                                                 |
| **padding**              | `EdgeInsetsGeometry?` | 提示文字与提示框边缘之间的内边距                             |
| **margin**               | `EdgeInsetsGeometry?` | 提示框与屏幕边缘之间的外边距，防止提示框溢出屏幕             |
| **verticalOffset**       | `double?`             | 提示框与目标组件之间的**垂直偏移距离**，数值越大提示框离目标越远 |
| **preferBelow**          | `bool?`               | 提示框优先显示在目标组件的**下方**还是上方；`true`（默认）优先显示在下方，空间不足时自动翻转到上方 |
| **decoration**           | `Decoration?`         | 提示框的外观装饰，可自定义背景色、圆角、阴影、边框等视觉效果 |
| **textStyle**            | `TextStyle?`          | 提示文字的样式，包括字号、颜色、字重等                       |
| **textAlign**            | `TextAlign?`          | 提示文字在提示框内的水平对齐方式，如居左、居中、居右         |
| **waitDuration**         | `Duration?`           | 鼠标悬停后**等待多久**才弹出提示框，用于避免鼠标快速划过时频繁弹出 |
| **showDuration**         | `Duration?`           | 提示框弹出后**持续显示多久**后自动消失                       |
| **triggerMode**          | `TooltipTriggerMode?` | 触发方式：`longPress`（长按触发，移动端默认）、`tap`（单击触发）、`manual`（仅通过程序手动控制显隐） |
| **enableFeedback**       | `bool?`               | 提示框弹出时是否伴随系统触觉或声音反馈，默认为 `true`        |
| **onTriggered**          | `VoidCallback?`       | 提示框被触发弹出时执行的回调函数，可用于埋点统计等场景       |
| **excludeFromSemantics** | `bool`                | 是否将提示文字从无障碍语义树中排除；默认 `false`，即屏幕阅读器会朗读提示内容 |
| **exitDuration**         | `Duration?`           | 用户手指离开或鼠标移出后，提示框经过多长时间的**淡出动画**后完全消失 |



## 86. Dismissible

------

### 一、概述

Dismissible 是一个允许用户通过**水平或垂直滑动手势**将其子组件从界面中移除的交互组件，最典型的用途是列表项的"滑动删除"功能。

------

### 二、核心属性

| 属性名                  | 数据类型                           | 属性说明                                                     |
| :---------------------- | :--------------------------------- | :----------------------------------------------------------- |
| **key**                 | `Key`                              | **必须提供**的唯一标识。框架依靠它来精确识别哪个 Dismissible 被移除，缺失或重复会导致列表状态混乱 |
| **child**               | `Widget`                           | 被包裹的目标组件，即用户看到并进行滑动操作的那个组件，通常是一个列表项 |
| **background**          | `Widget?`                          | 向**起始方向**（从左往右滑）滑动时，从子组件背后露出的底层组件，常用来放置一个带图标和背景色的容器表示"删除"或"归档" |
| **secondaryBackground** | `Widget?`                          | 向**结束方向**（从右往左滑）滑动时露出的底层组件。若不设置，两个方向滑动都会显示 `background`；若设置了，则两个方向各自显示独立的背景 |
| **direction**           | `DismissDirection`                 | 控制允许滑动的方向。常用值：`horizontal`（左右均可）、`endToStart`（仅从右往左）、`startToEnd`（仅从左往右）、`vertical`（上下方向）、`none`（禁止滑动） |
| **onDismissed**         | `DismissDirection → void`          | 子组件被**完全滑出屏幕后**触发的回调，参数为实际滑动的方向。通常在此回调中执行真正的数据删除操作 |
| **confirmDismiss**      | `DismissDirection → Future<bool?>` | 子组件即将被移除**之前**触发的异步回调，返回 `true` 允许移除，返回 `false` 或 `null` 则取消移除并自动弹回原位。常用来弹出确认对话框让用户二次确认 |
| **onResize**            | `VoidCallback?`                    | 子组件被移除后，列表中剩余项**收缩填补空隙**过程中持续触发的回调 |
| **dismissThresholds**   | `Map<DismissDirection, double>`    | 各方向上的**滑动触发阈值**，取值 0.0 到 1.0 之间，代表滑动距离占组件宽度的比例。默认约 0.4，即滑过 40% 松手就会触发移除，未达阈值则弹回 |
| **movementDuration**    | `Duration`                         | 松手后子组件**飞出屏幕**的动画时长，默认 200 毫秒            |
| **resizeDuration**      | `Duration?`                        | 子组件飞出后，下方列表项**向上收缩填补**的动画时长，默认 300 毫秒；设为 `null` 可跳过收缩动画 |
| **crossAxisEndOffset**  | `double`                           | 子组件在飞出过程中，沿**交叉轴**（垂直于滑动方向）的偏移量。默认为 0，即沿直线飞出；设为非零值会让飞出轨迹带有斜向效果 |
| **dragStartBehavior**   | `DragStartBehavior`                | 拖拽起点的判定方式：`start`（从手指按下点算起，更即时）或 `down`（从检测到拖动意图时算起，默认） |
| **behavior**            | `HitTestBehavior`                  | 命中测试行为，决定透明区域是否也能响应滑动手势，默认为 `opaque` |



## 87. SelectableText

------

### 一、概述

SelectableText 是一个允许用户通过**长按或鼠标拖拽来选中、复制其中文字**的文本展示组件，功能上等同于 Text 组件但额外赋予了文本可选中的交互能力。

------

### 二、核心属性

| 属性名                         | 数据类型                          | 属性说明                                                     |
| :----------------------------- | :-------------------------------- | :----------------------------------------------------------- |
| **data**                       | `String`                          | 构造函数的第一个位置参数，即要显示的纯文本字符串内容，必须提供 |
| **style**                      | `TextStyle?`                      | 文本的视觉样式，包括字号、颜色、字重、字体、行高、字间距等   |
| **textAlign**                  | `TextAlign?`                      | 文本的水平对齐方式：`left`（左对齐）、`center`（居中）、`right`（右对齐）、`justify`（两端对齐）等 |
| **textDirection**              | `TextDirection?`                  | 文本的书写方向：`ltr`（从左到右）或 `rtl`（从右到左），影响对齐和换行行为 |
| **maxLines**                   | `int?`                            | 文本最多显示的行数，超出部分会被截断；不设置则不限制行数     |
| **minLines**                   | `int?`                            | 文本区域最少占据的行数，即使文字不够也会撑开相应高度         |
| **cursorColor**                | `Color?`                          | 文本被选中时，光标（闪烁竖线）的颜色                         |
| **cursorWidth**                | `double`                          | 光标的宽度，默认为 2.0                                       |
| **cursorHeight**               | `double?`                         | 光标的高度，默认跟随文字行高                                 |
| **cursorRadius**               | `Radius?`                         | 光标末端的圆角半径，可使光标看起来更圆润                     |
| **showCursor**                 | `bool`                            | 是否显示光标，默认 `false`；设为 `true` 后即使未选中文字也会在点击位置显示一个闪烁光标 |
| **selectionControls**          | `TextSelectionControls?`          | 自定义选中文字后弹出的操作手柄和工具栏（如复制、全选按钮）的样式与行为 |
| **onSelectionChanged**         | `SelectionChangedCallback?`       | 用户选中文字的范围发生变化时触发的回调，可获取当前选中的文本范围和触发原因 |
| **onTap**                      | `VoidCallback?`                   | 用户点击文本时触发的回调                                     |
| **textScaler**                 | `TextScaler?`                     | 文本缩放器，控制文字相对于默认字号的缩放比例，取代了已废弃的 textScaleFactor |
| **strutStyle**                 | `StrutStyle?`                     | 支撑样式，强制统一每行的最小行高，确保多种字体混排时行高一致 |
| **scrollPhysics**              | `ScrollPhysics?`                  | 当文本内容超出可视区域时的滚动物理效果，如弹性滚动或固定边界滚动 |
| **textHeightBehavior**         | `TextHeightBehavior?`             | 精细控制首行顶部和末行底部的行高分配行为                     |
| **contextMenuBuilder**         | `EditableTextContextMenuBuilder?` | 自定义长按或右键点击时弹出的上下文菜单（如复制、全选菜单）的内容和外观 |
| **magnifierConfiguration**     | `TextMagnifierConfiguration?`     | 配置移动端选中文字时出现的放大镜效果的行为和样式             |
| **semanticsLabel**             | `String?`                         | 提供给无障碍系统的语义标签，屏幕阅读器会朗读此文本而非实际显示文本 |
| **enableInteractiveSelection** | `bool`                            | 是否启用文本的交互式选中功能，默认 `true`；设为 `false` 则退化为普通不可选中文本 |

------

### 三、构造函数

#### SelectableText.rich

**使用场景：** 当需要在同一段可选中的文本中混合使用**不同的字号、颜色、字重、甚至可点击链接**等多种样式时使用，即富文本选中场景。

**独有核心参数：**

| 参数名       | 数据类型   | 说明                                                         |
| :----------- | :--------- | :----------------------------------------------------------- |
| **textSpan** | `TextSpan` | 构造函数的第一个位置参数，接收一个 TextSpan 富文本对象。TextSpan 可以嵌套多个子 TextSpan，每个子片段拥有独立的 `text`、`style` 和 `recognizer`（手势识别器，用于实现文字点击） |



## 88. RichText

### 一、概述

RichText 是 Flutter 中用于在**同一段文字内**展示**多种不同样式**（如不同颜色、字号、粗细、下划线等）的底层渲染组件，它通过接收一棵由 TextSpan 节点组成的富文本树来完成复杂的混合排版。

------

### 二、核心属性

| 属性名                 | 数据类型              | 属性说明                                                     |
| :--------------------- | :-------------------- | :----------------------------------------------------------- |
| **text**               | `InlineSpan`          | 最核心的属性，通常传入一个 **TextSpan** 对象作为富文本树的根节点。TextSpan 内部可以嵌套多个子 TextSpan，每个子节点可以拥有独立的样式，从而实现"一段话里多种风格"的效果 |
| **textAlign**          | `TextAlign`           | 文本的水平对齐方式，如居左、居中、居右、两端对齐等。默认为居左 |
| **textDirection**      | `TextDirection`       | 文本的书写方向，决定文字是从左到右排列还是从右到左排列，主要影响阿拉伯语、希伯来语等从右向左书写的语言 |
| **softWrap**           | `bool`                | 是否允许文本在空间不足时自动换行。设为否时，超出部分会按 overflow 的策略处理。默认为允许换行 |
| **overflow**           | `TextOverflow`        | 文本溢出时的处理策略，常见选项有：直接裁剪、以省略号结尾、逐渐淡出等。默认为裁剪 |
| **maxLines**           | `int?`                | 限制文本最多显示的行数。超出行数的内容将按 overflow 策略处理。不设置则不限行数 |
| **textScaler**         | `TextScaler`          | 文本缩放器，用于控制文字相对于原始字号的缩放比例。它替代了早期版本中的缩放因子方案，支持更灵活的非线性缩放策略 |
| **strutStyle**         | `StrutStyle`          | 支撑线样式，用于统一每一行文本的最小行高，确保即使不同 TextSpan 使用了不同字号，行与行之间的间距也能保持一致和可预测 |
| **textWidthBasis**     | `TextWidthBasis`      | 决定如何测量文本宽度。可选择以最长行的实际宽度为准，或以包含该行的完整父级宽度为准 |
| **textHeightBehavior** | `TextHeightBehavior?` | 精细控制文本首行顶部和末行底部的额外行距是否生效，可用来消除文字上下方系统自动添加的多余空白 |
| **selectionColor**     | `Color?`              | 当文本被选中时的高亮背景颜色                                 |

------

#### TextSpan 关键子属性补充说明

由于 RichText 的全部能力几乎都通过 **text** 属性中的 TextSpan 来表达，以下是 TextSpan 本身最常用的属性：

| 属性名             | 数据类型             | 属性说明                                                     |
| :----------------- | :------------------- | :----------------------------------------------------------- |
| **text**           | `String?`            | 该节点要显示的具体文字内容                                   |
| **style**          | `TextStyle?`         | 该节点文字的样式，包括字体大小、颜色、粗细、斜体、下划线、字间距、行高等一切视觉表现 |
| **children**       | `List<InlineSpan>?`  | 子节点列表，可以继续嵌套更多的 TextSpan，实现样式的层层叠加与拼接。子节点会**继承**父节点的 style，并可以局部覆盖 |
| **recognizer**     | `GestureRecognizer?` | 手势识别器，可以让这一小段文字变得可点击，常用于实现"点击跳转链接"或"点击某个关键词"之类的交互 |
| **semanticsLabel** | `String?`            | 为无障碍功能提供的语义标签，屏幕阅读器会朗读此内容而非实际显示的文字 |



## 89. PopScope

### 一、概述

PopScope 是 Flutter 中用于**拦截和控制页面返回行为**的组件，它能决定当前页面是否允许被弹出（返回上一页），并在返回动作发生时执行自定义逻辑，适用于表单未保存提示、退出确认等场景。

------

### 二、核心属性

| 属性名                     | 数据类型                           | 属性说明                                                     |
| :------------------------- | :--------------------------------- | :----------------------------------------------------------- |
| **child**                  | `Widget`                           | 被 PopScope 包裹的子组件，通常是当前页面的整体内容。PopScope 本身不产生任何视觉效果，它只是在子组件外层增加返回行为的管控能力 |
| **canPop**                 | `bool`                             | 核心开关。设为 **true** 时，页面可以正常返回（系统返回键、侧滑手势等均生效）；设为 **false** 时，系统级别的返回操作将被**阻断**，页面不会被弹出。默认值为 true |
| **onPopInvokedWithResult** | `PopInvokedWithResultCallback<T>?` | 当返回动作被触发时调用的回调函数。它会接收两个参数：第一个是布尔值 **didPop**，表示本次返回是否真正执行了（若 canPop 为 false，则 didPop 为 false）；第二个是泛型 **result**，表示返回时携带的结果数据。开发者可以在此回调中执行弹窗确认、数据保存等自定义逻辑 |

------

#### onPopInvokedWithResult 回调参数补充说明

| 参数名     | 数据类型 | 说明                                                         |
| :--------- | :------- | :----------------------------------------------------------- |
| **didPop** | `bool`   | 如果为 true，说明页面已经成功弹出，此时不应再尝试手动弹出页面，否则会出错；如果为 false，说明返回被 canPop 拦截了，页面仍停留在当前，开发者可以在此时弹出确认对话框，询问用户是否确认离开 |
| **result** | `T?`     | 页面返回时附带的结果值，泛型类型与 PopScope 声明时指定的类型一致。若无返回值则为空 |



## 90. ValueListenableBuilder

### 一、概述

ValueListenableBuilder 是 Flutter 中用于**监听一个 ValueListenable 对象的值变化，并在值发生改变时自动局部重建界面**的组件，它实现了精准的、最小范围的 UI 刷新，无需触发整个页面的重建。

------

### 二、核心属性

| 属性名              | 数据类型                                    | 属性说明                                                     |
| :------------------ | :------------------------------------------ | :----------------------------------------------------------- |
| **valueListenable** | `ValueListenable<T>`                        | 要监听的数据源对象，最常用的实现是 **ValueNotifier**。ValueNotifier 是一个轻量级的值容器，当它内部持有的值被修改时，会自动通知所有监听者。泛型 T 表示所持有值的数据类型，可以是 int、String、bool、自定义对象等任意类型 |
| **builder**         | `Widget Function(BuildContext, T, Widget?)` | 构建函数，每当 valueListenable 中的值发生变化时，此函数会被重新调用以生成新的界面。它接收三个参数：**context** 为当前构建上下文；**value** 为最新的值，可直接使用；**child** 为下方 child 属性传入的不变组件，用于性能优化 |
| **child**           | `Widget?`                                   | 可选的、**不随值变化而重建**的子组件。它会被原封不动地传递给 builder 函数的第三个参数。将不需要刷新的部分放在这里，可以避免不必要的重建开销，提升性能 |

------

#### ValueNotifier 补充说明

由于 ValueListenableBuilder 几乎总是搭配 **ValueNotifier** 使用，以下是 ValueNotifier 的关键要点：

| 要点         | 说明                                                         |
| :----------- | :----------------------------------------------------------- |
| **创建方式** | 创建时传入一个初始值，泛型类型自动推断                       |
| **读取值**   | 通过其 **value** 属性获取当前持有的值                        |
| **修改值**   | 直接对 **value** 属性赋新值即可。赋值的瞬间，ValueNotifier 会自动通知所有监听它的 ValueListenableBuilder 进行重建 |
| **触发条件** | 只有当新值与旧值**不相等**时才会触发通知。如果赋的值和原来一样，不会引起重建 |
| **生命周期** | ValueNotifier 在不再使用时需要调用 **dispose** 方法释放资源，防止内存泄漏。通常在 StatefulWidget 的 dispose 生命周期中完成 |

------

### 三、工作原理与使用要点

ValueListenableBuilder 没有额外的命名构造函数，这里着重说明其核心工作机制：

#### 工作流程

1. **绑定数据源**：将一个 ValueNotifier 对象传给 valueListenable 属性，建立监听关系。
2. **首次构建**：组件初次挂载时，builder 函数立即执行一次，使用 ValueNotifier 的当前值渲染界面。
3. **值变化触发重建**：当 ValueNotifier 的 value 被赋予新值时，builder 函数自动重新执行，界面随之更新。
4. **局部刷新**：只有 builder 函数返回的那部分组件树会被重建，页面其余部分完全不受影响。

#### child 的性能优化作用

builder 函数每次被调用时都会重新执行，如果其中包含复杂的、与数据变化无关的组件，会造成不必要的性能消耗。将这类固定不变的组件通过 child 属性传入，它们只会被构建一次，之后在 builder 中直接复用即可。



## 91. NestedScrollView

### 一、概述

NestedScrollView 是 Flutter 中用于**协调外部滚动视图与内部滚动视图之间滚动联动**的组件，它将头部区域（如可折叠的应用栏）与主体区域（如可滚动的列表或选项卡内容）的滚动行为统一为一个连贯的整体滚动体验。

------

### 二、核心属性

| 属性名                  | 数据类型                               | 属性说明                                                     |
| :---------------------- | :------------------------------------- | :----------------------------------------------------------- |
| **headerSliverBuilder** | `NestedScrollViewHeaderSliversBuilder` | 最核心的属性之一。它是一个函数，返回一组 **Sliver 系列组件**的列表，用于构建头部区域的内容。最典型的用法是在此放入 **SliverAppBar**（可折叠应用栏）以及 **SliverPersistentHeader** 等。函数接收两个参数：context 和 **innerBoxIsScrolled**（一个布尔值，表示内部滚动区域是否已经发生了滚动，常用于控制 SliverAppBar 的阴影显示） |
| **body**                | `Widget`                               | 最核心的属性之二。放置主体内容区域，通常是一个内部可滚动的组件，如 **ListView**、**GridView**，或者搭配 **TabBarView** 实现多选项卡页面。body 中的滚动组件会与头部的滚动行为自动协调联动 |
| **controller**          | `ScrollController?`                    | 外部滚动控制器，用于以编程方式控制整个 NestedScrollView 的滚动位置，或监听滚动事件 |
| **scrollDirection**     | `Axis`                                 | 滚动方向，默认为垂直方向。也可以设置为水平方向，但绝大多数使用场景都是垂直方向 |
| **reverse**             | `bool`                                 | 是否反转滚动方向。设为 true 时内容从底部开始排列。默认为 false |
| **physics**             | `ScrollPhysics?`                       | 控制滚动的物理效果，例如可以设置为回弹效果、固定边界效果，或者完全禁止滚动 |
| **floatHeaderSlivers**  | `bool`                                 | 控制头部的 Sliver 组件在向下滚动时是否可以"浮起"（即用户稍微下拉就立即显示头部，而不需要滚动到最顶端）。设为 true 时，配合 SliverAppBar 的 floating 属性可实现快速浮出效果。默认为 false |
| **clipBehavior**        | `Clip`                                 | 内容超出边界时的裁剪行为。默认为 hardEdge，即硬裁剪          |

------

#### headerSliverBuilder 中常搭配的 SliverAppBar 关键属性补充

由于 NestedScrollView 几乎总是与 **SliverAppBar** 配合使用，以下是 SliverAppBar 中与嵌套滚动强相关的属性：

| 属性名             | 数据类型  | 说明                                                         |
| :----------------- | :-------- | :----------------------------------------------------------- |
| **expandedHeight** | `double?` | 应用栏完全展开时的高度，用于定义可折叠区域的总高度           |
| **floating**       | `bool`    | 为 true 时，用户稍微下拉即可让应用栏重新出现，无需滚动到列表顶部 |
| **pinned**         | `bool`    | 为 true 时，应用栏折叠后仍会保留一个固定的最小高度（工具栏部分）始终可见 |
| **snap**           | `bool`    | 配合 floating 使用，为 true 时应用栏在浮出时会有一个自动展开到完整高度的吸附效果 |
| **flexibleSpace**  | `Widget?` | 放置在可折叠空间内的组件，通常使用 **FlexibleSpaceBar** 来实现带标题和背景图的折叠动画效果 |
| **forceElevated**  | `bool`    | 强制显示阴影，通常绑定 headerSliverBuilder 提供的 innerBoxIsScrolled 参数，实现"内部列表滚动后应用栏底部出现阴影"的效果 |

------

### 三、核心工作机制

NestedScrollView 没有额外的命名构造函数，这里着重说明其核心联动机制：

#### 滚动协调原理

NestedScrollView 的本质是将整个页面的滚动拆分为**外部滚动**和**内部滚动**两个层级，并由一个内置的协调器统一调度：

1. **外部滚动阶段**：当用户开始向上滑动时，首先消耗的是头部区域的滚动量。头部的 SliverAppBar 等组件逐步折叠收起，body 区域随之上移。
2. **内部滚动阶段**：当头部完全折叠（或折叠到 pinned 的最小高度）后，继续滑动的手势会自动转交给 body 内部的滚动组件（如 ListView），内部列表开始滚动。
3. **反向恢复**：当用户向下滑动时，根据 floating 等配置，内部列表先滚回顶部，再展开头部，或者头部立即浮出。

#### 与 TabBarView 的经典组合

NestedScrollView 最常见的应用场景是搭配 **TabBar** 和 **TabBarView**，实现"顶部可折叠应用栏 + 中间固定选项卡栏 + 底部多个可独立滚动的列表页"的布局。在这种场景下，TabBar 通常放在 SliverAppBar 的 bottom 属性中，而 TabBarView 作为 body 传入。每个选项卡页面内的列表滚动都与头部折叠行为联动。

#### 关键注意事项

- body 内部的可滚动组件**不需要**也**不应该**自己再嵌套 SingleChildScrollView 等外层滚动容器，否则会导致滚动冲突。
- 如果 body 中使用的是 TabBarView，每个选项卡页面内的滚动列表建议使用与 NestedScrollView 关联的滚动控制方式，以确保各页面独立记忆滚动位置。



## 92. SliverPersistentHeader

------

### 一、概述

`SliverPersistentHeader` 是一个用于 `CustomScrollView` 中的 Sliver 组件，它能在滚动过程中根据滚动距离**动态改变自身高度**（从最大高度收缩到最小高度），并可选择**固定在顶部**或**浮动显示**。

------

### 二、核心属性

| 属性名     | 数据类型                         | 属性说明                                                     |
| :--------- | :------------------------------- | :----------------------------------------------------------- |
| `delegate` | `SliverPersistentHeaderDelegate` | **最核心属性**。一个抽象委托对象，用于定义头部的具体内容、最大高度、最小高度以及收缩过程中的构建逻辑。必须自行继承该抽象类并实现其四个成员（见下方说明） |
| `pinned`   | `bool`                           | 当设为 `true` 时，头部在向上滚动超出可视区域后，不会消失，而是**钉在顶部**保持可见（收缩到最小高度）。默认为 `false` |
| `floating` | `bool`                           | 当设为 `true` 时，用户**稍微向下滚动**，头部就会立刻从顶部滑出重新显示，而不需要完全滚动回列表顶端。默认为 `false` |

#### delegate 委托中需要实现的四个核心成员

| 成员名          | 类型 / 返回值        | 说明                                                         |
| :-------------- | :------------------- | :----------------------------------------------------------- |
| `maxExtent`     | `double`（getter）   | 头部**完全展开**时的最大高度（像素值）                       |
| `minExtent`     | `double`（getter）   | 头部**完全收缩**时的最小高度（像素值）。若 `pinned` 为 `true`，收缩到此高度后头部将保持固定 |
| `build`         | 返回 `Widget` 的方法 | 构建头部的具体内容。该方法会收到一个 `shrinkOffset` 参数，表示当前已收缩了多少像素，开发者可据此动态调整头部的外观（如渐变透明度、缩小字体等） |
| `shouldRebuild` | 返回 `bool` 的方法   | 告诉框架当委托对象被替换时，是否需要重新构建头部。通常在委托携带的数据发生变化时返回 `true` |

------

### 三、pinned 与 floating 的组合效果说明

由于这两个布尔属性的组合直接决定了头部的滚动行为，以下做简要归纳：

| pinned  | floating | 滚动行为                                                   |
| :-----: | :------: | :--------------------------------------------------------- |
| `false` | `false`  | 头部随列表一起滚出屏幕，完全消失不可见                     |
| `true`  | `false`  | 头部收缩到最小高度后**钉在顶部**，始终可见                 |
| `false` |  `true`  | 头部滚出后消失，但用户稍微**向下滑动**就会立刻重新浮现     |
| `true`  |  `true`  | 头部始终钉在顶部，同时在用户向下滑动时会立刻展开到最大高度 |



## 93. SliverFillRemaining

------

### 一、概述

`SliverFillRemaining` 是一个用于 `CustomScrollView` 中的 Sliver 组件，它的作用是让其子组件**自动填满视口中剩余的所有可用空间**，确保即使内容不足以撑满整个屏幕，页面底部也不会留下空白。

------

### 二、核心属性

| 属性名           | 数据类型  | 属性说明                                                     |
| :--------------- | :-------- | :----------------------------------------------------------- |
| `child`          | `Widget?` | 放置在剩余空间中的子组件，该子组件会被拉伸或约束以填满视口剩余区域 |
| `hasScrollBody`  | `bool`    | 指示子组件内部**是否包含可滚动内容**。设为 `true` 时，子组件会被赋予剩余空间大小并允许内部自行滚动；设为 `false` 时，子组件会被强制约束为剩余空间的精确尺寸，不可内部滚动。默认为 `true` |
| `fillOverscroll` | `bool`    | 仅在 `hasScrollBody` 为 `false` 时生效。设为 `true` 时，当用户**过度滚动**（overscroll）时，子组件会随之拉伸扩展以填充过度滚动产生的额外空间；设为 `false` 时，子组件保持固定大小不随过度滚动变化。默认为 `false` |

------

### 三、hasScrollBody 的两种模式详解

由于 `hasScrollBody` 直接决定了该组件的核心行为，以下做进一步说明：

| hasScrollBody  | 行为表现                                                     | 典型用途                                                     |
| :------------: | :----------------------------------------------------------- | :----------------------------------------------------------- |
| `true`（默认） | 子组件获得剩余空间作为可用范围，内部若有可滚动组件则可独立滚动 | 剩余区域放置一个列表或网格等可滚动内容                       |
|    `false`     | 子组件被**精确约束**为剩余空间大小，不允许内部滚动，内容被固定展示 | 剩余区域放置一个居中提示文字、加载指示器、底部版权信息等固定内容 |



## 94. NavigationRail

------

### 一、概述

`NavigationRail` 是 Material Design 提供的**垂直侧边导航栏**组件，固定在屏幕左侧或右侧，用于在多个顶级页面之间进行切换导航，主要适用于平板和桌面端等宽屏场景。

------

### 二、核心属性

| 属性名                  | 数据类型                          | 属性说明                                                     |
| :---------------------- | :-------------------------------- | :----------------------------------------------------------- |
| `destinations`          | `List<NavigationRailDestination>` | **必填**。定义导航栏中的各个导航项列表，至少需要两个。每个导航项包含图标和文字标签（详见下方子属性说明） |
| `selectedIndex`         | `int?`                            | 当前选中的导航项索引，从 `0` 开始。设为 `null` 表示没有任何项被选中 |
| `onDestinationSelected` | `ValueChanged<int>?`              | 用户点击某个导航项时触发的回调，参数为被点击项的索引值。开发者需在此回调中更新 `selectedIndex` |
| `labelType`             | `NavigationRailLabelType?`        | 控制文字标签的显示方式。可选值：`none`（不显示标签）、`selected`（仅选中项显示标签）、`all`（所有项始终显示标签） |
| `extended`              | `bool`                            | 设为 `true` 时，导航栏会**横向展开**，图标与标签并排水平排列，呈现宽模式。默认为 `false`。注意：与 `labelType` 互斥，不可同时使用 |
| `leading`               | `Widget?`                         | 放置在所有导航项**上方**的自定义组件，常用于放置应用图标、用户头像或菜单按钮 |
| `trailing`              | `Widget?`                         | 放置在所有导航项**下方**的自定义组件，常用于放置设置按钮或退出按钮 |
| `groupAlignment`        | `double?`                         | 控制导航项组在垂直方向上的对齐位置。取值范围为 `-1.0`（顶部对齐）到 `1.0`（底部对齐），`0.0` 为居中。默认为 `-1.0` |
| `backgroundColor`       | `Color?`                          | 导航栏的背景颜色                                             |
| `elevation`             | `double?`                         | 导航栏的阴影高度，用于体现层次感                             |
| `useIndicator`          | `bool?`                           | 是否在选中项上显示**椭圆形高亮指示器**。默认为 `true`        |
| `indicatorColor`        | `Color?`                          | 选中指示器的填充颜色                                         |
| `indicatorShape`        | `ShapeBorder?`                    | 选中指示器的形状，可自定义为圆角矩形、圆形等                 |
| `minWidth`              | `double?`                         | 导航栏在**未展开**状态下的最小宽度，默认为 `72` 像素         |
| `minExtendedWidth`      | `double?`                         | 导航栏在**展开**（`extended` 为 `true`）状态下的最小宽度，默认为 `256` 像素 |

#### NavigationRailDestination 子属性

| 属性名         | 数据类型              | 属性说明                                                     |
| :------------- | :-------------------- | :----------------------------------------------------------- |
| `icon`         | `Widget`              | **必填**。未选中状态下显示的图标                             |
| `selectedIcon` | `Widget?`             | 选中状态下显示的图标。若不设置，则选中和未选中使用同一个图标 |
| `label`        | `Widget`              | **必填**。导航项的文字标签                                   |
| `disabled`     | `bool`                | 设为 `true` 时，该导航项变为**不可点击的禁用状态**，默认为 `false` |
| `padding`      | `EdgeInsetsGeometry?` | 该导航项的内边距                                             |

------

### 三、labelType 与 extended 的关系说明

这两个属性都影响标签的展示，但它们的工作方式不同且**互斥**：

| 属性                 | 效果                                 | 布局方式                     |
| :------------------- | :----------------------------------- | :--------------------------- |
| `labelType`          | 控制标签是否显示以及在何种状态下显示 | 标签在图标**正下方**垂直排列 |
| `extended` 为 `true` | 标签始终显示，导航栏整体变宽         | 标签在图标**右侧**水平排列   |

当 `extended` 为 `true` 时，`labelType` 必须为 `none`（默认值），否则框架会抛出断言错误。



## 95. FilledButton

------

### 一、概述

`FilledButton` 是 Material 3 设计规范中的**实心填充按钮**组件，拥有纯色背景，用于承载页面中**最重要、最醒目**的操作行为，是视觉强调级别最高的按钮类型。

------

### 二、核心属性

| 属性名          | 数据类型         | 属性说明                                                     |
| :-------------- | :--------------- | :----------------------------------------------------------- |
| `onPressed`     | `VoidCallback?`  | 按钮被点击时触发的回调。设为 `null` 时按钮进入**禁用状态**，外观变灰且不可交互 |
| `onLongPress`   | `VoidCallback?`  | 按钮被长按时触发的回调                                       |
| `child`         | `Widget?`        | 按钮内部显示的内容，通常放置一个 `Text` 组件作为按钮文字     |
| `style`         | `ButtonStyle?`   | 用于全面自定义按钮的外观样式，包括背景色、前景色、形状、内边距、阴影、文字样式等。若不设置，则跟随主题中的默认 `FilledButton` 样式 |
| `autofocus`     | `bool`           | 是否在页面加载时自动获取焦点，默认为 `false`                 |
| `focusNode`     | `FocusNode?`     | 控制按钮焦点行为的节点对象，常用于键盘导航和桌面端交互       |
| `clipBehavior`  | `Clip`           | 内容超出按钮边界时的裁剪方式，默认为 `Clip.none`             |
| `iconAlignment` | `IconAlignment?` | 当使用图标构造函数时，控制图标相对于文字标签的位置（`start` 或 `end`） |

#### style（ButtonStyle）常用子属性

| 子属性名          | 数据类型                                    | 属性说明                                                     |
| :---------------- | :------------------------------------------ | :----------------------------------------------------------- |
| `backgroundColor` | `WidgetStateProperty<Color?>?`              | 按钮的**背景填充色**，可根据不同状态（按下、悬停、禁用等）设置不同颜色 |
| `foregroundColor` | `WidgetStateProperty<Color?>?`              | 按钮的**前景色**，影响文字和图标颜色                         |
| `shape`           | `WidgetStateProperty<OutlinedBorder?>?`     | 按钮的形状，如圆角矩形、胶囊形、圆形等                       |
| `padding`         | `WidgetStateProperty<EdgeInsetsGeometry?>?` | 按钮内容的内边距                                             |
| `elevation`       | `WidgetStateProperty<double?>?`             | 按钮的阴影高度                                               |
| `minimumSize`     | `WidgetStateProperty<Size?>?`               | 按钮的最小尺寸                                               |
| `fixedSize`       | `WidgetStateProperty<Size?>?`               | 按钮的固定尺寸，设置后按钮不再自适应内容大小                 |

------

### 三、构造函数

#### 1. `FilledButton.icon`

**场景**：需要在按钮文字旁边添加一个图标，构成"图标 + 文字"组合的填充按钮。

**独有核心参数**：

| 参数名  | 数据类型  | 参数说明                                           |
| :------ | :-------- | :------------------------------------------------- |
| `icon`  | `Widget?` | 显示在文字标签旁边的图标组件                       |
| `label` | `Widget?` | 按钮的文字标签，功能等同于默认构造函数中的 `child` |

#### 2. `FilledButton.tonal`

**场景**：需要一个**次级强调**的填充按钮。它的背景色不是主题的主色，而是主色的柔和色调变体（tonal color），视觉上比标准 `FilledButton` 弱一级，比 `OutlinedButton` 强一级，适合作为页面中**第二重要**的操作按钮。

**独有核心参数**：无额外独有参数，与默认构造函数一致，区别仅在于**默认样式不同**（背景色更柔和、对比度更低）。

#### 3. `FilledButton.tonalIcon`

**场景**：`FilledButton.tonal` 和 `FilledButton.icon` 的结合体，即带图标的次级填充按钮。

**独有核心参数**：

| 参数名  | 数据类型  | 参数说明                     |
| :------ | :-------- | :--------------------------- |
| `icon`  | `Widget?` | 显示在文字标签旁边的图标组件 |
| `label` | `Widget?` | 按钮的文字标签               |

------

### 四、Material 3 按钮体系中的定位

`FilledButton` 在 Material 3 的按钮强调层级中位置如下：

| 强调级别 | 按钮类型             | 视觉特征                         |
| :------: | :------------------- | :------------------------------- |
| **最高** | `FilledButton`       | 纯主色背景，白色文字，最醒目     |
|   次高   | `FilledButton.tonal` | 柔和色调背景，主色文字，温和醒目 |
|   中等   | `ElevatedButton`     | 浅色背景带阴影                   |
|   较低   | `OutlinedButton`     | 透明背景，带边框轮廓             |
| **最低** | `TextButton`         | 纯文字，无背景无边框             |





## 96. OutlinedButton

------

### 一、概述

OutlinedButton 是 Flutter 中一种带有外边框但默认无背景填充的按钮组件，用于触发用户交互操作，在视觉层级上介于 ElevatedButton（有阴影的凸起按钮）和 TextButton（纯文字按钮）之间，适合表达"次要但仍需清晰可辨"的操作。

------

### 二、核心属性

| 属性名               | 数据类型                                  | 属性说明                                                     |
| :------------------- | :---------------------------------------- | :----------------------------------------------------------- |
| **child**            | Widget                                    | 按钮内部显示的内容，通常放置一个文本组件来展示按钮文字       |
| **onPressed**        | VoidCallback?                             | 按钮被点击时触发的回调。设为 null 时按钮进入禁用状态，外观自动变为灰色且不可点击 |
| **onLongPress**      | VoidCallback?                             | 按钮被长按时触发的回调                                       |
| **onHover**          | ValueChanged<bool>?                       | 鼠标指针移入或移出按钮区域时触发的回调，参数为是否正在悬停，主要用于桌面端和 Web 端 |
| **onFocusChange**    | ValueChanged<bool>?                       | 按钮获得或失去焦点时触发的回调                               |
| **style**            | ButtonStyle?                              | 按钮的整体外观样式，可精细控制按钮的各个视觉细节。常用子属性如下 ↓ |
| ↳ foregroundColor    | WidgetStateProperty<Color?>?              | 按钮前景色，即文字和图标的颜色                               |
| ↳ backgroundColor    | WidgetStateProperty<Color?>?              | 按钮背景填充色，默认为透明                                   |
| ↳ side               | WidgetStateProperty<BorderSide?>?         | 按钮边框的样式，可设置边框颜色、粗细和线条风格               |
| ↳ shape              | WidgetStateProperty<OutlinedBorder?>?     | 按钮的形状，如圆角矩形、圆形、体育场形等                     |
| ↳ padding            | WidgetStateProperty<EdgeInsetsGeometry?>? | 按钮内部内容与边框之间的内边距                               |
| ↳ minimumSize        | WidgetStateProperty<Size?>?               | 按钮的最小尺寸，保证按钮不会小于该值                         |
| ↳ overlayColor       | WidgetStateProperty<Color?>?              | 按钮在被按下、悬停、聚焦等交互状态时覆盖在表面的半透明反馈色 |
| ↳ textStyle          | WidgetStateProperty<TextStyle?>?          | 按钮内文字的字体样式，如字号、字重、字体族等                 |
| **autofocus**        | bool                                      | 页面加载后是否自动获取焦点，默认为 false                     |
| **clipBehavior**     | Clip                                      | 内容超出按钮边界时的裁剪方式，默认为不裁剪                   |
| **statesController** | WidgetStatesController?                   | 用于外部监听和控制按钮的交互状态（如按下、悬停、禁用等），适合需要多个组件联动响应状态的场景 |
| **iconAlignment**    | IconAlignment                             | 当按钮包含图标时，控制图标相对于文字标签的对齐方向           |

------

### 三、构造函数

#### OutlinedButton.icon

**使用场景：** 当按钮需要同时展示一个图标和一段文字时使用，省去手动排列图标与文字的麻烦，组件会自动将图标和文字水平排列并保持合理间距。

**独有核心参数：**

| 参数名    | 数据类型 | 参数说明                                               |
| :-------- | :------- | :----------------------------------------------------- |
| **icon**  | Widget   | 按钮中显示的图标内容                                   |
| **label** | Widget   | 按钮中显示的文字标签，功能上等同于普通构造函数的 child |

> **要点提示：** 使用该构造函数时，不再需要传入 child 参数，取而代之的是分别通过 icon 和 label 来提供图标与文字内容。



## 97. RangeSlider

------

### 一、概述

RangeSlider 是 Flutter 中用于让用户在一条水平轨道上通过拖动两个滑块来选取一个**值范围**（即起始值和结束值）的交互组件，常用于筛选价格区间、年龄范围等需要同时设定上下限的场景。

------

### 二、核心属性

| 属性名                        | 数据类型                           | 属性说明                                                     |
| :---------------------------- | :--------------------------------- | :----------------------------------------------------------- |
| **values**                    | RangeValues                        | 当前选中的范围值，包含起始值和结束值两个数据。这是一个必传属性 ↓ |
| ↳ start                       | double                             | 范围的起始值，对应轨道上左侧滑块的位置                       |
| ↳ end                         | double                             | 范围的结束值，对应轨道上右侧滑块的位置                       |
| **onChanged**                 | ValueChanged<RangeValues>?         | 用户拖动任一滑块时持续触发的回调，参数为最新的范围值。设为 null 时整个组件进入禁用状态，不可交互 |
| **onChangeStart**             | ValueChanged<RangeValues>?         | 用户手指按下滑块、开始拖动的瞬间触发一次，可用于记录拖动前的初始值 |
| **onChangeEnd**               | ValueChanged<RangeValues>?         | 用户手指松开滑块、结束拖动的瞬间触发一次，适合在拖动结束后执行网络请求或数据提交等操作 |
| **min**                       | double                             | 轨道所代表的最小值，默认为 0.0                               |
| **max**                       | double                             | 轨道所代表的最大值，默认为 1.0                               |
| **divisions**                 | int?                               | 将轨道等分为指定的份数，使滑块只能停留在离散的刻度点上。未设置时滑块可停留在任意连续位置 |
| **labels**                    | RangeLabels?                       | 当设置了 divisions 时，拖动滑块会在其上方弹出气泡标签。通过此属性可分别为左右两个滑块设置标签文字 ↓ |
| ↳ start                       | String                             | 左侧滑块（起始值）上方显示的标签文字                         |
| ↳ end                         | String                             | 右侧滑块（结束值）上方显示的标签文字                         |
| **activeColor**               | Color?                             | 两个滑块之间那段"已选中"轨道的颜色，同时也会影响滑块圆点本身的颜色 |
| **inactiveColor**             | Color?                             | 两个滑块外侧那两段"未选中"轨道的颜色                         |
| **overlayColor**              | WidgetStateProperty<Color?>?       | 滑块在被按下、悬停等交互状态时，围绕圆点显示的半透明光晕颜色 |
| **mouseCursor**               | WidgetStateProperty<MouseCursor?>? | 鼠标悬停在组件上时显示的光标样式，主要用于桌面端和 Web 端    |
| **semanticFormatterCallback** | SemanticFormatterCallback?         | 为无障碍辅助功能提供自定义的值朗读格式，屏幕阅读器会使用该回调返回的文字来播报当前值 |

> **要点提示：** values 中 start 和 end 的值必须始终处于 min 和 max 之间，且 start 不得大于 end，否则会引发错误。



## 98. ReorderableListView

------

### 一、概述

ReorderableListView 是 Flutter 中一种支持用户通过长按并拖拽列表项来重新排列顺序的可滚动列表组件，常用于待办事项排序、播放列表调整等需要手动调整顺序的场景。

------

### 二、核心属性

| 属性名                         | 数据类型                   | 属性说明                                                     |
| :----------------------------- | :------------------------- | :----------------------------------------------------------- |
| **children**                   | List<Widget>               | 列表中要展示的所有子组件。**关键要求：每个子组件都必须设置一个唯一的 Key**，否则框架无法正确追踪拖拽后的位置变化，会直接报错 |
| **onReorder**                  | ReorderCallback            | 必传属性。当用户完成一次拖拽排序后触发，回调会提供两个整数参数：旧位置索引和新位置索引，开发者需要在此回调中手动更新数据源的顺序 |
| **onReorderStart**             | void Function(int)?        | 用户长按某一项开始拖拽的瞬间触发，参数为被拖拽项的索引       |
| **onReorderEnd**               | void Function(int)?        | 用户松手、拖拽结束的瞬间触发，参数为该项最终落下的索引位置   |
| **buildDefaultDragHandles**    | bool                       | 是否自动为每个列表项添加默认的拖拽手柄。默认为 true，此时用户长按列表项任意位置即可触发拖拽。设为 false 后需自行在子组件中放置 ReorderableDragStartListener 来指定拖拽触发区域 |
| **proxyDecorator**             | ReorderItemProxyDecorator? | 自定义"被拖起来那一项"在拖拽过程中的视觉外观，比如添加阴影、放大效果、改变透明度等。未设置时系统会使用默认的轻微阴影效果 |
| **scrollDirection**            | Axis                       | 列表的滚动方向，默认为垂直方向。设为水平方向时列表项将横向排列并支持横向拖拽排序 |
| **reverse**                    | bool                       | 是否反转列表的排列方向，默认为 false。设为 true 时列表从底部（或右侧）开始排列 |
| **header**                     | Widget?                    | 固定在列表最顶部（不参与拖拽排序）的头部组件                 |
| **footer**                     | Widget?                    | 固定在列表最底部（不参与拖拽排序）的尾部组件                 |
| **padding**                    | EdgeInsetsGeometry?        | 列表内容区域的内边距                                         |
| **scrollController**           | ScrollController?          | 列表的滚动控制器，用于监听或控制滚动位置                     |
| **prototypeItem**              | Widget?                    | 提供一个原型子组件，框架将以该组件的尺寸作为所有列表项的统一高度（或宽度），可以显著提升滚动性能 |
| **autoScrollerVelocityScalar** | double?                    | 拖拽项靠近列表边缘时自动滚动的速度倍率，值越大自动滚动越快   |

------

### 三、构造函数

#### ReorderableListView.builder

**使用场景：** 当列表项数量较多或数据来源是动态的时候使用。与默认构造函数一次性传入所有子组件不同，该构造函数采用"按需构建"策略，只有即将出现在屏幕上的列表项才会被创建，大幅节省内存和提升性能。

**独有核心参数：**

| 参数名          | 数据类型             | 参数说明                                                     |
| :-------------- | :------------------- | :----------------------------------------------------------- |
| **itemBuilder** | IndexedWidgetBuilder | 根据索引按需构建每一个列表项的回调函数。**同样要求每个返回的组件必须携带唯一的 Key** |
| **itemCount**   | int                  | 列表项的总数量，告知框架一共需要构建多少项                   |

> **要点提示：** 无论使用默认构造函数还是 builder 构造函数，为每个列表项设置唯一 Key 都是硬性要求，这是 ReorderableListView 能够正确完成拖拽排序的根本前提。





## 99. InteractiveViewer

------

### 一、概述

InteractiveViewer 是 Flutter 中用于让用户通过手势对其子组件进行**平移（拖动）、缩放（双指捏合）**等交互操作的容器组件，常用于查看大图、地图、表格等需要自由缩放和拖拽浏览的内容。

------

### 二、核心属性

| 属性名                                | 数据类型                    | 属性说明                                                     |
| :------------------------------------ | :-------------------------- | :----------------------------------------------------------- |
| **child**                             | Widget                      | 被包裹的子组件，即用户可以对其进行缩放和拖拽的目标内容       |
| **panEnabled**                        | bool                        | 是否允许用户通过拖拽手势平移内容，默认为 true                |
| **scaleEnabled**                      | bool                        | 是否允许用户通过双指捏合手势缩放内容，默认为 true            |
| **minScale**                          | double                      | 允许缩小到的最小倍数，默认为 0.8。例如设为 0.5 表示最多缩小到原始尺寸的一半 |
| **maxScale**                          | double                      | 允许放大到的最大倍数，默认为 2.5。例如设为 5.0 表示最多放大到原始尺寸的五倍 |
| **interactionEndFrictionCoefficient** | double                      | 手指松开后惯性滑动的摩擦系数，值越大减速越快、滑动距离越短，默认为 0.0000135 |
| **panAxis**                           | PanAxis                     | 限制平移的方向轴。默认为自由方向，即上下左右均可拖动。也可以限制为仅水平或仅垂直方向平移 |
| **constrained**                       | bool                        | 是否将子组件约束在 InteractiveViewer 自身的边界内，默认为 true。设为 true 时子组件尺寸不会超出父容器；设为 false 时子组件可以拥有远超屏幕的尺寸，适合展示超大画布类内容 |
| **boundaryMargin**                    | EdgeInsets                  | 内容可以被拖拽超出边界的额外距离。默认为零，即内容边缘不能被拖出可视区域。设置后用户可以将内容拖过边界一段距离，松手后会回弹或停留 |
| **alignment**                         | Alignment?                  | 子组件在 InteractiveViewer 中的初始对齐方式，例如居中、左上角等 |
| **transformationController**          | TransformationController?   | 用于从外部读取或控制当前的变换矩阵（包含平移偏移量和缩放倍数），可实现编程式地跳转到指定位置或重置缩放等功能 |
| **clipBehavior**                      | Clip                        | 子组件超出边界时的裁剪行为，默认为 hardEdge（硬裁剪）。如果确认内容不会溢出，设为 none 可获得轻微的性能提升 |
| **trackpadScrollCausesScale**         | bool                        | 在桌面端使用触控板双指滚动时是否触发缩放而非平移，默认为 false。设为 true 适合让触控板用户也能方便地缩放内容 |
| **onInteractionStart**                | GestureScaleStartCallback?  | 用户开始交互（手指按下）时触发的回调                         |
| **onInteractionUpdate**               | GestureScaleUpdateCallback? | 用户交互过程中（手指移动）持续触发的回调，可获取实时的缩放倍数和偏移信息 |
| **onInteractionEnd**                  | GestureScaleEndCallback?    | 用户结束交互（手指抬起）时触发的回调                         |

------

### 三、构造函数

#### InteractiveViewer.builder

**使用场景：** 当需要展示的内容区域非常大（如一张巨型地图或超大表格），一次性构建所有内容会导致严重的性能问题时使用。该构造函数会根据当前可视区域按需构建内容，只渲染用户当前能看到的部分，极大节省内存和渲染开销。

**独有核心参数：**

| 参数名      | 数据类型                       | 参数说明                                                     |
| :---------- | :----------------------------- | :----------------------------------------------------------- |
| **builder** | InteractiveViewerWidgetBuilder | 根据当前可视的视口区域按需构建子组件的回调函数，框架会传入当前视口的四边形区域信息，开发者据此决定需要渲染哪些内容 |

> **要点提示：** 使用 builder 构造函数时，constrained 属性会被自动设为 false，因为按需构建的前提就是子组件尺寸可以远超可视区域。此时不再传入 child，而是通过 builder 回调动态返回内容。



## 100. BackdropFilter

------

### 一、概述

BackdropFilter 是 Flutter 中用于对其**下方已有内容**（而非自身子组件）施加图像滤镜效果的组件，最常见的用途是实现毛玻璃（高斯模糊）效果，使背景内容变得模糊，从而突出前景信息。

------

### 二、核心属性

| 属性名        | 数据类型    | 属性说明                                                     |
| :------------ | :---------- | :----------------------------------------------------------- |
| **filter**    | ImageFilter | 必传属性。要施加到背景内容上的滤镜。最常用的是高斯模糊滤镜，可分别设置水平方向和垂直方向的模糊程度，数值越大越模糊。也支持矩阵变换、颜色滤镜组合等高级效果 |
| **child**     | Widget?     | 显示在滤镜效果之上的前景子组件。BackdropFilter 本身不产生任何视觉输出，如果不传 child，则仅对背景施加滤镜而前景为空 |
| **blendMode** | BlendMode   | 滤镜效果与原始背景内容之间的混合模式，默认为 srcOver（即滤镜覆盖在原内容之上）。通过更换混合模式可以实现不同的视觉合成效果 |



## 101. ClipOval

### 一、概述

ClipOval 是一个将其子组件裁剪为**椭圆形**（当宽高相等时则为正圆形）的裁剪组件，任何超出椭圆区域的内容都会被隐藏不可见。

------

### 二、核心属性

| 属性名           | 数据类型            | 属性说明                                                     |
| :--------------- | :------------------ | :----------------------------------------------------------- |
| **child**        | Widget              | 需要被裁剪为椭圆形的子组件，例如一张图片或一个容器           |
| **clipper**      | CustomClipper<Rect> | 自定义裁剪区域的计算逻辑。默认情况下，椭圆会根据子组件的边界矩形自动生成，绝大多数场景无需手动设置此项 |
| **clipBehavior** | Clip                | 控制裁剪边缘的渲染质量。常用取值如下：▸ **Clip.hardEdge**——裁剪速度最快，但边缘会有明显锯齿；▸ **Clip.antiAlias**——对边缘做抗锯齿处理，边缘平滑，性能略有消耗，这是默认值；▸ **Clip.antiAliasWithSaveLayer**——在抗锯齿基础上额外创建一个图层，边缘质量最高但性能开销最大，仅在有透明重叠等特殊需求时使用 |

------

### 三、关键要点

**1. 裁剪形状由子组件的宽高决定**

ClipOval 会以子组件所占矩形区域的内切椭圆作为裁剪轮廓。如果子组件是一个正方形，裁剪结果就是正圆；如果子组件是长方形，裁剪结果就是椭圆。因此，想要得到正圆效果，需确保子组件的宽和高相等。

**2. 典型使用场景**

- 将方形头像图片裁剪为圆形头像，这是最常见的用途。
- 制作圆形或椭圆形的装饰性背景区域。

**3. 优点**

- 用法极简，只需包裹子组件即可实现椭圆或圆形裁剪，无需额外计算。
- 支持对裁剪边缘质量做精细控制。

**4. 缺点**

- 裁剪操作会在每一帧的绘制阶段执行，如果在列表中大量、频繁使用会带来性能开销。
- 只能裁剪为椭圆/圆形，无法直接实现圆角矩形等其他形状（圆角矩形应使用 ClipRRect）。

**5. 与相近组件的区分**

| 组件          | 裁剪形状       |
| :------------ | :------------- |
| **ClipOval**  | 椭圆 / 正圆    |
| **ClipRRect** | 圆角矩形       |
| **ClipRect**  | 普通矩形       |
| **ClipPath**  | 任意自定义路径 |

**6. 性能建议**

在仅需要圆形头像的场景下，也可以考虑使用 CircleAvatar 或 BoxDecoration 中的 shape 属性来实现，这两种方式在某些场景下性能表现更优。ClipOval 更适合需要对**任意子组件**做椭圆裁剪的通用场景。



## 102. DecoratedBox

### 一、概述

DecoratedBox 是一个专门用于在子组件的**前方或后方绘制装饰**（如背景色、渐变、边框、圆角、阴影、背景图等）的组件，是 Flutter 中实现视觉装饰的最底层核心组件。

------

### 二、核心属性

| 属性名         | 数据类型           | 属性说明                                                     |
| :------------- | :----------------- | :----------------------------------------------------------- |
| **decoration** | Decoration         | 定义具体的装饰内容，实际使用中几乎都传入其子类 **BoxDecoration**，详见下方子属性说明 |
| **position**   | DecorationPosition | 控制装饰绘制在子组件的前方还是后方。▸ **background**（默认值）——装饰画在子组件的下层，充当背景；▸ **foreground**——装饰画在子组件的上层，会覆盖在子组件之上 |
| **child**      | Widget             | 被装饰的子组件                                               |

------

#### BoxDecoration 常用子属性

由于 decoration 属性最常用的值就是 BoxDecoration，以下列出它的高频子属性：

| 子属性名         | 数据类型             | 属性说明                                                     |
| :--------------- | :------------------- | :----------------------------------------------------------- |
| **color**        | Color                | 填充纯色背景，与 gradient 不可同时使用                       |
| **gradient**     | Gradient             | 填充渐变背景。常用类型：▸ **LinearGradient**——线性渐变；▸ **RadialGradient**——径向渐变；▸ **SweepGradient**——扫描渐变 |
| **border**       | BoxBorder            | 为盒子添加边框。通常使用 **Border.all** 设置统一边框，或用 **Border** 分别指定上下左右各边 |
| **borderRadius** | BorderRadiusGeometry | 设置圆角半径。当 shape 为矩形时生效，不可与 shape 设为圆形同时使用 |
| **shape**        | BoxShape             | 盒子的形状。▸ **rectangle**（默认）——矩形；▸ **circle**——圆形，此时宽高需相等，且不可设置 borderRadius |
| **boxShadow**    | List<BoxShadow>      | 为盒子添加一个或多个阴影。每个 BoxShadow 可分别设置颜色、偏移量、模糊半径和扩展半径 |
| **image**        | DecorationImage      | 在盒子内填充一张装饰图片，可控制填充方式、对齐方式等         |



## 103. ConstrainedBox

### 一、概述

ConstrainedBox 是一个用于对子组件施加**额外尺寸约束**（最小宽度、最大宽度、最小高度、最大高度）的布局组件，从而控制子组件的大小范围。

------

### 二、核心属性

| 属性名          | 数据类型       | 属性说明                                                     |
| :-------------- | :------------- | :----------------------------------------------------------- |
| **constraints** | BoxConstraints | 定义施加给子组件的尺寸约束规则，是该组件唯一且必填的核心属性，详见下方子属性说明 |
| **child**       | Widget         | 被施加约束的子组件                                           |

------

#### BoxConstraints 常用子属性

| 子属性 / 构造方式           | 数据类型 | 属性说明                                                     |
| :-------------------------- | :------- | :----------------------------------------------------------- |
| **minWidth**                | double   | 子组件允许的最小宽度，默认为 0                               |
| **maxWidth**                | double   | 子组件允许的最大宽度，默认为无穷大                           |
| **minHeight**               | double   | 子组件允许的最小高度，默认为 0                               |
| **maxHeight**               | double   | 子组件允许的最大高度，默认为无穷大                           |
| **BoxConstraints.tightFor** | 命名构造 | 可单独指定 width 和/或 height，被指定的维度会将最小值和最大值设为同一个值，即固定该维度的尺寸 |
| **BoxConstraints.expand**   | 命名构造 | 不传参时让子组件在该维度上尽可能撑满父级；传参时将对应维度固定为指定值 |
| **BoxConstraints.loose**    | 命名构造 | 将最小值设为 0，最大值设为指定的 Size，即子组件可以在 0 到指定值之间自由伸缩 |

------

### 三、关键要点

**1. 约束合并规则**

ConstrainedBox 施加的约束会与父级传递下来的约束**取交集**。这意味着：如果父级已经限制最大宽度为 200，而你在 ConstrainedBox 中设置最小宽度为 300，最终子组件的宽度仍然不会超过 200。简而言之，**父级约束的优先级更高**，ConstrainedBox 只能在父级允许的范围内进一步收紧约束，无法突破父级的限制。

**2. 与相近组件的区分**

| 组件                 | 核心差异                                             |
| :------------------- | :--------------------------------------------------- |
| **ConstrainedBox**   | 可同时设置最小值和最大值，定义一个弹性范围           |
| **SizedBox**         | 直接指定固定宽高，等同于将最小值和最大值设为同一个数 |
| **UnconstrainedBox** | 移除父级约束，让子组件按自身大小自由布局             |
| **LimitedBox**       | 仅在父级约束为无穷大时才生效，常用于列表等滚动场景   |



## 104. FractionallySizedBox

### 一、概述

FractionallySizedBox 是一个根据**父组件尺寸的百分比**来确定自身宽高的布局组件，使子组件的大小能够按比例随父组件动态缩放。

------

### 二、核心属性

| 属性名           | 数据类型          | 属性说明                                                     |
| :--------------- | :---------------- | :----------------------------------------------------------- |
| **widthFactor**  | double            | 宽度比例因子。取值为 0 到任意正数，其中 1.0 表示与父组件等宽，0.5 表示占父组件宽度的 50%，1.5 表示占 150%。为 null 时，子组件宽度不受该组件控制，而是遵循正常约束传递 |
| **heightFactor** | double            | 高度比例因子。规则与 widthFactor 完全一致，1.0 表示与父组件等高，0.5 表示占父组件高度的 50%。为 null 时，子组件高度不受该组件控制 |
| **alignment**    | AlignmentGeometry | 当计算出的尺寸与父组件尺寸不一致时，控制子组件在剩余空间中的对齐方式。默认值为 **Alignment.center**（居中）。常用取值：▸ topLeft——左上角；▸ center——居中；▸ bottomRight——右下角，以及其他九宫格位置 |
| **child**        | Widget            | 被按比例约束尺寸的子组件                                     |

------

### 三、关键要点

**1. 比例计算的基准**

widthFactor 和 heightFactor 的计算基准是**父组件传递给 FractionallySizedBox 的可用空间**，而非整个屏幕。例如，父组件可用宽度为 300，widthFactor 设为 0.5，则该组件的宽度为 150。

**2. 两个因子可独立设置**

widthFactor 和 heightFactor 互相独立，可以只设置其中一个。未设置的维度将按照正常的约束传递规则决定大小，不会受到比例控制。

**3. 没有子组件时的行为**

当不传入 child 时，FractionallySizedBox 自身会按照比例因子撑开对应的空间。这个特性常被用于在 Row 或 Column 中创建按比例占位的间距。

**4. 典型使用场景**

- 让一个按钮始终占据父容器宽度的 80%，实现响应式布局。
- 在弹窗中让内容区域占据屏幕高度的 60%。
- 在 Flexible 或 Expanded 包裹的区域内，进一步按百分比细分空间。
- 不传 child，在 Row / Column 中用作比例间隔。

**5. 与相近组件的区分**

| 组件                     | 核心差异                                       |
| :----------------------- | :--------------------------------------------- |
| **FractionallySizedBox** | 按父组件尺寸的**百分比**确定大小               |
| **SizedBox**             | 按**固定像素值**确定大小                       |
| **ConstrainedBox**       | 设定一个**最小到最大的弹性范围**               |
| **LayoutBuilder**        | 能获取父组件约束后自行计算，灵活度更高但更复杂 |



## 105. AnimatedCrossFade

### 一、概述

AnimatedCrossFade 是一个在**两个子组件之间**执行交叉淡入淡出切换动画的组件，当切换状态时，当前显示的子组件渐隐消失，另一个子组件同时渐显出现，并自动处理两者尺寸不同时的平滑过渡。

------

### 二、核心属性

| 属性名              | 数据类型                 | 属性说明                                                     |
| :------------------ | :----------------------- | :----------------------------------------------------------- |
| **firstChild**      | Widget                   | 第一个子组件，当 crossFadeState 为 showFirst 时显示该组件。**必填** |
| **secondChild**     | Widget                   | 第二个子组件，当 crossFadeState 为 showSecond 时显示该组件。**必填** |
| **crossFadeState**  | CrossFadeState           | 控制当前应显示哪个子组件。只有两个取值：▸ **CrossFadeState.showFirst**——显示第一个子组件；▸ **CrossFadeState.showSecond**——显示第二个子组件。切换该值即可触发动画。**必填** |
| **duration**        | Duration                 | 动画的持续时长，控制淡入淡出和尺寸过渡的总耗时。**必填**     |
| **reverseDuration** | Duration                 | 反向动画的持续时长。若不设置，则反向动画与正向动画使用相同的 duration |
| **firstCurve**      | Curve                    | 第一个子组件淡入淡出的动画曲线，默认为 **Curves.linear**（匀速） |
| **secondCurve**     | Curve                    | 第二个子组件淡入淡出的动画曲线，默认为 **Curves.linear**     |
| **sizeCurve**       | Curve                    | 两个子组件之间尺寸过渡的动画曲线，默认为 **Curves.linear**   |
| **alignment**       | AlignmentGeometry        | 当两个子组件尺寸不同时，控制它们在动画过渡期间的对齐方式，默认为 **Alignment.topCenter** |
| **layoutBuilder**   | AnimatedCrossFadeBuilder | 自定义两个子组件在动画期间的布局方式。默认行为是将两者叠放（Stack），通过此属性可以完全自定义叠放逻辑 |

------

### 三、关键要点

**1. 工作机制**

AnimatedCrossFade 始终同时持有两个子组件。当 crossFadeState 的值发生变化时，正在显示的子组件会逐渐降低透明度直至完全不可见，同时另一个子组件逐渐提高透明度直至完全可见。如果两个子组件的尺寸不同，整体占用空间也会同步平滑地过渡到目标尺寸。

**2. 动画由状态驱动**

你不需要手动创建 AnimationController，只需在 setState 中切换 crossFadeState 的值，组件会自动完成整个动画过程。这是一个**隐式动画**组件，对新手非常友好。

**3. 典型使用场景**

- 表单中在"提交按钮"与"加载指示器"之间平滑切换。
- 展开/收起场景中在"简要内容"与"详细内容"之间切换。
- 搜索框在"空状态提示"与"搜索结果"之间过渡。
- 任何需要在两个固定视图之间做渐变切换的场景。

**4. 与相近组件的区分**

| 组件                  | 核心差异                                                     |
| :-------------------- | :----------------------------------------------------------- |
| **AnimatedCrossFade** | 专门在**两个**子组件之间做交叉淡入淡出，自动处理尺寸过渡     |
| **AnimatedSwitcher**  | 可在**任意数量**的子组件之间切换，通过 key 变化触发，支持自定义过渡效果 |
| **AnimatedOpacity**   | 仅对**单个**子组件做透明度渐变，不涉及两个组件的交替         |
| **FadeTransition**    | 显式动画组件，需手动管理 AnimationController                 |



## 106. AnimatedPositioned

### 一、概述

`AnimatedPositioned` 是 `Positioned` 的动画版本，当其位置或尺寸属性发生变化时，会在指定时间内自动从旧值平滑过渡到新值，**必须作为 `Stack` 的直接子组件使用**。

------

### 二、核心属性

| 属性名       | 数据类型        | 属性说明                                                     |
| :----------- | :-------------- | :----------------------------------------------------------- |
| **child**    | `Widget`        | 被包裹的子组件，即需要产生位移或尺寸动画的目标组件           |
| **left**     | `double?`       | 子组件左边缘距 `Stack` 左边缘的距离，值变化时自动产生水平方向动画 |
| **top**      | `double?`       | 子组件上边缘距 `Stack` 上边缘的距离，值变化时自动产生垂直方向动画 |
| **right**    | `double?`       | 子组件右边缘距 `Stack` 右边缘的距离，值变化时自动产生水平方向动画 |
| **bottom**   | `double?`       | 子组件下边缘距 `Stack` 下边缘的距离，值变化时自动产生垂直方向动画 |
| **width**    | `double?`       | 子组件的宽度，值变化时自动产生宽度缩放动画                   |
| **height**   | `double?`       | 子组件的高度，值变化时自动产生高度缩放动画                   |
| **duration** | `Duration`      | **必填**。动画从旧值过渡到新值所需的总时长                   |
| **curve**    | `Curve`         | 动画的速度曲线，默认为 `Curves.linear`（匀速）。可设置为 `Curves.easeInOut` 等使动画更自然 |
| **onEnd**    | `VoidCallback?` | 动画完成时触发的回调，适合在动画结束后执行后续逻辑           |

> **重要约束**：`left`、`right`、`width` 三者最多只能同时指定其中两个；`top`、`bottom`、`height` 同理。这与 `Positioned` 的规则完全一致。



## 107. FadeTransition

### 一、概述

`FadeTransition` 是一个显式动画组件，通过接收一个 `Animation<double>` 对象来驱动子组件的透明度变化，从而实现淡入或淡出效果。

------

### 二、核心属性

| 属性名                     | 数据类型            | 属性说明                                                     |
| :------------------------- | :------------------ | :----------------------------------------------------------- |
| **opacity**                | `Animation<double>` | **必填**。驱动透明度变化的动画对象，值范围为 0.0（完全透明）到 1.0（完全不透明）。通常由 `AnimationController` 直接提供，或经过 `CurvedAnimation`、`Tween` 等加工后传入 |
| **child**                  | `Widget?`           | 需要执行淡入淡出效果的子组件                                 |
| **alwaysIncludeSemantics** | `bool`              | 当透明度为 0（完全不可见）时，是否仍然保留子组件的语义信息供无障碍服务读取。默认为 `false`，即完全透明时语义信息也会被隐藏 |

> **关键理解**：`opacity` 属性接收的不是一个静态的 `double` 数值，而是一个持续变化的 `Animation<double>` 动画对象。这意味着你必须自行创建并管理 `AnimationController`，这正是它与隐式动画组件 `AnimatedOpacity` 的本质区别。



## 108. SlideTransition

### 一、概述

`SlideTransition` 是一个显式动画组件，通过接收一个 `Animation<Offset>` 对象来驱动子组件的位置偏移，从而实现平滑的滑动进出效果。

------

### 二、核心属性

| 属性名            | 数据类型            | 属性说明                                                     |
| :---------------- | :------------------ | :----------------------------------------------------------- |
| **position**      | `Animation<Offset>` | **必填**。驱动位移变化的动画对象。`Offset` 中的值以子组件自身尺寸为单位：`Offset(1.0, 0.0)` 表示向右偏移一个自身宽度，`Offset(0.0, -1.0)` 表示向上偏移一个自身高度。通常通过 `Tween<Offset>` 配合 `AnimationController` 生成 |
| **child**         | `Widget?`           | 需要执行滑动动画的子组件                                     |
| **textDirection** | `TextDirection?`    | 决定水平方向偏移的参考方向。设为 `TextDirection.ltr` 时，正值向右滑；设为 `TextDirection.rtl` 时，正值向左滑。未指定时会自动从上下文中继承 |

> **关键理解**：`position` 中 `Offset` 的数值并非像素值，而是子组件自身尺寸的**倍数**。例如 `Offset(0.5, 0.0)` 意味着向右平移自身宽度的一半，`Offset(0.0, 2.0)` 意味着向下平移自身高度的两倍。这种相对单位的设计让动画天然适配不同尺寸的组件。



## 109. CustomPaint

### 一、概述

`CustomPaint` 是一个提供自由绘制画布的组件，允许开发者通过自定义的 `CustomPainter` 对象直接使用底层绘图指令（画线、画圆、画路径等）在屏幕上绑定任意图形。

------

### 二、核心属性

| 属性名                | 数据类型         | 属性说明                                                     |
| :-------------------- | :--------------- | :----------------------------------------------------------- |
| **painter**           | `CustomPainter?` | 在子组件**之前**（即底层）进行绘制的画家对象。需要自行继承 `CustomPainter` 类并实现其中的 `paint` 方法（执行具体绘图逻辑）和 `shouldRepaint` 方法（决定何时需要重新绘制） |
| **foregroundPainter** | `CustomPainter?` | 在子组件**之上**（即顶层）进行绘制的画家对象。用法与 `painter` 完全一致，区别仅在于绘制层级覆盖在 `child` 上方 |
| **child**             | `Widget?`        | 放置在 `painter` 和 `foregroundPainter` 之间的子组件。`CustomPaint` 的尺寸会优先采用 `child` 的尺寸 |
| **size**              | `Size`           | 当没有 `child` 时，用来指定画布的大小。默认为 `Size.zero`。如果有 `child`，此属性会被忽略，画布大小由 `child` 决定 |
| **isComplex**         | `bool`           | 提示渲染引擎此绘制内容是否复杂。设为 `true` 时，引擎会尝试对绘制结果进行缓存以提升性能。默认为 `false` |
| **willChange**        | `bool`           | 提示渲染引擎此绘制内容在下一帧是否可能发生变化。设为 `true` 时，引擎会减少缓存的使用。默认为 `false` |

> **关于 CustomPainter 的两个关键方法**：
>
> - **paint(Canvas canvas, Size size)**：核心绘制方法。`Canvas` 是画布对象，提供了 `drawLine`、`drawCircle`、`drawRect`、`drawPath`、`drawArc` 等丰富的绘图指令；`Size` 是当前画布的可用尺寸。绘制时需要配合 `Paint` 对象来定义颜色、线宽、填充模式等样式。
> - **shouldRepaint(covariant CustomPainter oldDelegate)**：返回 `true` 表示需要重新调用 `paint` 进行重绘，返回 `false` 则跳过重绘。通常根据自定义属性是否发生变化来判断。



## 110. AnimatedList

------

### 一、概述

AnimatedList 是一个可滚动列表组件，当列表项被**插入**或**移除**时，能够自动执行指定的过渡动画，而非让元素生硬地出现或消失。

------

### 二、核心属性

| 属性名               | 数据类型                     | 属性说明                                                     |
| :------------------- | :--------------------------- | :----------------------------------------------------------- |
| **key**              | GlobalKey<AnimatedListState> | 这是 AnimatedList 最关键的属性。通过全局键获取列表的状态对象，从而在外部调用 **insertItem** 和 **removeItem** 方法来触发动画。没有它，就无法驱动列表的增删动画 |
| **itemBuilder**      | AnimatedListItemBuilder      | 构建每一个列表项的回调。它会接收三个参数：上下文、当前项的索引、以及一个**动画对象**。你需要利用这个动画对象把列表项包裹在动画组件中（如 FadeTransition、SizeTransition 等），从而决定项目出现时的动画效果 |
| **initialItemCount** | int                          | 列表在首次渲染时包含的项目数量，默认为 0。注意这只是告知列表"一开始有多少项"，并不会自动播放入场动画 |
| **scrollDirection**  | Axis                         | 列表的滚动方向，可选垂直或水平，默认垂直                     |
| **reverse**          | bool                         | 是否反转滚动方向与内容排列顺序，默认为 false                 |
| **controller**       | ScrollController             | 滚动控制器，用于监听或控制滚动位置                           |
| **padding**          | EdgeInsetsGeometry           | 列表内容区域的内边距                                         |
| **physics**          | ScrollPhysics                | 自定义滚动的物理行为，如弹性效果、不可滚动等                 |
| **shrinkWrap**       | bool                         | 是否让列表高度根据内容自适应收缩，默认为 false。在嵌套滚动场景中常设为 true |
| **clipBehavior**     | Clip                         | 内容超出边界时的裁剪方式，默认为硬裁剪                       |

------

### 三、核心运作机制

由于 AnimatedList 的使用方式与普通列表差异较大，以下用自然语言阐明其运作逻辑：

**驱动方式：**
AnimatedList 不像普通列表那样"数据变了自动刷新"。你必须通过全局键拿到它的状态对象，然后主动调用状态对象上的两个核心方法：

- **insertItem**：告诉列表"在某个索引位置插入了一项"，列表会为这一项播放由 itemBuilder 中定义的入场动画。
- **removeItem**：告诉列表"移除某个索引位置的一项"，同时你需要提供一个构建器来描述该项在移除过程中应该如何播放退场动画。

**数据同步原则：**
你自己维护一份数据列表。每次调用 insertItem 或 removeItem 之前或同时，必须同步更新你的数据列表，确保数据源与 AnimatedList 的项目数量始终一致，否则会报错。

------

### 四、构造函数

#### AnimatedList.separated

**使用场景：** 当你需要在每两个列表项之间放置分隔元素（如分割线、间距）并且分隔元素本身也需要动画效果时使用，类似于 ListView.separated 的动画版本。

**独有核心参数：**

| 属性名               | 数据类型                     | 属性说明                                                     |
| :------------------- | :--------------------------- | :----------------------------------------------------------- |
| **separatorBuilder** | AnimatedListSeparatorBuilder | 构建两项之间分隔组件的回调，同样会接收一个动画对象，使分隔元素也能随列表项的增删同步执行动画过渡 |



## 111. TweenAnimationBuilder

------

### 一、概述

TweenAnimationBuilder 是一个隐式动画组件，允许你定义任意类型的起始值与目标值，组件会自动在两者之间进行平滑的数值插值过渡，并在每一帧将当前插值结果交给你来构建界面，无需手动管理 AnimationController。

------

### 二、核心属性

| 属性名       | 数据类型              | 属性说明                                                     |
| :----------- | :-------------------- | :----------------------------------------------------------- |
| **tween**    | Tween<T>              | 定义动画的**数值变化范围**。通过设置 begin（起始值）和 end（目标值），告诉组件"从哪里变到哪里"。T 是泛型，意味着可以插值的类型非常广泛，包括 double、Color、Offset、Size、BorderRadius 等任何实现了插值逻辑的类型 |
| **duration** | Duration              | 动画从起始值过渡到目标值所需的时长                           |
| **builder**  | ValueWidgetBuilder<T> | 核心构建回调。每当动画值发生变化时都会被调用，接收三个参数：上下文、**当前帧的动画插值结果**（类型为 T）、以及可选的 child。你根据这个实时变化的值来构建或调整界面元素的外观 |
| **child**    | Widget?               | 一个不随动画变化的静态子组件。它会被直接传递到 builder 回调中。将不需要重建的部分放在这里，可以避免每帧都重复构建，起到**性能优化**作用 |
| **curve**    | Curve                 | 动画的速率曲线，控制变化节奏，如先快后慢、弹性效果等，默认为匀速线性 |
| **onEnd**    | VoidCallback?         | 动画完成时触发的回调，适合在动画结束后执行后续逻辑，如弹出提示、触发下一段动画等 |

------

### 三、核心运作机制

**首次构建时的行为：**
组件第一次出现在屏幕上时，如果 tween 的 begin 不为空，就会从 begin 动画过渡到 end；如果 begin 为空，则直接以 end 值静态展示，不播放动画。

**目标值变更时的行为：**
当你修改 tween 的 end 值时，组件会自动将**当前动画所处的值**作为新的起点，平滑过渡到新的 end 值。这意味着即使动画正在进行中途被打断，也不会出现跳跃，过渡始终连贯流畅。

**与其他隐式动画组件的区别：**
AnimatedOpacity 只能为透明度做动画，AnimatedContainer 只能为容器属性做动画——它们各自局限于特定属性。而 TweenAnimationBuilder 是**通用型**的，你可以为任何可插值的数据类型创建动画，甚至可以同时组合多个 TweenAnimationBuilder 实现多属性的独立动画控制。

**与显式动画的边界：**
它适合"从 A 到 B"这类有明确终点的单次过渡动画。如果你需要无限循环、需要手动控制播放/暂停/反转，那就超出了它的能力范围，应该转向使用 AnimationController 配合显式动画组件。



## 112. DraggableScrollableSheet

------

### 一、概述

DraggableScrollableSheet 是一个可被用户通过手指上下拖拽来改变高度的可滚动面板组件，当面板展开到一定程度后，其内部内容还可以继续滚动，常用于从屏幕底部弹出的详情面板场景。

------

### 二、核心属性

| 属性名                     | 数据类型                       | 属性说明                                                     |
| :------------------------- | :----------------------------- | :----------------------------------------------------------- |
| **initialChildSize**       | double                         | 面板**首次出现时**占父容器高度的比例，取值范围 0 到 1，默认为 0.5，即初始占据父容器一半高度 |
| **minChildSize**           | double                         | 面板被向下拖拽时**允许缩小到的最小高度比例**，默认为 0.25，即最小占父容器四分之一高度。用户无法将面板拖到比这更小 |
| **maxChildSize**           | double                         | 面板被向上拖拽时**允许扩展到的最大高度比例**，默认为 1.0，即最大可占满整个父容器。用户无法将面板拖到比这更大 |
| **expand**                 | bool                           | 是否让该组件自身撑满父容器的全部可用空间，默认为 true。设为 false 时，组件自身的尺寸会随面板的实际显示高度而变化 |
| **snap**                   | bool                           | 是否开启**吸附效果**，默认为 false。开启后，当用户松手时，面板不会停留在任意位置，而是自动弹到最近的吸附点 |
| **snapSizes**              | List<double>?                  | 自定义吸附点列表，每个值代表一个高度比例。仅在 snap 为 true 时生效。若不设置，默认吸附点为 minChildSize 和 maxChildSize 两个端点 |
| **snapAnimationDuration**  | Duration?                      | 吸附动画的时长，控制松手后面板滑向吸附点的速度               |
| **controller**             | DraggableScrollableController? | 外部控制器，用于在代码中主动读取或改变面板当前的高度比例，也可以监听面板高度的变化，还能通过它调用 animateTo 方法将面板平滑地过渡到指定高度 |
| **shouldCloseOnMinExtent** | bool                           | 当面板被拖到最小高度时，是否自动关闭（触发 Navigator.pop），默认为 true。常用于 showBottomSheet 场景中，拖到底即关闭 |
| **builder**                | ScrollableWidgetBuilder        | 核心构建回调。它接收一个上下文和一个 **ScrollController**，你必须将这个 ScrollController 绑定给面板内部的可滚动组件（如 ListView、SingleChildScrollView），这是实现"拖拽与内部滚动无缝衔接"的关键纽带 |

------

### 三、核心运作机制

**拖拽与滚动的智能切换：**
当面板尚未展开到最大高度时，用户的上滑手势会**优先拖拽面板使其变高**；当面板已经到达最大高度后，同样的上滑手势会**自动切换为滚动面板内部内容**。下滑同理——内部内容滚动到顶部后，继续下拉会开始缩小面板高度。这个切换完全自动，但前提是你必须把 builder 中提供的 ScrollController 正确绑定到内部的可滚动组件上。

**典型使用位置：**
它通常作为 Stack 的子组件使用，或者放在 showBottomSheet / showModalBottomSheet 中。放在 Stack 中时，面板会浮在其他内容之上，用户可以拖拽它来查看更多信息。

**控制器的能力：**
DraggableScrollableController 提供了 size 属性来获取当前高度比例，提供了 animateTo 方法来程序化地将面板平滑移动到指定比例，还提供了 reset 方法将面板恢复到 initialChildSize。



## 113. StatefulBuilder

------

### 一、概述

StatefulBuilder 是一个工具型组件，它能在自身内部提供一个**局部的 setState 函数**，使得只有被它包裹的那一小块界面区域可以独立刷新，而无需刷新整个页面或创建一个完整的 StatefulWidget 类。

------

### 二、核心属性

| 属性名      | 数据类型              | 属性说明                                                     |
| :---------- | :-------------------- | :----------------------------------------------------------- |
| **builder** | StatefulWidgetBuilder | 唯一的核心属性。这是一个构建回调，接收两个参数：上下文和一个名为 **setState** 的函数。当你调用这个 setState 并在其中修改变量值时，仅有该 builder 内部构建的那部分界面会被重新构建，页面其余部分完全不受影响 |

------

### 三、核心运作机制

**它解决的核心问题：**
在 Flutter 中，如果你在一个 StatelessWidget 里需要某一小块区域拥有状态管理能力，正常做法是把整个页面改造成 StatefulWidget，或者为那一小块单独抽出一个 StatefulWidget 类。StatefulBuilder 提供了第三种选择——直接在原地嵌入，就能获得局部状态刷新能力，省去了创建新类的麻烦。

**最经典的使用场景：**
在 showDialog 或 showModalBottomSheet 弹出的对话框中，对话框内部的界面默认无法通过外层页面的 setState 来刷新。此时在对话框内部使用 StatefulBuilder 包裹内容，就可以用它提供的局部 setState 来更新对话框内的界面，例如切换复选框状态、更新对话框中的文本等。

**局部 setState 的作用范围：**
它提供的 setState 函数**仅重建 builder 回调内部返回的那棵子树**。这意味着如果页面上有一个很复杂的列表，你只想刷新列表中的一个按钮状态，把那个按钮用 StatefulBuilder 包起来，调用它的 setState 时只有按钮会重建，列表不会受到任何影响。

**变量的声明位置：**
需要被局部刷新影响的变量，应当声明在 StatefulBuilder 的外部但在其可访问的作用域内。StatefulBuilder 本身不持有变量，它只提供触发局部重建的能力。



## 114. AnimatedSwitcher

------

### 一、概述

AnimatedSwitcher 是一个**当其子组件发生替换时，自动对旧子组件的退出和新子组件的进入执行过渡动画**的隐式动画容器组件。默认的过渡效果为淡入淡出（交叉溶解）。

> **关键机制**：AnimatedSwitcher 判断"子组件是否发生了替换"的依据是子组件的 **类型（Type）** 或 **Key** 是否改变。若两者都未变，它会认为子组件没有更换，不会触发动画。因此，当你替换的是同类型组件（例如都是文本组件，只是内容不同），必须为它们赋予不同的 Key，才能让 AnimatedSwitcher 识别出"这是一个新的子组件"并触发过渡动画。

------

### 二、核心属性

| 属性名                | 数据类型                                                     | 属性说明                                                     |
| :-------------------- | :----------------------------------------------------------- | :----------------------------------------------------------- |
| **child**             | Widget?                                                      | 当前要显示的子组件。当此属性指向一个新的组件实例（类型或 Key 不同）时，AnimatedSwitcher 就会对旧子组件播放退出动画、对新子组件播放进入动画。 |
| **duration**          | Duration                                                     | 新子组件**进入动画**的时长，这是必填属性。                   |
| **reverseDuration**   | Duration?                                                    | 旧子组件**退出动画**的时长。若不设置，则默认与 duration 保持一致。 |
| **switchInCurve**     | Curve                                                        | 新子组件进入动画所使用的动画曲线，默认为线性曲线（Curves.linear）。可替换为弹性、缓入缓出等其他曲线以改变动画节奏感。 |
| **switchOutCurve**    | Curve                                                        | 旧子组件退出动画所使用的动画曲线，默认同样为线性曲线。       |
| **transitionBuilder** | Widget Function(Widget child, Animation<double> animation)   | 定义"用什么动画效果"来包装子组件。它接收子组件和一个动画值，返回一个带有过渡效果的组件。默认实现是使用淡入淡出效果。你可以替换为缩放、旋转、滑动等任意过渡效果。进入和退出的子组件都会经过此函数处理。 |
| **layoutBuilder**     | Widget Function(Widget? currentChild, List<Widget> previousChildren) | 定义新旧子组件在过渡期间的**布局方式**。默认行为是将新旧子组件以堆叠（居中对齐）的方式叠放在一起，使它们在同一位置完成交叉过渡。你可以自定义此函数来改变它们在过渡期间的排列逻辑。 |



## 115. Tab

------

### 一、概述

Tab 是 Material Design 规范下用于定义**标签栏（TabBar）中单个标签项**的组件，它描述了每个标签所展示的内容，可以是文字、图标、或两者兼有。

> **重要关系**：Tab 组件本身不会独立使用，它必须放在 TabBar 的 tabs 列表中才有意义。TabBar 负责排列和交互逻辑，而每个 Tab 只负责定义"这个标签长什么样"。

------

### 二、核心属性

| 属性名         | 数据类型           | 属性说明                                                     |
| :------------- | :----------------- | :----------------------------------------------------------- |
| **text**       | String?            | 标签上显示的文字内容。与 child 属性互斥，两者只能设置其中一个。 |
| **icon**       | Widget?            | 标签上显示的图标。可以与 text 或 child 同时使用，同时存在时图标显示在上方、文字显示在下方。 |
| **iconMargin** | EdgeInsetsGeometry | 图标与文字之间的间距，默认为底部留出 10 逻辑像素的间距。仅当 icon 与 text/child 同时存在时才生效。 |
| **child**      | Widget?            | 用于替代 text 的完全自定义内容组件。当简单文字无法满足需求时（例如需要富文本、特殊排版），可使用此属性。与 text 互斥，两者只能设置其中一个。 |
| **height**     | double?            | 标签的高度。当仅有文字或仅有图标时默认为 46 逻辑像素；当图标和文字同时存在时默认为 72 逻辑像素。 |



## 116. PreferredSize

------

### 一、概述

PreferredSize 是一个用于**为任意子组件声明一个"期望尺寸"**的包装组件，它本身不会对子组件施加任何尺寸约束，仅仅是向父组件报告"我希望占据多大的空间"，最常见的用途是将自定义组件作为 Scaffold 的 appBar 或 bottomNavigationBar 使用。

> **核心理解**：Scaffold 的 appBar 属性要求传入一个实现了 PreferredSizeWidget 接口的组件。AppBar 天然实现了此接口，但如果你想用一个完全自定义的组件替代 AppBar，就必须用 PreferredSize 将其包裹，从而让 Scaffold 知道这个自定义组件期望占多高的空间。PreferredSize 只是"声明尺寸"，并不强制子组件遵守这个尺寸。

------

### 二、核心属性

| 属性名            | 数据类型 | 属性说明                                                     |
| :---------------- | :------- | :----------------------------------------------------------- |
| **preferredSize** | Size     | 必填属性。声明该组件期望的尺寸大小。它是一个 Size 对象，包含宽度和高度两个维度。实际使用中，宽度通常设为无限大（占满可用宽度），重点关注的是高度值。此尺寸仅作为"建议"提供给父组件参考，不会对子组件进行实际的尺寸约束。 |
| **child**         | Widget   | 被包裹的实际子组件，即你希望展示的自定义内容。PreferredSize 会将此子组件原样渲染，不做任何布局干预。 |



## 117. FlexibleSpaceBar

------

### 一、概述

FlexibleSpaceBar 是专门用于 SliverAppBar 的 **flexibleSpace** 属性中的组件，它定义了应用栏在滚动展开与收缩过程中，**标题和背景内容如何随滚动产生视差、缩放、淡入淡出等动态过渡效果**。

> **核心理解**：SliverAppBar 提供了"可伸缩应用栏"的骨架能力，而 FlexibleSpaceBar 则负责填充这个伸缩区域的**具体内容与动画表现**。两者配合使用，才能实现常见的"向上滚动时大图逐渐收缩为普通标题栏"的效果。FlexibleSpaceBar 脱离 SliverAppBar 单独使用是没有意义的。

------

### 二、核心属性

| 属性名                 | 数据类型            | 属性说明                                                     |
| :--------------------- | :------------------ | :----------------------------------------------------------- |
| **title**              | Widget?             | 显示在伸缩区域中的标题组件。在展开状态下，标题通常显示在底部偏左位置；随着滚动收缩，标题会自动平滑过渡到普通应用栏标题的位置。 |
| **background**         | Widget?             | 伸缩区域的背景内容，通常放置一张图片。在滚动收缩过程中，背景会根据 collapseMode 的设定产生视差滚动、固定不动或直接消失等不同效果。 |
| **centerTitle**        | bool?               | 标题是否居中显示。若不设置，则跟随平台默认行为（Android 靠左，iOS 居中）。 |
| **titlePadding**       | EdgeInsetsGeometry? | 标题组件的内边距。用于精确控制标题在展开状态下的位置，默认情况下标题左侧和底部各留有一定间距。 |
| **collapseMode**       | CollapseMode        | 控制背景在收缩过程中的动画行为，有三个可选值：**parallax**（默认值，背景以视差效果滚动，即背景滚动速度慢于内容滚动速度，产生层次感）；**pin**（背景固定不动，内容在其上方滚过）；**none**（背景跟随内容同速滚动，无特殊效果）。 |
| **stretchModes**       | List<StretchMode>   | 当用户过度下拉（即超出顶部边界继续拉）时，背景的拉伸表现方式。可以同时指定多种模式组合：**zoomBackground**（背景图放大）、**blurBackground**（背景图模糊）、**fadeTitle**（标题淡出消失）。需要 SliverAppBar 的 stretch 属性开启才生效。 |
| **expandedTitleScale** | double              | 标题在完全展开状态下相对于收缩状态的缩放倍数，默认值为 1.5，即展开时标题比收缩后大 1.5 倍。随着滚动收缩，标题会从放大状态平滑缩小到正常大小。 |



## 118. BottomAppBar

------

### 一、概述

`BottomAppBar` 是放置在屏幕底部的应用栏容器，通常作为 `Scaffold` 的 `bottomNavigationBar` 使用，它最突出的能力是可以与 `FloatingActionButton` 配合，在自身上方形成一个凹陷缺口，将浮动按钮嵌入其中，从而实现底部导航与核心操作按钮的一体化布局。

------

### 二、核心属性

| 属性名             | 数据类型              | 属性说明                                                     |
| :----------------- | :-------------------- | :----------------------------------------------------------- |
| `child`            | `Widget?`             | 放置在底部栏内部的子组件，通常是一个 `Row`，里面排列多个图标按钮作为导航项 |
| `color`            | `Color?`              | 底部栏的背景颜色                                             |
| `elevation`        | `double?`             | 底部栏的阴影高度，数值越大投影越明显，设为 `0` 则无阴影      |
| `shape`            | `NotchedShape?`       | 定义缺口的形状。最常用的值是 `CircularNotchedRectangle()`，它会在底部栏边缘切出一个圆形凹槽来容纳 `FloatingActionButton`。若不设置则没有缺口 |
| `notchMargin`      | `double`              | 缺口边缘与 `FloatingActionButton` 之间的间距，默认值为 `4.0`。数值越大，凹槽与按钮之间的留白越宽 |
| `height`           | `double?`             | 底部栏的整体高度。Material 3 规范下默认为 `80.0`             |
| `padding`          | `EdgeInsetsGeometry?` | 底部栏内部的内边距，控制 `child` 与栏边缘之间的距离          |
| `surfaceTintColor` | `Color?`              | Material 3 体系下的表面着色叠加色，会与 `elevation` 联动产生色调变化。设为 `Colors.transparent` 可关闭此效果 |
| `shadowColor`      | `Color?`              | 阴影的颜色，配合 `elevation` 一起决定投影的视觉表现          |
| `clipBehavior`     | `Clip`                | 内容超出边界时的裁剪方式，默认为 `Clip.none`。当设置了 `shape` 产生缺口时，通常需要改为 `Clip.antiAlias` 以确保缺口处裁剪平滑 |

------

### 三、使用要点与注意事项

1. **与 FloatingActionButton 联动**：要让浮动按钮"嵌"进底部栏的凹槽中，需要同时满足三个条件——在 `Scaffold` 中设置 `floatingActionButtonLocation` 为居中停靠或末端停靠的位置、给 `BottomAppBar` 的 `shape` 赋值一个缺口形状、并将 `clipBehavior` 设为抗锯齿裁剪。三者缺一不可。
2. **它不是 BottomNavigationBar**：`BottomNavigationBar`（以及更推荐的 `NavigationBar`）自带选项卡切换逻辑和选中状态管理，而 `BottomAppBar` 本身只是一个"空容器"，内部放什么、点击后做什么，全部需要开发者自行组装。它的定位更偏向自由布局，而非固定的导航模式。
3. **Material 3 的视觉差异**：在 Material 3 主题下，`BottomAppBar` 默认没有阴影投影，而是通过 `surfaceTintColor` 结合 `elevation` 来呈现层次感（颜色会略微偏移）。如果希望回归传统阴影效果，需要手动将 `surfaceTintColor` 设为透明，同时给 `shadowColor` 赋一个可见颜色。



## 119. Material

------

### 一、概述

`Material` 是 Flutter 中实现 Material Design 视觉效果的最底层基础组件，它为其子组件提供背景颜色、阴影投影、圆角裁剪以及墨水波纹（InkWell / InkResponse）的承载表面——几乎所有 Material 系列组件（如按钮、卡片、对话框）的内部都依赖一个 `Material` 作为绘制基底。

------

### 二、核心属性

| 属性名               | 数据类型                | 属性说明                                                     |
| :------------------- | :---------------------- | :----------------------------------------------------------- |
| `child`              | `Widget?`               | 放置在 Material 表面之上的子组件                             |
| `type`               | `MaterialType`          | 决定 Material 的基础形态。常用枚举值：`canvas`（默认，带背景色的矩形）、`card`（带圆角和阴影的卡片样式）、`circle`（圆形）、`button`（带圆角的按钮样式）、`transparency`（完全透明，不绘制背景也不产生阴影，仅作为墨水波纹的承载面） |
| `elevation`          | `double`                | 阴影的高度层级，数值越大投影越明显。默认值为 `0`。它同时影响 Material 3 体系下 `surfaceTintColor` 的色调叠加程度 |
| `color`              | `Color?`                | Material 表面的背景颜色。当 `type` 为 `transparency` 时此属性无效 |
| `shadowColor`        | `Color?`                | 阴影的颜色。Material 3 下默认为 `Colors.transparent`，若要看到传统阴影效果需手动指定 |
| `surfaceTintColor`   | `Color?`                | Material 3 的表面着色叠加色，会与 `elevation` 联动——`elevation` 越高，叠加的色调越明显。设为 `Colors.transparent` 可关闭此效果 |
| `borderRadius`       | `BorderRadiusGeometry?` | 圆角半径，仅在 `type` 为 `canvas`、`transparency` 或自定义时生效。与 `shape` 互斥，不可同时使用 |
| `shape`              | `ShapeBorder?`          | 自定义形状边框，优先级高于 `borderRadius`。可传入 `RoundedRectangleBorder`、`StadiumBorder`、`CircleBorder` 等任意形状 |
| `borderOnForeground` | `bool`                  | 当设置了 `shape` 时，控制边框绘制在子组件的前面还是后面。默认为 `true`（绘制在前景层） |
| `clipBehavior`       | `Clip`                  | 内容超出 Material 形状边界时的裁剪策略。默认为 `Clip.none`。设置了圆角或自定义形状后，通常需改为 `Clip.antiAlias` 以确保内容被正确裁剪 |
| `animationDuration`  | `Duration`              | 当 `color`、`elevation`、`shadowColor` 等属性发生变化时，过渡动画的持续时长。默认为 `kThemeChangeDuration`（约 200 毫秒） |
| `textStyle`          | `TextStyle?`            | 为其所有后代文本组件提供的默认文字样式                       |



## 120. Theme

------

### 一、概述

`Theme` 是一个用于向其所有后代组件统一注入视觉样式配置的 `InheritedWidget`，它通过携带一个 `ThemeData` 对象，让子树中的所有 Material 组件（文字、按钮、卡片、输入框等）自动继承并应用同一套颜色、字体、形状等设计规范，从而实现全局或局部的样式统一管理。

------

### 二、核心属性

#### Theme 组件本身的属性

| 属性名  | 数据类型    | 属性说明                                                     |
| :------ | :---------- | :----------------------------------------------------------- |
| `data`  | `ThemeData` | **必填**。承载所有样式配置的核心数据对象，所有视觉规范都在这里定义 |
| `child` | `Widget`    | **必填**。需要应用该主题的子组件树                           |

#### ThemeData 的高频子属性

由于 `ThemeData` 是 `Theme` 的灵魂所在，以下列出其最常用的配置项：

| 属性名                      | 数据类型                         | 属性说明                                                     |
| :-------------------------- | :------------------------------- | :----------------------------------------------------------- |
| `useMaterial3`              | `bool`                           | 是否启用 Material 3 设计规范。Flutter 3.16 起默认为 `true`   |
| `colorScheme`               | `ColorScheme?`                   | 整套配色方案，包含 `primary`、`secondary`、`surface`、`error`、`onPrimary` 等约 30 个语义化颜色槽位。它是 Material 3 下颜色体系的核心入口 |
| `colorSchemeSeed`           | `Color?`                         | 传入一个种子颜色，Flutter 会自动基于该颜色生成一整套符合 Material 3 规范的 `ColorScheme`。与 `colorScheme` 互斥，不可同时使用 |
| `brightness`                | `Brightness?`                    | 整体亮暗模式：`Brightness.light`（浅色模式）或 `Brightness.dark`（深色模式）。若已设置 `colorScheme`，则以 `colorScheme.brightness` 为准 |
| `textTheme`                 | `TextTheme?`                     | 全局文字样式集合，包含 `displayLarge`、`headlineMedium`、`bodyLarge`、`labelSmall` 等多个语义化层级，每个层级对应一个 `TextStyle` |
| `scaffoldBackgroundColor`   | `Color?`                         | `Scaffold` 的默认背景色                                      |
| `appBarTheme`               | `AppBarTheme?`                   | 统一配置所有 `AppBar` 的背景色、前景色、阴影、标题样式等     |
| `cardTheme`                 | `CardTheme?`                     | 统一配置所有 `Card` 的颜色、阴影、形状、边距等               |
| `iconTheme`                 | `IconThemeData?`                 | 统一配置图标的默认颜色、大小、透明度                         |
| `elevatedButtonTheme`       | `ElevatedButtonThemeData?`       | 统一配置所有 `ElevatedButton` 的样式                         |
| `inputDecorationTheme`      | `InputDecorationTheme?`          | 统一配置所有输入框（`TextField`）的边框、标签、提示文字等装饰样式 |
| `navigationBarTheme`        | `NavigationBarThemeData?`        | 统一配置 Material 3 底部导航栏 `NavigationBar` 的样式        |
| `dialogTheme`               | `DialogTheme?`                   | 统一配置所有对话框的背景色、形状、标题样式等                 |
| `dividerTheme`              | `DividerThemeData?`              | 统一配置分割线的颜色、粗细、缩进                             |
| `floatingActionButtonTheme` | `FloatingActionButtonThemeData?` | 统一配置浮动操作按钮的颜色、形状、阴影等                     |
| `visualDensity`             | `VisualDensity?`                 | 控制组件的视觉紧凑程度，可在水平和垂直方向上微调组件的密度   |
| `splashFactory`             | `InteractiveInkFeatureFactory?`  | 定义墨水波纹的动画效果工厂。如 `InkRipple.splashFactory`（经典扩散波纹）或 `InkSparkle.splashFactory`（Material 3 闪烁效果） |
| `typography`                | `Typography?`                    | 定义各平台下的基础字体排版规则，`textTheme` 会在此基础上做进一步覆盖 |
| `platform`                  | `TargetPlatform?`                | 手动指定目标平台，影响部分组件的默认交互行为和视觉风格       |

------

### 三、关键静态方法

`Theme` 没有命名构造函数，但拥有两个极其重要的静态方法，是日常使用中获取主题数据的核心途径：

#### `Theme.of(BuildContext context)`

从当前组件所在位置向上查找最近的 `Theme` 祖先，返回其携带的 `ThemeData`。这是最常用的主题读取方式。当上层 `Theme` 的 `data` 发生变化时，所有通过此方法读取主题的组件会自动重建以反映新样式。

#### `ThemeData.copyWith(...)`

虽然这不是 `Theme` 的方法，但它是与 `Theme` 配合使用频率最高的能力。它基于一个已有的 `ThemeData` 创建副本，并只覆盖你指定的个别属性，其余属性保持不变。常见用途是在局部子树中微调某些样式，而不影响全局主题的其他部分。

------

### 四、使用层级与作用域

1. **全局主题**：在 `MaterialApp` 的 `theme` 属性（浅色）和 `darkTheme` 属性（深色）中设置 `ThemeData`，作用于整个应用的所有页面。
2. **局部主题覆盖**：在组件树的任意位置插入一个 `Theme` 组件，传入经过 `copyWith` 微调的 `ThemeData`，仅影响其 `child` 子树内的组件样式，不波及子树外部。
3. **优先级规则**：组件自身直接设置的样式 > 最近的 `Theme` 提供的样式 > 更上层的 `Theme` 提供的样式 > `MaterialApp` 设置的全局主题。





## 121. ChoiceChip

------

### 一、概述

`ChoiceChip` 是一种用于在一组选项中进行**单项选择**的小型标签组件，用户点击后它会切换为"选中"状态并在视觉上高亮显示，常用于筛选条件、分类标签等场景中代替传统的单选按钮。

------

### 二、核心属性

| 属性名                  | 数据类型                       | 属性说明                                                     |
| :---------------------- | :----------------------------- | :----------------------------------------------------------- |
| `label`                 | `Widget`                       | **必填**。芯片上显示的主体内容，通常是一个 `Text` 组件       |
| `selected`              | `bool`                         | **必填**。当前芯片是否处于选中状态。`true` 为选中（高亮），`false` 为未选中。此属性由开发者自行管理状态 |
| `onSelected`            | `ValueChanged<bool>?`          | 用户点击芯片时的回调，参数为切换后的布尔值。设为 `null` 则芯片变为禁用状态，不可交互 |
| `avatar`                | `Widget?`                      | 显示在 `label` 左侧的小图标或图片。当芯片被选中时，默认行为下 `avatar` 会被选中勾选图标替换 |
| `showCheckmark`         | `bool?`                        | 选中时是否在前方显示一个勾选标记。默认为 `true`。设为 `false` 可隐藏勾选图标，让选中状态仅通过颜色变化来体现 |
| `checkmarkColor`        | `Color?`                       | 勾选标记的颜色                                               |
| `selectedColor`         | `Color?`                       | 芯片被选中时的背景颜色                                       |
| `disabledColor`         | `Color?`                       | 芯片处于禁用状态时的背景颜色                                 |
| `backgroundColor`       | `Color?`                       | 芯片未被选中时的背景颜色                                     |
| `labelStyle`            | `TextStyle?`                   | `label` 的文字样式，可控制字体大小、粗细、颜色等             |
| `labelPadding`          | `EdgeInsetsGeometry?`          | `label` 内容区域的内边距                                     |
| `padding`               | `EdgeInsetsGeometry?`          | 芯片整体的内边距，控制内容与芯片边缘之间的间距               |
| `shape`                 | `OutlinedBorder?`              | 芯片的外形轮廓，可传入 `RoundedRectangleBorder`、`StadiumBorder` 等自定义形状 |
| `side`                  | `BorderSide?`                  | 芯片的边框样式，可控制边框颜色、宽度等                       |
| `elevation`             | `double?`                      | 未选中状态下的阴影高度                                       |
| `pressElevation`        | `double?`                      | 按下时的阴影高度                                             |
| `selectedShadowColor`   | `Color?`                       | 选中状态下阴影的颜色                                         |
| `tooltip`               | `String?`                      | 长按时弹出的提示文字                                         |
| `materialTapTargetSize` | `MaterialTapTargetSize?`       | 点击目标的最小尺寸策略。`padded` 会确保至少 48×48 的可点击区域；`shrinkWrap` 则紧贴芯片实际大小 |
| `iconTheme`             | `IconThemeData?`               | 统一控制芯片内部图标的颜色、大小等                           |
| `color`                 | `WidgetStateProperty<Color?>?` | Material 3 下根据不同交互状态（选中、悬停、按下、禁用等）动态返回不同背景颜色的属性，优先级高于 `selectedColor` 和 `backgroundColor` |

------

### 三、使用要点与注意事项

1. **状态需自行管理**：`ChoiceChip` 本身不会记住自己是否被选中，`selected` 属性的值完全由开发者通过状态管理来维护。在 `onSelected` 回调中更新状态变量，再触发界面重建，芯片才会呈现选中或取消的效果。
2. **单选逻辑需手动实现**：当多个 `ChoiceChip` 排列在一起时，Flutter 不会自动实现"选一个就取消其他"的互斥行为。开发者需要维护一个记录当前选中项的变量，在 `onSelected` 回调中将该变量更新为当前点击项的标识，并让每个芯片的 `selected` 属性根据此变量计算自身是否被选中。
3. **与 Wrap 组件搭配**：多个 `ChoiceChip` 通常放在 `Wrap` 组件中排列，这样当一行放不下时会自动换行，比 `Row` 更适合标签列表的布局场景。
4. **Material 3 下的视觉差异**：在 Material 3 主题下，选中的 `ChoiceChip` 默认采用 `ColorScheme.secondaryContainer` 作为背景色，未选中时为 `surface` 色配合边框轮廓线。这与 Material 2 的纯色填充风格有明显不同。

------

### 四、与其他 Chip 的区别

| 芯片类型     | 核心定位                                   |
| :----------- | :----------------------------------------- |
| `ChoiceChip` | **单项选择**，一组中同一时刻只选中一个     |
| `FilterChip` | **多项筛选**，一组中可同时选中多个         |
| `InputChip`  | 代表一条用户输入的信息，支持删除操作       |
| `ActionChip` | 触发一个动作，没有选中状态，类似紧凑型按钮 |



## 122. FilterChip

------

### 一、概述

FilterChip 是 Material Design 中的一种"筛选标签"组件，用于在一组选项中让用户勾选或取消勾选一个或多个条件，从而实现内容过滤。它自带"选中"与"未选中"两种状态，选中时默认会在前方显示一个对勾标记。

------

### 二、核心属性

| 属性名                    | 数据类型                         | 属性说明                                                     |
| :------------------------ | :------------------------------- | :----------------------------------------------------------- |
| **label**                 | `Widget`                         | 标签上显示的主体内容，通常放一段文字，是必填属性             |
| **selected**              | `bool`                           | 当前是否处于选中状态，为 true 时呈现选中样式，默认为 false   |
| **onSelected**            | `ValueChanged<bool>?`            | 用户点击时触发的回调，参数为切换后的布尔值；设为 null 则该标签变为禁用状态，不可交互 |
| **avatar**                | `Widget?`                        | 显示在标签文字左侧的小图标或小头像；注意：当处于选中状态且 showCheckmark 为 true 时，对勾会替换掉 avatar 的位置 |
| **showCheckmark**         | `bool?`                          | 选中时是否在前方显示对勾图标，默认为 true                    |
| **checkmarkColor**        | `Color?`                         | 对勾图标的颜色                                               |
| **backgroundColor**       | `Color?`                         | 未选中状态下的背景色                                         |
| **selectedColor**         | `Color?`                         | 选中状态下的背景色                                           |
| **disabledColor**         | `Color?`                         | 禁用状态下的背景色（即 onSelected 为 null 时生效）           |
| **labelStyle**            | `TextStyle?`                     | 标签文字的样式，可控制字号、字重、颜色等                     |
| **labelPadding**          | `EdgeInsetsGeometry?`            | 标签文字与芯片边缘之间的内边距                               |
| **padding**               | `EdgeInsetsGeometry?`            | 整个芯片内容区域的内边距                                     |
| **shape**                 | `OutlinedBorder?`                | 芯片的外形轮廓，可设置为圆角矩形、体育场形等                 |
| **side**                  | `BorderSide?`                    | 芯片的边框线条样式，可控制颜色、粗细                         |
| **elevation**             | `double?`                        | 未选中状态下的阴影高度                                       |
| **pressElevation**        | `double?`                        | 按下瞬间的阴影高度                                           |
| **selectedShadowColor**   | `Color?`                         | 选中状态下阴影的颜色                                         |
| **shadowColor**           | `Color?`                         | 未选中状态下阴影的颜色                                       |
| **color**                 | `MaterialStateProperty<Color?>?` | 基于不同交互状态（悬停、按下、选中、禁用等）动态返回背景色，优先级高于 backgroundColor 和 selectedColor |
| **tooltip**               | `String?`                        | 长按或鼠标悬停时弹出的提示文字                               |
| **materialTapTargetSize** | `MaterialTapTargetSize?`         | 控制最小点击区域的大小策略，影响标签之间的间距表现           |
| **visualDensity**         | `VisualDensity?`                 | 视觉密度，可让芯片整体更紧凑或更宽松                         |
| **iconTheme**             | `IconThemeData?`                 | 统一控制芯片内部图标的大小、颜色等主题属性                   |

------

### 三、构造函数

#### FilterChip.elevated

**使用场景：** 当你希望筛选标签以"凸起卡片"的视觉风格呈现（带有默认阴影、无边框轮廓），而非默认的扁平描边风格时使用。适合需要在页面中更突出筛选区域、营造层次感的界面设计。

**独有特征说明：** 该构造函数本身没有额外的独有参数，它与默认构造函数接收完全相同的属性列表。区别在于它自动应用了 Material Design 3 中"Elevated Filter Chip"的默认主题——默认带有阴影抬升效果、无描边边框、背景色为表面色调，无需你手动去设置 elevation 和 side 来模拟凸起效果。



## 123. ActionChip

------

### 一、概述

ActionChip 是 Material Design 中的一种"动作标签"组件，用于触发一个与当前内容相关的操作，它没有"选中 / 未选中"的状态切换，点击一次就执行一次动作，本质上更接近一个样式为标签外观的按钮。

------

### 二、核心属性

| 属性名                    | 数据类型                         | 属性说明                                                     |
| :------------------------ | :------------------------------- | :----------------------------------------------------------- |
| **label**                 | `Widget`                         | 标签上显示的主体内容，通常放一段文字，是必填属性             |
| **onPressed**             | `VoidCallback?`                  | 用户点击时触发的回调，无返回值也无参数；设为 null 则该标签进入禁用状态，不可交互 |
| **avatar**                | `Widget?`                        | 显示在标签文字左侧的小图标或小图片，用于辅助说明该动作的含义 |
| **backgroundColor**       | `Color?`                         | 标签的背景颜色                                               |
| **disabledColor**         | `Color?`                         | 禁用状态下的背景颜色（即 onPressed 为 null 时生效）          |
| **labelStyle**            | `TextStyle?`                     | 标签文字的样式，可控制字号、字重、颜色等                     |
| **labelPadding**          | `EdgeInsetsGeometry?`            | 标签文字与芯片边缘之间的内边距                               |
| **padding**               | `EdgeInsetsGeometry?`            | 整个芯片内容区域的内边距                                     |
| **shape**                 | `OutlinedBorder?`                | 芯片的外形轮廓，可设置为圆角矩形、体育场形等                 |
| **side**                  | `BorderSide?`                    | 芯片的边框线条样式，可控制颜色和粗细                         |
| **elevation**             | `double?`                        | 默认状态下的阴影高度                                         |
| **pressElevation**        | `double?`                        | 按下瞬间的阴影高度                                           |
| **shadowColor**           | `Color?`                         | 阴影的颜色                                                   |
| **color**                 | `MaterialStateProperty<Color?>?` | 基于不同交互状态（悬停、按下、禁用等）动态返回背景色，优先级高于 backgroundColor |
| **tooltip**               | `String?`                        | 长按或鼠标悬停时弹出的提示文字                               |
| **iconTheme**             | `IconThemeData?`                 | 统一控制芯片内部图标的大小、颜色等主题属性                   |
| **materialTapTargetSize** | `MaterialTapTargetSize?`         | 控制最小点击区域的大小策略，影响标签之间的间距表现           |
| **visualDensity**         | `VisualDensity?`                 | 视觉密度，可让芯片整体更紧凑或更宽松                         |

------

### 三、构造函数

#### ActionChip.elevated

**使用场景：** 当你希望动作标签以"凸起卡片"的视觉风格呈现（自带阴影、无描边轮廓），而非默认的扁平描边风格时使用。适合需要让操作入口在页面中更醒目、更具层次感的界面设计。

**独有特征说明：** 该构造函数没有额外的独有参数，与默认构造函数接收完全相同的属性列表。区别在于它自动应用了 Material Design 3 中"Elevated Action Chip"的默认主题——默认带有阴影抬升效果、无描边边框、背景为表面色调，无需手动设置 elevation 和 side 来模拟凸起效果。





## 124. InputChip

------

### 一、概述

InputChip 是 Material Design 中功能最丰富的标签组件，用于以紧凑的标签形式呈现一条复杂信息（如用户、标签、属性等），它同时支持选中切换、点击触发动作以及删除移除三种交互能力。

------

### 二、核心属性

| 属性名                         | 数据类型                         | 属性说明                                                     |
| :----------------------------- | :------------------------------- | :----------------------------------------------------------- |
| **label**                      | `Widget`                         | 标签上显示的主体内容，通常放一段文字，是必填属性             |
| **onPressed**                  | `VoidCallback?`                  | 用户点击标签主体时触发的回调，用于执行一次性动作；与 onSelected 不可同时使用 |
| **onSelected**                 | `ValueChanged<bool>?`            | 用户点击时触发的选中状态切换回调，参数为切换后的布尔值；与 onPressed 不可同时使用 |
| **selected**                   | `bool`                           | 当前是否处于选中状态，默认为 false；仅在使用 onSelected 时有意义 |
| **onDeleted**                  | `VoidCallback?`                  | 删除按钮的点击回调；只要此属性不为 null，标签右侧就会自动出现一个删除图标 |
| **deleteIcon**                 | `Widget?`                        | 自定义删除图标的外观，替换默认的叉号图标；仅在 onDeleted 不为 null 时生效 |
| **deleteIconColor**            | `Color?`                         | 删除图标的颜色                                               |
| **deleteButtonTooltipMessage** | `String?`                        | 长按或悬停在删除图标上时弹出的提示文字                       |
| **avatar**                     | `Widget?`                        | 显示在标签文字左侧的小图标或头像；选中状态下且 showCheckmark 为 true 时，对勾会替换 avatar 的位置 |
| **showCheckmark**              | `bool?`                          | 选中时是否在前方显示对勾图标，默认为 true                    |
| **checkmarkColor**             | `Color?`                         | 对勾图标的颜色                                               |
| **isEnabled**                  | `bool`                           | 是否启用该标签，为 false 时标签变灰且不可交互，默认为 true   |
| **backgroundColor**            | `Color?`                         | 未选中状态下的背景色                                         |
| **selectedColor**              | `Color?`                         | 选中状态下的背景色                                           |
| **disabledColor**              | `Color?`                         | 禁用状态下的背景色                                           |
| **labelStyle**                 | `TextStyle?`                     | 标签文字的样式，可控制字号、字重、颜色等                     |
| **labelPadding**               | `EdgeInsetsGeometry?`            | 标签文字与芯片边缘之间的内边距                               |
| **padding**                    | `EdgeInsetsGeometry?`            | 整个芯片内容区域的内边距                                     |
| **shape**                      | `OutlinedBorder?`                | 芯片的外形轮廓，可设置为圆角矩形、体育场形等                 |
| **side**                       | `BorderSide?`                    | 芯片的边框线条样式，可控制颜色和粗细                         |
| **elevation**                  | `double?`                        | 默认状态下的阴影高度                                         |
| **pressElevation**             | `double?`                        | 按下瞬间的阴影高度                                           |
| **shadowColor**                | `Color?`                         | 阴影的颜色                                                   |
| **selectedShadowColor**        | `Color?`                         | 选中状态下阴影的颜色                                         |
| **color**                      | `MaterialStateProperty<Color?>?` | 基于不同交互状态动态返回背景色，优先级高于 backgroundColor 和 selectedColor |
| **tooltip**                    | `String?`                        | 长按或鼠标悬停在标签主体上时弹出的提示文字                   |
| **iconTheme**                  | `IconThemeData?`                 | 统一控制芯片内部图标的大小、颜色等主题属性                   |
| **materialTapTargetSize**      | `MaterialTapTargetSize?`         | 控制最小点击区域的大小策略，影响标签之间的间距表现           |
| **visualDensity**              | `VisualDensity?`                 | 视觉密度，可让芯片整体更紧凑或更宽松                         |



## 125. OverflowBar

------

### 一、概述

OverflowBar 是一个智能布局组件，它会将子组件优先横向排列成一行，当水平空间不足以容纳所有子组件时，自动切换为纵向逐个排列，常用于对话框底部的按钮组排布。

------

### 二、核心属性

| 属性名                | 数据类型               | 属性说明                                                     |
| :-------------------- | :--------------------- | :----------------------------------------------------------- |
| **children**          | `List<Widget>`         | 子组件列表，即需要被排列的所有元素                           |
| **spacing**           | `double`               | 横向排列时，相邻子组件之间的水平间距，默认为 0               |
| **overflowSpacing**   | `double`               | 纵向排列（溢出模式）时，相邻子组件之间的垂直间距，默认为 0   |
| **alignment**         | `MainAxisAlignment`    | 横向排列时，所有子组件在主轴（水平方向）上的对齐方式，默认为 start（靠左对齐） |
| **overflowAlignment** | `OverflowBarAlignment` | 纵向排列时，每个子组件在水平方向上的对齐方式，可选值有 start（靠左）、center（居中）、end（靠右），默认为 start |
| **overflowDirection** | `VerticalDirection`    | 纵向排列时子组件的堆叠方向，down 表示从上往下排列，up 表示从下往上排列，默认为 down |
| **textDirection**     | `TextDirection?`       | 控制横向排列时的文字方向，影响 start 和 end 的实际含义（左到右或右到左），通常无需手动设置，会自动继承上下文 |



## 126. Badge

------

### 一、概述

Badge 是 Material Design 3 中的徽章组件，用于在另一个组件（如图标、按钮）的右上角叠加显示一个小标记，通常用来展示未读消息数量或提示有新内容需要关注。

------

### 二、核心属性

| 属性名              | 数据类型              | 属性说明                                                     |
| :------------------ | :-------------------- | :----------------------------------------------------------- |
| **child**           | `Widget?`             | 徽章所依附的目标组件，徽章会叠加显示在该组件的角落位置，如一个图标或按钮 |
| **label**           | `Widget?`             | 徽章内部显示的内容，通常放一段文字（如数字）；若不提供，则徽章以一个小圆点形式呈现 |
| **isLabelVisible**  | `bool`                | 控制徽章是否可见，为 false 时徽章隐藏但 child 仍正常显示，默认为 true |
| **backgroundColor** | `Color?`              | 徽章的背景颜色，默认跟随 Material 3 主题的 error 色（通常为红色） |
| **textColor**       | `Color?`              | 徽章内文字的颜色，默认跟随主题的 onError 色（通常为白色）    |
| **textStyle**       | `TextStyle?`          | 徽章内文字的样式，可控制字号、字重等                         |
| **smallSize**       | `double?`             | 无 label 时（小圆点模式）徽章的直径大小，默认为 6            |
| **largeSize**       | `double?`             | 有 label 时（带内容模式）徽章的高度，默认为 16               |
| **padding**         | `EdgeInsetsGeometry?` | 有 label 时，徽章内部内容与徽章边缘之间的内边距              |
| **alignment**       | `AlignmentGeometry?`  | 徽章相对于 child 的对齐位置，默认为右上角                    |
| **offset**          | `Offset?`             | 在 alignment 基础上进行微调偏移，正值向右下移动，负值向左上移动 |

------

### 三、构造函数

#### Badge.count

**使用场景：** 当你只需要在徽章中显示一个数字（如未读消息数）时使用，省去了手动创建 label 内部文字组件的步骤。

**独有核心参数：**

| 属性名    | 数据类型 | 属性说明                                                     |
| :-------- | :------- | :----------------------------------------------------------- |
| **count** | `int`    | 要显示的数字，组件会自动将该整数转为文字并填充到徽章内部，无需手动构建 label |



## 127. SegmentedButton

------

### 一、概述

`SegmentedButton` 是 Flutter Material 3 设计体系中的**分段选择按钮**组件，用于在一组水平排列的选项中让用户选择一个或多个选项，每个选项以"段"的形式紧密排列成一个整体按钮组。

------

### 二、核心属性

#### 2.1 SegmentedButton 本体属性

| 属性名                  | 数据类型                 | 属性说明                                                     |
| :---------------------- | :----------------------- | :----------------------------------------------------------- |
| `segments`              | `List<ButtonSegment<T>>` | 定义所有可选的分段列表，至少需要提供两个分段，每个分段由 `ButtonSegment` 描述 |
| `selected`              | `Set<T>`                 | 当前被选中的值的集合。单选时集合中只有一个元素，多选时可包含多个 |
| `onSelectionChanged`    | `void Function(Set<T>)?` | 用户点击切换选项时触发的回调，参数为最新的选中值集合。设为空则整个组件变为禁用状态 |
| `multiSelectionEnabled` | `bool`                   | 是否允许同时选中多个分段，默认为否，即单选模式               |
| `emptySelectionAllowed` | `bool`                   | 是否允许一个都不选，默认为否，即至少要选中一个分段           |
| `showSelectedIcon`      | `bool`                   | 被选中的分段前方是否显示一个选中图标（默认是对勾），默认为是 |
| `selectedIcon`          | `Widget?`                | 自定义选中状态时显示的图标，替换默认的对勾图标               |
| `style`                 | `ButtonStyle?`           | 控制所有分段的视觉样式，包括背景色、前景色、边框、内边距、文字样式、叠加色等，用法与普通按钮的 `ButtonStyle` 一致 |
| `direction`             | `Axis`                   | 控制分段的排列方向，可设为水平排列或垂直排列，默认为水平方向 |

#### 2.2 ButtonSegment（每个分段）的属性

每一个"段"通过 `ButtonSegment` 来定义，以下是其核心属性：

| 属性名    | 数据类型  | 属性说明                                                     |
| :-------- | :-------- | :----------------------------------------------------------- |
| `value`   | `T`       | 该分段所代表的值，是泛型类型，用于标识和匹配 `selected` 集合中的选中项 |
| `label`   | `Widget?` | 分段上显示的文字内容，通常传入一个文本组件                   |
| `icon`    | `Widget?` | 分段上显示的图标，可与 `label` 同时存在，也可单独使用        |
| `enabled` | `bool`    | 该分段是否可被点击，默认为是。设为否时该分段呈灰色禁用态，但不影响其他分段 |
| `tooltip` | `String?` | 长按或鼠标悬停时显示的提示文字                               |



## 128. SearchAnchor

------

### 一、概述

`SearchAnchor` 是 Flutter Material 3 设计体系中的**搜索锚点**组件，它将一个"触发入口"与一个"搜索视图"绑定在一起——用户点击触发入口后，自动弹出一个带有输入框和建议列表的搜索面板，用于实现完整的搜索交互流程。

------

### 二、核心属性

#### 2.1 SearchAnchor 本体属性

| 属性名                | 数据类型                                                     | 属性说明                                                     |
| :-------------------- | :----------------------------------------------------------- | :----------------------------------------------------------- |
| `searchController`    | `SearchController`                                           | 搜索控制器，用于管理搜索视图的打开/关闭、获取与设置输入框中的文字。是整个搜索流程的核心调度者 |
| `builder`             | `Widget Function(BuildContext, SearchController)`            | 构建"触发入口"的回调，你需要在这里返回用户看到并点击的那个组件（通常是一个搜索图标或搜索栏），同时可通过控制器调用打开搜索视图 |
| `suggestionsBuilder`  | `FutureOr<List<Widget>> Function(BuildContext, SearchController)` | 构建搜索建议列表的回调，每当用户输入内容变化时会被调用，需要返回一组组件作为建议项展示在搜索视图中。支持返回异步结果 |
| `isFullScreen`        | `bool?`                                                      | 搜索视图是否以全屏形式展开。为空时，小屏设备（手机）自动全屏，大屏设备（桌面/平板）以浮层 Dropdown 形式展示 |
| `viewLeading`         | `Widget?`                                                    | 搜索视图标题栏**左侧**的组件，通常放置返回按钮。默认自带一个返回箭头 |
| `viewTrailing`        | `Iterable<Widget>?`                                          | 搜索视图标题栏**右侧**的组件列表，通常放置清除按钮、语音输入按钮等操作图标 |
| `viewHintText`        | `String?`                                                    | 搜索视图输入框中未输入内容时显示的提示文字                   |
| `viewBackgroundColor` | `Color?`                                                     | 搜索视图的整体背景颜色                                       |
| `viewElevation`       | `double?`                                                    | 搜索视图的阴影高度，影响浮层的立体感                         |
| `viewShape`           | `OutlinedBorder?`                                            | 搜索视图的外形轮廓，如圆角矩形等                             |
| `viewConstraints`     | `BoxConstraints?`                                            | 搜索视图在非全屏模式下的尺寸约束，可控制其最大/最小宽高      |
| `headerTextStyle`     | `TextStyle?`                                                 | 搜索视图中输入框内**正式输入文字**的样式                     |
| `headerHintStyle`     | `TextStyle?`                                                 | 搜索视图中输入框内**提示文字**的样式                         |
| `dividerColor`        | `Color?`                                                     | 搜索视图中输入框与建议列表之间那条分割线的颜色               |
| `viewOnChanged`       | `void Function(String)?`                                     | 搜索视图中每次输入内容变化时触发的回调                       |
| `viewOnSubmitted`     | `void Function(String)?`                                     | 用户在搜索视图中按下键盘确认键时触发的回调                   |
| `textCapitalization`  | `TextCapitalization?`                                        | 控制搜索输入框的大小写策略，如首字母大写、全部大写等         |
| `textInputAction`     | `TextInputAction?`                                           | 控制软键盘右下角操作按钮的类型，如显示"搜索"、"完成"等       |

#### 2.2 SearchController 核心能力

`SearchController` 继承自 `TextEditingController`，除了常规的文本读写能力外，额外提供以下关键方法：

| 方法/属性            | 说明                                                         |
| :------------------- | :----------------------------------------------------------- |
| `openView()`         | 手动打开搜索视图                                             |
| `closeView(String?)` | 关闭搜索视图，并可传入一个字符串自动填充到触发入口的文本中，代表用户选定了某个结果 |
| `text`               | 读取或设置当前输入框中的文字内容（继承自 TextEditingController） |

------

### 三、构造函数

#### `SearchAnchor.bar`

**使用场景：** 当你希望触发入口直接就是一个现成的 Material 3 风格搜索栏（而非自己手动构建）时使用。它内部自动生成了一个 `SearchBar` 作为触发入口，省去了手写 `builder` 的步骤。

**独有核心属性：**

| 属性名               | 数据类型                                    | 属性说明                                                     |
| :------------------- | :------------------------------------------ | :----------------------------------------------------------- |
| `barHintText`        | `String?`                                   | 搜索栏（触发入口）未输入时的提示文字，注意这是触发栏上的提示，与 `viewHintText`（搜索视图中的提示）是两个独立的位置 |
| `barLeading`         | `Widget?`                                   | 搜索栏左侧的组件，通常放一个搜索图标                         |
| `barTrailing`        | `Iterable<Widget>?`                         | 搜索栏右侧的组件列表，如头像、麦克风图标等                   |
| `barElevation`       | `WidgetStateProperty<double?>?`             | 搜索栏在不同交互状态下的阴影高度                             |
| `barBackgroundColor` | `WidgetStateProperty<Color?>?`              | 搜索栏在不同交互状态下的背景颜色                             |
| `barOverlayColor`    | `WidgetStateProperty<Color?>?`              | 搜索栏在按下、悬停等交互状态下的叠加色                       |
| `barShape`           | `WidgetStateProperty<OutlinedBorder?>?`     | 搜索栏在不同状态下的外形轮廓                                 |
| `barSide`            | `WidgetStateProperty<BorderSide?>?`         | 搜索栏在不同状态下的边框样式                                 |
| `barPadding`         | `WidgetStateProperty<EdgeInsetsGeometry?>?` | 搜索栏内容的内边距                                           |
| `barTextStyle`       | `WidgetStateProperty<TextStyle?>?`          | 搜索栏中输入文字的样式                                       |
| `barHintStyle`       | `WidgetStateProperty<TextStyle?>?`          | 搜索栏中提示文字的样式                                       |
| `constraints`        | `BoxConstraints?`                           | 搜索栏自身的尺寸约束                                         |

> 注意：上述搜索栏属性大量使用了 `WidgetStateProperty` 类型，意味着可以根据按下、悬停、聚焦等不同交互状态返回不同的值，实现更细腻的视觉反馈。

## 129. UserAccountsDrawerHeader

------

### 一、概述

`UserAccountsDrawerHeader` 是 Material Design 中专门用于侧边抽屉（`Drawer`）顶部的**用户账户信息展示区**，它以固定布局集中呈现当前用户的头像、用户名、邮箱及背景图等账户信息。

------

### 二、核心属性

| 属性名                  | 数据类型              | 属性说明                                                     |
| :---------------------- | :-------------------- | :----------------------------------------------------------- |
| `currentAccountPicture` | `Widget?`             | 当前用户的主头像，显示在左下方，通常放一个圆形头像组件，尺寸较大且醒目 |
| `otherAccountsPictures` | `List<Widget>?`       | 其他关联账户的头像列表，显示在右上角，尺寸较小，最多展示三个 |
| `accountName`           | `Widget?`             | 用户名称，显示在头像右侧偏下的位置，通常传入一个文本组件。内部已默认设定了白色文字样式 |
| `accountEmail`          | `Widget?`             | 用户邮箱或其他副标题信息，显示在用户名正下方，通常传入一个文本组件。同样默认白色文字样式 |
| `decoration`            | `Decoration?`         | 整个头部区域的背景装饰，最常用的做法是设置一张背景图片或渐变色。若不设置，默认使用主题的主色调作为背景 |
| `onDetailsPressed`      | `VoidCallback?`       | 设置后，邮箱文字右侧会自动出现一个下拉箭头图标，点击时触发此回调。通常用于展开/收起账户切换列表 |
| `arrowColor`            | `Color?`              | 下拉箭头图标的颜色，仅在 `onDetailsPressed` 不为空时生效     |
| `margin`                | `EdgeInsetsGeometry?` | 头部区域与外部的间距，默认底部有 8 像素的间距，用于与下方菜单项拉开距离 |



## 130. DrawerHeader

------

### 一、概述

`DrawerHeader` 是 Material Design 中用于侧边抽屉（`Drawer`）顶部的**通用头部容器**，它提供了一块固定高度的区域，开发者可以在其中自由放置任意内容作为抽屉的顶部展示区。

------

### 二、核心属性

| 属性名       | 数据类型              | 属性说明                                                     |
| :----------- | :-------------------- | :----------------------------------------------------------- |
| `child`      | `Widget?`             | 头部区域内部展示的内容，可以是任意组件，如文本、图片、图标、自定义布局等，完全由开发者自行决定 |
| `decoration` | `Decoration?`         | 头部区域的背景装饰，通常用来设置背景颜色、背景图片或渐变效果。若不设置，默认使用主题中 `primaryColor` 分割线绘制底部边框 |
| `margin`     | `EdgeInsetsGeometry?` | 头部区域与外部的间距，默认值与 `Drawer` 内部 `ListView` 的默认 padding 对齐，一般无需手动修改 |
| `padding`    | `EdgeInsetsGeometry?` | 头部区域内部内容与边界之间的内边距，默认值为上方 16 像素加上系统状态栏高度、左右各 16 像素、下方 8 像素 |
| `duration`   | `Duration`            | 当 `decoration` 发生切换时，背景过渡动画的时长，默认为 250 毫秒 |
| `curve`      | `Curve`               | 背景过渡动画的缓动曲线，默认为先快后慢的减速曲线             |

------

### 三、关键机制说明

**1. 与 UserAccountsDrawerHeader 的关系**

`DrawerHeader` 是一个**纯容器**，内部没有任何预设的布局结构——不会自动帮你放置头像、用户名、邮箱。而 `UserAccountsDrawerHeader` 实际上是在 `DrawerHeader` 的基础上，进一步封装了固定布局的账户信息展示。如果你需要完全自定义头部的内容与排版，选择 `DrawerHeader`；如果你只想快速展示标准的账户信息，选择 `UserAccountsDrawerHeader`。

**2. 固定高度机制**

`DrawerHeader` 内部硬编码了固定高度（160 像素加上状态栏高度的内边距），这意味着它的纵向空间是固定的，不会随内部内容自动撑大或缩小。

**3. 背景切换动画**

当你动态更改 `decoration` 的值时（例如切换背景图片），组件会自动使用交叉淡入淡出动画完成过渡，动画的时长和曲线分别由 `duration` 和 `curve` 控制。

**4. 底部分割线**

如果没有设置 `decoration`，组件会自动在底部绘制一条分割线，将头部区域与下方菜单项在视觉上分隔开。一旦设置了自定义 `decoration`，分割线将被你提供的装饰取代。





## 131. DefaultTextStyle

------

### 一、概述

`DefaultTextStyle` 是一个继承型组件，用于为其内部所有后代 `Text` 组件统一设置默认的文字样式。当后代 `Text` 没有单独指定样式时，就会自动继承并使用这个默认样式。

------

### 二、核心属性

| 属性名                 | 数据类型              | 属性说明                                                     |
| :--------------------- | :-------------------- | :----------------------------------------------------------- |
| **style**              | `TextStyle`           | 要向下传递的默认文字样式，包含字号、颜色、粗细、字体等一切文字外观配置 |
| **textAlign**          | `TextAlign?`          | 文字的水平对齐方式，如居左、居中、居右等                     |
| **softWrap**           | `bool`                | 文字在达到容器边界时是否自动换行。设为 `true` 则换行，`false` 则不换行 |
| **overflow**           | `TextOverflow`        | 当文字超出可显示区域时的处理策略，常用值有：截断（`clip`）、省略号（`ellipsis`）、渐隐（`fade`） |
| **maxLines**           | `int?`                | 文字最多显示的行数。超出部分将依据 `overflow` 的策略进行处理 |
| **textWidthBasis**     | `TextWidthBasis`      | 衡量文字宽度的计算基准。`parent` 表示以父容器宽度为基准，`longestLine` 表示以最长一行的实际宽度为基准 |
| **textHeightBehavior** | `TextHeightBehavior?` | 精细控制文字行高的行为，例如是否对首行顶部和末行底部应用额外的行高间距 |
| **child**              | `Widget`              | 必需参数，放置在其下方的子组件树，树中所有未自行指定样式的 `Text` 都将继承此默认样式 |

------

### 三、构造函数

#### DefaultTextStyle.fallback

**使用场景：** 当你不想提供任何自定义样式，只需要一个最基础的、"兜底"的默认文字样式时使用。它会创建一个携带 Flutter 框架内置最小化文字样式的 `DefaultTextStyle`，通常在组件树的最顶层或测试环境中作为保底方案出现。

**独有特点：** 该构造函数不接收 `style` 和 `child` 参数，也不需要传入任何文字配置。它内部自动使用框架预设的基础样式，目的就是确保即使开发者完全没有设置任何文字样式，文字也能以一个合理的默认外观正常渲染，不会出错。



## 132. ToggleButtons

------

### 一、概述

`ToggleButtons` 是一组水平排列的按钮组，每个按钮都拥有"选中"与"未选中"两种状态，用于让用户在多个选项中进行单选或多选切换。

------

### 二、核心属性

| 属性名                  | 数据类型                 | 属性说明                                                     |
| :---------------------- | :----------------------- | :----------------------------------------------------------- |
| **children**            | `List<Widget>`           | 必需参数。每个按钮中要显示的内容列表，通常放图标或文字，列表长度决定按钮的个数 |
| **isSelected**          | `List<bool>`             | 必需参数。一个与 `children` 等长的布尔值列表，逐一对应每个按钮当前是选中（`true`）还是未选中（`false`） |
| **onPressed**           | `void Function(int)?`    | 按钮被点击时的回调，参数为被点击按钮的索引。设为 `null` 则所有按钮进入禁用状态，无法交互 |
| **color**               | `Color?`                 | 按钮内容（文字/图标）在**未选中**状态下的颜色                |
| **selectedColor**       | `Color?`                 | 按钮内容（文字/图标）在**选中**状态下的颜色                  |
| **fillColor**           | `Color?`                 | 按钮在**选中**状态下的背景填充色                             |
| **disabledColor**       | `Color?`                 | 按钮在**禁用**状态下内容的颜色                               |
| **highlightColor**      | `Color?`                 | 按钮被长按时显示的高亮色                                     |
| **splashColor**         | `Color?`                 | 按钮被点击时的水波纹扩散颜色                                 |
| **hoverColor**          | `Color?`                 | 鼠标悬停在按钮上时的背景色（桌面端/Web 端常用）              |
| **borderColor**         | `Color?`                 | 按钮在**未选中**状态下的边框颜色                             |
| **selectedBorderColor** | `Color?`                 | 按钮在**选中**状态下的边框颜色                               |
| **disabledBorderColor** | `Color?`                 | 按钮在**禁用**状态下的边框颜色                               |
| **borderWidth**         | `double?`                | 所有按钮边框的宽度                                           |
| **borderRadius**        | `BorderRadius?`          | 整组按钮的圆角弧度，可统一设置四角的圆角大小                 |
| **constraints**         | `BoxConstraints?`        | 对每个按钮施加的尺寸约束，可精确控制单个按钮的最小宽高       |
| **direction**           | `Axis`                   | 按钮组的排列方向，默认为水平排列（`Axis.horizontal`），也可设为垂直排列（`Axis.vertical`） |
| **verticalDirection**   | `VerticalDirection`      | 当 `direction` 设为垂直时，控制按钮的排列顺序是从上到下还是从下到上 |
| **renderBorder**        | `bool`                   | 是否渲染按钮的边框，默认为 `true`。设为 `false` 则整组按钮无边框 |
| **tapTargetSize**       | `MaterialTapTargetSize?` | 按钮可点击区域的最小尺寸策略，影响触摸热区大小               |



## 133. VerticalDivider

------

### 一、概述

`VerticalDivider` 是一条竖直方向的细线，用于在水平排列的元素之间充当视觉分隔符。

------

### 二、核心属性

| 属性名        | 数据类型  | 属性说明                                                     |
| :------------ | :-------- | :----------------------------------------------------------- |
| **width**     | `double?` | 该组件在水平方向上所占据的总空间宽度（包含线条本身及其两侧的留白），默认为 16 |
| **thickness** | `double?` | 竖线本身的粗细（实际可见线条的宽度），默认为 0.0，即极细的一根线；若设为 0 在某些主题下可能不可见，通常建议显式指定 |
| **indent**    | `double?` | 竖线**顶部**距离组件上边缘的留白距离，效果是让线条不从最顶端开始绘制 |
| **endIndent** | `double?` | 竖线**底部**距离组件下边缘的留白距离，效果是让线条不延伸到最底端 |
| **color**     | `Color?`  | 竖线的颜色。若未指定，会使用当前主题中 `DividerThemeData` 定义的颜色 |



## 134. SelectionArea

------

### 一、概述

`SelectionArea` 是一个功能型组件，用于让其内部的文本内容变为可选中、可复制的状态，使用户能够通过长按或鼠标拖拽来选取文字。

------

### 二、核心属性

| 属性名                     | 数据类型                                                | 属性说明                                                     |
| :------------------------- | :------------------------------------------------------ | :----------------------------------------------------------- |
| **child**                  | `Widget`                                                | 必需参数。放置在其内部的子组件树，树中所有支持选择的文本内容都将变为可选中状态 |
| **selectionControls**      | `TextSelectionControls?`                                | 自定义文本选中后出现的操作控件的外观与行为（例如选中文字后弹出的"复制""全选"等工具栏的样式），不同平台有各自的默认实现 |
| **onSelectionChanged**     | `void Function(SelectedContent?)?`                      | 当用户的选中内容发生变化时触发的回调，参数中携带了当前被选中的文本内容，可用于监听或获取用户选取的文字 |
| **contextMenuBuilder**     | `Widget Function(BuildContext, SelectableRegionState)?` | 自定义右键菜单（桌面端）或长按弹出菜单（移动端）的构建方式，可完全替换默认的上下文菜单为自定义样式和功能 |
| **magnifierConfiguration** | `TextMagnifierConfiguration?`                           | 配置移动端选择文字时出现的放大镜的行为和外观，例如是否显示放大镜、放大倍率等 |





## 135. Autocomplete

------

### 一、概述

`Autocomplete` 是一个自动补全组件，当用户在输入框中键入文字时，它会根据输入内容实时筛选并弹出一组匹配的候选项列表，用户可以从中选择一项来快速完成输入。

------

### 二、核心属性

| 属性名                   | 数据类型                                                     | 属性说明                                                     |
| :----------------------- | :----------------------------------------------------------- | :----------------------------------------------------------- |
| `optionsBuilder`         | `FutureOr<Iterable<T>> Function(TextEditingValue)`           | **（必填）** 核心中的核心。每当输入框内容发生变化时，该回调就会被触发，你需要在其中根据当前输入的文本返回一组匹配的候选项。返回空集合则不显示任何建议。 |
| `onSelected`             | `void Function(T)`                                           | 当用户从候选列表中点击选中某一项时触发的回调，参数即为用户所选中的那个选项对象，可在此处理后续业务逻辑。 |
| `displayStringForOption` | `String Function(T)`                                         | 决定每个候选项对象以什么文本形式展示在输入框和列表中。若候选项本身就是字符串则无需设置；若是自定义对象（如用户模型），则必须通过此属性告知组件如何从对象中提取显示文本。 |
| `fieldViewBuilder`       | `Widget Function(BuildContext, TextEditingController, FocusNode, VoidCallback)` | 用于自定义输入框的外观与行为。回调中提供了文本控制器、焦点节点和一个提交回调，你需要用这些参数构建自己的输入框组件。若不设置，组件会使用一个默认的简单文本输入框。 |
| `optionsViewBuilder`     | `Widget Function(BuildContext, AutocompleteOnSelected<T>, Iterable<T>)` | 用于自定义候选项下拉列表的外观。回调中提供了当前匹配到的所有候选项以及一个选中回调，你可以自由决定列表的样式、布局和交互方式。若不设置，组件会使用默认的列表样式。 |
| `optionsMaxHeight`       | `double`                                                     | 候选项下拉列表的最大高度，默认值为 200 逻辑像素。当候选项过多时，超出部分可滚动查看。 |
| `initialValue`           | `TextEditingValue`                                           | 输入框的初始值。可用于在组件初次渲染时预填充一段文本，此时候选列表也会根据该初始文本进行首次筛选。 |



## 136. DataTable

------

### 一、概述

`DataTable` 是一个用于以行列交叉的表格形式展示结构化数据的组件，支持排序、行选择等交互功能，适用于需要清晰呈现多条多字段记录的场景。

------

### 二、核心属性

#### DataTable 本体属性

| 属性名               | 数据类型                       | 属性说明                                                     |
| :------------------- | :----------------------------- | :----------------------------------------------------------- |
| `columns`            | `List<DataColumn>`             | **（必填）** 定义表格有哪些列，每一列的表头标题、是否为数值列等信息都在此配置。列的数量决定了表格的纵向结构。 |
| `rows`               | `List<DataRow>`                | **（必填）** 定义表格的所有数据行，每一行由若干个单元格组成，单元格数量必须与列数严格一致。 |
| `sortColumnIndex`    | `int?`                         | 当前正在按哪一列排序，传入该列的索引值后，对应列的表头会显示排序箭头图标。 |
| `sortAscending`      | `bool`                         | 当前排序方向是否为升序，默认为 `true`。配合 `sortColumnIndex` 一起使用，控制排序箭头朝上还是朝下。 |
| `onSelectAll`        | `void Function(bool?)?`        | 当用户点击表头的全选复选框时触发的回调，参数为是否全选。     |
| `showCheckboxColumn` | `bool`                         | 是否在每行最左侧显示复选框列。只有当至少一个 `DataRow` 设置了 `onSelectChanged` 回调时，此列才会自动出现；可通过此属性强制控制显示与否。 |
| `headingRowColor`    | `WidgetStateProperty<Color?>?` | 表头行的背景色，支持根据不同交互状态（如悬停、按下）返回不同颜色。 |
| `headingRowHeight`   | `double?`                      | 表头行的高度，默认为 56 逻辑像素。                           |
| `headingTextStyle`   | `TextStyle?`                   | 表头文字的统一样式，如字号、加粗、颜色等。                   |
| `dataRowMinHeight`   | `double?`                      | 数据行的最小高度，默认为 48 逻辑像素。                       |
| `dataRowMaxHeight`   | `double?`                      | 数据行的最大高度，默认同样为 48 逻辑像素。若需要行内容自适应高度，可将此值设大或设为无穷大。 |
| `dataTextStyle`      | `TextStyle?`                   | 所有数据单元格文字的统一样式。                               |
| `columnSpacing`      | `double?`                      | 相邻两列内容之间的水平间距，默认为 56 逻辑像素。             |
| `horizontalMargin`   | `double?`                      | 表格最左侧和最右侧内容到表格边缘的水平内边距，默认为 24 逻辑像素。 |
| `showBottomBorder`   | `bool`                         | 是否在表格最后一行下方显示边框线，默认为 `false`。           |
| `dividerThickness`   | `double?`                      | 每行之间分隔线的粗细，设为 0 可隐藏分隔线。                  |
| `border`             | `TableBorder?`                 | 表格的整体边框样式，可分别控制外边框和内部网格线的颜色、粗细。 |
| `decoration`         | `Decoration?`                  | 表格整体的装饰，如背景色、圆角、阴影等。                     |

------

#### DataColumn 核心属性（列的配置）

| 属性名    | 数据类型                    | 属性说明                                                     |
| :-------- | :-------------------------- | :----------------------------------------------------------- |
| `label`   | `Widget`                    | **（必填）** 该列的表头显示内容，通常是一个文本组件，也可以是任意自定义组件。 |
| `numeric` | `bool`                      | 该列是否为数值类型，默认 `false`。设为 `true` 后列内容会右对齐，符合数字阅读习惯。 |
| `onSort`  | `void Function(int, bool)?` | 用户点击该列表头时触发的排序回调，参数分别为列索引和是否升序。设置后表头会出现可点击的排序箭头。 |
| `tooltip` | `String?`                   | 长按或鼠标悬停在表头上时显示的提示文字。                     |

------

#### DataRow 核心属性（行的配置）

| 属性名            | 数据类型                       | 属性说明                                                     |
| :---------------- | :----------------------------- | :----------------------------------------------------------- |
| `cells`           | `List<DataCell>`               | **（必填）** 该行包含的所有单元格，数量必须与 `columns` 的列数完全一致。 |
| `selected`        | `bool`                         | 该行是否处于选中状态，默认 `false`。选中后行背景会高亮，且前面的复选框会被勾选。 |
| `onSelectChanged` | `void Function(bool?)?`        | 用户点击该行的复选框或行本身时触发的回调。只要设置了此回调，该行就会变为可选中状态。 |
| `color`           | `WidgetStateProperty<Color?>?` | 该行的背景色，支持根据交互状态（选中、悬停、按下等）返回不同颜色。 |
| `onLongPress`     | `VoidCallback?`                | 长按该行时触发的回调。                                       |

------

#### DataCell 核心属性（单元格的配置）

| 属性名         | 数据类型        | 属性说明                                                     |
| :------------- | :-------------- | :----------------------------------------------------------- |
| `child`        | `Widget`        | **（必填）** 单元格内显示的具体内容，可以是文本、图标或任意组件。 |
| `placeholder`  | `bool`          | 是否将该单元格的内容视为占位符样式显示（文字会变为浅灰色），适合标记暂无数据的单元格。 |
| `showEditIcon` | `bool`          | 是否在单元格右侧显示一个编辑图标（小铅笔），默认 `false`。   |
| `onTap`        | `VoidCallback?` | 点击该单元格时触发的回调，适合为特定单元格添加独立的点击交互。 |
| `onLongPress`  | `VoidCallback?` | 长按该单元格时触发的回调。                                   |
| `onDoubleTap`  | `VoidCallback?` | 双击该单元格时触发的回调。                                   |

------

### 三、构造函数

#### DataRow.byIndex

**使用场景：** 当你希望行的背景色根据行号自动交替显示（斑马纹效果）时使用。

**独有属性：**

| 属性名  | 数据类型 | 属性说明                                                     |
| :------ | :------- | :----------------------------------------------------------- |
| `index` | `int`    | 该行在表格中的索引位置，组件会根据此索引的奇偶性自动应用不同的背景色，实现隔行变色的视觉效果。 |



## 137. Table

------

### 一、概述

`Table` 是一个纯布局组件，用于将子组件按照行与列的网格形式进行排列定位，它不附带任何数据交互功能（如排序、选择），专注于解决多行多列的对齐与布局问题。

------

### 二、核心属性

#### Table 本体属性

| 属性名                     | 数据类型                      | 属性说明                                                     |
| :------------------------- | :---------------------------- | :----------------------------------------------------------- |
| `children`                 | `List<TableRow>`              | 表格中所有行的集合，每个 `TableRow` 代表一行。每行内包含的子组件数量即为该行的列数，**所有行的列数必须相同**，否则会报错。 |
| `columnWidths`             | `Map<int, TableColumnWidth>?` | 以列索引为键、宽度策略为值的映射表，用于为**指定列**单独设置宽度规则。未在此映射中出现的列会使用 `defaultColumnWidth` 的值。 |
| `defaultColumnWidth`       | `TableColumnWidth`            | 所有列的默认宽度策略，未被 `columnWidths` 单独指定的列都遵循此值。默认为 `FlexColumnWidth(1.0)`，即所有列平分剩余可用宽度。 |
| `border`                   | `TableBorder?`                | 表格的边框样式，可以分别控制外边框（上下左右）和内部网格线（水平线、垂直线）的颜色、粗细、样式。默认无边框。 |
| `defaultVerticalAlignment` | `TableCellVerticalAlignment`  | 所有单元格内容在垂直方向上的默认对齐方式。常用值包括：`top`（顶部对齐）、`middle`（居中对齐）、`bottom`（底部对齐）、`baseline`（基线对齐）、`fill`（拉伸填满整行高度）。默认为 `top`。 |
| `textBaseline`             | `TextBaseline?`               | 当 `defaultVerticalAlignment` 设为 `baseline` 时必须提供此属性，指定使用哪种文字基线（字母基线或表意基线）来对齐各单元格中的文本。 |
| `textDirection`            | `TextDirection?`              | 列的排列方向。`ltr` 表示从左到右排列，`rtl` 表示从右到左排列。默认跟随应用的文本方向。 |

------

#### 常用列宽策略（TableColumnWidth 的子类）

| 策略名                 | 属性说明                                                     |
| :--------------------- | :----------------------------------------------------------- |
| `FlexColumnWidth`      | 按弹性比例分配剩余空间，参数为权重值。例如传入 `2.0` 的列会比传入 `1.0` 的列宽一倍。这是默认策略。 |
| `FixedColumnWidth`     | 将列宽固定为指定的逻辑像素值，不论内容多少，宽度恒定不变。   |
| `IntrinsicColumnWidth` | 根据该列中所有单元格的实际内容来决定列宽，取最宽的那个单元格内容为准。性能开销相对较大。 |
| `FractionColumnWidth`  | 以表格总宽度的百分比来指定列宽，参数为 0 到 1 之间的小数。例如 `0.3` 表示占总宽度的 30%。 |
| `MaxColumnWidth`       | 接收两个列宽策略，取二者计算结果中**较大的**那个作为最终列宽。 |
| `MinColumnWidth`       | 接收两个列宽策略，取二者计算结果中**较小的**那个作为最终列宽。 |

------

#### TableRow 核心属性（行的配置）

| 属性名       | 数据类型       | 属性说明                                                     |
| :----------- | :------------- | :----------------------------------------------------------- |
| `children`   | `List<Widget>` | **（必填）** 该行中每个单元格的内容组件，数量即为列数。可以是任意组件。 |
| `decoration` | `Decoration?`  | 该行的装饰，最常用于设置行背景色。配合不同行使用不同颜色可实现斑马纹效果。 |

------

#### TableCell 核心属性（单元格的包装）

`TableCell` 是一个可选的包装组件，当你需要对某个单元格做独立于整体的垂直对齐控制时使用。

| 属性名              | 数据类型                      | 属性说明                                                     |
| :------------------ | :---------------------------- | :----------------------------------------------------------- |
| `child`             | `Widget`                      | **（必填）** 单元格内的实际内容组件。                        |
| `verticalAlignment` | `TableCellVerticalAlignment?` | 单独覆盖该单元格的垂直对齐方式，优先级高于 `Table` 上设置的 `defaultVerticalAlignment`。 |

------

### 

## 138. Stepper

------

### 一、概述

`Stepper` 是一个步骤导航组件，用于将一个复杂流程拆分为多个有序步骤，引导用户按顺序逐步完成每个步骤的内容填写或操作。

------

### 二、核心属性

#### Stepper 本体属性

| 属性名               | 数据类型                                          | 属性说明                                                     |
| :------------------- | :------------------------------------------------ | :----------------------------------------------------------- |
| `steps`              | `List<Step>`                                      | **（必填）** 所有步骤的集合，每个 `Step` 代表流程中的一个独立环节，至少需要提供两个步骤才有意义。 |
| `currentStep`        | `int`                                             | 当前激活展开的步骤索引，默认为 `0`（即第一个步骤）。需要你自行维护该值来控制当前处于哪一步。 |
| `type`               | `StepperType`                                     | 步骤条的布局方向。`StepperType.vertical` 为纵向排列（默认），所有步骤上下排开，展开的步骤内容显示在标题下方；`StepperType.horizontal` 为横向排列，步骤标题横向排成一排，当前步骤内容显示在下方。 |
| `onStepContinue`     | `VoidCallback?`                                   | 用户点击每个步骤内置的"继续"按钮时触发的回调，通常在此将 `currentStep` 加 1 以跳到下一步。 |
| `onStepCancel`       | `VoidCallback?`                                   | 用户点击每个步骤内置的"取消"按钮时触发的回调，通常在此将 `currentStep` 减 1 以回到上一步。 |
| `onStepTapped`       | `void Function(int)?`                             | 用户直接点击某个步骤的标题圆圈或标签时触发的回调，参数为被点击步骤的索引。可用于实现跳步导航（直接跳到任意步骤）。 |
| `controlsBuilder`    | `Widget Function(BuildContext, ControlsDetails)?` | 自定义每个步骤底部的操作按钮区域。默认情况下每个步骤下方会显示"继续"和"取消"两个按钮，通过此属性可以完全替换为自定义的按钮样式和布局。 |
| `elevation`          | `double?`                                         | 组件整体的阴影高度，仅在 `type` 为 `horizontal` 时视觉效果较为明显。 |
| `margin`             | `EdgeInsetsGeometry?`                             | 每个步骤内容区域的外边距，仅在 `type` 为 `vertical` 时生效。 |
| `physics`            | `ScrollPhysics?`                                  | 控制步骤列表的滚动物理行为，如弹性回弹、无回弹等。`Stepper` 内部自带滚动能力，此属性用于自定义滚动效果。 |
| `connectorColor`     | `WidgetStateProperty<Color?>?`                    | 步骤之间连接线的颜色，支持根据不同状态（如选中、禁用）返回不同颜色。 |
| `connectorThickness` | `double?`                                         | 步骤之间连接线的粗细。                                       |
| `stepIconBuilder`    | `Widget Function(int, StepState)?`                | 自定义步骤圆圈内的图标内容，参数为步骤索引和当前步骤状态，可按需返回不同的自定义图标组件。 |
| `stepIconHeight`     | `double?`                                         | 步骤圆圈图标的高度。                                         |
| `stepIconWidth`      | `double?`                                         | 步骤圆圈图标的宽度。                                         |
| `stepIconMargin`     | `EdgeInsets?`                                     | 步骤圆圈图标的外边距。                                       |

------

#### Step 核心属性（单个步骤的配置）

| 属性名     | 数据类型    | 属性说明                                                     |
| :--------- | :---------- | :----------------------------------------------------------- |
| `title`    | `Widget`    | **（必填）** 步骤的标题，显示在圆圈图标右侧（纵向）或下方（横向），通常是一个文本组件。 |
| `subtitle` | `Widget?`   | 步骤的副标题，显示在标题下方，用于补充说明该步骤的简要信息。 |
| `content`  | `Widget`    | **（必填）** 该步骤被展开后显示的具体内容区域，可以是表单、文本或任意组件组合。 |
| `state`    | `StepState` | 该步骤当前的视觉状态，直接影响圆圈图标的显示样式。默认为 `StepState.indexed`。 |
| `isActive` | `bool`      | 该步骤是否处于激活状态，默认 `false`。激活时圆圈图标会以主题色高亮显示，通常将 `currentStep` 所在及之前的步骤设为激活。 |
| `label`    | `Widget?`   | 仅在 `StepperType.horizontal` 横向模式下生效，用于在步骤圆圈图标下方显示额外的标签文字。 |

------

#### StepState 枚举值说明

| 枚举值               | 说明                                                         |
| :------------------- | :----------------------------------------------------------- |
| `StepState.indexed`  | 默认状态，圆圈内显示步骤序号数字（1、2、3……）。              |
| `StepState.editing`  | 编辑中状态，圆圈内显示一个铅笔图标，表示该步骤正在被编辑。   |
| `StepState.complete` | 已完成状态，圆圈内显示一个对勾图标，表示该步骤已成功完成。   |
| `StepState.disabled` | 禁用状态，圆圈和标题文字变为灰色，表示该步骤当前不可操作。   |
| `StepState.error`    | 错误状态，圆圈变为红色背景并显示感叹号，表示该步骤存在需要修正的问题。 |



## 139. SimpleDialog

------

### 一、概述

`SimpleDialog` 是一个简单选择型弹窗组件，用于向用户展示一组选项列表，让用户从中选择一项后关闭弹窗并返回所选结果。

------

### 二、核心属性

#### SimpleDialog 本体属性

| 属性名             | 数据类型              | 属性说明                                                     |
| :----------------- | :-------------------- | :----------------------------------------------------------- |
| `title`            | `Widget?`             | 弹窗顶部的标题区域，通常放置一个文本组件来说明本次选择的主题，如"请选择语言"。 |
| `titlePadding`     | `EdgeInsetsGeometry?` | 标题区域的内边距。若有 `title`，默认上下左右留有一定间距；若无 `title`，则此值无效。 |
| `titleTextStyle`   | `TextStyle?`          | 标题文字的样式，如字号、颜色、字重等。                       |
| `children`         | `List<Widget>?`       | 弹窗的主体内容，通常放置一组 `SimpleDialogOption` 作为可选项列表。也可以放入任意其他组件。当选项过多时，此区域会自动变为可滚动。 |
| `contentPadding`   | `EdgeInsetsGeometry?` | `children` 内容区域的内边距，默认上下各 12 逻辑像素、左右各 0 像素。 |
| `backgroundColor`  | `Color?`              | 弹窗的背景颜色。                                             |
| `elevation`        | `double?`             | 弹窗的阴影高度，数值越大投影越明显，层次感越强。             |
| `shadowColor`      | `Color?`              | 阴影的颜色。                                                 |
| `surfaceTintColor` | `Color?`              | Material 3 中弹窗表面的色调叠加色，会根据 `elevation` 自动调整叠加强度以体现层级。 |
| `shape`            | `ShapeBorder?`        | 弹窗的形状，可设置圆角矩形、圆形等。默认在 Material 3 下为圆角矩形。 |
| `alignment`        | `AlignmentGeometry?`  | 弹窗在屏幕中的对齐位置，默认居中显示。可调整为顶部、底部等位置。 |
| `insetPadding`     | `EdgeInsets?`         | 弹窗与屏幕边缘之间的最小距离，默认水平各 40、垂直各 24 逻辑像素，确保弹窗不会贴到屏幕边缘。 |
| `clipBehavior`     | `Clip`                | 弹窗内容超出边界时的裁剪行为，默认为 `Clip.none`。若弹窗有圆角且子组件可能溢出，可设为 `Clip.antiAlias` 以平滑裁剪。 |

------

#### SimpleDialogOption 核心属性（选项条目）

`SimpleDialogOption` 是专门配合 `SimpleDialog` 使用的选项组件，每个实例代表弹窗中的一个可选条目。

| 属性名      | 数据类型        | 属性说明                                                     |
| :---------- | :-------------- | :----------------------------------------------------------- |
| `child`     | `Widget?`       | 选项的显示内容，通常是一段文本，也可以是图标与文字的组合。   |
| `onPressed` | `VoidCallback?` | 用户点击该选项时触发的回调。通常在此调用导航的 `pop` 方法关闭弹窗，并将选中的值传回给调用方。 |
| `padding`   | `EdgeInsets?`   | 该选项的内边距，控制选项内容与选项边界之间的距离。           |





## 140. Dialog

------

### 一、概述

`Dialog` 是 Flutter 中用于在当前页面之上弹出一个浮层面板的基础组件，通常配合 `showDialog()` 函数使用，用于向用户展示重要信息、请求确认或收集输入，弹出时会在背后覆盖一层半透明遮罩以聚焦用户注意力。

------

### 二、核心属性

| 属性名                   | 数据类型             | 属性说明                                                     |
| :----------------------- | :------------------- | :----------------------------------------------------------- |
| `child`                  | `Widget?`            | 对话框内部显示的具体内容，是承载所有自定义界面的容器         |
| `backgroundColor`        | `Color?`             | 对话框面板的背景颜色                                         |
| `elevation`              | `double?`            | 对话框的阴影高度，数值越大投影越明显，立体感越强             |
| `shadowColor`            | `Color?`             | 阴影的颜色，配合 `elevation` 控制投影的视觉效果              |
| `surfaceTintColor`       | `Color?`             | Material 3 设计体系下，施加在背景色之上的色调叠加色，用于表达海拔层级感 |
| `shape`                  | `ShapeBorder?`       | 对话框的外形轮廓，可设为圆角矩形、圆形、斜角等任意形状边框   |
| `alignment`              | `AlignmentGeometry?` | 对话框在屏幕中的对齐位置，默认居中，可改为靠顶部、底部等任意位置 |
| `insetPadding`           | `EdgeInsets?`        | 对话框与屏幕边缘之间的最小留白距离，防止对话框紧贴屏幕边缘   |
| `clipBehavior`           | `Clip`               | 内容超出对话框形状边界时的裁剪策略，默认不裁剪               |
| `insetAnimationDuration` | `Duration`           | 当系统键盘弹出导致对话框需要避让时，位移动画所持续的时长     |
| `insetAnimationCurve`    | `Curve`              | 上述避让动画的运动曲线，控制动画的加速与减速节奏             |

------

### 三、构造函数

#### `Dialog.fullscreen`

**使用场景：** 当需要对话框铺满整个屏幕时使用，适合承载复杂表单、多步骤流程或需要沉浸式交互的场景，在移动端尤为常见。

**独有特征说明：**

该构造函数会自动将对话框扩展到全屏尺寸，因此与默认构造函数相比，它**不再需要**也**不再支持** `elevation`、`shadowColor`、`surfaceTintColor`、`shape`、`alignment`、`insetPadding`、`clipBehavior` 这些属性——因为全屏状态下没有浮层阴影、外形轮廓和边距的概念。同时，它的 `insetAnimationDuration` 默认值为零，即键盘弹出时不播放避让动画，直接到位。



## 141. AboutDialog

------

### 一、概述

`AboutDialog` 是 Flutter 提供的一个专门用于展示应用程序基本信息（如名称、版本号、图标及法律声明）的预构建对话框组件，通常配合 `showAboutDialog()` 函数使用，并且内置了一个可跳转查看所有依赖库开源许可证的按钮。

------

### 二、核心属性

| 属性名                | 数据类型        | 属性说明                                                     |
| :-------------------- | :-------------- | :----------------------------------------------------------- |
| `applicationName`     | `String?`       | 应用程序的名称，显示在对话框的醒目位置。若不设置，Flutter 会自动读取系统的应用名称 |
| `applicationVersion`  | `String?`       | 应用程序的版本号文字，显示在名称下方，如"1.2.0"。若不设置则不显示 |
| `applicationIcon`     | `Widget?`       | 应用程序的图标，显示在名称上方。可以传入任意 Widget，通常传入一个 `Image` 或 `FlutterLogo` |
| `applicationLegalese` | `String?`       | 法律声明文字，通常用于展示版权信息，如"© 2024 某某公司"，显示在版本号下方 |
| `children`            | `List<Widget>?` | 额外的自定义内容组件列表，会显示在法律声明文字之后。可用于补充任何你想展示的说明信息 |





## 142. RotatedBox

------

### 一、概述

`RotatedBox` 是一个在布局阶段就将其子组件按 90 度的整数倍进行旋转的组件，旋转后的子组件会真正占据旋转后的空间尺寸，参与正常的布局排列。

------

### 二、核心属性

| 属性名         | 数据类型  | 属性说明                                                     |
| :------------- | :-------- | :----------------------------------------------------------- |
| `quarterTurns` | `int`     | 旋转的次数，每次代表顺时针旋转 90 度。值为 1 表示顺时针转 90 度，值为 2 表示转 180 度，值为 3 表示转 270 度（即逆时针 90 度），值为 4 等同于不旋转。支持负数，负值表示逆时针方向旋转 |
| `child`        | `Widget?` | 需要被旋转的子组件                                           |



## 143. AnimatedSize

------

### 一、概述

`AnimatedSize` 是一个当其子组件的尺寸发生变化时，会自动以平滑动画过渡到新尺寸的容器组件，无需手动管理动画控制器。

------

### 二、核心属性

| 属性名            | 数据类型            | 属性说明                                                     |
| :---------------- | :------------------ | :----------------------------------------------------------- |
| `child`           | `Widget?`           | 被包裹的子组件，当该子组件的宽或高发生变化时，`AnimatedSize` 会自动对尺寸变化进行动画过渡 |
| `duration`        | `Duration`          | 尺寸过渡动画的持续时长，必须设置。例如设为 300 毫秒，则从旧尺寸到新尺寸的变化会在 300 毫秒内平滑完成 |
| `reverseDuration` | `Duration?`         | 尺寸从大变小（反向）时的动画持续时长。若不设置，则反向动画与正向动画使用相同的 `duration` |
| `curve`           | `Curve`             | 动画的运动曲线，控制尺寸变化的加速与减速节奏。默认值为 `Curves.linear`（匀速），可更换为弹性、先快后慢等各种曲线效果 |
| `alignment`       | `AlignmentGeometry` | 子组件在 `AnimatedSize` 容器内的对齐方式。默认居中对齐。当尺寸变化时，对齐方式决定了子组件从哪个方向"生长"或"收缩" |
| `clipBehavior`    | `Clip`              | 动画过渡期间，子组件超出当前过渡尺寸边界时的裁剪策略。默认为 `Clip.hardEdge`，即硬裁剪，确保过渡过程中内容不会溢出 |



## 144. AnimatedPadding

------

### 一、概述

AnimatedPadding 是 Padding 组件的动画版本，当其内边距值发生变化时，会在指定的时间内自动、平滑地从旧内边距过渡到新内边距，而无需手动管理动画控制器。

------

### 二、核心属性

| 属性名       | 数据类型             | 属性说明                                                     |
| :----------- | :------------------- | :----------------------------------------------------------- |
| **padding**  | `EdgeInsetsGeometry` | 目标内边距值。当该值被更新时，组件会自动从当前内边距平滑过渡到新值。常用子类为 `EdgeInsets.all()`（四边等距）、`EdgeInsets.symmetric()`（对称设置）、`EdgeInsets.only()`（单独指定某一边） |
| **duration** | `Duration`           | 动画的持续时长。决定从旧内边距过渡到新内边距需要多少时间，例如设置为 300 毫秒或 1 秒 |
| **curve**    | `Curve`              | 动画的速度曲线，控制动画的节奏感。默认值为线性匀速。可设置为先快后慢、先慢后快、弹性效果等，Flutter 内置了大量预设曲线可供选择 |
| **child**    | `Widget`             | 被内边距包裹的子组件。内边距变化时，子组件会随之被平滑地推移位置 |
| **onEnd**    | `VoidCallback?`      | 动画播放完毕时触发的回调。可用于在动画结束后执行后续逻辑，如连锁触发下一个动画或更新状态 |





## 145. AnimatedAlign

------

### 一、概述

AnimatedAlign 是 Align 组件的动画版本，当子组件的对齐位置发生变化时，会在指定时间内自动、平滑地从旧位置滑动过渡到新位置，无需手动管理动画控制器。

------

### 二、核心属性

| 属性名           | 数据类型            | 属性说明                                                     |
| :--------------- | :------------------ | :----------------------------------------------------------- |
| **alignment**    | `AlignmentGeometry` | 子组件在父容器中的对齐位置。当该值被更新时，子组件会从当前位置平滑滑动到新位置。常用预设值包括：`Alignment.center`（正中）、`Alignment.topLeft`（左上角）、`Alignment.bottomRight`（右下角）等，也可通过 `Alignment(x, y)` 自定义任意坐标点，x 和 y 的范围均为 -1.0 到 1.0 |
| **duration**     | `Duration`          | 动画的持续时长。决定子组件从旧位置移动到新位置所需的时间     |
| **curve**        | `Curve`             | 动画的速度曲线，控制移动过程中的加减速节奏。默认为线性匀速，可设置为缓入缓出、弹跳等 Flutter 内置预设曲线 |
| **child**        | `Widget`            | 被对齐控制的子组件。对齐位置变化时，该子组件会被平滑地移动   |
| **heightFactor** | `double?`           | 将父容器的高度收缩为子组件高度的指定倍数。不设置时，父容器会尽可能占满可用高度 |
| **widthFactor**  | `double?`           | 将父容器的宽度收缩为子组件宽度的指定倍数。不设置时，父容器会尽可能占满可用宽度 |
| **onEnd**        | `VoidCallback?`     | 动画播放完毕时触发的回调。可用于在位移动画结束后执行后续逻辑 |



## 146. AnimatedDefaultTextStyle

------

### 一、概述

AnimatedDefaultTextStyle 是 DefaultTextStyle 组件的动画版本，当文本样式（如字号、颜色、字重等）发生变化时，会在指定时间内自动、平滑地从旧样式过渡到新样式，无需手动管理动画控制器。

------

### 二、核心属性

| 属性名        | 数据类型        | 属性说明                                                     |
| :------------ | :-------------- | :----------------------------------------------------------- |
| **style**     | `TextStyle`     | 应用于子组件中文本的目标样式。当该值被更新时，组件会自动从当前样式平滑过渡到新样式。TextStyle 中可动画过渡的常用子属性包括：`fontSize`（字号大小）、`color`（文字颜色）、`fontWeight`（字重粗细）、`letterSpacing`（字母间距）、`height`（行高倍数）等 |
| **duration**  | `Duration`      | 动画的持续时长。决定从旧文本样式过渡到新文本样式需要多少时间 |
| **curve**     | `Curve`         | 动画的速度曲线，控制样式变化过程中的加减速节奏。默认为线性匀速，可设置为缓入缓出等 Flutter 内置预设曲线 |
| **child**     | `Widget`        | 被该组件包裹的子组件。通常是一个或多个 Text 组件，这些 Text 如果没有自行指定 style，就会自动继承此处设置的文本样式 |
| **textAlign** | `TextAlign?`    | 文本的水平对齐方式，如居左、居中、居右等。该属性本身不参与动画过渡，属于即时切换 |
| **softWrap**  | `bool`          | 文本是否允许自动换行。设为 true 时文本会在容器边界处换行，设为 false 则单行显示 |
| **overflow**  | `TextOverflow`  | 文本溢出时的处理方式。常用值包括：`TextOverflow.ellipsis`（末尾显示省略号）、`TextOverflow.clip`（直接裁剪）、`TextOverflow.fade`（渐隐消失） |
| **maxLines**  | `int?`          | 文本最大显示行数。超出行数的内容将按 overflow 指定的方式处理 |
| **onEnd**     | `VoidCallback?` | 动画播放完毕时触发的回调。可用于在样式过渡结束后执行后续逻辑 |



## 147. AnimatedRotation

------

### 一、概述

AnimatedRotation 是一个隐式动画组件，当旋转圈数值发生变化时，会在指定时间内自动、平滑地将子组件从当前角度旋转过渡到目标角度，无需手动管理动画控制器。

------

### 二、核心属性

| 属性名            | 数据类型         | 属性说明                                                     |
| :---------------- | :--------------- | :----------------------------------------------------------- |
| **turns**         | `double`         | 旋转的圈数，是该组件最核心的属性。值为 1.0 表示顺时针旋转一整圈（360度），0.5 表示旋转半圈（180度），0.25 表示旋转四分之一圈（90度）。负值表示逆时针旋转。当该值被更新时，组件会自动从当前角度平滑旋转到目标角度 |
| **duration**      | `Duration`       | 动画的持续时长。决定从当前旋转角度过渡到目标角度需要多少时间 |
| **curve**         | `Curve`          | 动画的速度曲线，控制旋转过程中的加减速节奏。默认为线性匀速，可设置为缓入缓出、弹性等 Flutter 内置预设曲线 |
| **alignment**     | `Alignment`      | 旋转的锚点（中心点）位置。默认为 `Alignment.center`，即围绕子组件正中心旋转。可设置为 `Alignment.topLeft` 等值，让子组件围绕某个角或边旋转 |
| **child**         | `Widget`         | 被旋转控制的子组件。旋转角度变化时，该子组件会被平滑地转动   |
| **filterQuality** | `FilterQuality?` | 旋转过程中的图像渲染质量。对于包含图片或复杂内容的子组件，设置更高的质量可减少旋转时的锯齿感，但会消耗更多性能 |
| **onEnd**         | `VoidCallback?`  | 动画播放完毕时触发的回调。可用于在旋转结束后执行后续逻辑     |



## 148. AnimatedScale

------

### 一、概述

`AnimatedScale` 是一个隐式动画组件，当你改变它的缩放比例值时，它会自动在旧值与新值之间执行平滑的缩放过渡动画，无需手动管理动画控制器。

------

### 二、核心属性

| 属性名              | 数据类型        | 属性说明                                                     |
| :------------------ | :-------------- | :----------------------------------------------------------- |
| **scale**           | `double`        | 缩放比例。1.0 表示原始大小，0.5 表示缩小到一半，2.0 表示放大到两倍。当此值发生变化时，组件自动触发缩放动画 |
| **duration**        | `Duration`      | 动画从开始到结束所需的时长。例如设为 300 毫秒，则缩放过渡会在 300 毫秒内完成 |
| **curve**           | `Curve`         | 动画的速度曲线，决定动画是匀速、先快后慢还是带弹性等效果。默认为线性匀速 |
| **alignment**       | `Alignment`     | 缩放的锚点位置。决定组件以哪个点为中心进行缩放，默认是正中心。例如设为左上角，则组件会以左上角为固定点向外放大或向内缩小 |
| **filterQuality**   | `FilterQuality` | 缩放时的图像采样质量。质量越高，缩放后的画面越清晰细腻，但性能开销也越大。默认为低质量 |
| **child**           | `Widget`        | 被缩放的子组件。它本身不参与动画逻辑，只是被动接受缩放变换   |
| **onEnd**           | `VoidCallback?` | 动画播放完毕时触发的回调。可用于在缩放结束后执行下一步操作，例如连续串联多段动画 |
| **reverseDuration** | `Duration?`     | 动画反向播放时的时长。若未设置，则反向播放时沿用 `duration` 的值 |



## 149. AnimatedSlide

------

### 一、概述

`AnimatedSlide` 是一个隐式动画组件，当你改变它的偏移量值时，它会自动让子组件从旧位置平滑地滑动到新位置，无需手动管理动画控制器。

------

### 二、核心属性

| 属性名              | 数据类型        | 属性说明                                                     |
| :------------------ | :-------------- | :----------------------------------------------------------- |
| **offset**          | `Offset`        | 滑动的偏移量，以子组件自身尺寸为单位。水平方向上，1.0 表示向右平移一个自身宽度，-1.0 表示向左平移一个自身宽度；垂直方向上，1.0 表示向下平移一个自身高度，-1.0 表示向上平移一个自身高度。`Offset(0, 0)` 表示原位不动。当此值发生变化时，组件自动触发滑动动画 |
| **duration**        | `Duration`      | 动画从开始到结束所需的时长。值越大，滑动过程越慢             |
| **curve**           | `Curve`         | 动画的速度曲线，控制滑动过程是匀速、先快后慢、还是带弹性等节奏感。默认为线性匀速 |
| **child**           | `Widget`        | 被滑动的子组件。它本身不参与动画逻辑，只是被动跟随偏移量变化而移动 |
| **onEnd**           | `VoidCallback?` | 动画播放完毕时触发的回调。可用于在滑动结束后执行后续操作，例如串联下一段动画 |
| **reverseDuration** | `Duration?`     | 动画反向播放时的时长。若未设置，则反向播放时沿用 `duration` 的值 |



## 150. ScaleTransition

------

### 一、概述

`ScaleTransition` 是一个显式动画组件，它根据你提供的动画对象实时驱动子组件的缩放变化，需要手动创建并管理 `AnimationController` 来精确控制动画的播放、暂停、反转等行为。

------

### 二、核心属性

| 属性名            | 数据类型            | 属性说明                                                     |
| :---------------- | :------------------ | :----------------------------------------------------------- |
| **scale**         | `Animation<double>` | 驱动缩放的动画对象，而非一个静态数值。动画输出值为 1.0 时表示原始大小，0.0 时完全缩小至不可见，2.0 时放大到两倍。该动画对象通常由 `AnimationController` 配合 `Tween` 或 `CurvedAnimation` 生成 |
| **alignment**     | `Alignment`         | 缩放的锚点位置，决定子组件围绕哪个点进行缩放。默认为正中心。若设为左上角，则子组件会以左上角为固定点向外放大或向内缩小 |
| **filterQuality** | `FilterQuality?`    | 缩放时的图像采样质量。质量越高，缩放后画面越细腻清晰，但性能开销也越大 |
| **child**         | `Widget?`           | 被缩放的子组件。它本身不参与动画逻辑，仅被动接受缩放变换     |



## 151. RotationTransition

------

### 一、概述

`RotationTransition` 是一个显式动画组件，它根据你提供的动画对象实时驱动子组件的旋转变化，需要手动创建并管理 `AnimationController` 来精确控制旋转动画的播放、暂停、反转等行为。

------

### 二、核心属性

| 属性名            | 数据类型            | 属性说明                                                     |
| :---------------- | :------------------ | :----------------------------------------------------------- |
| **turns**         | `Animation<double>` | 驱动旋转的动画对象，值代表旋转的圈数而非角度。0.0 表示不旋转，0.25 表示顺时针旋转四分之一圈（即 90 度），0.5 表示旋转半圈（180 度），1.0 表示旋转整整一圈（360 度）。负值则为逆时针旋转。该动画对象通常由 `AnimationController` 配合 `Tween` 或 `CurvedAnimation` 生成 |
| **alignment**     | `Alignment`         | 旋转的锚点位置，决定子组件围绕哪个点进行旋转。默认为正中心。若设为左上角，则子组件会以左上角为固定点旋转 |
| **filterQuality** | `FilterQuality?`    | 旋转时的图像采样质量。质量越高，旋转后的画面越细腻清晰，但性能开销也越大 |
| **child**         | `Widget?`           | 被旋转的子组件。它本身不参与动画逻辑，仅被动接受旋转变换     |



## 152. SizeTransition

------

### 一、概述

`SizeTransition` 是一个显式动画组件，它根据你提供的动画对象实时驱动子组件在指定轴向上的尺寸裁剪变化，通过逐渐展开或收起子组件的可见区域来实现展开/折叠效果，需要手动创建并管理 `AnimationController`。

------

### 二、核心属性

| 属性名                       | 数据类型            | 属性说明                                                     |
| :--------------------------- | :------------------ | :----------------------------------------------------------- |
| **sizeFactor**               | `Animation<double>` | 驱动尺寸变化的动画对象，值为比例因子。0.0 表示子组件在指定轴向上完全收起不可见，0.5 表示只展示一半，1.0 表示完全展开显示原始大小。该动画对象通常由 `AnimationController` 配合 `Tween` 或 `CurvedAnimation` 生成 |
| **axis**                     | `Axis`              | 尺寸变化的轴向。设为 `Axis.vertical` 时，子组件在垂直方向上展开或收起（高度变化）；设为 `Axis.horizontal` 时，子组件在水平方向上展开或收起（宽度变化）。默认为垂直方向 |
| **axisAlignment**            | `double`            | 子组件在变化轴向上的对齐位置。取值范围为 -1.0 到 1.0。-1.0 表示顶部或左侧对齐，0.0 表示居中对齐，1.0 表示底部或右侧对齐。此属性决定了展开/收起时子组件从哪个边缘开始出现或消失。默认为 0.0 居中 |
| **fixedCrossAxisSizeFactor** | `double?`           | 交叉轴方向上的尺寸比例因子。若未设置，交叉轴方向上的尺寸不受动画影响，保持原始大小。若设置了值，交叉轴方向也会按此比例缩放 |
| **child**                    | `Widget?`           | 被展开或收起的子组件。它本身不参与动画逻辑，仅被动接受尺寸裁剪 |



## 153. DecoratedBoxTransition

------

### 一、概述

`DecoratedBoxTransition` 是 `DecoratedBox` 的动画版本，用于在一段时间内将一个装饰（如背景色、边框、圆角、阴影、渐变等）**平滑地过渡变化**到另一个装饰状态，由一个显式的 `Animation` 对象驱动。

------

### 二、核心属性

| 属性名       | 数据类型                | 属性说明                                                     |
| :----------- | :---------------------- | :----------------------------------------------------------- |
| `decoration` | `Animation<Decoration>` | 核心属性。它不是一个静态的装饰对象，而是一个**随动画控制器不断变化的装饰动画**。通常通过 `DecorationTween` 来创建，定义装饰的起始状态与结束状态，Flutter 会自动在两者之间进行插值计算，实现平滑过渡。 |
| `position`   | `DecorationPosition`    | 控制装饰绘制的层级位置。有两个可选值：`background` 表示装饰画在子组件**背后**（默认值，最常用）；`foreground` 表示装饰画在子组件**前面**，会覆盖在子组件上方。 |
| `child`      | `Widget`                | 被装饰的子组件。装饰效果会围绕这个子组件进行渲染，子组件本身不受动画影响，保持不变。 |

> **补充说明 — `DecorationTween`：**
> 这是配合 `DecoratedBoxTransition` 使用的核心工具。你需要给它提供一个 `begin`（起始装饰）和一个 `end`（结束装饰），它们的类型通常是 `BoxDecoration`。`DecorationTween` 负责计算两个装饰状态之间每一帧的中间值。例如，背景色从蓝色渐变到红色、圆角从无到有、阴影从浅到深，都由它自动完成插值。



## 154. AnimatedPhysicalModel

------

### 一、概述

`AnimatedPhysicalModel` 是 `PhysicalModel` 的隐式动画版本，当其形状、海拔高度（阴影深度）、颜色或阴影颜色等属性值发生变化时，会在指定时长内**自动平滑过渡**到新状态，无需手动管理动画控制器。

------

### 二、核心属性

| 属性名               | 数据类型       | 属性说明                                                     |
| :------------------- | :------------- | :----------------------------------------------------------- |
| `shape`              | `BoxShape`     | 模型的基本形状。可选 `BoxShape.rectangle`（矩形，默认）或 `BoxShape.circle`（圆形）。形状变化时会自动产生动画过渡。 |
| `borderRadius`       | `BorderRadius` | 矩形的圆角半径。仅在 `shape` 为 `rectangle` 时生效。圆角值的变化会自动动画过渡。 |
| `elevation`          | `double`       | 海拔高度，即组件在 Z 轴上的抬升程度。值越大，投射的阴影越明显、越扩散。这是该组件最核心的动画属性之一。 |
| `color`              | `Color`        | 模型本身的背景填充颜色。是否参与动画过渡取决于 `animateColor` 属性。 |
| `shadowColor`        | `Color`        | 阴影的颜色。是否参与动画过渡取决于 `animateShadowColor` 属性。 |
| `animateColor`       | `bool`         | 控制 `color` 属性变化时是否执行动画过渡。设为 `true` 则平滑渐变，设为 `false` 则瞬间切换。默认为 `true`。 |
| `animateShadowColor` | `bool`         | 控制 `shadowColor` 属性变化时是否执行动画过渡。逻辑与 `animateColor` 一致。默认为 `true`。 |
| `clipBehavior`       | `Clip`         | 子组件超出模型边界时的裁剪行为。常用值为 `Clip.none`（不裁剪）和 `Clip.antiAlias`（抗锯齿裁剪）。 |
| `duration`           | `Duration`     | 动画的总时长。这是所有隐式动画组件的必填属性，决定了过渡动画从开始到结束需要多少时间。 |
| `curve`              | `Curve`        | 动画的速度曲线。默认为 `Curves.linear`（匀速）。可换为 `easeIn`、`easeOut`、`bounceOut` 等曲线改变动画的节奏感。 |
| `child`              | `Widget`       | 被包裹在物理模型内部的子组件。子组件本身不参与动画，仅被模型的形状、颜色和阴影所"承载"。 |



## 155. AlignTransition

------

### 一、概述

`AlignTransition` 是 `Align` 的显式动画版本，用于在一段时间内将子组件的**对齐位置**从一个点平滑移动到另一个点，由外部提供的 `Animation` 对象驱动。

------

### 二、核心属性

| 属性名         | 数据类型                       | 属性说明                                                     |
| :------------- | :----------------------------- | :----------------------------------------------------------- |
| `alignment`    | `Animation<AlignmentGeometry>` | 核心动画属性。它不是一个固定的对齐值，而是一个**随动画控制器持续变化的对齐位置动画**。通常通过 `AlignmentTween` 创建，指定起始对齐位置与结束对齐位置，Flutter 自动在两者之间逐帧插值，实现子组件位置的平滑移动。 |
| `widthFactor`  | `double?`                      | 宽度因子。用于控制 `AlignTransition` 自身的宽度为子组件宽度的多少倍。若不设置，则尽可能撑满父组件的宽度。此属性**不参与动画**，是一个静态值。 |
| `heightFactor` | `double?`                      | 高度因子。逻辑与 `widthFactor` 一致，控制自身高度为子组件高度的多少倍。若不设置，则尽可能撑满父组件的高度。同样**不参与动画**。 |
| `child`        | `Widget`                       | 被对齐并参与位置动画的子组件。子组件本身内容不受动画影响，只是它在父容器中的**摆放位置**在持续变化。 |

> **补充说明 — `AlignmentTween`：**
> 这是配合 `AlignTransition` 使用的关键工具。你需要提供一个 `begin`（起始位置，如左上角 `Alignment.topLeft`）和一个 `end`（结束位置，如右下角 `Alignment.bottomRight`），然后调用其 `animate` 方法并传入动画控制器，生成的 `Animation<AlignmentGeometry>` 对象就交给 `alignment` 属性。Flutter 会自动计算每一帧子组件应该处于的位置。



## 156. RelativePositionedTransition

------

### 一、概述

`RelativePositionedTransition` 是一个必须在 `Stack` 内使用的显式动画组件，它根据一个 `Animation<Rect>` 动画和一个参考尺寸，将子组件的**位置与大小**从一个矩形区域平滑过渡到另一个矩形区域。

------

### 二、核心属性

| 属性名  | 数据类型          | 属性说明                                                     |
| :------ | :---------------- | :----------------------------------------------------------- |
| `rect`  | `Animation<Rect>` | 核心动画属性。接收一个不断变化的矩形区域动画，通常通过 `RectTween` 创建，指定起始矩形和结束矩形。Flutter 会逐帧插值，驱动子组件的位置和尺寸同时发生平滑变化。 |
| `size`  | `Size`            | 参考尺寸。代表父级 `Stack` 的大小，组件内部依据这个尺寸将 `Rect`（绝对矩形）换算为 `RelativeRect`（相对定位），从而确定子组件在 `Stack` 中的上下左右偏移量。 |
| `child` | `Widget`          | 被定位并参与动画的子组件。其位置和大小由 `rect` 动画和 `size` 共同决定。 |

> **补充说明 — `Rect` 与 `RelativeRect` 的区别：**
> `Rect` 使用左上角坐标加宽高来描述一个绝对矩形区域。而 `RelativeRect` 使用上、下、左、右四个距离值来描述子组件相对于父容器各边的偏移。`RelativePositionedTransition` 的核心价值在于：你只需提供直观的绝对矩形动画，它自动帮你转换为 `Stack` 所需的相对定位。

> **补充说明 — `RectTween`：**
> 配合此组件使用的插值工具。提供 `begin`（起始矩形）和 `end`（结束矩形），每个 `Rect` 包含左上角坐标以及宽高信息。调用其 `animate` 方法传入动画控制器后，即可生成 `Animation<Rect>` 交给 `rect` 属性。



## 157. AbsorbPointer

### 一、概述

AbsorbPointer 是一个能够**拦截并吞噬**其子组件上所有触摸事件的组件——当它开启拦截时，用户对其内部任何子组件的点击、滑动、长按等手势操作都会被它"吸收掉"，子组件完全感知不到用户的触摸，但子组件在视觉上依然正常显示、不会有任何外观变化。

------

### 二、核心属性

| 属性名                | 数据类型  | 属性说明                                                     |
| :-------------------- | :-------- | :----------------------------------------------------------- |
| **absorbing**         | `bool`    | 核心开关。设为 `true` 时，该组件会拦截所有触摸事件，子组件无法响应任何手势；设为 `false` 时，触摸事件正常穿透，子组件可正常交互。默认值为 `true`。 |
| **child**             | `Widget?` | 被包裹的子组件。它在视觉上照常渲染，但当 `absorbing` 为 `true` 时，其上的所有触摸事件都会被吞噬。 |
| **ignoringSemantics** | `bool?`   | 控制是否同时屏蔽无障碍语义层面的交互。设为 `true` 时，屏幕阅读器等辅助工具也无法触达子组件；设为 `null`（默认）时，语义层的屏蔽行为自动跟随 `absorbing` 的值。 |

------

### 三、与 IgnorePointer 的关键区别

这是新手最容易混淆的一对组件，务必区分清楚：

| 对比维度                             | AbsorbPointer                                          | IgnorePointer                                  |
| :----------------------------------- | :----------------------------------------------------- | :--------------------------------------------- |
| **对事件的处理方式**                 | **吸收**事件——事件到它这里就停了，它自身会参与命中测试 | **忽略**事件——事件直接穿透它，就像它不存在一样 |
| **它身后（下层）的组件能否收到事件** | ❌ 不能，事件被它吞掉了                                 | ✅ 能，事件会继续向下层传递                     |

简单总结：AbsorbPointer 像一面**墙**，挡住所有触摸，谁都收不到；IgnorePointer 像一层**透明空气**，触摸直接穿过它落到后面的组件上。



## 158. IgnorePointer

### 一、概述

IgnorePointer 是一个让其子组件对所有触摸事件**完全透明**的组件——当它开启忽略时，触摸事件会直接穿透它及其子组件，传递给在组件树中位于其**下方（层叠意义上被它遮挡的）** 的其他组件，就好像它和它的子组件在触摸层面根本不存在一样。

------

### 二、核心属性

| 属性名                | 数据类型  | 属性说明                                                     |
| :-------------------- | :-------- | :----------------------------------------------------------- |
| **ignoring**          | `bool`    | 核心开关。设为 `true` 时，该组件及其所有子组件会被命中测试完全跳过，触摸事件直接穿透到下层组件；设为 `false` 时，子组件可正常接收触摸事件。默认值为 `true`。 |
| **child**             | `Widget?` | 被包裹的子组件。视觉上照常渲染显示，但当 `ignoring` 为 `true` 时，它在触摸事件的命中测试中会被彻底跳过。 |
| **ignoringSemantics** | `bool?`   | 控制是否同时在无障碍语义层面也将其忽略。设为 `true` 时，屏幕阅读器等辅助功能工具也无法感知子组件；设为 `null`（默认）时，语义层的忽略行为自动跟随 `ignoring` 的值。 |

------



## 159. Offstage

### 一、概述

Offstage 是一个控制子组件是否**脱离舞台**的组件——当它开启隐藏时，子组件不会被绘制到屏幕上、不占据任何布局空间、也不响应触摸事件，但子组件在组件树中**依然存在**，其状态会被完整保留。

------

### 二、核心属性

| 属性名       | 数据类型  | 属性说明                                                     |
| :----------- | :-------- | :----------------------------------------------------------- |
| **offstage** | `bool`    | 核心开关。设为 `true` 时，子组件不可见、不占空间、不可交互，但仍保留在组件树中维持状态；设为 `false` 时，子组件正常显示和参与布局。默认值为 `true`。 |
| **child**    | `Widget?` | 被包裹的子组件。当 `offstage` 为 `true` 时，该子组件依然会经历构建（build）过程，但不会被绘制（paint），也不会参与布局计算的空间分配。 |



## 160. Placeholder

### 一、概述

Placeholder 是一个绘制交叉对角线矩形框的**占位组件**，用于在界面开发过程中临时标记某个区域"这里将来要放一个真正的组件"，帮助开发者在布局搭建阶段快速可视化空间分配。

------

### 二、核心属性

| 属性名             | 数据类型 | 属性说明                                                     |
| :----------------- | :------- | :----------------------------------------------------------- |
| **color**          | `Color`  | 占位框及其内部交叉线的颜色。默认值为深蓝色（`Color(0xFF455A64)`）。可根据需要修改为更醒目的颜色以便于区分不同区域。 |
| **strokeWidth**    | `double` | 交叉线和边框线的线条粗细，单位为逻辑像素。默认值为 `2.0`。   |
| **fallbackWidth**  | `double` | 当 Placeholder 在水平方向上没有受到约束（即父组件不限制其宽度）时，所使用的**后备宽度**。默认值为 `400.0`。 |
| **fallbackHeight** | `double` | 当 Placeholder 在垂直方向上没有受到约束（即父组件不限制其高度）时，所使用的**后备高度**。默认值为 `400.0`。 |



## 161. Baseline

### 一、概述

Baseline 是一个布局组件，它将子组件放置在一个指定的基线位置上——即强制子组件内文本的基线对齐到距离自身顶部特定像素数的位置，从而实现精确的基线对齐控制。

------

### 二、核心属性

| 属性名           | 数据类型       | 属性说明                                                     |
| :--------------- | :------------- | :----------------------------------------------------------- |
| **baseline**     | `double`       | 从 Baseline 组件自身顶部算起，子组件的文本基线应落在的垂直距离（逻辑像素）。值越大，子组件越往下放置 |
| **baselineType** | `TextBaseline` | 指定使用哪种基线类型进行对齐。有两个可选值：**alphabetic**（拉丁字母等西文的底部对齐线，最常用）和 **ideographic**（中日韩等方块文字的底部对齐线） |
| **child**        | `Widget?`      | 需要进行基线对齐的子组件，通常是包含文本的组件               |



## 162. IntrinsicHeight

### 一、概述

IntrinsicHeight 是一个布局组件，它将子组件的高度强制调整为该子组件自身内容所需的**固有高度**（intrinsic height），用于解决某些布局场景下子组件高度无法自动适配内容的问题。

------

### 二、核心属性

| 属性名    | 数据类型  | 属性说明                                                     |
| :-------- | :-------- | :----------------------------------------------------------- |
| **child** | `Widget?` | 需要被约束为固有高度的子组件。IntrinsicHeight 会测量这个子组件内容真正需要多高，然后将其高度精确设定为该值 |



## 163. IntrinsicWidth

### 一、概述

IntrinsicWidth 是一个布局组件，它将子组件的宽度强制调整为该子组件自身内容所需的**固有宽度**（intrinsic width），用于解决某些布局场景下子组件宽度无法自动收缩至内容实际所需尺寸的问题。

------

### 二、核心属性

| 属性名         | 数据类型  | 属性说明                                                     |
| :------------- | :-------- | :----------------------------------------------------------- |
| **child**      | `Widget?` | 需要被约束为固有宽度的子组件。IntrinsicWidth 会测量这个子组件内容真正需要多宽，然后将其宽度精确设定为该值 |
| **stepWidth**  | `double?` | 设置宽度的"步进值"。如果设定了该值，子组件的最终宽度会被向上取整到该步进值的整数倍。例如步进值为 50，则实际宽度会被调整为 50、100、150 等最近的整数倍 |
| **stepHeight** | `double?` | 与 stepWidth 同理，但作用于高度方向。设定后子组件的高度也会按该步进值向上取整 |



## 164. LimitedBox

### 一、概述

LimitedBox 是一个布局组件，它**仅在父组件未给出明确约束（即约束为无限大）时**，才对子组件施加最大宽度或最大高度的限制，用于防止子组件在无约束环境中无限膨胀。

------

### 二、核心属性

| 属性名        | 数据类型  | 属性说明                                                     |
| :------------ | :-------- | :----------------------------------------------------------- |
| **maxWidth**  | `double`  | 当父组件在水平方向的约束为无限大时，子组件被允许的最大宽度。默认值为 `double.infinity`（即不额外限制）。若父组件已提供了有限的宽度约束，此属性**自动失效**，完全由父组件的约束决定 |
| **maxHeight** | `double`  | 当父组件在垂直方向的约束为无限大时，子组件被允许的最大高度。默认值为 `double.infinity`。同理，若父组件已提供了有限的高度约束，此属性**自动失效** |
| **child**     | `Widget?` | 需要被限制尺寸的子组件                                       |



## 165. OverflowBox

### 一、概述

OverflowBox 是一个布局组件，它允许子组件**突破父组件施加的尺寸约束**，让子组件可以比父组件更大或更小，且超出部分不会触发溢出警告。

------

### 二、核心属性

| 属性名        | 数据类型            | 属性说明                                                     |
| :------------ | :------------------ | :----------------------------------------------------------- |
| **alignment** | `AlignmentGeometry` | 控制子组件在 OverflowBox 内部的对齐方式。默认值为 `Alignment.center`（居中）。当子组件尺寸与 OverflowBox 不一致时，决定子组件偏向哪个方向放置 |
| **minWidth**  | `double?`           | 传递给子组件的最小宽度约束。设为 null 时，沿用父组件传来的最小宽度约束 |
| **maxWidth**  | `double?`           | 传递给子组件的最大宽度约束。设为 null 时，沿用父组件传来的最大宽度约束 |
| **minHeight** | `double?`           | 传递给子组件的最小高度约束。设为 null 时，沿用父组件传来的最小高度约束 |
| **maxHeight** | `double?`           | 传递给子组件的最大高度约束。设为 null 时，沿用父组件传来的最大高度约束 |
| **fit**       | `OverflowBoxFit`    | 控制 OverflowBox 自身如何确定尺寸。可选值：**max**（默认，自身尽可能占满父组件给的空间）、**deferToChild**（自身尺寸跟随子组件的实际尺寸） |
| **child**     | `Widget?`           | 需要突破约束限制的子组件                                     |



## 166. SizedOverflowBox

------

### 一、概述

`SizedOverflowBox` 是一个**将自身尺寸与子组件尺寸解耦**的布局组件——它按照你指定的 `size` 来确定自己在布局中占据的空间大小，但会把**父级传来的原始约束**（而非自身尺寸衍生的约束）透传给子组件，从而允许子组件以不同于该盒子的大小进行渲染，超出部分产生溢出。

------

### 二、核心属性

| 属性名      | 数据类型            | 属性说明                                                     |
| :---------- | :------------------ | :----------------------------------------------------------- |
| `size`      | `Size`              | 定义该组件**自身**在父级布局中期望占据的宽高。最终实际尺寸会受父级约束的夹紧（clamp）影响，但子组件并不会受此尺寸约束。 |
| `alignment` | `AlignmentGeometry` | 当子组件与该盒子大小不一致时，决定子组件相对于盒子的对齐方式。默认值为居中对齐。 |
| `child`     | `Widget?`           | 放置在盒子内部的子组件。它接收的是**父级的原始约束**，因此可能比盒子更大或更小。 |



## 167. UnconstrainedBox

------

### 一、概述

`UnconstrainedBox` 是一个**解除父级对子组件施加的布局约束**的组件，使子组件可以按照自身的固有尺寸自由渲染，不再被迫拉伸或压缩以服从父级的尺寸要求。

------

### 二、核心属性

| 属性名            | 数据类型            | 属性说明                                                     |
| :---------------- | :------------------ | :----------------------------------------------------------- |
| `child`           | `Widget?`           | 需要被"解放约束"的子组件。子组件将获得无限宽松的约束，按自身固有大小进行渲染。 |
| `alignment`       | `AlignmentGeometry` | 当子组件的实际大小与 `UnconstrainedBox` 自身大小不一致时，控制子组件在盒子内部的对齐方式。默认居中。 |
| `constrainedAxis` | `Axis?`             | 指定是否在**某一个轴向上保留**父级约束。设为 `Axis.horizontal` 表示水平方向仍受约束、仅垂直方向解除；设为 `Axis.vertical` 则相反。默认为 `null`，即两个方向的约束全部解除。 |
| `clipBehavior`    | `Clip`              | 当子组件溢出盒子边界时的裁剪行为。默认值为 `Clip.none`，即不裁剪，溢出内容直接可见。可设为 `Clip.hardEdge` 等进行裁剪。 |
| `textDirection`   | `TextDirection?`    | 文本方向，用于解析 `alignment` 中带有"start""end"等与阅读方向相关的对齐值。通常自动从上下文继承，无需手动设置。 |



## 168. RepaintBoundary

------

### 一、概述

`RepaintBoundary` 是一个**将子组件的重绘区域隔离为独立图层**的性能优化组件，使子组件内部发生视觉变化时，只重绘该隔离区域，而不会触发其外部的其他组件一同重绘。

------

### 二、核心属性

| 属性名  | 数据类型  | 属性说明                                                     |
| :------ | :-------- | :----------------------------------------------------------- |
| `child` | `Widget?` | 需要被隔离到独立重绘图层中的子组件。该子组件及其所有后代的重绘将被限制在这一层内，不会波及外部。 |
| `key`   | `Key?`    | 标准的 Widget 标识符，用于在 Widget 树更新时保持状态或辅助框架识别。 |

> **说明**：`RepaintBoundary` 本身属性极少，因为它的核心价值不在于配置参数，而在于它在渲染树中**创建独立图层**这一行为本身。



## 169. MouseRegion

------

### 一、概述

`MouseRegion` 是一个**监听鼠标（指针）进入、悬停移动和离开事件**的组件，专门用于在桌面端和 Web 端追踪鼠标光标在指定区域内的行为并可改变光标样式。

------

### 二、核心属性

| 属性名            | 数据类型                     | 属性说明                                                     |
| :---------------- | :--------------------------- | :----------------------------------------------------------- |
| `child`           | `Widget?`                    | 被鼠标事件监听区域包裹的子组件。该子组件的渲染范围即为鼠标事件的响应区域。 |
| `onEnter`         | `PointerEnterEventListener?` | 鼠标光标**进入**该区域时触发的回调。回调参数中包含进入时的指针位置等信息。 |
| `onHover`         | `PointerHoverEventListener?` | 鼠标光标在该区域内**移动**（悬停滑动）时持续触发的回调。每次指针位置变化都会调用，可获取实时坐标。 |
| `onExit`          | `PointerExitEventListener?`  | 鼠标光标**离开**该区域时触发的回调。回调参数中包含离开时的指针位置等信息。 |
| `cursor`          | `MouseCursor`                | 当鼠标悬停在该区域上方时显示的**光标样式**。常用值包括：`SystemMouseCursors.click`（手型）、`SystemMouseCursors.text`（文本输入光标）、`SystemMouseCursors.grab`（抓取手型）、`MouseCursor.defer`（沿用上层设定）等。默认值为 `MouseCursor.defer`。 |
| `opaque`          | `bool`                       | 是否将该区域视为**不透明**的鼠标事件目标。设为 `true`（默认值）时，该区域会阻止鼠标事件穿透到其下方被遮挡的组件；设为 `false` 时，下方组件也能感知鼠标悬停。 |
| `hitTestBehavior` | `HitTestBehavior?`           | 控制命中测试的行为方式。`HitTestBehavior.opaque` 表示整个区域都响应命中；`HitTestBehavior.translucent` 表示自身响应同时允许下层也参与命中测试；`HitTestBehavior.deferToChild` 只在子组件实际覆盖的像素区域内响应。 |



## 170. Listener

------

### 一、概述

`Listener` 是一个用于监听底层原始指针事件（如按下、移动、抬起、取消等）的组件，它可以捕获到比 `GestureDetector` 更底层的触摸事件。

------

### 二、核心属性

| 属性名            | 数据类型                      | 属性说明                                                     |
| :---------------- | :---------------------------- | :----------------------------------------------------------- |
| `child`           | `Widget?`                     | 包含的子组件                                                 |
| `onPointerDown`   | `PointerDownEventListener?`   | 手指按下时触发的回调                                         |
| `onPointerMove`   | `PointerMoveEventListener?`   | 手指在屏幕上滑动时触发的回调                                 |
| `onPointerUp`     | `PointerUpEventListener?`     | 手指抬起时触发的回调                                         |
| `onPointerCancel` | `PointerCancelEventListener?` | 触摸事件被系统取消时触发的回调                               |
| `behavior`        | `HitTestBehavior`             | 命中测试策略，决定事件如何穿透。默认为 `HitTestBehavior.deferToChild` |



## 171. Focus

------

### 一、概述

`Focus` 是一个焦点管理组件，用于让其子组件具备"获得焦点"和"失去焦点"的能力，从而可以接收键盘事件并参与焦点遍历系统。

------

### 二、核心属性

| 属性名                      | 数据类型                   | 属性说明                                                     |
| :-------------------------- | :------------------------- | :----------------------------------------------------------- |
| `child`                     | `Widget`                   | 被包裹的子组件，即你希望赋予焦点能力的目标组件               |
| `focusNode`                 | `FocusNode?`               | 外部传入的焦点节点对象，用于在组件外部手动控制焦点的获取、释放及状态监听。若不传入，组件内部会自动创建一个 |
| `autofocus`                 | `bool`                     | 是否在组件首次构建时自动请求焦点。默认为 `false`。同一个焦点作用域中，只有一个组件的自动聚焦会生效 |
| `onFocusChange`             | `ValueChanged<bool>?`      | 当焦点状态发生变化时触发的回调。参数为 `true` 表示获得焦点，`false` 表示失去焦点 |
| `onKeyEvent`                | `FocusOnKeyEventCallback?` | 当该组件处于聚焦状态时，接收到键盘事件后触发的回调。可通过返回值决定是否"消费"该事件，阻止事件继续向上传递 |
| `canRequestFocus`           | `bool`                     | 控制该节点是否允许被请求焦点。设为 `false` 后，该节点将无法获得焦点，但不影响其后代节点。默认为 `true` |
| `skipTraversal`             | `bool`                     | 是否在焦点遍历（如用户按 Tab 键切换焦点）时跳过该节点。设为 `true` 后，用户无法通过键盘导航聚焦到它，但仍可通过程序手动聚焦。默认为 `false` |
| `descendantsAreFocusable`   | `bool`                     | 控制该节点的所有后代节点是否允许获得焦点。设为 `false` 时，整棵子树中的所有后代都无法聚焦。默认为 `true` |
| `descendantsAreTraversable` | `bool`                     | 控制该节点的所有后代节点是否参与焦点遍历。设为 `false` 时，后代节点将被遍历机制忽略，但仍可通过程序手动聚焦。默认为 `true` |
| `includeSemantics`          | `bool`                     | 是否在语义树中包含焦点相关的语义信息，主要影响无障碍功能。默认为 `true` |
| `debugLabel`                | `String?`                  | 为该焦点节点设置的调试标签，便于在调试工具中快速识别不同的焦点节点，不会影响实际功能 |
| `parentNode`                | `FocusNode?`               | 手动指定该焦点节点的父节点，用于覆盖默认的焦点树层级关系。绝大多数场景下无需设置，框架会自动根据 Widget 树结构推断 |





## 172. FocusScope

------

### 一、概述

`FocusScope` 是一个焦点作用域组件，用于将一组 `Focus` 节点划分到同一个逻辑分组中，统一管理该分组内的焦点记忆、焦点恢复与焦点遍历行为。

------

### 二、核心属性

| 属性名                      | 数据类型                   | 属性说明                                                     |
| :-------------------------- | :------------------------- | :----------------------------------------------------------- |
| `child`                     | `Widget`                   | 被包裹的子组件，该子组件及其后代中的所有焦点节点都将归属于此作用域 |
| `node`                      | `FocusScopeNode?`          | 外部传入的焦点作用域节点对象，功能类似于 `Focus` 的 `focusNode`，但类型为 `FocusScopeNode`。它能记住作用域内最近一次获得焦点的子节点，当作用域重新获得焦点时可自动恢复到该子节点。若不传入，组件内部会自动创建 |
| `autofocus`                 | `bool`                     | 是否在组件首次构建时自动请求焦点。默认为 `false`             |
| `onFocusChange`             | `ValueChanged<bool>?`      | 当此作用域的焦点状态发生变化时触发的回调。`true` 表示作用域内有节点获得焦点，`false` 表示作用域内所有节点均失去焦点 |
| `onKeyEvent`                | `FocusOnKeyEventCallback?` | 当作用域处于聚焦状态时，接收到键盘事件后触发的回调。可决定是否消费该事件，阻止其继续向上冒泡 |
| `canRequestFocus`           | `bool`                     | 控制该作用域是否允许被请求焦点。设为 `false` 后，作用域自身及其所有后代节点都无法获得焦点。默认为 `true` |
| `skipTraversal`             | `bool`                     | 是否在焦点遍历（如 Tab 键切换）时跳过该作用域。默认为 `false` |
| `descendantsAreFocusable`   | `bool`                     | 控制作用域内所有后代节点是否允许获得焦点。设为 `false` 时，整个作用域内的后代都无法聚焦。默认为 `true` |
| `descendantsAreTraversable` | `bool`                     | 控制作用域内所有后代节点是否参与焦点遍历。设为 `false` 时，后代节点将被遍历机制忽略。默认为 `true` |
| `includeSemantics`          | `bool`                     | 是否在语义树中包含焦点相关的无障碍语义信息。默认为 `true`    |
| `debugLabel`                | `String?`                  | 调试标签，便于在调试工具中识别该作用域节点，不影响实际功能   |
| `parentNode`                | `FocusNode?`               | 手动指定该作用域的父焦点节点，用于覆盖框架自动推断的焦点树层级关系。绝大多数场景无需设置 |



## 173. Draggable

------

### 一、概述

`Draggable` 是一个可拖拽组件，用于让其子组件能够被用户长按后拖动，并在拖动结束时将携带的数据传递给目标接收区域（`DragTarget`）。

------

### 二、核心属性

| 属性名                 | 数据类型                     | 属性说明                                                     |
| :--------------------- | :--------------------------- | :----------------------------------------------------------- |
| `child`                | `Widget`                     | 组件在未被拖动时显示的内容，即静止状态下的外观               |
| `feedback`             | `Widget`                     | 拖动过程中跟随手指移动的"影子"组件。它独立于原组件渲染，通常设计为与 `child` 相似但带有半透明或缩放效果，以提示用户正在拖动 |
| `childWhenDragging`    | `Widget?`                    | 拖动进行时，原位置显示的替代组件。若不设置，原位置仍显示 `child`；若希望拖动时原位置变为空白或占位样式，可通过此属性控制 |
| `data`                 | `T?`                         | 该拖拽操作携带的数据，泛型类型由 `Draggable<T>` 声明时指定。当拖拽物被放到 `DragTarget` 上时，目标区域通过此数据判断是否接受以及执行何种操作 |
| `axis`                 | `Axis?`                      | 限制拖动方向。设为 `Axis.horizontal` 则只能水平拖动，设为 `Axis.vertical` 则只能垂直拖动。默认为 `null`，表示可自由拖动 |
| `affinity`             | `Axis?`                      | 当拖拽方向存在手势竞争时（如嵌套在可滚动列表中），通过此属性声明该拖拽倾向于哪个方向，帮助手势识别系统做出更准确的判断 |
| `maxSimultaneousDrags` | `int?`                       | 允许同时进行的最大拖拽数量。设为 `1` 表示同一时间只能有一个拖拽操作；设为 `0` 则完全禁用拖拽。默认为 `null`，表示不限制 |
| `onDragStarted`        | `VoidCallback?`              | 拖拽开始时触发的回调                                         |
| `onDragUpdate`         | `DragUpdateCallback?`        | 拖拽过程中手指每次移动时持续触发的回调，回调参数中包含拖拽的位置偏移等信息 |
| `onDragEnd`            | `DraggableCanceledCallback?` | 拖拽结束时触发的回调，无论是否被 `DragTarget` 接受都会触发。回调参数中包含最终速度和偏移量 |
| `onDraggableCanceled`  | `DraggableCanceledCallback?` | 拖拽物未被任何 `DragTarget` 接受时触发的回调。可用于执行"拖拽失败"后的逻辑 |
| `onDragCompleted`      | `VoidCallback?`              | 拖拽物被某个 `DragTarget` 成功接受时触发的回调               |
| `feedbackOffset`       | `Offset`                     | 控制 `feedback` 组件相对于手指触摸点的偏移量。默认为 `Offset.zero`，即 `feedback` 左上角与触摸点对齐 |
| `dragAnchorStrategy`   | `DragAnchorStrategy?`        | 决定拖拽时 `feedback` 组件锚点的计算策略。默认策略会让 `feedback` 的触摸点位置与手指位置保持一致，避免拖动瞬间发生跳跃 |
| `rootOverlay`          | `bool`                       | 控制 `feedback` 组件是否插入到根 `Overlay` 层。设为 `true` 时，`feedback` 会渲染在整个应用的最顶层，不受局部布局裁剪的影响。默认为 `false` |
| `hitTestBehavior`      | `HitTestBehavior`            | 控制该组件的命中测试行为，决定透明区域是否响应触摸事件。默认为 `HitTestBehavior.deferToChild` |



## 174. DragTarget

------

### 一、概述

`DragTarget` 是一个拖拽接收区域组件，用于定义一块可以接收 `Draggable` 拖拽物的目标区域，并在拖拽物进入、悬停、放下或离开时执行相应的逻辑。

------

### 二、核心属性

| 属性名                    | 数据类型                          | 属性说明                                                     |
| :------------------------ | :-------------------------------- | :----------------------------------------------------------- |
| `builder`                 | `DragTargetBuilder<T>`            | 构建该区域外观的回调函数。它接收三个参数：当前上下文、已被接受的数据列表、以及被拒绝的数据列表。你可以根据这些参数动态改变区域的外观，例如当有拖拽物悬停在上方时高亮显示 |
| `onWillAcceptWithDetails` | `DragTargetWillAccept<T>?`        | 当拖拽物进入该区域时触发的回调，用于判断是否愿意接受该数据。返回 `true` 表示愿意接受，返回 `false` 表示拒绝。回调参数中包含拖拽物携带的数据及位置等详细信息 |
| `onAcceptWithDetails`     | `DragTargetAcceptWithDetails<T>?` | 当拖拽物被释放且已通过 `onWillAcceptWithDetails` 验证为接受时触发的回调。这是执行核心业务逻辑的地方，回调参数中包含数据及放下位置等详细信息 |
| `onLeave`                 | `DragTargetLeave<T>?`             | 当拖拽物离开该区域（未释放，只是移走了）时触发的回调。可用于恢复区域的默认外观 |
| `onMove`                  | `DragTargetMove<T>?`              | 当拖拽物在该区域内移动时持续触发的回调，回调参数中包含实时的位置信息。可用于实现跟随拖拽位置变化的动态效果 |
| `hitTestBehavior`         | `HitTestBehavior`                 | 控制命中测试行为，决定该区域的透明部分是否响应拖拽事件。默认为 `HitTestBehavior.translucent`，表示即使区域透明也能检测到拖拽物的进入 |



## 175. LongPressDraggable

------

### 一、概述

`LongPressDraggable` 是 `Draggable` 的子类，区别在于它要求用户长按一段时间后才启动拖拽，而非立即响应拖动手势，适用于需要区分普通点击/滚动与拖拽操作的场景。

------

### 二、核心属性

| 属性名                  | 数据类型                     | 属性说明                                                     |
| :---------------------- | :--------------------------- | :----------------------------------------------------------- |
| `child`                 | `Widget`                     | 未被拖动时显示的内容，即静止状态下的外观                     |
| `feedback`              | `Widget`                     | 拖动过程中跟随手指移动的组件，独立于原组件渲染               |
| `childWhenDragging`     | `Widget?`                    | 拖动进行时，原位置显示的替代组件。若不设置，原位置仍显示 `child` |
| `data`                  | `T?`                         | 拖拽操作携带的数据，泛型类型由声明时指定，释放到 `DragTarget` 时供其读取和判断 |
| `axis`                  | `Axis?`                      | 限制拖动方向。`Axis.horizontal` 仅水平，`Axis.vertical` 仅垂直，`null` 为自由拖动 |
| `maxSimultaneousDrags`  | `int?`                       | 允许同时进行的最大拖拽数量。设为 `0` 则完全禁用拖拽          |
| `delay`                 | `Duration`                   | **该组件特有属性**。用户需要长按多长时间才能触发拖拽。默认为 `kLongPressTimeout`（约 500 毫秒）。可根据业务需求调整，缩短则更灵敏，延长则需按更久 |
| `hapticFeedbackOnStart` | `bool`                       | **该组件特有属性**。长按触发拖拽时是否产生触觉反馈（手机振动）。默认为 `true`，让用户通过振动感知到拖拽已被激活 |
| `onDragStarted`         | `VoidCallback?`              | 拖拽开始时触发的回调                                         |
| `onDragUpdate`          | `DragUpdateCallback?`        | 拖拽过程中手指每次移动时持续触发的回调                       |
| `onDragEnd`             | `DraggableCanceledCallback?` | 拖拽结束时触发的回调，无论是否被接受都会触发                 |
| `onDraggableCanceled`   | `DraggableCanceledCallback?` | 拖拽物未被任何 `DragTarget` 接受时触发的回调                 |
| `onDragCompleted`       | `VoidCallback?`              | 拖拽物被 `DragTarget` 成功接受时触发的回调                   |
| `feedbackOffset`        | `Offset`                     | `feedback` 组件相对于触摸点的偏移量，默认为 `Offset.zero`    |
| `dragAnchorStrategy`    | `DragAnchorStrategy?`        | 拖拽时 `feedback` 锚点的计算策略，决定 `feedback` 与手指的对齐方式 |
| `rootOverlay`           | `bool`                       | `feedback` 是否插入到根 `Overlay` 层，设为 `true` 可避免被局部布局裁剪 |



## 176. NotificationListener

------

### 一、概述

`NotificationListener` 是一个专门用来**拦截并监听子组件向上冒泡传递的通知（Notification）**的组件，它能让父级在不直接持有子组件引用的情况下，感知子组件内部发生的事件（如滚动、布局变化等），并决定是否继续向更上层传递该通知。

------

### 二、核心概念前置：什么是"通知冒泡"

在 Flutter 的 Widget 树中，某些组件在发生特定行为时（例如列表滚动），会产生一个"通知"对象。这个通知会像水中的气泡一样，**从产生它的子组件开始，沿着 Widget 树逐层向上传递**，直到到达树的顶端，或者被某一层的 `NotificationListener` 拦截消费掉为止。这整个过程就叫做**通知冒泡机制**。

------

### 三、核心属性

| 属性名           | 数据类型                           | 属性说明                                                     |
| :--------------- | :--------------------------------- | :----------------------------------------------------------- |
| `child`          | `Widget`                           | 被监听的子组件，通知将从这个子组件内部向上冒泡               |
| `onNotification` | `NotificationListenerCallback<T>?` | 当捕获到类型为 `T` 的通知时触发的回调。回调接收到通知对象作为参数，**必须返回一个布尔值**：返回 `true` 表示"我已消费此通知，停止继续向上冒泡"；返回 `false` 表示"我只是旁听，请继续向上传递" |

> **关于泛型 `T`**：`NotificationListener` 是一个泛型组件，`T` 必须是 `Notification` 的子类。你可以指定具体的通知类型来精确过滤，只监听你关心的那一类通知。若不指定类型，则默认监听所有类型的通知。

------

### 四、常见的通知类型

| 通知类型                        | 触发场景                               |
| :------------------------------ | :------------------------------------- |
| `ScrollNotification`            | 可滚动组件发生滚动时发出的通知总类     |
| `ScrollStartNotification`       | 滚动开始的瞬间                         |
| `ScrollUpdateNotification`      | 滚动过程中持续触发，包含滚动距离等信息 |
| `ScrollEndNotification`         | 滚动结束的瞬间                         |
| `OverscrollNotification`        | 滚动超出边界时（过度滚动）             |
| `UserScrollNotification`        | 用户主动改变滚动方向时                 |
| `SizeChangedLayoutNotification` | 子组件的尺寸发生变化时                 |
| `KeepAliveNotification`         | 子组件请求保持存活状态时               |



## 177. OrientationBuilder

------

### 一、概述

`OrientationBuilder` 是一个能够**感知其父组件分配给自己的可用空间是"宽大于高"还是"高大于宽"，并据此让你构建不同界面布局**的组件。

------

### 二、关键概念澄清：它判断的不是设备方向

很多人会误以为 `OrientationBuilder` 检测的是手机有没有横过来。实际上，它判断的是**父组件给它的约束空间的宽高比**：

- 当可用宽度 **大于** 可用高度时，判定为**横向（landscape）**
- 当可用高度 **大于等于** 可用宽度时，判定为**纵向（portrait）**

这意味着即使手机始终竖着拿，如果 `OrientationBuilder` 被放在一个宽大于高的容器里，它依然会判定为横向。如果你需要获取设备真实的物理旋转方向，应该使用 `MediaQuery.orientationOf` 而非此组件。

------

### 三、核心属性

| 属性名    | 数据类型                   | 属性说明                                                     |
| :-------- | :------------------------- | :----------------------------------------------------------- |
| `builder` | `OrientationWidgetBuilder` | 必填的构建回调，当方向变化时会被重新调用。回调接收两个参数：一个是 `BuildContext`，另一个是 `Orientation` 枚举值（只有 `portrait` 和 `landscape` 两种），你根据这个枚举值返回对应方向下想要展示的子组件 |

> **关于 `Orientation` 枚举**：它只有两个值——`Orientation.portrait`（纵向，高 ≥ 宽）和 `Orientation.landscape`（横向，宽 > 高），简单明了。



## 178. ListWheelScrollView

------

### 一、概述

`ListWheelScrollView` 是一个将子组件排列在一个**三维圆柱滚轮表面**上进行滚动展示的列表组件，滚动时子项会呈现出近大远小、带有透视倾斜的立体旋转效果，常用于日期选择器、时间选择器等场景。

------

### 二、核心属性

| 属性名                          | 数据类型             | 属性说明                                                     |
| :------------------------------ | :------------------- | :----------------------------------------------------------- |
| `children`                      | `List<Widget>`       | 直接传入的子组件列表，适用于子项数量较少的场景。所有子项会一次性全部创建 |
| `controller`                    | `ScrollController?`  | 滚动控制器，用于监听或控制滚动位置，例如跳转到某个子项       |
| `itemExtent`                    | `double`             | **必填**。每个子项在主轴方向（垂直）上的固定高度，所有子项必须统一高度 |
| `diameterRatio`                 | `double`             | 圆柱体的直径与视口高度的比值，默认为 2.0。值越大，圆柱越"平"，子项之间的透视倾斜越小；值越小，弯曲越明显 |
| `perspective`                   | `double`             | 透视强度，取值范围为大于 0 且不超过 0.01，默认 0.003。值越大，三维纵深感越强；值越小，越接近平面效果 |
| `offAxisFraction`               | `double`             | 圆柱体在水平方向上的偏移比例，默认为 0（居中）。正值向右偏移，负值向左偏移，可制造出倾斜视角的效果 |
| `useMagnifier`                  | `bool`               | 是否对中心选中项启用放大镜效果，默认为 `false`               |
| `magnification`                 | `double`             | 放大镜的放大倍率，默认为 1.0（不放大）。需配合 `useMagnifier` 为 `true` 使用，值大于 1.0 时选中项会被放大显示 |
| `overAndUnderCenterOpacity`     | `double`             | 非选中项（中心项上方和下方的项）的不透明度，取值 0.0 到 1.0，默认为 1.0（完全不透明）。调低此值可让未选中项呈现淡出效果，突出中心项 |
| `squeeze`                       | `double`             | 子项在圆柱上的排列紧凑程度，默认为 1.0。值大于 1.0 时子项之间更紧密（视觉上项目更多），小于 1.0 时更稀疏 |
| `physics`                       | `ScrollPhysics?`     | 滚动物理特性，控制滚动的行为表现，例如使用 `FixedExtentScrollPhysics` 可让滚动结束后自动对齐到某个子项 |
| `onSelectedItemChanged`         | `ValueChanged<int>?` | 当中心选中项发生变化时触发的回调，参数为当前选中项的索引值   |
| `clipBehavior`                  | `Clip`               | 内容超出边界时的裁剪方式，默认为 `Clip.hardEdge`             |
| `renderChildrenOutsideViewport` | `bool`               | 是否渲染视口外的子组件，默认为 `false`。若设为 `true`，则 `clipBehavior` 必须设为 `Clip.none` |

------

### 三、构造函数

#### `ListWheelScrollView.useDelegate`

**使用场景**：当子项数量非常多或不确定时使用，通过委托（delegate）按需懒加载创建子项，避免一次性创建全部子项造成的性能浪费。

**独有核心参数**：

| 属性名          | 数据类型                 | 属性说明                                                     |
| :-------------- | :----------------------- | :----------------------------------------------------------- |
| `childDelegate` | `ListWheelChildDelegate` | 必填。子项构建的委托对象，常用的实现有两种：`ListWheelChildBuilderDelegate` 按需构建子项并可指定总数量；`ListWheelChildLoopingListDelegate` 让子项列表首尾相连循环滚动，永远滚不到头 |



## 179. GridTile

------

### 一、概述

`GridTile` 是一个 Material Design 风格的网格单元格组件，用于在一个主内容（通常是图片）的**顶部和/或底部叠加标题栏**，形成带有信息覆盖层的网格卡片效果。

------

### 二、核心属性

| 属性名   | 数据类型  | 属性说明                                                     |
| :------- | :-------- | :----------------------------------------------------------- |
| `child`  | `Widget`  | 必填。单元格的主体内容，通常是一张图片，会填满整个单元格区域，作为最底层显示 |
| `header` | `Widget?` | 叠加在主体内容**顶部**的组件，通常放置一个 `GridTileBar` 来显示标题、图标等信息。它会悬浮在 `child` 之上 |
| `footer` | `Widget?` | 叠加在主体内容**底部**的组件，用法与 `header` 相同，通常也放置一个 `GridTileBar`。与 `header` 可以同时使用 |

> **关于 `GridTileBar`**：它是专门为 `GridTile` 的 `header` 和 `footer` 设计的配套组件，提供了 `title`（标题）、`subtitle`（副标题）、`leading`（左侧图标）、`trailing`（右侧图标）以及 `backgroundColor`（背景色）等属性，能够快速构建出带有半透明背景的信息栏。



## 180. GridTileBar

------

### 一、概述

`GridTileBar` 是专门为 `GridTile` 的 `header` 或 `footer` 位置设计的**信息栏组件**，用于在网格卡片的顶部或底部展示标题、副标题、左右图标等信息，并支持设置半透明背景色以保证文字在图片上的可读性。

------

### 二、核心属性

| 属性名            | 数据类型  | 属性说明                                                     |
| :---------------- | :-------- | :----------------------------------------------------------- |
| `backgroundColor` | `Color?`  | 信息栏的背景颜色，通常设置为带有透明度的黑色（如半透明黑），使文字叠加在图片上时依然清晰可读。默认为透明 |
| `leading`         | `Widget?` | 信息栏**左侧**的组件，通常放置头像、小图标等                 |
| `title`           | `Widget?` | 信息栏的**主标题**组件，通常是一个 `Text`，会自动应用白色字体样式。如果同时设置了 `subtitle`，字体大小会稍作调整以保持层次感 |
| `subtitle`        | `Widget?` | 信息栏的**副标题**组件，显示在 `title` 下方，字体较小，常用于补充描述信息 |
| `trailing`        | `Widget?` | 信息栏**右侧**的组件，通常放置操作按钮，如收藏图标、更多菜单图标等 |

------

### 三、内部布局结构

`GridTileBar` 的内部排列方式为**水平一行**：

1. **最左侧**：`leading` 组件
2. **中间区域**：`title` 和 `subtitle` 上下排列，占据剩余空间自动伸展
3. **最右侧**：`trailing` 组件

中间的标题区域会自动填满 `leading` 和 `trailing` 之间的所有剩余空间，文本超长时会自动截断。



## 181. ExpansionPanelList

------

### 一、概述

`ExpansionPanelList` 是一个用于展示**可折叠/展开面板列表**的 Material 组件，列表中的每个面板都拥有一个始终可见的头部区域和一个可以展开或收起的内容区域，用户点击后可切换该面板内容的显隐状态。

------

### 二、核心属性

#### ExpansionPanelList 本体属性

| 属性名                  | 数据类型               | 属性说明                                                     |
| :---------------------- | :--------------------- | :----------------------------------------------------------- |
| `children`              | `List<ExpansionPanel>` | 面板列表，每个元素都是一个 `ExpansionPanel` 对象             |
| `expansionCallback`     | `Function(int, bool)`  | 用户点击展开/收起时的回调，返回被操作面板的**索引**和当前**是否已展开**的状态 |
| `animationDuration`     | `Duration`             | 面板展开与收起的动画时长，默认约 200 毫秒                    |
| `elevation`             | `double`               | 面板展开时的阴影高度，数值越大投影越明显                     |
| `expandedHeaderPadding` | `EdgeInsets`           | 面板处于展开状态时，头部区域额外增加的内边距                 |
| `dividerColor`          | `Color`                | 面板与面板之间分隔线的颜色                                   |
| `expandIconColor`       | `Color`                | 右侧展开/收起箭头图标的颜色                                  |
| `materialGapSize`       | `double`               | 面板展开后，与相邻面板之间产生的间隙大小                     |

#### ExpansionPanel 子项属性

| 属性名            | 数据类型                       | 属性说明                                                     |
| :---------------- | :----------------------------- | :----------------------------------------------------------- |
| `headerBuilder`   | `Function(BuildContext, bool)` | 构建头部区域的方法，第二个参数表示当前面板是否处于展开状态，可据此改变头部样式 |
| `body`            | `Widget`                       | 面板展开后显示的内容区域，可以放置任意组件                   |
| `isExpanded`      | `bool`                         | 控制该面板当前是展开还是收起，默认为收起状态                 |
| `canTapOnHeader`  | `bool`                         | 是否允许点击整个头部区域来触发展开/收起，默认仅点击右侧箭头图标才生效 |
| `backgroundColor` | `Color`                        | 该面板的背景颜色                                             |

------

### 三、构造函数

#### ExpansionPanelList.radio

**使用场景：** 当你希望整个列表中**同一时刻最多只能有一个面板处于展开状态**时使用。点击新面板时，之前已展开的面板会自动收起，行为类似单选框（Radio）的互斥逻辑。

**独有核心参数：**

| 属性名                  | 数据类型  | 属性说明                                                     |
| :---------------------- | :-------- | :----------------------------------------------------------- |
| `initialOpenPanelValue` | `Object?` | 指定列表初始加载时默认展开的那个面板的标识值，与 `ExpansionPanelRadio` 的 `value` 对应 |

> **补充说明：** 使用此构造函数时，`children` 中的每个子项需要使用 `ExpansionPanelRadio`（而非普通的 `ExpansionPanel`）。`ExpansionPanelRadio` 比普通面板多了一个 `value` 属性，用于唯一标识每个面板，框架通过这个值来判断该展开谁、该收起谁。



## 182. FormField

------

### 一、概述

`FormField<T>` 是 Flutter 表单体系中的**泛型基类组件**，它为任意类型的表单字段提供统一的**值管理、校验和保存**能力，是 `TextFormField`、`DropdownButtonFormField` 等具体表单字段的底层父类，也可以直接使用它来自定义任何非标准的表单字段。

------

### 二、核心属性

| 属性名             | 数据类型                             | 属性说明                                                     |
| :----------------- | :----------------------------------- | :----------------------------------------------------------- |
| `builder`          | `Widget Function(FormFieldState<T>)` | **必填**。根据当前字段状态构建实际显示的组件，参数中可获取当前值、错误信息等状态 |
| `initialValue`     | `T?`                                 | 字段的初始值，首次渲染时使用该值                             |
| `validator`        | `String? Function(T?)`               | 校验函数，接收当前值，返回错误提示文字表示校验失败，返回 `null` 表示校验通过 |
| `onSaved`          | `void Function(T?)`                  | 当所在 `Form` 调用保存操作时触发，用于将字段最终值收集起来   |
| `autovalidateMode` | `AutovalidateMode`                   | 自动校验时机：`disabled` 不自动校验；`onUserInteraction` 用户操作后才校验；`always` 始终自动校验 |
| `enabled`          | `bool`                               | 是否启用该字段，设为 `false` 时字段不可交互且不参与校验，默认为 `true` |
| `forceErrorText`   | `String?`                            | 强制显示指定的错误文字，一旦设置将覆盖 `validator` 的校验结果，适用于服务器端返回错误等外部校验场景 |
| `restorationId`    | `String?`                            | 状态恢复标识，用于应用被系统回收后恢复字段值                 |

#### FormFieldState 常用能力说明

`builder` 接收的 `FormFieldState<T>` 对象是与该字段关联的状态对象，包含以下高频使用的能力：

| 成员                  | 说明                                                   |
| :-------------------- | :----------------------------------------------------- |
| `value`               | 获取字段当前值                                         |
| `hasError`            | 是否存在校验错误                                       |
| `errorText`           | 当前的错误提示文字，校验通过时为 `null`                |
| `didChange(T? value)` | 主动更新字段值并触发重建，自定义字段中更改值的标准方式 |
| `validate()`          | 手动触发该字段的校验                                   |
| `reset()`             | 将字段值恢复为 `initialValue` 并清除错误状态           |
| `save()`              | 手动触发该字段的 `onSaved` 回调                        |



## 183. WidgetSpan

------

### 一、概述

`WidgetSpan` 是一种特殊的内联片段（`InlineSpan`），它允许你在富文本（`RichText` 或 `Text.rich`）的文字流中**嵌入任意 Widget**，使图标、图片、按钮等非文字组件能够像一个字符一样与文本混排在同一行内。

------

### 二、核心属性

| 属性名      | 数据类型               | 属性说明                                                     |
| :---------- | :--------------------- | :----------------------------------------------------------- |
| `child`     | `Widget`               | **必填**。要嵌入文本流中的任意组件，如图标、图片、容器等     |
| `alignment` | `PlaceholderAlignment` | 控制嵌入组件相对于周围文字的**垂直对齐方式**，详见下方说明   |
| `baseline`  | `TextBaseline?`        | 当 `alignment` 设为基线对齐时，指定使用的基线类型（字母基线或表意基线） |
| `style`     | `TextStyle?`           | 继承自父类 `TextSpan` 的文本样式，会向下传递给 `child` 内部的文本组件 |

#### PlaceholderAlignment 常用取值说明

| 取值            | 说明                                                         |
| :-------------- | :----------------------------------------------------------- |
| `bottom`        | 组件底边与文字底边对齐                                       |
| `top`           | 组件顶边与文字顶边对齐                                       |
| `middle`        | 组件中心与文字中心对齐                                       |
| `aboveBaseline` | 组件底边与文字基线对齐（组件位于基线上方）                   |
| `belowBaseline` | 组件顶边与文字基线对齐（组件位于基线下方）                   |
| `baseline`      | 组件自身的基线与文字基线对齐，此时必须同时指定 `baseline` 属性 |

------



#### 补充：与相关类的关系说明

`WidgetSpan` 在富文本体系中的定位需要了解以下层级关系：

| 类名         | 角色                                                       |
| :----------- | :--------------------------------------------------------- |
| `InlineSpan` | 所有内联片段的抽象基类                                     |
| `TextSpan`   | 用于在富文本中插入**纯文字片段**，可嵌套子 `TextSpan`      |
| `WidgetSpan` | 用于在富文本中插入**任意组件片段**，与 `TextSpan` 平级混用 |

**使用位置：** `WidgetSpan` 不能单独使用，必须放在 `Text.rich` 的 `children` 列表中，或作为 `TextSpan` 的 `children` 中的一个元素，与其他 `TextSpan` 共同组成一段图文混排的富文本内容。

**关键限制：** `WidgetSpan` 内嵌的组件会被当作一个"字符"参与文本布局，因此它的尺寸受行高约束。如果嵌入的组件过大，可能导致行高异常或布局溢出，需要注意控制 `child` 的大小。



## 184. MenuAnchor

------

### 一、概述

`MenuAnchor` 是 Flutter 3.x 引入的新一代菜单系统核心组件，它为一个子组件提供**菜单锚点**，用于定义菜单弹出的位置和内容，支持多级嵌套子菜单，是构建上下文菜单、下拉菜单等场景的基础容器。

------

### 二、核心属性

| 属性名                   | 数据类型                                                 | 属性说明                                                     |
| :----------------------- | :------------------------------------------------------- | :----------------------------------------------------------- |
| `menuChildren`           | `List<Widget>`                                           | **必填**。菜单弹出后显示的菜单项列表，通常使用 `MenuItemButton` 或 `SubmenuButton` |
| `builder`                | `Widget Function(BuildContext, MenuController, Widget?)` | 构建锚点组件的方法，第二个参数为菜单控制器，可用于手动打开或关闭菜单 |
| `controller`             | `MenuController`                                         | 菜单控制器，通过它可以在外部调用 `open()` 和 `close()` 来程序化地控制菜单的开关 |
| `child`                  | `Widget?`                                                | 锚点的子组件，如果同时设置了 `builder`，该 `child` 会作为 `builder` 的第三个参数传入 |
| `style`                  | `MenuStyle?`                                             | 控制弹出菜单面板的视觉样式，如背景色、阴影、圆角、内边距等   |
| `alignmentOffset`        | `Offset?`                                                | 菜单相对于锚点默认对齐位置的偏移量，用于微调菜单弹出后的位置 |
| `anchorTapClosesMenu`    | `bool`                                                   | 菜单已打开时，再次点击锚点是否关闭菜单，默认为 `true`        |
| `onOpen`                 | `VoidCallback?`                                          | 菜单打开时的回调                                             |
| `onClose`                | `VoidCallback?`                                          | 菜单关闭时的回调                                             |
| `consumeOutsideTap`      | `bool`                                                   | 点击菜单外部区域关闭菜单时，该次点击是否被"吞掉"而不传递给下层组件，默认为 `false` |
| `crossAxisUnconstrained` | `bool`                                                   | 菜单在交叉轴方向是否不受锚点宽度约束，默认为 `true`，即菜单宽度可以自由伸展 |
| `clipBehavior`           | `Clip`                                                   | 菜单面板的裁剪行为，默认为 `Clip.hardEdge`                   |

#### 常用菜单项组件说明

| 组件名           | 说明                                                         |
| :--------------- | :----------------------------------------------------------- |
| `MenuItemButton` | 单个菜单项按钮，支持设置文字、图标、快捷键标签以及点击回调，是最基本的菜单项 |
| `SubmenuButton`  | 带有子菜单的菜单项，悬停或点击后会展开下一级菜单，实现多级嵌套菜单结构 |

#### MenuController 核心方法

| 方法      | 说明                         |
| :-------- | :--------------------------- |
| `open()`  | 手动打开菜单                 |
| `close()` | 手动关闭菜单                 |
| `isOpen`  | 获取菜单当前是否处于打开状态 |

------



#### 补充：与旧菜单体系的关系

`MenuAnchor` 是 Flutter 3.x 推出的全新菜单方案，相比传统的 `PopupMenuButton`，它具备以下核心优势：

- **支持多级子菜单嵌套**，通过 `SubmenuButton` 可无限层级展开
- **支持键盘导航与快捷键**，更符合桌面端和无障碍访问需求
- **定位更灵活**，可通过 `alignmentOffset` 精细调控弹出位置
- **控制更自主**，`MenuController` 允许在任意时机程序化地开关菜单，而不仅限于点击触发



## 185. MenuBar

------

### 一、概述

`MenuBar` 是 Flutter 3.x 新菜单系统中的**水平菜单栏**组件，用于在界面顶部呈现一排可点击的菜单入口（如"文件"、"编辑"、"视图"等），点击后展开下拉子菜单，主要服务于桌面端和 Web 端的应用程序。

------

### 二、核心属性

| 属性名         | 数据类型          | 属性说明                                                     |
| :------------- | :---------------- | :----------------------------------------------------------- |
| `children`     | `List<Widget>`    | **必填**。菜单栏中水平排列的顶级菜单项，通常使用 `SubmenuButton` 来承载可展开的下拉菜单，也可以直接使用 `MenuItemButton` 作为无子菜单的独立按钮 |
| `style`        | `MenuStyle?`      | 菜单栏自身的视觉样式，包括背景色、阴影、圆角、内边距、形状等 |
| `clipBehavior` | `Clip`            | 菜单栏内容的裁剪行为，默认为 `Clip.none`                     |
| `controller`   | `MenuController?` | 菜单控制器，可程序化地控制菜单的打开与关闭                   |

#### MenuStyle 常用子属性说明

| 子属性             | 数据类型                                   | 说明                       |
| :----------------- | :----------------------------------------- | :------------------------- |
| `backgroundColor`  | `WidgetStateProperty<Color?>`              | 菜单栏及弹出面板的背景颜色 |
| `elevation`        | `WidgetStateProperty<double?>`             | 阴影高度                   |
| `padding`          | `WidgetStateProperty<EdgeInsetsGeometry?>` | 菜单内容区域的内边距       |
| `shape`            | `WidgetStateProperty<OutlinedBorder?>`     | 菜单面板的形状，如圆角矩形 |
| `surfaceTintColor` | `WidgetStateProperty<Color?>`              | Material 3 表面着色颜色    |

#### 菜单栏常用子组件说明

| 组件名           | 说明                                                         |
| :--------------- | :----------------------------------------------------------- |
| `SubmenuButton`  | 菜单栏中的顶级入口，点击或悬停后弹出下拉子菜单，内部通过 `menuChildren` 定义子菜单项，支持多级嵌套 |
| `MenuItemButton` | 最终可执行操作的菜单项，设置 `onPressed` 响应用户点击，可配置前置图标、文字标签和快捷键提示 |

------



#### 补充：与 MenuAnchor 的关系和区别

| 对比维度     | MenuBar                                                    | MenuAnchor                         |
| :----------- | :--------------------------------------------------------- | :--------------------------------- |
| **定位**     | 固定的水平菜单导航栏                                       | 任意位置的菜单锚点                 |
| **典型场景** | 桌面应用顶部的"文件 / 编辑 / 视图"菜单栏                   | 右键上下文菜单、按钮触发的弹出菜单 |
| **布局方式** | 顶级菜单项**水平排列**成一行                               | 围绕单个锚点组件弹出菜单           |
| **底层实现** | 内部基于 `MenuAnchor` 构建，本质是对多个锚点的横向编排封装 | 菜单系统的基础构建单元             |

**核心要点：** `MenuBar` 和 `MenuAnchor` 共同属于 Flutter 3.x 的新菜单体系，它们共享 `SubmenuButton`、`MenuItemButton` 等子组件，并且天然支持**键盘方向键导航**和**快捷键绑定**，非常适合构建桌面级应用的专业菜单交互。



## 186. SubmenuButton

### 一、概述

`SubmenuButton` 是 Flutter Material 3 菜单体系中的一个按钮组件，用于在菜单栏或菜单面板中创建一个**可展开子菜单的菜单项**——当用户点击或悬停在它上面时，会弹出一组下级菜单选项。

------

### 二、核心属性

| 属性名            | 数据类型              | 属性说明                                                     |
| :---------------- | :-------------------- | :----------------------------------------------------------- |
| `menuChildren`    | `List<Widget>`        | **必填**。子菜单中要展示的所有菜单项列表，通常由 `MenuItemButton` 或嵌套的 `SubmenuButton` 组成 |
| `child`           | `Widget?`             | 该按钮自身显示的内容，一般是一段文字标签，告诉用户这个菜单项叫什么 |
| `controller`      | `MenuController?`     | 菜单控制器，可通过它在程序逻辑中主动打开或关闭子菜单，而非仅依赖用户操作 |
| `onOpen`          | `VoidCallback?`       | 子菜单被打开时触发的回调，适合在此时执行日志记录或状态更新等操作 |
| `onClose`         | `VoidCallback?`       | 子菜单被关闭时触发的回调，与 `onOpen` 对应                   |
| `style`           | `ButtonStyle?`        | 控制该按钮自身的视觉样式，如背景色、内边距、文字样式、形状等，与普通按钮的 `style` 用法一致 |
| `menuStyle`       | `MenuStyle?`          | 控制弹出的**子菜单面板**的整体样式，如面板背景色、圆角、阴影高度、内边距等 |
| `leadingIcon`     | `Widget?`             | 显示在按钮文字**前方**的图标，用于为菜单项添加前置视觉标识   |
| `trailingIcon`    | `Widget?`             | 显示在按钮文字**后方**的图标，系统默认会放置一个指向子菜单方向的小箭头，可自定义替换 |
| `alignmentOffset` | `Offset?`             | 子菜单面板相对于按钮的位置偏移量，用于微调子菜单弹出后的精确位置 |
| `clipBehavior`    | `Clip`                | 子菜单面板内容的裁剪行为，决定内容超出面板边界时如何处理，默认为硬裁剪 |
| `focusNode`       | `FocusNode?`          | 焦点节点，用于控制键盘导航时该按钮的焦点获取与转移逻辑       |
| `onHover`         | `ValueChanged<bool>?` | 鼠标指针进入或离开按钮区域时触发，参数为是否正在悬停的布尔值 |
| `onFocusChange`   | `ValueChanged<bool>?` | 按钮焦点状态发生变化时触发，参数为是否获得焦点的布尔值       |



## 187. MenuItemButton

### 一、概述

`MenuItemButton` 是 Flutter Material 3 菜单体系中的**叶子节点**组件，用于在菜单面板中创建一个可被用户点击以执行具体操作的最终菜单选项。

------

### 二、核心属性

| 属性名                | 数据类型                    | 属性说明                                                     |
| :-------------------- | :-------------------------- | :----------------------------------------------------------- |
| `onPressed`           | `VoidCallback?`             | 用户点击该菜单项时触发的回调。为 `null` 时该菜单项进入禁用状态，视觉上会变灰且无法响应交互 |
| `child`               | `Widget?`                   | 菜单项上显示的主要内容，通常是一段文字标签，描述该操作的含义，如"复制""粘贴"等 |
| `shortcut`            | `MenuSerializableShortcut?` | 为该菜单项绑定的键盘快捷键。设置后，菜单项右侧会自动显示对应的快捷键文本提示，但**仅负责显示**，实际快捷键的监听逻辑需要配合外部的快捷键绑定机制 |
| `leadingIcon`         | `Widget?`                   | 显示在菜单项文字**前方**的图标，用于提供直观的视觉标识，帮助用户快速识别操作类型 |
| `trailingIcon`        | `Widget?`                   | 显示在菜单项文字**后方**的图标，通常用于放置勾选标记或其他状态指示 |
| `style`               | `ButtonStyle?`              | 控制该菜单项自身的视觉样式，包括背景色、前景色、内边距、文字样式、形状、最小尺寸等 |
| `closeOnActivate`     | `bool`                      | 点击该菜单项后是否自动关闭整个菜单面板，默认为 `true`。设为 `false` 时，点击后菜单保持展开状态，适合需要连续操作的场景 |
| `requestFocusOnHover` | `bool`                      | 鼠标悬停时是否自动获取焦点，默认为 `true`。在桌面端场景中，鼠标滑过菜单项时会高亮当前项 |
| `focusNode`           | `FocusNode?`                | 焦点节点，用于在键盘导航中精确控制该菜单项的焦点获取与释放   |
| `onHover`             | `ValueChanged<bool>?`       | 鼠标指针进入或离开该菜单项区域时触发，参数为当前是否处于悬停状态的布尔值 |
| `onFocusChange`       | `ValueChanged<bool>?`       | 焦点状态发生变化时触发，参数为当前是否获得焦点的布尔值       |
| `clipBehavior`        | `Clip`                      | 内容超出边界时的裁剪行为，默认为不裁剪                       |



## 188. NavigationDrawer

### 一、概述

`NavigationDrawer` 是 Flutter Material 3 中的侧边导航抽屉组件，用于从屏幕一侧滑出一个面板，面板内罗列多个导航目的地，供用户在应用的不同页面或功能模块之间进行切换。

------

### 二、核心属性

| 属性名                  | 数据类型              | 属性说明                                                     |
| :---------------------- | :-------------------- | :----------------------------------------------------------- |
| `children`              | `List<Widget>`        | **必填**。抽屉面板中显示的所有子组件列表，通常由 `NavigationDrawerDestination` 组成，也可以插入任意 Widget 来充当标题、分割线或间距等非导航内容 |
| `selectedIndex`         | `int?`                | 当前被选中的导航项索引，从 0 开始计数。注意：索引只针对 `children` 中的 `NavigationDrawerDestination` 类型进行计数，其他非导航类型的 Widget 不占索引位 |
| `onDestinationSelected` | `ValueChanged<int>?`  | 用户点击某个导航项时触发的回调，参数为该导航项的索引值。需在此回调中手动更新 `selectedIndex` 以切换选中状态 |
| `backgroundColor`       | `Color?`              | 整个抽屉面板的背景颜色                                       |
| `elevation`             | `double?`             | 抽屉面板的阴影高度，数值越大投影越明显，营造越强的浮起层次感 |
| `shadowColor`           | `Color?`              | 阴影的颜色，配合 `elevation` 使用                            |
| `surfaceTintColor`      | `Color?`              | Material 3 表面色调叠加颜色，影响面板随 `elevation` 变化时的色彩变化效果 |
| `indicatorColor`        | `Color?`              | 当前选中导航项的**高亮指示器**背景颜色，即选中项背后那一块醒目的色块 |
| `indicatorShape`        | `ShapeBorder?`        | 选中指示器的形状，可设置为圆角矩形、体育场形等               |
| `tilePadding`           | `EdgeInsetsGeometry?` | 每个导航项（即 `NavigationDrawerDestination`）外围的内边距，控制导航项与抽屉面板边缘之间的距离 |

------



------

### 三、配套组件：NavigationDrawerDestination

`NavigationDrawer` 中的每一个导航项都由 `NavigationDrawerDestination` 来表示，它是专门为此抽屉设计的导航目的地组件，核心属性如下：

| 属性名         | 数据类型  | 属性说明                                                     |
| :------------- | :-------- | :----------------------------------------------------------- |
| `icon`         | `Widget`  | **必填**。导航项在**未选中**状态下显示的图标                 |
| `selectedIcon` | `Widget?` | 导航项在**选中**状态下显示的图标，不设置则选中时仍使用 `icon` |
| `label`        | `Widget`  | **必填**。导航项的文字标签，描述该目的地的名称               |
| `enabled`      | `bool`    | 该导航项是否可交互，默认为 `true`。设为 `false` 时该项变灰且无法点击 |

------

### 四、使用方式说明

`NavigationDrawer` 有两种典型使用方式：

**方式一：配合 Scaffold 的 drawer 属性。** 将 `NavigationDrawer` 直接传给 `Scaffold` 的 `drawer` 参数，此时抽屉默认隐藏，用户通过点击 AppBar 上的菜单图标或从屏幕左侧边缘向右滑动来唤出它，使用完毕后可通过点击抽屉外区域或向左滑动来关闭。

**方式二：直接放在页面布局中常驻显示。** 在宽屏或桌面端场景下，可以将 `NavigationDrawer` 作为普通 Widget 放入 `Row` 等布局中，使其始终可见，无需滑动唤出。



## 189. MaterialBanner

### 一、概述

`MaterialBanner` 是 Flutter Material Design 中的横幅通知组件，用于在页面顶部显示一条持久性的提示信息，并附带操作按钮，要求用户主动处理后才会消失。

------

### 二、核心属性

| 属性名              | 数据类型               | 属性说明                                                     |
| :------------------ | :--------------------- | :----------------------------------------------------------- |
| `content`           | `Widget`               | **必填**。横幅中显示的主体信息内容，通常是一段描述性文字，告知用户当前需要关注的事项 |
| `actions`           | `List<Widget>`         | **必填**。横幅底部或右侧的操作按钮列表，通常包含"关闭""了解更多"等按钮，供用户执行响应操作 |
| `leading`           | `Widget?`              | 显示在内容文字**前方**的前导组件，通常放置一个图标，用于直观传达信息类型（如警告图标、错误图标等） |
| `backgroundColor`   | `Color?`               | 横幅的背景颜色                                               |
| `surfaceTintColor`  | `Color?`               | Material 3 表面色调叠加颜色，影响横幅在不同层级下的颜色表现  |
| `shadowColor`       | `Color?`               | 横幅阴影的颜色                                               |
| `elevation`         | `double?`              | 横幅的阴影高度，数值越大，横幅浮起感越强                     |
| `dividerColor`      | `Color?`               | 横幅底部分割线的颜色。该分割线将横幅与下方的页面内容在视觉上进行分隔 |
| `contentTextStyle`  | `TextStyle?`           | `content` 中文字的样式，可设置字体大小、颜色、粗细等         |
| `padding`           | `EdgeInsetsGeometry?`  | 横幅内容区域的内边距，控制文字和图标距离横幅边缘的间距       |
| `leadingPadding`    | `EdgeInsetsGeometry?`  | `leading` 组件专属的内边距，用于微调前导图标与内容文字之间的距离 |
| `forceActionsBelow` | `bool`                 | 是否强制将操作按钮放置在内容文字的**下方**。默认为 `false`，此时按钮可能在文字右侧；设为 `true` 后按钮必定换行到下方独占一行 |
| `overflowAlignment` | `OverflowBarAlignment` | 当操作按钮被放置到内容下方时，按钮组的水平对齐方式，可选起始对齐或末尾对齐 |
| `animation`         | `Animation<double>?`   | 控制横幅显示和隐藏时的动画效果，通常在通过 `ScaffoldMessenger` 调用时由系统自动管理 |
| `onVisible`         | `VoidCallback?`        | 横幅变为可见状态时触发的回调                                 |

------



------

### 三、显示方式说明

`MaterialBanner` 本身只是一个描述横幅外观和内容的"配置对象"，要让它实际显示在页面上，需要通过 `ScaffoldMessenger` 来驱动。具体做法是调用 `ScaffoldMessenger` 的 `showMaterialBanner` 方法，并将 `MaterialBanner` 实例传入即可。横幅会从页面顶部出现并保持停留，直到调用 `hideCurrentMaterialBanner` 或 `clearMaterialBanners` 方法将其移除。

这与 `SnackBar` 的使用模式非常相似——都是通过 `ScaffoldMessenger` 统一管理显示和隐藏。

------

### 四、与 SnackBar 的核心区别

| 对比维度 | MaterialBanner                               | SnackBar                     |
| :------- | :------------------------------------------- | :--------------------------- |
| 出现位置 | 页面**顶部**                                 | 页面**底部**                 |
| 持久性   | **持久显示**，必须用户主动操作或程序主动关闭 | 默认**自动消失**，有限时展示 |
| 适用场景 | 重要提示、需要用户明确处理的通知             | 轻量反馈、操作结果提示       |
| 操作按钮 | 支持**多个**操作按钮                         | 通常只有**一个**可选操作     |



# Cupertino 系列

## 1. CupertinoApp

### 一、概述

`CupertinoApp` 是 Flutter 中用于构建 iOS 风格应用程序的**顶层根组件**，它为整个应用提供 iOS（Cupertino）设计语言的主题配置、导航路由管理以及本地化等基础设施。

------

### 二、核心属性

| 属性名                       | 数据类型                           | 属性说明                                                     |
| :--------------------------- | :--------------------------------- | :----------------------------------------------------------- |
| `home`                       | `Widget?`                          | 应用启动后默认显示的第一个页面。与 `routes` 中的根路由 `"/"` 互斥，二者设置其一即可 |
| `routes`                     | `Map<String, WidgetBuilder>`       | 应用的静态路由表，以字符串路径为键、页面构建函数为值，用于通过命名路由实现页面跳转 |
| `initialRoute`               | `String?`                          | 应用启动时加载的初始路由路径名。若设置了 `home`，则该属性通常不需要再配置 |
| `onGenerateRoute`            | `RouteFactory?`                    | 动态路由生成器。当导航请求的路由名在 `routes` 表中找不到时，由此回调动态生成路由，适合需要传参或条件判断的路由场景 |
| `onUnknownRoute`             | `RouteFactory?`                    | 未知路由兜底处理器。当 `routes` 和 `onGenerateRoute` 都无法匹配时触发，通常用于展示 404 页面 |
| `navigatorKey`               | `GlobalKey<NavigatorState>?`       | 导航器的全局键，可通过它在任意位置直接操控导航器进行页面跳转，而无需依赖上下文 |
| `navigatorObservers`         | `List<NavigatorObserver>`          | 导航观察者列表，可监听所有页面的入栈、出栈等路由变化事件，常用于埋点统计或日志记录 |
| `theme`                      | `CupertinoThemeData?`              | 应用的全局 iOS 风格主题配置，可统一设置主色调、文字样式、页面背景色、导航栏样式等 |
| `locale`                     | `Locale?`                          | 手动指定应用的语言区域，如中文、英文等。不设置时将跟随系统语言 |
| `localizationsDelegates`     | `Iterable<LocalizationsDelegate>?` | 本地化代理列表，用于注册各语言的翻译资源，实现应用的多语言支持 |
| `supportedLocales`           | `Iterable<Locale>`                 | 应用支持的语言区域列表，系统会在其中选择与用户设备最匹配的语言 |
| `debugShowCheckedModeBanner` | `bool`                             | 是否在应用右上角显示 "DEBUG" 调试横幅，默认为 `true`，正式截图或发布前通常设为 `false` |
| `title`                      | `String`                           | 应用的标题文字，显示在操作系统的任务切换界面中，帮助用户识别应用 |
| `onGenerateTitle`            | `GenerateAppTitle?`                | 动态生成应用标题的回调，可根据当前语言环境返回不同的本地化标题，优先级高于 `title` |
| `builder`                    | `TransitionBuilder?`               | 在导航器之上插入的全局构建器，可用于包裹全局性的组件层，如全局的加载遮罩、字体缩放控制等 |
| `scrollBehavior`             | `ScrollBehavior?`                  | 全局滚动行为配置，控制应用中所有滚动组件的默认物理效果和滚动条表现 |

------

### 三、构造函数

#### `CupertinoApp.router`

**使用场景：** 当项目采用声明式路由方案（如 `go_router`、`auto_route` 等第三方路由库）时，需要使用此构造函数代替默认构造函数，将路由管理权完全交由外部路由器掌控。

**独有核心参数：**

| 属性名                     | 数据类型                          | 属性说明                                                     |
| :------------------------- | :-------------------------------- | :----------------------------------------------------------- |
| `routerConfig`             | `RouterConfig<Object>?`           | 路由配置对象，将第三方路由库生成的完整路由配置一次性传入即可，这是最简洁的接入方式 |
| `routerDelegate`           | `RouterDelegate<Object>?`         | 路由代理，负责根据当前路由状态构建对应的页面。与 `routeInformationParser` 搭配使用 |
| `routeInformationParser`   | `RouteInformationParser<Object>?` | 路由信息解析器，负责将系统传入的原始路由信息（如 URL）解析为路由代理能理解的数据结构 |
| `routeInformationProvider` | `RouteInformationProvider?`       | 路由信息提供者，负责向应用提供当前的路由信息来源，通常由框架自动处理 |
| `backButtonDispatcher`     | `BackButtonDispatcher?`           | 系统返回按钮的事件分发器，用于自定义 Android 物理返回键或 Web 端浏览器后退按钮的行为 |

> **提示：** 若使用 `routerConfig`，则 `routerDelegate`、`routeInformationParser` 等参数无需再单独设置，因为 `routerConfig` 已将它们打包在一起。

------

### 四、与 MaterialApp 的核心区别

| 对比维度     | CupertinoApp                                                 | MaterialApp                                  |
| :----------- | :----------------------------------------------------------- | :------------------------------------------- |
| 设计风格     | iOS（Cupertino）风格                                         | Android（Material Design）风格               |
| 主题系统     | 使用 `CupertinoThemeData`                                    | 使用 `ThemeData`                             |
| 页面过渡动画 | 默认为 iOS 风格的左右滑动过渡                                | 默认为 Android 风格的淡入上浮过渡            |
| 组件生态     | 搭配 `CupertinoPageScaffold`、`CupertinoNavigationBar` 等 iOS 风组件 | 搭配 `Scaffold`、`AppBar` 等 Material 风组件 |



## 2. CupertinoPageScaffold

------

### 一、概述

CupertinoPageScaffold 是 Flutter 中用于构建 **iOS 风格页面基础骨架** 的容器组件，它为页面提供了一个标准的 iOS 布局结构：顶部放置导航栏，下方承载页面主体内容，并自动处理导航栏与内容区域之间的安全区域适配。

------

### 二、核心属性

| 属性名                       | 数据类型                        | 属性说明                                                     |
| :--------------------------- | :------------------------------ | :----------------------------------------------------------- |
| **child**                    | Widget                          | 页面的主体内容区域，是整个页面中导航栏以下的所有可见内容的载体，为必填属性 |
| **navigationBar**            | ObstructingPreferredSizeWidget? | 页面顶部的 iOS 风格导航栏，通常传入一个 CupertinoNavigationBar 组件。若设为空则不显示顶部导航栏，页面内容将从屏幕顶部开始铺满 |
| **backgroundColor**          | Color                           | 页面整体的背景颜色。默认值会跟随当前 CupertinoTheme 主题中的 scaffoldBackgroundColor，一般为 iOS 标准的浅灰白色 |
| **resizeToAvoidBottomInset** | bool                            | 控制当软键盘弹出时，页面主体内容是否自动向上收缩以避免被键盘遮挡。默认为 true，即自动避让；设为 false 则键盘会直接覆盖在内容上方 |



## 3. CupertinoNavigationBar

------

### 一、概述

CupertinoNavigationBar 是 Flutter 中用于构建 **iOS 风格顶部导航栏** 的组件，提供了左侧返回区域、中间标题区域、右侧操作区域的标准三段式布局，并自带半透明磨砂背景效果和页面间的过渡动画。

------

### 二、核心属性

| 属性名                        | 数据类型               | 属性说明                                                     |
| :---------------------------- | :--------------------- | :----------------------------------------------------------- |
| **middle**                    | Widget?                | 导航栏的中间区域，通常用来放置页面标题文本。若不设置且 automaticallyImplyMiddle 为 true，会自动使用当前路由的标题 |
| **leading**                   | Widget?                | 导航栏最左侧的组件，通常放置返回按钮或关闭按钮。若不设置且 automaticallyImplyLeading 为 true，系统会自动根据路由情况生成一个返回箭头 |
| **trailing**                  | Widget?                | 导航栏最右侧的组件，通常放置"编辑"、"完成"等操作按钮或图标   |
| **automaticallyImplyLeading** | bool                   | 当 leading 未设置时，是否自动生成一个 iOS 风格的返回按钮（带左箭头和上一页标题）。默认为 true |
| **automaticallyImplyMiddle**  | bool                   | 当 middle 未设置时，是否自动将当前路由的标题显示在中间区域。默认为 true |
| **previousPageTitle**         | String?                | 手动指定返回按钮旁边显示的上一页标题文字。若不设置，系统会自动读取上一个路由的标题 |
| **backgroundColor**           | Color?                 | 导航栏的背景颜色。默认带有 iOS 标准的半透明磨砂效果，若设为完全不透明的颜色则磨砂效果消失 |
| **border**                    | Border?                | 导航栏底部的分隔线。默认是一条极细的灰色底边线，设为 null 可去除 |
| **padding**                   | EdgeInsetsDirectional? | 导航栏内部左右两侧的内边距，用于微调 leading 和 trailing 与屏幕边缘的间距 |
| **transitionBetweenRoutes**   | bool                   | 是否启用 iOS 风格的页面切换过渡动画（标题从右侧滑入、上一页标题向左淡出的联动效果）。默认为 true |
| **heroTag**                   | Object                 | 配合 transitionBetweenRoutes 使用的标识符，用于在两个页面的导航栏之间建立过渡动画的配对关系。默认值通常无需修改 |





## 4. CupertinoSliverNavigationBar

------

### 一、概述

CupertinoSliverNavigationBar 是 Flutter 中用于构建 **iOS 风格大标题导航栏** 的滚动感知组件，它在页面未滚动时以大字号展示标题，当用户向上滚动内容时，大标题会自动收缩并过渡为标准尺寸的顶部导航栏，必须放置在 CustomScrollView 内部使用。

------

### 二、核心属性

| 属性名                        | 数据类型               | 属性说明                                                     |
| :---------------------------- | :--------------------- | :----------------------------------------------------------- |
| **largeTitle**                | Widget?                | 页面未滚动时展示在导航栏下方的大标题内容，通常放置一个文本组件，这是该组件最核心的属性，也是它区别于普通 CupertinoNavigationBar 的关键所在 |
| **middle**                    | Widget?                | 大标题收缩后，显示在标准导航栏中间区域的内容。若未设置且 automaticallyImplyTitle 为 true，会自动将 largeTitle 的文本内容搬到此处 |
| **leading**                   | Widget?                | 导航栏最左侧的组件，常用于放置返回按钮或关闭按钮             |
| **trailing**                  | Widget?                | 导航栏最右侧的组件，常用于放置操作按钮                       |
| **automaticallyImplyLeading** | bool                   | 当 leading 未设置时，是否自动生成 iOS 风格的返回按钮。默认为 true |
| **automaticallyImplyTitle**   | bool                   | 当 middle 未设置时，是否自动将 largeTitle 的文字内容用作收缩后导航栏的中间标题。默认为 true |
| **alwaysShowMiddle**          | bool                   | 即使大标题仍然可见（页面未滚动），是否也同时在顶部标准导航栏区域显示 middle 内容。默认为 true；设为 false 则只有大标题完全收起后 middle 才会出现 |
| **previousPageTitle**         | String?                | 手动指定返回按钮旁显示的上一页标题文字                       |
| **backgroundColor**           | Color?                 | 导航栏背景颜色，默认带有 iOS 标准的半透明磨砂效果            |
| **border**                    | Border?                | 导航栏底部的分隔线，默认为一条极细灰线，设为 null 可移除     |
| **stretch**                   | bool                   | 当用户在顶部继续过度下拉时，大标题区域是否跟随拉伸放大。默认为 false |
| **padding**                   | EdgeInsetsDirectional? | 导航栏内部左右的内边距，用于微调 leading 和 trailing 的位置  |
| **transitionBetweenRoutes**   | bool                   | 是否启用 iOS 风格的页面切换标题联动过渡动画。默认为 true     |
| **heroTag**                   | Object                 | 页面间导航栏过渡动画的配对标识符，默认值通常无需修改         |



## 5. CupertinoButton

------

### 一、概述

CupertinoButton 是 Flutter 提供的 **iOS 风格按钮组件**，用于在界面中创建符合苹果 Human Interface 设计规范的可点击按钮，按下时会通过降低透明度来提供视觉反馈。

------

### 二、核心属性

| 属性名             | 数据类型              | 属性说明                                                     |
| :----------------- | :-------------------- | :----------------------------------------------------------- |
| **child**          | `Widget?`             | 按钮内部显示的内容，通常放置文本或图标                       |
| **onPressed**      | `VoidCallback?`       | 按钮被点击时触发的回调。设为 `null` 时按钮自动进入**禁用状态**，无法点击且样式变灰 |
| **padding**        | `EdgeInsetsGeometry?` | 按钮内容与按钮边缘之间的内边距                               |
| **color**          | `Color?`              | 按钮的背景颜色。默认构造函数下为透明，即按钮无背景色，只显示文字 |
| **disabledColor**  | `Color`               | 按钮处于禁用状态时的背景颜色                                 |
| **pressedOpacity** | `double?`             | 按钮被按下时的不透明度，取值范围 0.0 到 1.0。默认值为 0.4，数值越小按下时越透明，这是 CupertinoButton 最标志性的交互反馈方式 |
| **minSize**        | `double?`             | 按钮的最小尺寸（宽和高都不会小于此值），用于确保按钮有足够的可点击区域 |
| **borderRadius**   | `BorderRadius?`       | 按钮背景的圆角半径。仅在设置了背景颜色时才有可见效果         |
| **alignment**      | `AlignmentGeometry`   | 子内容在按钮内部的对齐方式，默认居中                         |
| **sizeStyle**      | `CupertinoButtonSize` | 按钮的尺寸风格，提供 `small`（小号）、`regular`（常规）、`large`（大号）三个预设档位，会自动调整内边距和最小尺寸 |

------

### 三、构造函数

#### 1. CupertinoButton.filled

**使用场景：** 需要一个带有**实心填充背景**的醒目按钮时使用，通常作为页面中的主要操作按钮（类似"确认""提交"这类关键动作）。

**独有特征：**

- 自动将按钮背景色设置为当前 Cupertino 主题的主色调（primaryColor），无需手动指定颜色
- 按钮内文字自动变为白色，与填充背景形成高对比
- 禁用时背景自动切换为一种柔和的灰色
- 自带圆角效果

> 简而言之：默认构造函数创建的是"文字按钮"（透明背景），而 `filled` 创建的是"实心按钮"（有背景色），两者在视觉层级上有明确的主次之分。

------

#### 2. CupertinoButton.tinted

**使用场景：** 需要一个视觉重要性介于透明按钮和实心按钮之间的**半透明色调按钮**时使用，常用于次要操作。

**独有特征：**

- 背景采用当前主题主色调的**半透明淡化版本**，呈现柔和的色块效果
- 文字颜色保持为主题主色调（而非白色），与 `filled` 形成区分
- 视觉权重适中，既不像默认构造函数那样"隐形"，也不像 `filled` 那样强烈抢眼

> 三种构造函数的视觉层级关系：**默认（最轻）→ tinted（中等）→ filled（最重）**，开发者可根据按钮的重要程度选择合适的样式。

## 6. CupertinoTextField

------

### 一、概述

CupertinoTextField 是 Flutter 提供的 **iOS 风格文本输入框组件**，用于接收用户键盘输入的文字信息，默认呈现带圆角边框的 iOS 原生输入框样式。

------

### 二、核心属性

| 属性名                 | 数据类型                    | 属性说明                                                     |
| :--------------------- | :-------------------------- | :----------------------------------------------------------- |
| **controller**         | `TextEditingController?`    | 文本编辑控制器，用于读取、设置或监听输入框中的文字内容       |
| **placeholder**        | `String?`                   | 输入框为空时显示的占位提示文字，相当于 Material 风格中的 hintText |
| **placeholderStyle**   | `TextStyle?`                | 占位提示文字的样式，可控制其颜色、字号等                     |
| **prefix**             | `Widget?`                   | 输入框最左侧的前缀组件，常放置图标或标签                     |
| **prefixMode**         | `OverlayVisibilityMode`     | 控制前缀组件的显示时机：始终显示、有文字时显示、编辑时显示、或从不显示 |
| **suffix**             | `Widget?`                   | 输入框最右侧的后缀组件，常放置图标或操作按钮                 |
| **suffixMode**         | `OverlayVisibilityMode`     | 控制后缀组件的显示时机，取值规则与 prefixMode 一致           |
| **clearButtonMode**    | `OverlayVisibilityMode`     | 清除按钮（叉号图标）的显示时机。默认为从不显示，设为编辑时显示最为常用，可一键清空输入内容 |
| **decoration**         | `BoxDecoration?`            | 输入框的外观装饰，控制边框、圆角、背景色等。默认是带浅灰色圆角边框的样式，设为 `null` 可去除所有装饰 |
| **padding**            | `EdgeInsetsGeometry`        | 输入框内部文字与边框之间的内边距                             |
| **style**              | `TextStyle?`                | 用户实际输入文字的样式                                       |
| **keyboardType**       | `TextInputType?`            | 弹出键盘的类型，如纯数字键盘、邮箱键盘、电话键盘、普通文字键盘等 |
| **textInputAction**    | `TextInputAction?`          | 键盘右下角的功能键类型，如"完成""下一项""搜索""发送"等       |
| **obscureText**        | `bool`                      | 是否隐藏输入内容，设为 true 时文字以圆点显示，用于密码输入场景 |
| **maxLines**           | `int?`                      | 输入框最大显示行数。默认为 1（单行），设为 `null` 则可无限换行 |
| **minLines**           | `int?`                      | 输入框最小显示行数，可让输入框在无内容时也保持一定高度       |
| **maxLength**          | `int?`                      | 允许输入的最大字符数量，超出后无法继续输入                   |
| **onChanged**          | `ValueChanged<String>?`     | 输入内容每次发生变化时触发的回调，参数为当前输入框的完整文本 |
| **onSubmitted**        | `ValueChanged<String>?`     | 用户按下键盘上的"完成/提交"键时触发的回调                    |
| **onTap**              | `GestureTapCallback?`       | 输入框被点击时触发的回调                                     |
| **enabled**            | `bool?`                     | 是否启用输入框。设为 false 时无法输入也无法获取焦点，整体呈灰态 |
| **readOnly**           | `bool`                      | 是否只读。与 enabled 不同，只读状态下输入框仍可获取焦点和选中文本，但不能修改内容 |
| **autofocus**          | `bool`                      | 是否在页面加载后自动获取焦点并弹出键盘                       |
| **focusNode**          | `FocusNode?`                | 焦点控制器，用于手动控制输入框的获取焦点和失去焦点           |
| **cursorColor**        | `Color?`                    | 光标的颜色                                                   |
| **textAlign**          | `TextAlign`                 | 输入文字的水平对齐方式，默认左对齐                           |
| **inputFormatters**    | `List<TextInputFormatter>?` | 输入格式限制器列表，可强制限定只允许输入数字、限制特定字符等 |
| **autocorrect**        | `bool`                      | 是否启用系统自动纠正功能                                     |
| **textCapitalization** | `TextCapitalization`        | 文本自动大写策略：无、每个单词首字母、每句首字母、全部大写   |

------

### 三、构造函数

#### CupertinoTextField.borderless

**使用场景：** 需要一个**没有边框和背景装饰**的纯净输入框时使用，常见于将输入框嵌入到列表行、表单卡片或自定义容器中，由外部容器统一提供边框和分隔线的场景。

**独有特征：**

- 默认将 `decoration` 设为 `null`，移除了标准 CupertinoTextField 自带的圆角边框和背景色
- 默认内边距也做了调整，更适合嵌入紧凑布局
- 其余所有属性与默认构造函数完全一致

> 总结：默认构造函数 = 带圆角边框的独立输入框；`borderless` = 无边框的嵌入式输入框。根据输入框是独立使用还是嵌入到其他容器中来选择。



## 7. CupertinoSearchTextField

------

### 一、概述

CupertinoSearchTextField 是 Flutter 提供的 **iOS 风格搜索输入框组件**，内置了搜索图标、占位提示文字和清除按钮，用于快速构建符合苹果设计规范的搜索栏。

------

### 二、核心属性

| 属性名               | 数据类型                 | 属性说明                                                     |
| :------------------- | :----------------------- | :----------------------------------------------------------- |
| **controller**       | `TextEditingController?` | 文本编辑控制器，用于读取、设置或监听搜索框中的文字内容       |
| **onChanged**        | `ValueChanged<String>?`  | 输入内容每次发生变化时触发的回调，参数为当前完整文本，是实现"边输入边搜索"的核心属性 |
| **onSubmitted**      | `ValueChanged<String>?`  | 用户按下键盘上"搜索"键时触发的回调                           |
| **onSuffixTap**      | `VoidCallback?`          | 用户点击右侧清除按钮时触发的回调。默认行为是清空输入框内容，可通过此属性追加自定义逻辑 |
| **placeholder**      | `String?`                | 输入框为空时显示的占位提示文字，默认显示"Search"（会跟随系统语言本地化） |
| **placeholderStyle** | `TextStyle?`             | 占位提示文字的样式                                           |
| **style**            | `TextStyle?`             | 用户实际输入文字的样式                                       |
| **decoration**       | `BoxDecoration?`         | 搜索框的外观装饰，控制边框、背景色、圆角等                   |
| **backgroundColor**  | `Color?`                 | 搜索框的背景颜色，默认为 iOS 标准的浅灰色半透明背景          |
| **borderRadius**     | `BorderRadius?`          | 搜索框的圆角半径，默认为 iOS 标准的小圆角                    |
| **padding**          | `EdgeInsetsGeometry`     | 输入框内部文字与边框之间的内边距                             |
| **prefixIcon**       | `Widget`                 | 搜索框左侧的前缀图标，默认是一个 iOS 风格的放大镜图标        |
| **prefixInsets**     | `EdgeInsetsGeometry`     | 前缀图标的外边距，用于调整放大镜图标与周围元素的间距         |
| **suffixIcon**       | `Icon`                   | 搜索框右侧的后缀图标，默认是一个圆形叉号清除图标             |
| **suffixInsets**     | `EdgeInsetsGeometry`     | 后缀图标的外边距                                             |
| **suffixMode**       | `OverlayVisibilityMode`  | 清除按钮的显示时机。默认为"编辑时显示"，即输入框有内容且处于编辑状态时才出现清除按钮 |
| **itemColor**        | `Color`                  | 前缀图标和后缀图标的统一颜色                                 |
| **itemSize**         | `double`                 | 前缀图标和后缀图标的统一大小                                 |
| **keyboardType**     | `TextInputType?`         | 弹出键盘的类型，默认为普通文字键盘                           |
| **autocorrect**      | `bool`                   | 是否启用系统自动纠正功能                                     |
| **autofocus**        | `bool`                   | 是否在页面加载后自动获取焦点并弹出键盘                       |
| **enabled**          | `bool?`                  | 是否启用搜索框，设为 false 时无法输入                        |
| **focusNode**        | `FocusNode?`             | 焦点控制器，用于手动控制搜索框的聚焦与失焦                   |



## 8. CupertinoSwitch

------

### 一、概述

CupertinoSwitch 是 Flutter 提供的 **iOS 风格开关组件**，用于在"开"与"关"两种状态之间进行切换，常用于设置页面中控制某项功能的启用或关闭。

------

### 二、核心属性

| 属性名                 | 数据类型              | 属性说明                                                     |
| :--------------------- | :-------------------- | :----------------------------------------------------------- |
| **value**              | `bool`                | 开关当前的状态，`true` 为开启，`false` 为关闭。这是一个**必填属性** |
| **onChanged**          | `ValueChanged<bool>?` | 用户拨动开关时触发的回调，参数为切换后的新状态值。设为 `null` 时开关进入**禁用状态**，无法拨动 |
| **activeTrackColor**   | `Color?`              | 开关处于**开启状态**时轨道（背景槽）的颜色，默认为 iOS 标准的绿色 |
| **inactiveTrackColor** | `Color?`              | 开关处于**关闭状态**时轨道的颜色                             |
| **thumbColor**         | `Color?`              | 开关上圆形滑块（拇指）的颜色，默认为白色                     |
| **trackColor**         | `Color?`              | 轨道颜色，同时影响开启和关闭两种状态。若同时设置了 activeTrackColor 或 inactiveTrackColor，则各状态下的专属属性优先级更高 |
| **focusColor**         | `Color?`              | 开关获取焦点时的高亮颜色，主要用于键盘导航或辅助功能场景     |
| **onLabelColor**       | `Color?`              | 开启状态下轨道内部竖线标记的颜色（iOS 无障碍设计中用于区分开关状态的视觉标识） |
| **offLabelColor**      | `Color?`              | 关闭状态下轨道内部圆圈标记的颜色                             |
| **applyTheme**         | `bool?`               | 是否将当前 CupertinoTheme 的主题色自动应用为开启状态的轨道颜色。设为 true 时，activeTrackColor 若未指定则跟随主题色 |
| **focusNode**          | `FocusNode?`          | 焦点控制器，用于手动控制开关的焦点获取与释放                 |
| **autofocus**          | `bool`                | 是否在页面加载后自动获取焦点，默认为 false                   |
| **dragStartBehavior**  | `DragStartBehavior`   | 拖拽手势的起始行为判定方式，影响拨动手势开始计算的时间点，通常保持默认即可 |

## 9. CupertinoSlider

------

### 一、概述

CupertinoSlider 是 Flutter 提供的 **iOS 风格滑动条组件**，用于让用户通过水平拖拽滑块在一个连续或离散的数值范围内选取一个值，常见于音量调节、亮度设置等场景。

------

### 二、核心属性

| 属性名            | 数据类型                | 属性说明                                                     |
| :---------------- | :---------------------- | :----------------------------------------------------------- |
| **value**         | `double`                | 滑块当前所处的数值，必须在 min 和 max 之间。这是一个**必填属性** |
| **onChanged**     | `ValueChanged<double>?` | 用户拖拽滑块过程中**持续触发**的回调，参数为实时变化的当前值。设为 `null` 时滑块进入**禁用状态**，无法拖动 |
| **onChangeStart** | `ValueChanged<double>?` | 用户**开始拖拽**滑块时触发一次的回调，参数为拖拽起始时的值   |
| **onChangeEnd**   | `ValueChanged<double>?` | 用户**松手释放**滑块时触发一次的回调，参数为拖拽结束时的最终值。适合在此时机执行网络请求等耗时操作 |
| **min**           | `double`                | 滑块允许的最小值，默认为 0.0                                 |
| **max**           | `double`                | 滑块允许的最大值，默认为 1.0                                 |
| **divisions**     | `int?`                  | 将滑动范围等分为多少段。未设置时滑块可在范围内自由滑动（连续值）；设置后滑块只能停在等分点上（离散值），拖动时会有明显的"卡档"吸附感 |
| **activeColor**   | `Color?`                | 滑块左侧（已滑过区域）轨道的颜色，默认为 iOS 标准的蓝绿色，也会同时影响滑块圆点的颜色 |
| **thumbColor**    | `Color`                 | 滑块圆点的颜色，默认为白色                                   |

## 10. CupertinoCheckbox

------

### 一、概述

CupertinoCheckbox 是 Flutter 提供的 **iOS 风格复选框组件**，用于让用户在"选中"与"未选中"之间进行勾选切换，常见于同意协议、多选列表等需要确认或批量选择的场景。

------

### 二、核心属性

| 属性名            | 数据类型               | 属性说明                                                     |
| :---------------- | :--------------------- | :----------------------------------------------------------- |
| **value**         | `bool?`                | 复选框当前的选中状态。`true` 为选中（显示勾号），`false` 为未选中。当开启三态模式时，`null` 表示不确定状态（显示横线）。这是一个**必填属性** |
| **onChanged**     | `ValueChanged<bool?>?` | 用户点击复选框时触发的回调，参数为切换后的新状态值。设为 `null` 时复选框进入**禁用状态**，无法点击 |
| **tristate**      | `bool`                 | 是否启用三态模式。默认为 false（仅在选中和未选中之间切换）；设为 true 时，点击循环顺序为：未选中 → 选中 → 不确定 → 未选中 |
| **activeColor**   | `Color?`               | 复选框处于**选中状态**时的填充背景颜色，默认跟随 CupertinoTheme 的主题色 |
| **checkColor**    | `Color?`               | 选中状态下**勾号标记**本身的颜色，默认为白色                 |
| **inactiveColor** | `Color?`               | 复选框处于**未选中状态**时的边框颜色                         |
| **focusColor**    | `Color?`               | 复选框获取焦点时的高亮颜色，主要用于键盘导航或辅助功能场景   |
| **focusNode**     | `FocusNode?`           | 焦点控制器，用于手动控制复选框的焦点获取与释放               |
| **autofocus**     | `bool`                 | 是否在页面加载后自动获取焦点，默认为 false                   |
| **side**          | `BorderSide?`          | 复选框未选中状态下的边框样式，可自定义边框的颜色、粗细等     |
| **shape**         | `OutlinedBorder?`      | 复选框的形状，可自定义为圆角矩形等不同外形，默认为 iOS 风格的圆角方框 |



## 11. CupertinoRadio

------

### 一、概述

CupertinoRadio 是 Flutter 提供的 **iOS 风格单选按钮组件**，用于在一组互斥的选项中让用户选择且仅能选择其中一个，选中时显示内部实心圆点标记。

------

### 二、核心属性

| 属性名                | 数据类型            | 属性说明                                                     |
| :-------------------- | :------------------ | :----------------------------------------------------------- |
| **value**             | `T`                 | 该单选按钮**自身代表的值**。这是一个泛型类型，可以是字符串、枚举、数字等任意类型。这是一个**必填属性** |
| **groupValue**        | `T?`                | 当前这一组单选按钮中**被选中的那个值**。当 groupValue 等于本按钮的 value 时，该按钮显示为选中状态。这是一个**必填属性** |
| **onChanged**         | `ValueChanged<T?>?` | 用户点击该单选按钮时触发的回调，参数为该按钮的 value 值。设为 `null` 时按钮进入**禁用状态**，无法点击 |
| **toggleable**        | `bool`              | 是否允许取消选中。默认为 false，即选中后不能再点击同一按钮取消；设为 true 时，再次点击已选中的按钮会取消选中，此时 onChanged 回调参数为 `null` |
| **activeColor**       | `Color?`            | 单选按钮处于**选中状态**时的填充颜色，默认跟随 CupertinoTheme 的主题色 |
| **inactiveColor**     | `Color?`            | 单选按钮处于**未选中状态**时的边框颜色                       |
| **fillColor**         | `Color?`            | 选中状态下内部实心圆点的颜色                                 |
| **focusColor**        | `Color?`            | 按钮获取焦点时的高亮颜色，主要用于键盘导航或辅助功能场景     |
| **focusNode**         | `FocusNode?`        | 焦点控制器，用于手动控制单选按钮的焦点获取与释放             |
| **autofocus**         | `bool`              | 是否在页面加载后自动获取焦点，默认为 false                   |
| **useCheckmarkStyle** | `bool`              | 是否使用勾号样式替代传统的实心圆点样式。设为 true 时，选中状态显示为 iOS 风格的勾号标记，而非默认的圆点 |



## 12. CupertinoActivityIndicator

### 一、概述

CupertinoActivityIndicator 是 Flutter 提供的 **iOS 风格加载指示器**，用于在数据请求或耗时操作期间向用户展示一个持续旋转的菊花状等待动画，表示"正在加载中"。

------

### 二、核心属性

| 属性名        | 数据类型 | 属性说明                                                     |
| :------------ | :------- | :----------------------------------------------------------- |
| **animating** | `bool`   | 控制指示器是否执行旋转动画。设为 `true` 时持续旋转，设为 `false` 时静止不动。默认为 `true` |
| **radius**    | `double` | 指示器的半径大小，数值越大，菊花图案越大。默认值为 10.0      |
| **color**     | `Color?` | 指示器的颜色。若不设置，默认会跟随当前 Cupertino 主题中的活动指示器颜色（通常为灰色） |

> **补充说明**：该组件非常轻量，没有复杂的子属性嵌套。以上三个属性已覆盖日常开发中绝大多数使用场景。

------

### 三、构造函数

#### `CupertinoActivityIndicator.partiallyRevealed`

**使用场景**：专门用于"下拉刷新"等需要根据用户手势进度来**逐步显露**指示器的交互场景。例如，用户手指下拉得越多，菊花图案就逐渐从无到有地显现出来，而不是一上来就完整旋转。

**独有核心参数**：

| 属性名       | 数据类型 | 属性说明                                                     |
| :----------- | :------- | :----------------------------------------------------------- |
| **progress** | `double` | 控制指示器的显露程度，取值范围为 0.0 到 1.0。0.0 表示完全不可见，1.0 表示完全显露。通常将此值与用户的下拉距离进行绑定，实现渐进式的视觉反馈。默认值为 1.0 |

> **与默认构造函数的区别**：默认构造函数创建的是一个自动旋转的完整指示器；而 `partiallyRevealed` 创建的是一个**静止的、根据进度值部分显示**的指示器，强调的是"逐步展现"而非"持续旋转"。



## 13. CupertinoAlertDialog

### 一、概述

CupertinoAlertDialog 是 Flutter 提供的 **iOS 风格弹出式警告对话框**，用于在屏幕中央弹出一个圆角半透明面板，向用户展示重要提示信息并提供操作按钮（如"确认"或"取消"），通常需要用户做出选择后才能继续操作。

------

### 二、核心属性

| 属性名                     | 数据类型            | 属性说明                                                     |
| :------------------------- | :------------------ | :----------------------------------------------------------- |
| **title**                  | `Widget?`           | 对话框顶部的标题区域，一般放置一个文本组件来显示简短的标题，如"提示"或"警告" |
| **content**                | `Widget?`           | 标题下方的正文内容区域，用于展示具体的提示信息或说明文字。当内容过长时会自动支持滚动 |
| **actions**                | `List<Widget>`      | 对话框底部的操作按钮列表。通常放入 **CupertinoDialogAction** 组件。当按钮为两个时水平并排显示，超过两个时自动切换为垂直堆叠排列 |
| **scrollController**       | `ScrollController?` | 用于控制 content 区域的滚动行为，当正文内容特别长需要精细控制滚动位置时使用 |
| **actionScrollController** | `ScrollController?` | 用于控制 actions 区域的滚动行为，当操作按钮数量很多导致需要滚动时使用 |

> **关于 CupertinoDialogAction（actions 的常用子组件）**

| 属性名                  | 数据类型        | 属性说明                                                     |
| :---------------------- | :-------------- | :----------------------------------------------------------- |
| **child**               | `Widget`        | 按钮上显示的内容，通常是一个文本组件                         |
| **onPressed**           | `VoidCallback?` | 按钮被点击时触发的回调。设为 `null` 时按钮会呈现禁用状态     |
| **isDefaultAction**     | `bool`          | 设为 `true` 时，该按钮文字会加粗显示，表示这是推荐的默认操作。默认为 `false` |
| **isDestructiveAction** | `bool`          | 设为 `true` 时，该按钮文字会变为红色，表示这是一个具有破坏性的危险操作（如删除）。默认为 `false` |
| **textStyle**           | `TextStyle?`    | 自定义按钮文字的样式                                         |



------

### 三、使用要点

- CupertinoAlertDialog **本身不会自动弹出**，需要通过 `showCupertinoDialog` 函数来将其以模态弹窗的形式展示到屏幕上。
- `showCupertinoDialog` 中的 **barrierDismissible** 参数可以控制点击对话框外部的半透明遮罩区域是否关闭对话框，默认为 `false`（即必须点按钮才能关闭）。
- 关闭对话框的标准做法是在按钮的回调中调用 Navigator 的 pop 方法。

## 14. CupertinoDialogAction

### 一、概述

CupertinoDialogAction 是专门用于 **iOS 风格对话框（CupertinoAlertDialog）底部操作区域的按钮组件**，负责为用户提供"确认"、"取消"、"删除"等可点击的操作选项。

------

### 二、核心属性

| 属性名                  | 数据类型        | 属性说明                                                     |
| :---------------------- | :-------------- | :----------------------------------------------------------- |
| **child**               | `Widget`        | 按钮上显示的内容，通常放置一个文本组件来展示按钮文字，如"确定"或"取消" |
| **onPressed**           | `VoidCallback?` | 按钮被点击时执行的回调函数。若设为 `null`，按钮将呈现半透明的禁用状态，无法响应任何点击 |
| **isDefaultAction**     | `bool`          | 是否标记为默认推荐操作。设为 `true` 时，按钮文字会自动 **加粗** 显示，向用户暗示"这是建议选择的操作"。默认为 `false` |
| **isDestructiveAction** | `bool`          | 是否标记为破坏性/危险操作。设为 `true` 时，按钮文字会自动变为 **红色**，警示用户该操作不可逆（如删除、移除）。默认为 `false` |
| **textStyle**           | `TextStyle?`    | 自定义按钮文字的样式。若不设置，组件会根据 `isDefaultAction` 和 `isDestructiveAction` 的状态自动应用合适的默认样式 |



------

### 三、使用要点

- CupertinoDialogAction **不能单独使用**，它是专门为 CupertinoAlertDialog 的 `actions` 列表设计的子组件，脱离对话框上下文将失去正确的视觉表现（分隔线、布局排列等）。
- 当对话框中有 **两个** CupertinoDialogAction 时，它们会自动 **水平并排** 显示；当有 **三个及以上** 时，会自动切换为 **垂直堆叠** 排列。
- `isDefaultAction` 和 `isDestructiveAction` 可以 **同时设为 true**，此时按钮文字既加粗又显示为红色，但实际开发中这种组合较为少见。
- 按钮被按下时，会自动呈现一个轻微的高亮反馈效果，无需额外配置。



## 15. CupertinoActionSheet

### 一、概述

CupertinoActionSheet 是 Flutter 提供的 **iOS 风格底部弹出式操作面板**，用于从屏幕底部滑出一个圆角半透明面板，向用户提供一组与当前情境相关的操作选项（如"拍照"、"从相册选择"、"删除"等），并附带一个独立的"取消"按钮。

------

### 二、核心属性

| 属性名                      | 数据类型            | 属性说明                                                     |
| :-------------------------- | :------------------ | :----------------------------------------------------------- |
| **title**                   | `Widget?`           | 面板顶部的标题区域，通常放置一个文本组件来简要说明操作的上下文，如"选择照片来源"。文字默认以较小的灰色字体显示 |
| **message**                 | `Widget?`           | 紧跟标题下方的补充说明区域，用于提供更详细的描述信息。若同时设置了 title 和 message，两者会上下排列显示 |
| **actions**                 | `List<Widget>`      | 操作选项按钮列表，通常放入 **CupertinoActionSheetAction** 组件。各按钮之间会自动以细分隔线隔开，并垂直堆叠排列。选项过多时该区域支持滚动 |
| **cancelButton**            | `Widget?`           | 面板最底部独立显示的"取消"按钮，与上方的 actions 区域之间存在一段明显的间距，视觉上完全分离。通常也放入一个 CupertinoActionSheetAction 组件 |
| **actionScrollController**  | `ScrollController?` | 用于控制 actions 区域的滚动行为，当操作选项数量很多需要精细控制滚动位置时使用 |
| **messageScrollController** | `ScrollController?` | 用于控制 title 和 message 区域的滚动行为，当标题与说明文字内容特别长时使用 |

> **关于 CupertinoActionSheetAction（actions 的常用子组件）**

| 属性名                  | 数据类型       | 属性说明                                                     |
| :---------------------- | :------------- | :----------------------------------------------------------- |
| **child**               | `Widget`       | 按钮上显示的内容，通常是一个文本组件                         |
| **onPressed**           | `VoidCallback` | 按钮被点击时触发的回调函数，**必填项**                       |
| **isDefaultAction**     | `bool`         | 设为 `true` 时，按钮文字会 **加粗** 显示，标记为推荐操作。默认为 `false` |
| **isDestructiveAction** | `bool`         | 设为 `true` 时，按钮文字会变为 **红色**，警示这是一个危险操作。默认为 `false` |



------

### 三、使用要点

- CupertinoActionSheet **不会自动弹出**，需要通过 `showCupertinoModalPopup` 函数将其以底部弹窗的形式展示。该函数会自动为面板添加从底部向上滑入的动画以及半透明的背景遮罩。
- **cancelButton 的位置是固定的**，它始终独立于 actions 区域之外、显示在面板的最底部，与操作选项之间有明显的视觉间隔，这是 iOS 设计规范的标准做法。
- title 和 message **都是可选的**，可以只设其中一个，也可以都不设，直接展示操作按钮列表。
- 关闭面板的标准做法是在按钮的回调中调用 Navigator 的 pop 方法。
- 点击背景遮罩区域默认即可关闭面板，无需额外配置。



## 16. CupertinoDatePicker

### 一、概述

CupertinoDatePicker 是 Flutter 提供的 **iOS 风格滚轮式日期时间选择器**，通过上下滑动多列滚轮来选取日期、时间或日期与时间的组合值。

------

### 二、核心属性

| 属性名                | 数据类型                  | 属性说明                                                     |
| :-------------------- | :------------------------ | :----------------------------------------------------------- |
| **mode**              | `CupertinoDatePickerMode` | 选择器的工作模式，决定滚轮显示哪些列。详见下方模式说明       |
| **onDateTimeChanged** | `ValueChanged<DateTime>`  | 用户滚动滚轮导致选中值发生变化时触发的回调函数，**必填项**。每次滚轮停到新值时都会被调用，并将最新的 DateTime 传出 |
| **initialDateTime**   | `DateTime?`               | 选择器初始显示的日期时间值。若不设置，默认为当前系统时间。该值必须在 minimumDate 和 maximumDate 的范围之内 |
| **minimumDate**       | `DateTime?`               | 可选的最早日期时间，早于此值的选项将无法被选中（滚轮滚动到该位置时会被弹回） |
| **maximumDate**       | `DateTime?`               | 可选的最晚日期时间，晚于此值的选项将无法被选中               |
| **minimumYear**       | `int`                     | 年份滚轮的最小年份，默认为 1。仅在包含日期的模式下生效       |
| **maximumYear**       | `int?`                    | 年份滚轮的最大年份。若不设置，则年份可无限向后滚动           |
| **minuteInterval**    | `int`                     | 分钟列的间隔步长，默认为 1。可设为 5、10、15、30 等，使分钟列仅显示这些间隔值（如 0、5、10、15…）。必须能被 60 整除 |
| **use24hFormat**      | `bool`                    | 是否使用 24 小时制。设为 `true` 时显示 0～23 小时，设为 `false` 时显示 1～12 小时并附带 AM/PM 列。默认为 `false` |
| **dateOrder**         | `DatePickerDateOrder?`    | 日期列的排列顺序（年、月、日之间的先后位置）。可选值包括：年月日、日月年、月日年、月年日。若不设置，会根据当前语言区域自动决定 |
| **backgroundColor**   | `Color?`                  | 选择器的背景颜色                                             |
| **showDayOfWeek**     | `bool`                    | 是否在日期模式中额外显示"星期几"这一列。默认为 `false`       |

> **CupertinoDatePickerMode 模式说明**

| 模式值          | 说明                                                         |
| :-------------- | :----------------------------------------------------------- |
| **dateAndTime** | 同时显示日期和时间列（默认模式），左侧为日期，右侧为小时和分钟 |
| **date**        | 仅显示日期列：年、月、日                                     |
| **time**        | 仅显示时间列：小时、分钟（以及可能的 AM/PM）                 |
| **monthYear**   | 仅显示月份和年份列，不包含"日"                               |



------

### 三、使用要点

- CupertinoDatePicker **本身不会自动弹出**，它是一个需要嵌入到其他容器中的内联组件。常见做法是将其放入一个固定高度的容器中，再通过 `showCupertinoModalPopup` 从屏幕底部弹出。
- 该组件 **必须被赋予明确的高度约束**，否则会因为滚轮需要无限高度而导致布局报错。通常将其包裹在一个设定了固定高度（如 216 逻辑像素）的容器中。
- `onDateTimeChanged` 是 **必填的**，该组件不会自行维护选中状态，需要在回调中接收新值并通过状态管理保存下来。
- `initialDateTime` 若设置的值超出 minimumDate 与 maximumDate 的范围，运行时会直接报错。



## 17. CupertinoTimerPicker

------

### 一、概述

CupertinoTimerPicker 是一个 iOS 风格的**倒计时时长选择器**，以多列滚轮的形式让用户选取一段时间长度（时、分、秒），常见于计时器、倒计时等需要用户设定"一段持续时间"的场景。

------

### 二、核心属性

| 属性名                     | 数据类型                   | 属性说明                                                     |
| :------------------------- | :------------------------- | :----------------------------------------------------------- |
| **onTimerDurationChanged** | `ValueChanged<Duration>`   | 用户每次滚动滚轮导致时长发生变化时的回调，会将最新选中的总时长传递出来。**必填属性**。 |
| **mode**                   | `CupertinoTimerPickerMode` | 控制选择器显示哪些列。有三个可选值：**hm**（时+分，默认值）、**ms**（分+秒）、**hms**（时+分+秒）。 |
| **initialTimerDuration**   | `Duration`                 | 选择器打开时默认停留的初始时长，默认为零时长。该值只在首次构建时生效。 |
| **minuteInterval**         | `int`                      | 分钟列每两个相邻可选值之间的间隔。例如设为 5，则分钟列只会出现 0、5、10、15…。必须是 60 的因数，默认为 1。 |
| **secondInterval**         | `int`                      | 秒钟列每两个相邻可选值之间的间隔，规则与 minuteInterval 相同。必须是 60 的因数，默认为 1。仅在 mode 包含秒列时有意义。 |
| **alignment**              | `AlignmentGeometry`        | 控制选择器在其父容器中的对齐方式，默认居中。                 |
| **backgroundColor**        | `Color?`                   | 选择器整体的背景颜色。不设置时将使用系统默认的 Cupertino 风格背景。 |
| **itemExtent**             | `double`                   | 滚轮中每一行的高度（像素），直接影响单个选项的视觉大小和滚轮的整体紧凑程度，默认值约为 32。 |



------

### 三、补充要点

1. **它选的是"时长"而非"时刻"**
   与 CupertinoDatePicker 不同，CupertinoTimerPicker 产出的结果是一个 Duration（例如 2 小时 30 分钟），而不是一个具体的日期或钟点。适合"设定倒计时"这类场景，不适合"选择几点几分"的需求。
2. **滚轮高度需要足够空间**
   该组件本身不会自动撑满或收缩，通常需要将它放在一个有明确高度约束的容器中（如固定高度的盒子或底部弹出面板），否则可能出现布局溢出。
3. **interval 必须能整除 60**
   minuteInterval 和 secondInterval 的值只能是 1、2、3、4、5、6、10、12、15、20、30、60 中的一个，设置其他值会直接报错。
4. **initialTimerDuration 必须与 interval 对齐**
   初始时长中分钟和秒钟的部分必须刚好能被对应的 interval 整除，否则同样会报错。例如 interval 设为 5 时，初始时长不能包含 3 分钟这种无法被 5 整除的值。



## 18. CupertinoPicker

------

### 一、概述

CupertinoPicker 是一个 iOS 风格的**通用滚轮选择器**，以垂直滚动的圆柱形转轮呈现一组选项，用户通过上下滑动来选中其中某一项，适用于任何自定义列表的单项选择场景。

------

### 二、核心属性

| 属性名                    | 数据类型                       | 属性说明                                                     |
| :------------------------ | :----------------------------- | :----------------------------------------------------------- |
| **itemExtent**            | `double`                       | 滚轮中每一行的固定高度（像素）。**必填属性**，所有子项都会被强制约束为该高度。 |
| **onSelectedItemChanged** | `ValueChanged<int>?`           | 用户滚动导致选中项变化时的回调，传出的是当前选中项的**索引值**（从 0 开始）。 |
| **children**              | `List<Widget>`                 | 滚轮中要展示的所有选项列表，每个选项都是一个普通 Widget（如文本）。**必填属性**。 |
| **scrollController**      | `FixedExtentScrollController?` | 用于控制滚轮的滚动位置。可以通过它设定初始选中项的索引，也可以在外部通过编程方式跳转到指定项。 |
| **diameterRatio**         | `double`                       | 控制滚轮的"弯曲程度"。值越大，圆柱直径越大，视觉上越接近平面列表；值越小，弯曲感越强。默认约为 1.07。 |
| **offAxisFraction**       | `double`                       | 控制滚轮在水平方向上的偏移量。默认为 0（居中），正值使滚轮向右偏，负值向左偏，用于营造透视倾斜效果。 |
| **useMagnifier**          | `bool`                         | 是否对选中区域启用放大镜效果，让当前选中项看起来比周围项更大更清晰。默认为 false。 |
| **magnification**         | `double`                       | 放大镜的放大倍率，仅在 useMagnifier 为 true 时生效。默认为 1.0（不放大），大于 1.0 则放大。 |
| **squeeze**               | `double`                       | 控制滚轮上可见选项的紧凑程度。值越大，同一视区内挤入的选项越多，每项在视觉上被"压扁"；值越小，选项越稀疏。默认为 1.45。 |
| **selectionOverlay**      | `Widget?`                      | 绘制在选中行上方的覆盖层组件，默认是一个带上下细线的半透明高亮条。设为 null 可完全移除该覆盖效果。 |
| **looping**               | `bool`                         | 是否让选项列表无限循环滚动。设为 true 后，滚到末尾会无缝衔接回开头，适合选项较少时提升操作流畅度。默认为 false。 |
| **backgroundColor**       | `Color?`                       | 滚轮整体的背景颜色。不设置时采用系统默认的 Cupertino 风格背景。 |

------

### 三、构造函数

#### CupertinoPicker.builder

**使用场景**：当选项数量非常多（如数百项），或者选项内容需要按需动态生成时使用。它采用"按需构建"的模式，只有即将显示在屏幕上的选项才会被创建，大幅提升性能。

**独有核心参数**：

| 参数名          | 数据类型                              | 说明                                                         |
| :-------------- | :------------------------------------ | :----------------------------------------------------------- |
| **itemBuilder** | `Widget? Function(BuildContext, int)` | 根据索引按需构建每一项的回调函数。当某项即将滚入可视区域时才会被调用，返回 null 表示该索引无对应项。 |
| **childCount**  | `int?`                                | 选项的总数量。设为 null 时表示选项数量无限（配合 itemBuilder 实现无限滚动）；设为具体数值时表示有限列表。 |

与默认构造函数的核心区别：默认构造函数通过 children 一次性传入所有选项 Widget，适合选项少的场景；而 builder 构造函数通过 itemBuilder 逐个按需生成，适合选项多或内容动态的场景。



## 19. CupertinoTabScaffold

------

### 一、概述

CupertinoTabScaffold 是一个 iOS 风格的**底部标签页脚手架**，将底部标签栏与多个标签页内容区域整合在一起，负责管理标签切换并为每个标签页维护独立的导航状态和页面状态。

------

### 二、核心属性

| 属性名                       | 数据类型                  | 属性说明                                                     |
| :--------------------------- | :------------------------ | :----------------------------------------------------------- |
| **tabBar**                   | `CupertinoTabBar`         | 底部标签栏组件。**必填属性**。通过它定义标签的图标、文字、数量、选中颜色等。标签的数量由该标签栏中 items 列表的长度决定。 |
| **tabBuilder**               | `IndexedWidgetBuilder`    | 根据标签索引按需构建对应页面内容的回调。**必填属性**。每次切换标签时，框架会传入当前标签的索引，由你返回该标签页应展示的完整页面 Widget。 |
| **controller**               | `CupertinoTabController?` | 标签页控制器，用于在外部程序化地控制当前选中的标签索引，也可监听标签切换事件。不传时会自动创建一个默认控制器。 |
| **backgroundColor**          | `Color?`                  | 整个标签页内容区域（标签栏后方）的背景颜色。不设置时使用 CupertinoTheme 中的默认背景色。 |
| **resizeToAvoidBottomInset** | `bool`                    | 当软键盘弹出时，是否自动调整内容区域的大小以避免被键盘遮挡。默认为 true。 |
| **restorationId**            | `String?`                 | 用于状态恢复的唯一标识。设定后，当应用被系统回收再恢复时，能自动记住用户上次停留在哪个标签页。 |



------

### 三、补充要点

1. **每个标签页拥有独立的导航栈**
   这是 CupertinoTabScaffold 最核心的特性。在 tabBuilder 中为每个标签页包裹一个 CupertinoTabView 后，每个标签页会拥有自己独立的页面跳转历史。用户在 A 标签页中进入了深层页面，切换到 B 标签页再切回 A 时，A 标签页仍停留在之前的深层页面，而不会被重置。
2. **与 CupertinoTabBar 强绑定**
   tabBar 属性的类型被限定为 CupertinoTabBar，不能传入其他任意 Widget。标签的数量、图标、文字等全部在 CupertinoTabBar 的 items 属性中通过 BottomNavigationBarItem 列表来定义。
3. **tabBuilder 的延迟构建机制**
   tabBuilder 只会在某个标签首次被选中时才构建该页面，已构建过的页面会被保留在内存中而非销毁，这保证了切换标签时的流畅性和状态保持。
4. **controller 的典型用途**
   当需要从非标签栏的位置（如页面内的按钮）切换标签时，可以通过 CupertinoTabController 的 index 属性直接设定目标标签索引来实现跳转。
5. **与 Material 体系的对应关系**
   CupertinoTabScaffold 在功能上对应 Material 体系中 Scaffold 搭配 BottomNavigationBar 的组合，但它是完全按照 iOS 的交互规范设计的，包括标签切换动画、页面过渡效果等。



## 20. CupertinoTabBar

------

### 一、概述

CupertinoTabBar 是一个 iOS 风格的**底部标签导航栏**，固定显示在屏幕底部，通过一排图标加文字的标签项让用户在不同功能页面之间快速切换。

------

### 二、核心属性

| 属性名              | 数据类型                        | 属性说明                                                     |
| :------------------ | :------------------------------ | :----------------------------------------------------------- |
| **items**           | `List<BottomNavigationBarItem>` | 标签项列表。**必填属性**。每个 BottomNavigationBarItem 包含 icon（默认图标）、activeIcon（选中时图标）、label（文字标签）等。列表长度至少为 2。 |
| **onTap**           | `ValueChanged<int>?`            | 用户点击某个标签项时的回调，传出被点击项的索引值（从 0 开始）。在 CupertinoTabScaffold 中使用时通常不需要手动设置，脚手架会自动处理。 |
| **currentIndex**    | `int`                           | 当前选中标签的索引，默认为 0（第一项）。该值决定哪个标签显示为高亮选中状态。 |
| **activeColor**     | `Color?`                        | 选中标签的图标和文字颜色。不设置时默认使用 CupertinoTheme 中的主题主色。 |
| **inactiveColor**   | `Color`                         | 未选中标签的图标和文字颜色。默认为系统预设的灰色调。         |
| **backgroundColor** | `Color?`                        | 标签栏整体的背景颜色。默认带有 iOS 特有的半透明磨砂效果。    |
| **iconSize**        | `double`                        | 标签项中图标的大小，默认为 30.0。                            |
| **height**          | `double`                        | 标签栏的整体高度（不含底部安全区域），默认约为 50.0。系统会自动在底部额外加上安全区域的高度以适配全面屏设备。 |
| **border**          | `Border?`                       | 标签栏的边框设置，默认在顶部有一条细微的分隔线。设为 null 可移除所有边框。 |



------

### 三、补充要点

1. **通常与 CupertinoTabScaffold 搭配使用**
   CupertinoTabBar 最常见的用法是作为 CupertinoTabScaffold 的 tabBar 属性传入。在这种模式下，标签切换的状态管理、页面构建都由脚手架自动完成，无需手动处理 onTap 和 currentIndex 的联动。
2. **也可以独立使用**
   如果不使用 CupertinoTabScaffold，CupertinoTabBar 也可以单独放在任何页面布局中。此时需要自行管理 currentIndex 的状态，并在 onTap 回调中更新索引值来驱动标签的选中切换。
3. **自动适配全面屏**
   标签栏会自动检测设备底部的安全区域（如 iPhone 的 Home Indicator 区域），并在 height 的基础上额外增加相应的内边距，确保标签项不会被遮挡。
4. **磨砂半透明效果**
   默认的 backgroundColor 并非纯色，而是一种 iOS 风格的半透明毛玻璃效果——当页面内容滚动经过标签栏下方时，可以隐约透视到下层内容。如果手动设置了一个完全不透明的颜色，该效果会消失。
5. **items 中的 activeIcon**
   每个 BottomNavigationBarItem 可以分别为选中和未选中状态指定不同的图标。如果只设置了 icon 而未设置 activeIcon，则两种状态共用同一图标，仅通过颜色区分。

## 21. CupertinoContextMenu

------

### 一、概述

CupertinoContextMenu 是 Flutter 提供的 iOS 风格长按弹出式上下文菜单组件，当用户对某个元素持续按压时，该元素会浮起放大，同时背景模糊化，并在下方弹出一组操作选项供用户选择。

------

### 二、核心属性

| 属性名                   | 数据类型       | 属性说明                                                     |
| :----------------------- | :------------- | :----------------------------------------------------------- |
| **child**                | `Widget`       | 被长按触发菜单的目标组件，即用户手指按住的那个元素           |
| **actions**              | `List<Widget>` | 长按后弹出的操作按钮列表，通常使用 `CupertinoContextMenuAction` 作为列表项 |
| **enableHapticFeedback** | `bool`         | 是否在菜单弹出时触发设备震动反馈，默认为 `false`             |

#### 常用搭配组件：CupertinoContextMenuAction 核心属性

| 属性名                  | 数据类型        | 属性说明                                                     |
| :---------------------- | :-------------- | :----------------------------------------------------------- |
| **child**               | `Widget`        | 操作按钮上显示的内容，一般为一段文字                         |
| **onPressed**           | `VoidCallback?` | 用户点击该操作项时触发的回调                                 |
| **isDefaultAction**     | `bool`          | 设为 `true` 时，文字会以**加粗**样式呈现，表示这是推荐的默认操作 |
| **isDestructiveAction** | `bool`          | 设为 `true` 时，文字会以**红色**样式呈现，用于警示性操作（如删除） |
| **trailingIcon**        | `IconData?`     | 显示在操作项右侧的图标，用于给操作增加视觉辨识度             |

------

### 三、构造函数

#### CupertinoContextMenu.builder

**使用场景：** 当你希望在长按动画过程中自定义预览区域的外观时使用。默认构造函数中，长按浮起的预览就是 `child` 本身；而此构造函数允许你根据动画进度，动态改变预览区域的大小、圆角、内容等，实现更精细的视觉效果控制。

**独有核心参数：**

| 属性名      | 数据类型                      | 属性说明                                                     |
| :---------- | :---------------------------- | :----------------------------------------------------------- |
| **builder** | `CupertinoContextMenuBuilder` | 一个构建函数，接收两个参数：一个是当前的动画对象（反映菜单从收起到完全展开的进度），另一个是内部自动传入的子组件引用。你可以根据动画进度值来决定预览区域在不同阶段呈现什么样的外观 |

> **要点区分：** 使用此构造函数时不再传入 `child`，而是通过 `builder` 完全接管预览内容的构建逻辑。两者互斥，只能选其一。



## 22. CupertinoListSection

------

### 一、概述

CupertinoListSection 是 Flutter 提供的 iOS 风格分组列表容器组件，用于将多个列表项（通常是 CupertinoListTile）组织成带有标题、尾注和分隔线的分组区块，呈现出 iOS 系统设置页面中常见的分组列表样式。

------

### 二、核心属性

| 属性名                      | 数据类型              | 属性说明                                                     |
| :-------------------------- | :-------------------- | :----------------------------------------------------------- |
| **children**                | `List<Widget>`        | 分组内的列表项集合，通常放入多个 `CupertinoListTile`         |
| **header**                  | `Widget?`             | 显示在分组上方的标题区域，常用于说明该分组的类别             |
| **footer**                  | `Widget?`             | 显示在分组下方的补充说明区域，常用于对该分组的备注提示       |
| **decoration**              | `BoxDecoration?`      | 分组容器的装饰，可自定义背景色、圆角、边框等视觉样式         |
| **backgroundColor**         | `Color?`              | 分组区块之外的整体背景色，即分组与分组之间的底色             |
| **dividerMargin**           | `double`              | 列表项之间分隔线的起始缩进距离                               |
| **additionalDividerMargin** | `double`              | 在 `dividerMargin` 基础上额外追加的缩进量，用于配合有前导图标的场景做精细对齐 |
| **hasLeading**              | `bool`                | 声明子项是否含有前导组件（如头像、图标），框架会据此自动调整分隔线缩进，默认为 `true` |
| **topMargin**               | `double`              | 分组区块顶部与上方内容之间的间距                             |
| **margin**                  | `EdgeInsetsGeometry?` | 分组容器的外边距                                             |
| **separatorColor**          | `Color?`              | 列表项之间分隔线的颜色                                       |
| **clipBehavior**            | `Clip`                | 内容超出容器圆角区域时的裁剪方式，默认为 `Clip.hardEdge`     |

------

### 三、构造函数

#### CupertinoListSection.insetGrouped

**使用场景：** 用于创建 iOS 13 之后引入的「内嵌分组」风格列表区块。与默认构造函数相比，该样式的分组容器左右两侧有明显的内缩边距，四个角呈现圆角效果，视觉上更加卡片化，适合现代 iOS 应用的设置页面或信息展示页面。

**独有说明：** 该构造函数并无额外的独有参数，与默认构造函数接收相同的属性。区别在于内部预设了不同的默认值——容器自带圆角、左右内缩边距更大、整体呈现卡片式外观。默认构造函数则呈现传统的全宽分组样式（类似 iOS 12 及更早版本的设置页面），没有明显的圆角和左右缩进。

> **选择要点：** 想要经典的全宽平铺分组就用默认构造函数；想要现代卡片式圆角分组就用 `insetGrouped`。



## 23. CupertinoListTile

------

### 一、概述

CupertinoListTile 是 Flutter 提供的 iOS 风格列表行组件，用于在分组列表中展示一行结构化信息，包含标题、副标题、前导图标和尾部附件等区域，呈现出 iOS 系统设置页面中单行条目的标准外观与交互效果。

------

### 二、核心属性

| 属性名                       | 数据类型              | 属性说明                                                     |
| :--------------------------- | :-------------------- | :----------------------------------------------------------- |
| **title**                    | `Widget`              | 列表行的主标题内容，是唯一必填项，通常为一段文字             |
| **subtitle**                 | `Widget?`             | 显示在主标题下方的副标题，用于补充说明信息，字号更小         |
| **leading**                  | `Widget?`             | 显示在行最左侧的前导组件，通常放置图标或小头像               |
| **trailing**                 | `Widget?`             | 显示在行最右侧的尾部组件，常用于放置箭头图标、开关或辅助文字 |
| **additionalInfo**           | `Widget?`             | 显示在 `trailing` 左侧的额外信息区域，常用于展示灰色辅助文字（如"已开启"） |
| **onTap**                    | `VoidCallback?`       | 用户点击该行时触发的回调函数                                 |
| **backgroundColor**          | `Color?`              | 行的默景色                                                   |
| **backgroundColorActivated** | `Color?`              | 用户手指按下时行的背景色，用于营造点击反馈效果               |
| **leadingSize**              | `double`              | 前导组件区域的尺寸约束，默认为 28.0                          |
| **leadingToTitle**           | `double`              | 前导组件与标题之间的水平间距，默认为 16.0                    |
| **padding**                  | `EdgeInsetsGeometry?` | 整行内容的内边距                                             |

------

### 三、构造函数

#### CupertinoListTile.notched

**使用场景：** 用于创建「缺口式」列表行，专门搭配 `CupertinoListSection.insetGrouped` 使用。与默认构造函数相比，该样式下前导组件的尺寸更大（默认为 30.0），前导与标题间距更宽，整体行高更高，视觉上更接近 iOS 系统中带有圆角应用图标的那种设置列表条目风格。

**独有说明：** 该构造函数没有额外的独有参数，接收的属性与默认构造函数完全相同。区别在于内部预设了不同的默认尺寸值——前导区域更大、内边距更宽松、整行更高，从而呈现出更加宽敞、适配圆角图标的视觉效果。

> **选择要点：** 普通列表行用默认构造函数；需要展示较大图标且搭配 `insetGrouped` 分组使用时选 `notched`。



## 24. CupertinoFormSection

------

### 一、概述

CupertinoFormSection 是 Flutter 提供的 iOS 风格表单分组容器组件，用于将多个表单输入项（如文本输入框、开关、选择器等）组织成带有标题、尾注和分隔线的分组区块，呈现出 iOS 系统中常见的表单分区样式。

------

### 二、核心属性

| 属性名                      | 数据类型              | 属性说明                                                     |
| :-------------------------- | :-------------------- | :----------------------------------------------------------- |
| **children**                | `List<Widget>`        | 分组内的表单项集合，通常放入 `CupertinoTextFormFieldRow`、`CupertinoFormRow` 等表单行组件 |
| **header**                  | `Widget?`             | 显示在分组上方的标题区域，用于标明该组表单的类别（如"个人信息"） |
| **footer**                  | `Widget?`             | 显示在分组下方的说明区域，用于补充提示或备注信息             |
| **decoration**              | `BoxDecoration?`      | 分组容器的装饰样式，可自定义背景色、圆角、边框等             |
| **backgroundColor**         | `Color?`              | 分组区块之外的整体底色，即分组与分组之间的背景色             |
| **dividerMargin**           | `double`              | 表单项之间分隔线的起始缩进距离                               |
| **additionalDividerMargin** | `double`              | 在 `dividerMargin` 基础上额外追加的缩进量，用于配合含前导组件的表单行做精细对齐 |
| **margin**                  | `EdgeInsetsGeometry?` | 分组容器的外边距                                             |
| **clipBehavior**            | `Clip`                | 内容超出容器圆角区域时的裁剪方式，默认为 `Clip.hardEdge`     |
| **separatorColor**          | `Color?`              | 表单项之间分隔线的颜色                                       |

------

### 三、构造函数

#### CupertinoFormSection.insetGrouped

**使用场景：** 用于创建 iOS 13 之后引入的「内嵌圆角卡片式」表单分组。与默认构造函数的全宽平铺样式不同，该样式下分组容器左右两侧明显内缩，四角带有圆角，整体呈现卡片化的现代外观，适合构建符合当前 iOS 设计规范的表单页面。

**独有说明：** 该构造函数没有额外的独有参数，接收的属性与默认构造函数完全一致。区别在于内部预设了不同的默认值——容器自带圆角、左右内缩边距更大，从而自动呈现卡片式分组效果。

> **选择要点：** 想要传统全宽分组风格（类似 iOS 12 及更早版本）用默认构造函数；想要现代圆角卡片分组风格用 `insetGrouped`。

------

### 四、与 CupertinoListSection 的区别

两者在外观结构上几乎一致，核心差异在于**语义定位**不同：

- **CupertinoListSection** 面向「信息展示」场景，内部放置 `CupertinoListTile` 等展示型列表行。
- **CupertinoFormSection** 面向「数据采集」场景，内部放置 `CupertinoTextFormFieldRow`、`CupertinoFormRow` 等可交互的表单输入行，且能够与 Flutter 的 `Form` 组件协同完成表单校验。



## 25. CupertinoFormRow

------

### 一、概述

CupertinoFormRow 是 Flutter 提供的 iOS 风格表单行布局组件，用于在表单分组中为任意表单控件提供统一的行级排版结构，包含左侧标签、右侧控件区域以及下方的辅助提示和错误信息区域。

------

### 二、核心属性

| 属性名      | 数据类型              | 属性说明                                                     |
| :---------- | :-------------------- | :----------------------------------------------------------- |
| **child**   | `Widget`              | 行内的主体表单控件，放置在行的右侧区域，如开关、滑块、选择器等任意可交互组件 |
| **prefix**  | `Widget?`             | 显示在行左侧的标签内容，通常为一段描述性文字（如"用户名"、"通知"），用于说明右侧控件的用途 |
| **helper**  | `Widget?`             | 显示在行下方的辅助提示信息，字号较小，用于给用户提供额外的填写指引 |
| **error**   | `Widget?`             | 显示在行下方的错误提示信息，通常以红色文字呈现，用于展示表单校验失败时的反馈 |
| **padding** | `EdgeInsetsGeometry?` | 整行内容的内边距                                             |



------

### 三、与相关组件的关系

| 对比维度     | CupertinoFormRow                                           | CupertinoTextFormFieldRow                |
| :----------- | :--------------------------------------------------------- | :--------------------------------------- |
| **定位**     | 通用表单行容器，`child` 可放入任意控件                     | 专用文本输入表单行，内部已集成文本输入框 |
| **适用场景** | 需要在表单行中放置开关、滑块、日期选择器等非文本控件时使用 | 需要在表单行中进行文本输入时使用         |
| **灵活性**   | 高，控件类型不受限                                         | 低，仅限文本输入                         |

> **要点：** CupertinoTextFormFieldRow 实际上是在 CupertinoFormRow 的基础上内置了一个文本输入框。当你需要放置文本输入以外的表单控件时，就应该使用 CupertinoFormRow 自行组合。



## 26. CupertinoSlidingSegmentedControl

------

### 一、概述

`CupertinoSlidingSegmentedControl` 是 Flutter 提供的一个 **iOS 风格（iOS 13+）的滑动分段选择控件**，用于在一组互斥的选项中让用户选择其中一项，选中项下方会有一个可滑动的浮动滑块来指示当前选中状态。

------

### 二、核心属性

| 属性名              | 数据类型             | 属性说明                                                     |
| :------------------ | :------------------- | :----------------------------------------------------------- |
| **children**        | `Map<T, Widget>`     | 定义所有可选分段的集合。键（Key）代表每个分段对应的值，值（Value）是每个分段上显示的内容（如一段文字）。至少需要提供两个分段。键的类型 `T` 由你自己决定，通常使用整数或枚举。 |
| **groupValue**      | `T?`                 | 当前被选中的分段所对应的键。当它为 `null` 时，表示没有任何分段被选中。它必须是 `children` 中某个键的值，或者为 `null`。 |
| **onValueChanged**  | `ValueChanged<T?>`   | 用户点击或滑动切换分段时触发的回调。回调会把新选中的分段对应的键传递出来，你需要在回调中更新 `groupValue`，界面才会刷新到新的选中状态。 |
| **backgroundColor** | `Color`              | 整个控件的背景颜色，即滑块后面那一层底色。默认是 iOS 风格的半透明灰色。 |
| **thumbColor**      | `Color`              | 滑动滑块（即选中项下方那个浮动白色块）的颜色。默认为白色，并自带轻微阴影，模拟 iOS 原生的质感。 |
| **padding**         | `EdgeInsetsGeometry` | 控件外框与内部各分段之间的内边距。调整它可以控制分段内容与控件边缘的距离。 |



------

### 三、补充要点

**与 CupertinoSegmentedControl 的区别：**
`CupertinoSlidingSegmentedControl` 是 iOS 13 之后的新版视觉风格，特征是拥有一个**浮动滑块**在选项之间平滑滑动；而 `CupertinoSegmentedControl` 是更早期 iOS 风格，选中项以**填充背景色**来区分。两者功能相似，但视觉表现不同，推荐优先使用前者，因为它更贴合当前 iOS 设计规范。



## 27. CupertinoScrollbar

------

### 一、概述

`CupertinoScrollbar` 是 Flutter 提供的一个 **iOS 风格滚动条**组件，用于包裹可滚动内容，在用户滚动时在屏幕边缘显示一个细长的半透明滚动指示条，并支持用户**拖拽该指示条**来快速定位内容位置。

------

### 二、核心属性

| 属性名                     | 数据类型                       | 属性说明                                                     |
| :------------------------- | :----------------------------- | :----------------------------------------------------------- |
| **child**                  | `Widget`                       | 被包裹的可滚动子组件，通常是 `ListView`、`SingleChildScrollView`、`CustomScrollView` 等。滚动条会根据该子组件的滚动状态来同步显示。 |
| **controller**             | `ScrollController?`            | 与子组件共享的滚动控制器。当页面内存在**多个可滚动区域**时，必须显式指定此属性，将滚动条与正确的可滚动组件进行绑定，否则框架会报错。 |
| **thumbVisibility**        | `bool?`                        | 滚动条的滑块是否**始终可见**。默认为 `false`，即只有在滚动时才短暂出现然后自动淡出。设为 `true` 后滑块将常驻显示。 |
| **thickness**              | `double`                       | 滑块在**静止或普通滚动**状态下的粗细（宽度）。默认值为 3 逻辑像素，非常纤细，还原 iOS 原生风格。 |
| **thicknessWhileDragging** | `double`                       | 用户**手指按住并拖拽滑块**时，滑块会动态变粗至此值。默认值为 8 逻辑像素。这是 iOS 特有的交互反馈——按住时滑块变粗，松手后恢复纤细。 |
| **radius**                 | `Radius`                       | 滑块在**静止或普通滚动**状态下的圆角半径。默认值为 1.5，呈现出极细的胶囊形态。 |
| **radiusWhileDragging**    | `Radius`                       | 用户**拖拽滑块时**的圆角半径。默认值为 4.0，配合变粗效果，圆角也会同步变大，视觉过渡非常流畅。 |
| **notificationPredicate**  | `ScrollNotificationPredicate?` | 决定滚动条响应**哪一层级**的滚动通知。默认只响应最近的可滚动祖先。当存在嵌套滚动时，可通过此属性指定监听深度。 |
| **scrollbarOrientation**   | `ScrollbarOrientation?`        | 强制指定滚动条出现的**位置方向**，例如左侧、右侧、顶部或底部。默认情况下根据滚动方向和文字方向自动判定。 |



------

### 三、补充要点

**与 Material 风格 Scrollbar 的核心区别**

> Material 的 `Scrollbar` 组件在视觉上更粗、更方正，且在 Android/Web 平台上自动适配 Material 设计规范。而 `CupertinoScrollbar` 特有的"**按住变粗、松开变细**"的渐变动画效果，是完全模拟 iOS 原生的交互细节，这是两者最明显的体验差异。



## 28. CupertinoPopupSurface

------

### 一、概述

`CupertinoPopupSurface` 是 Flutter Cupertino 库中提供的一个 **iOS 风格弹出层底板容器**，它负责为弹出式组件（如操作菜单、对话框等）提供标准的圆角矩形背景表面与毛玻璃模糊效果，是构建自定义 iOS 风格弹窗的基础视觉载体。

------

### 二、核心属性

| 属性名             | 数据类型  | 属性说明                                                     |
| :----------------- | :-------- | :----------------------------------------------------------- |
| `child`            | `Widget?` | 放置在该弹出表面内部的子组件，即弹窗中实际要展示的内容       |
| `isSurfacePainted` | `bool`    | 是否绘制默认的 iOS 风格背景表面（带有白色半透明底色与模糊效果）。设为 `true`（默认值）时，表面会呈现标准的 iOS 弹窗背景；设为 `false` 时，背景完全透明，仅保留圆角裁剪，适用于需要完全自定义背景样式的场景 |

------

### 三、补充要点

**它在体系中的角色：**
`CupertinoPopupSurface` 本身并不负责弹窗的弹出逻辑、动画或定位，它只关心"这块弹出面板长什么样"。Flutter 官方的 `CupertinoActionSheet`、`CupertinoAlertDialog` 等组件，其内部就是用它来绘制那层标志性的圆角磨砂背景。当你需要构建一个外观完全符合 iOS 设计规范、但内容布局高度自定义的弹窗时，就可以直接使用它作为最外层的视觉容器。



## 29. CupertinoFullscreenDialogTransition

------

### 一、概述

`CupertinoFullscreenDialogTransition` 是 Flutter Cupertino 库中用于实现 **iOS 风格全屏对话框页面过渡动画** 的组件，它驱动新页面从屏幕底部向上滑入，同时让当前页面轻微向后缩退，完整复刻 iOS 系统中弹出全屏模态页面时的标准转场效果。

------

### 二、核心属性

| 属性名                    | 数据类型            | 属性说明                                                     |
| :------------------------ | :------------------ | :----------------------------------------------------------- |
| `primaryRouteAnimation`   | `Animation<double>` | 主路由动画，控制新页面（即全屏对话框）从底部滑入到完全展示的整个动画过程。值从 0.0 到 1.0 表示页面从完全不可见到完全到位 |
| `secondaryRouteAnimation` | `Animation<double>` | 次路由动画，控制当前页面在新对话框弹出时的退让效果。当又有一个新页面在对话框之上被推入时，该动画驱动对话框自身的退让位移 |
| `linearTransition`        | `bool`              | 是否使用线性动画曲线。设为 `true` 时动画匀速进行，通常用于用户手势驱动的交互式返回过程；设为 `false` 时使用 iOS 标准的缓动曲线，产生更自然的加速减速效果 |
| `child`                   | `Widget`            | 被此过渡动画包裹的子组件，即全屏对话框页面中实际要展示的内容 |



------

### 三、补充说明

**它在体系中的角色：**
当你使用 `CupertinoPageRoute` 并将其 `fullscreenDialog` 设为 `true` 时，Flutter 框架内部就会自动使用 `CupertinoFullscreenDialogTransition` 来执行页面转场动画。大多数情况下开发者不需要直接使用它，但当你需要构建完全自定义的路由转场、同时又希望保留 iOS 全屏对话框的原生动画质感时，就可以手动调用它来控制动画行为。

**与 `CupertinoPageTransition` 的区别：**
`CupertinoPageTransition` 实现的是标准的 **左右水平滑动** 转场（普通页面推入），而 `CupertinoFullscreenDialogTransition` 实现的是 **从底部向上垂直滑入** 的转场（全屏模态对话框推入），两者方向和语义完全不同。



## 30. CupertinoPageTransition

------

### 一、概述

`CupertinoPageTransition` 是 Flutter Cupertino 库中用于实现 **iOS 风格标准页面水平滑动转场动画** 的组件，它驱动新页面从屏幕右侧滑入、同时让当前页面向左侧滑出并伴随轻微视差偏移，完整复刻 iOS 系统中普通页面推入和弹出时的标准导航过渡效果。

------

### 二、核心属性

| 属性名                    | 数据类型            | 属性说明                                                     |
| :------------------------ | :------------------ | :----------------------------------------------------------- |
| `primaryRouteAnimation`   | `Animation<double>` | 主路由动画，控制新页面从右侧滑入到完全就位的整个动画进度。值从 0.0 到 1.0 代表页面从完全在屏幕右侧外到完全占据屏幕 |
| `secondaryRouteAnimation` | `Animation<double>` | 次路由动画，控制当前页面在新页面推入时的左移退让效果。当该页面之上又被推入一个新页面时，此动画驱动它自身向左偏移退出 |
| `linearTransition`        | `bool`              | 是否使用线性动画曲线。设为 `true` 时动画匀速运行，适用于用户手指拖拽驱动的交互式侧滑返回；设为 `false` 时使用 iOS 标准缓动曲线，产生自然的加速与减速感 |
| `child`                   | `Widget`            | 被此过渡动画包裹的子组件，即页面中实际要展示的内容           |



------

### 三、补充说明

**它在体系中的角色：**
当你使用 `CupertinoPageRoute`（且未开启 `fullscreenDialog`）进行页面导航时，Flutter 框架内部就会自动调用 `CupertinoPageTransition` 来执行转场动画。绝大多数场景下开发者无需直接使用它，但当你需要完全自定义路由（例如继承 `PageRoute` 自行构建 `buildTransitions`），又想保留 iOS 原生的水平滑动过渡视觉时，就可以手动使用它。

**与 `CupertinoFullscreenDialogTransition` 的区别：**
`CupertinoPageTransition` 的动画方向是 **水平方向**（右进左出），用于常规页面之间的前进与后退导航。而 `CupertinoFullscreenDialogTransition` 的动画方向是 **垂直方向**（底部上滑），专用于全屏模态对话框场景。两者服务于不同的导航语义。

**动画细节：**
该组件不仅做了简单的水平位移，还内置了 iOS 特有的视差效果——当前页面向左退出时的偏移量小于新页面从右侧进入时的偏移量，同时伴有微妙的阴影变化，使得层次感与 iOS 原生体验完全一致。



## 31. CupertinoTheme

------

### 一、概述

`CupertinoTheme` 是 Flutter Cupertino 库中的 **iOS 风格全局主题配置组件**，它通过向下传递一套统一的主题数据（如主色调、文字样式、亮度等），让其子树中所有 Cupertino 系列组件自动继承并应用一致的 iOS 视觉风格。

------

### 二、核心属性

| 属性名  | 数据类型             | 属性说明                                                     |
| :------ | :------------------- | :----------------------------------------------------------- |
| `data`  | `CupertinoThemeData` | 主题数据对象，承载了所有具体的主题配置信息，是整个主题的核心载体。其常用子属性见下方详述 |
| `child` | `Widget`             | 需要应用该主题的子组件树，其内部所有 Cupertino 组件都会自动读取并使用此主题配置 |

**`CupertinoThemeData` 常用子属性：**

| 子属性名                  | 数据类型                  | 属性说明                                                     |
| :------------------------ | :------------------------ | :----------------------------------------------------------- |
| `brightness`              | `Brightness?`             | 应用的亮度模式，可选 `Brightness.light`（浅色模式）或 `Brightness.dark`（深色模式）。决定了整体的明暗基调 |
| `primaryColor`            | `Color?`                  | 主色调，影响导航栏标题、按钮、交互控件等关键元素的默认颜色   |
| `primaryContrastingColor` | `Color?`                  | 主色调的对比色，用于需要与主色调形成强烈视觉反差的场景，例如填充按钮上的文字颜色 |
| `scaffoldBackgroundColor` | `Color?`                  | 页面脚手架的背景色，决定了整个页面最底层的背景颜色           |
| `barBackgroundColor`      | `Color?`                  | 导航栏与标签栏的背景色，通常带有半透明效果以配合 iOS 的模糊背景风格 |
| `textTheme`               | `CupertinoTextThemeData?` | 文字主题，统一配置各级别文字的字体、字号、颜色和字重等样式。其内部又包含 `navTitleTextStyle`（导航栏标题样式）、`actionTextStyle`（操作按钮文字样式）、`textStyle`（通用正文样式）等多个细分属性 |
| `applyThemeToAll`         | `bool?`                   | 设为 `true` 时，主题配置会强制应用到所有 Cupertino 组件（包括部分在 Material 环境下运行的 Cupertino 组件），确保视觉完全统一 |



------

### 三、补充说明

**它在体系中的角色：**
`CupertinoTheme` 在 Cupertino 体系中的地位等同于 Material 体系中的 `Theme`。当你使用 `CupertinoApp` 作为应用入口时，框架内部会自动创建一个 `CupertinoTheme`，你可以通过 `CupertinoApp` 的 `theme` 参数直接配置它。若你需要在子树的某个局部区域覆盖主题样式，也可以在任意位置嵌套一个新的 `CupertinoTheme` 来实现局部主题覆盖。

**如何获取当前主题：**
在子树中的任意位置，都可以通过 `CupertinoTheme.of(context)` 这个静态方法获取到最近的祖先 `CupertinoTheme` 所提供的 `CupertinoThemeData`，从而读取当前生效的主色调、文字样式等主题信息。

**与 Material Theme 的关系：**
当你在 `MaterialApp` 中使用 Cupertino 组件时，Flutter 会尝试从 Material 的 `Theme` 中推导出一套兼容的 `CupertinoThemeData`。但如果你希望精确控制 iOS 风格组件的外观，最可靠的做法仍然是显式配置 `CupertinoTheme`。