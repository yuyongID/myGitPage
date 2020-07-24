---
title: "字符串 string"
---

## 字符串 string

{{< expand "罗马数字转整数" "...">}}
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

{{< expand "有效的括号" "...">}}

```go
func isValid(s string) bool {
    parMap := map[rune]rune {
        '(': '0',
        '{': '0',
        '[': '0',
        ')': '(',
        '}': '{',
        ']': '[',
    }
    parQueue := []rune{}
    for _, v := range s {
        if _, ok := parMap[v]; !ok {
            continue
        }
        if parMap[v] == '0' {
            parQueue = append(parQueue, v)
            continue
        }
        if len(parQueue) == 0 {return false}
        if parMap[v] != parQueue[len(parQueue)-1] {
            return false
        }
        parQueue = parQueue[:len(parQueue)-1]
    }
    if len(parQueue) > 0 {return false}
    return true
}
```

{{< /expand>}}

{{< expand "最长公共前缀" "...">}}

```go
func longestCommonPrefix(strs []string) string {
    if len(strs) == 0 {
        return ""
    }
    if len(strs) == 1 {
        return strs[0]
    }
    mid := len(strs)/2
    left := longestCommonPrefix(strs[:mid])
    right := longestCommonPrefix(strs[mid:])
    var length int
    if len(left) < len(right) {
        length = len(left)
    } else {
        length = len(right)
    }
    result := ""
    for i:=0;i<length;i++ {
        if left[i] != right[i] {
            break
        }
        result = result + string(left[i])
    }
    return result
}
```

{{< /expand>}}

{{< expand "二进制求和" "...">}}

```go
func addBinary(a string, b string) string {
    ans := ""
    carry := 0
    lenA, lenB := len(a), len(b)
    n := max(lenA, lenB)

    for i := 0; i < n; i++ {
        if i < lenA {
            carry += int(a[lenA-i-1] - '0')
        }
        if i < lenB {
            carry += int(b[lenB-i-1] - '0')
        }
        ans = strconv.Itoa(carry%2) + ans
        carry /= 2
    }
    if carry > 0 {
        ans = "1" + ans
    }
    return ans
}

func max(x, y int) int {
    if x > y {
        return x
    }
    return y
}
```

{{< /expand>}}