---
title: "哈希表 hash map"

---

## 哈希表 hash map

{{< expand "宝石与石头" "...">}}

```go
func numJewelsInStones(J string, S string) int {
    jewels := make(map[string]struct{})
    result := 0
    for i:=0;i<len(J);i++{
        jewels[string(J[i])] = struct{}{}
    }
    for i:=0;i<len(S);i++{
        if _, ok := jewels[string(S[i])];ok {
            result = result + 1
        }
    }
    return result
}
```

{{< /expand>}}