# study-masm
课程实验代码，因为是刚学的时候写的代码，写的很垃圾，懒得改了，就作为记忆留存吧。

## 1.软件安装

1. dosbox
2. masm.exe、link.exe、debug.exe
3. sublime

### 1.配置编译菜单(sublime)

- tools -> build system -> new build system
- 输入以下代码并保存文件名为 Assembly.sublime-build
- 文件在路径 C:\Users\heartape\AppData\Roaming\Sublime Text 3\Packages\User

```json
{
    "cmd": ["\"选择其他编译选项\""],
    "file_regex": "^[ ]*File \"(...*?)\", line ([0-9]*)",
    "selector": "source.asm",
    "encoding":"cp936",
    "variants":  
     [   
          {
                "name": "build", 
                "cmd": ["D:\\MASM\\asm-build.bat", "$file_base_name"],
                "shell":true
          },
          {
                "name": "debug", 
                "cmd": ["D:\\MASM\\asm-debug.bat", "$file_base_name"],
                "shell":true
          },
          {
                "name": "run", 
                "cmd": ["D:\\MASM\\asm-run.bat", "$file_base_name"],
                "shell":true
          }
     ]  
}
```

### 2.编写编译脚本
```shell
@echo off
# build
D:\program\DOSBox-0.74\DOSBox.exe -c "masm %1;" -c "link %1;";
# debug
D:\program\DOSBox-0.74\DOSBox.exe -c "masm %1;" -c "link %1;" -c "debug %1.exe";
# run
D:\program\DOSBox-0.74\DOSBox.exe -c "masm %1;" -c "link %1;" -c "%1.exe";
```

## 2.实验
- 10-1
- 10-2
- 10-3
- 11
- 12
- 13
- 14
- 15
- 17

### 3.使用
tools -> build system -> Assembly
tools -> build with 即可开始编译了

## 3.参考

- 《汇编语言（第4版）》 王爽