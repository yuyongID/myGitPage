---
title: "数学 mathematics"

---

## 数学 mathematics

{{< expand "整数反转" "...">}}
```go
func reverse(x int) int {
    y := 0
    for x != 0 {
        y = y*10 + x%10
        x = x/10
    }
    if y < -(1<<31) || y > (1<<31)-1 {
        return 0
    }
    return y
}
```
{{< /expand>}}