---
bookFlatSection: true
title: "go 语言一些笔记"
---



# 一些笔记

```go
1<<31  // 2的31次方
```

### map 的空值
```go
a := make(map[int]bool)
fmt.Println(a[0])  // false
b := make(map[int]int)
fmt.Println(b[0])  // 0
c := make(map[int]string)
fmt.Println(c[0])  // "" 空字符串
```

### string 字符串迭代

- 使用 `for`+`i` 迭代字符串时，获取元素类型是 `byte`
- 使用 `for` + `range` 迭代字符串时，获取元素类型是 `rune` 

### 转化为二进制字符串
```go
s := fmt.Sprintf("%b", C)
```

### make 与 new

**new**： 返回的永远是指针，指向分配类型的地址。同时把分配的内存置零；

**make**：返回 chan，map，slice，本身。这三种类型是饮用类型，没有必要返回指针；make(type, len, cap)，初始化一个 type 类型的，其中前 len 个元素都赋零值，最长长度为 cap。

