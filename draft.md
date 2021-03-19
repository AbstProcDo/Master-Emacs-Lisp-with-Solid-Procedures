# 帮你精通Emacs：召唤神龙 interactive交互函数

工作很无聊，生活亦复如是；学编程枯燥，学 elisp 燥上加燥，然而“想象力”是一切的解药。当你身疲意懒之时，深呼吸，按键 M-x 召唤我们的神龙。

我们在编辑器中写一条一条的函数，就如“张僧繇”于壁上画龙，函数内的 interactive 就是催动神龙从“静态”入“动态“的点睛一笔。画龙点上“interactive”之须臾，一条条“函数”，霎时雷电破壁，腾云穿天而去。

![帮你精通Emacs：召唤神龙 interactive交互函数](images/5c7c26fb9c5a4c1aab977b2e951b5cd0)



# 一、静态的字符串却表达动态的属性

交互函数的“点睛之笔”在于其内部的 interactive， 模板结构为：

```
(defun interactive-function (args)
  "documentation..."
  (interactive ...)
  body...)
```

再往下读 interactive 后面的字符串，确是一头雾水，比如:

```
(interactive "BAppend to buffer: \nr")
```

读手册 “21.2.2 Code Characters for interactive”，获悉 B 代表 buffer-name, 而尾部的 r 代表 region， 中间的 \n 是分隔符，换言之，这串描述字符的本质属性是 list：

```
> "BAppend to buffer: \nr".split('\n')
[ 'BAppend to buffer: ', 'r' ]
```

然而，文档中轻描淡写一句 B 代表 buffer-name； 

![帮你精通Emacs：召唤神龙 interactive交互函数](images/5ab4d46b0d25417399d2aafd64e3da0a)

B的含义描述

虽然得知其内涵，但无论是字幕 B 还是命名 buffer-name 都是静态的名词，怎么会有读取buffer，read-buffer 的含义呢？

再一探，才恍然大悟，原来 B 就是 动态的函数 read-buffer，上面的一串字符 "BAppend to buffer: \nr" 表达的具象含义是动态的函数组，扩展为：

```
(interactive
 (list (read-buffer
        "Append to buffer: "
        ....
       (region-beginning)
       (region-end)))
```

于是茅塞顿开，静态的字符 B 就是动态的函数 read-buffer, 而 r 则对应 (region-beginning) (region-end)。

回头看文档中对 code-character B的描述：

> \- 'B'
>
>  A buffer name. The buffer need not exist. By default, uses the name of a recently used buffer other than the current buffer. Completion,  Default, Prompt.

以静态的文字阐述静态的字符，却绝口不提加上一句 B 对应的是 read-buffer 函数，着实让人遗憾。

# 二、分类总结 code-character

填补文档的缺憾，以 Emacs 的操作对象分类，将 code 与 function 一一对应。

**一、文本对象**

文本对象包括：point, mark, region, varable, character, string，number，以及文本编辑的补全 completion:

![帮你精通Emacs：召唤神龙 interactive交互函数](images/c135ecb7b81b4093ae7a198d795ca88d)



**二、Buffer 与 File** 

包括 buffer mini-buffer file directory 等：

![帮你精通Emacs：召唤神龙 interactive交互函数](images/8e29351131834b989f2635713b39a5d8)



**三、命令**

没有对应操作 windows & Frame 的 code， 此处归类 Commands：

![帮你精通Emacs：召唤神龙 interactive交互函数](images/06276b67d5444e0cb1328917493d99f7)



**四、最高频的 prefix-numeric-value:**

同时也将 read-coding-system 归类到此处：

![帮你精通Emacs：召唤神龙 interactive交互函数](images/8e7ecc70be1a4d8990c428e4dac30028)



# 三、总结

![帮你精通Emacs：召唤神龙 interactive交互函数](images/641333828aee4f5a9cc4bf6a22bd57fb)



我们在编辑器中写的一条条函数就是挥毫作于画壁上的一条条神龙。
interactive 是画龙点睛的一笔，而 character-code 则是我们指挥若定，输入其“眼耳口”中的咒符。

![帮你精通Emacs：召唤神龙 interactive交互函数](images/b8284ebc694e49488a25d52560a03c74)

