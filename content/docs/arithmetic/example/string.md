---
title: "字符串 string"

---

## 字符串 string

{{< expand "整数反转" "...">}}
直接使用 hash map 作为索引会比较省事
```go
func romanToInt(s string) int {
    tranMap := map[string]int {
        "I": 1,
        "V": 5,
        "X": 10,
        "L": 50,
        "C": 100,
        "D": 500,
        "M": 1000,
        "IV": 4,
        "IX": 9,
        "XL": 40,
        "XC": 90,
        "CD": 400,
        "CM": 900,
    }
    sList := strings.Split(s, "")
    result := 0
    for i:=0;i<len(sList);i++ {
        if i == len(sList) -1 {
            result = result + tranMap[sList[i]]
            continue
        }
        if v, ok := tranMap[sList[i]+sList[i+1]];ok{
            result = result + v
            i = i + 1
            continue
        }        
        result = result + tranMap[sList[i]]
    }
    return result
}
```
{{< /expand>}}