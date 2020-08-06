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
// 对齐末尾字符，同时字符“相加”，通过 carry 的值传递进位。每位的结果位 carry+a[i]+b[i]，留下的结果位为 %2 的结果，下一次的进位为 /2 的结果。
func addBinary(a string, b string) string {
     result, carry, n := "", 0, 0
     if len(a) > len(b) {
         n = len(a)
     } else {
         n = len(b)
     }
     for i:=0; i<n; i++ {
         if i < len(a) {
             carry = carry + int(a[len(a)-1-i] - '0')  // 当字符串中 a[len(a)-1-i] 为 "0" 时，之际操作游标取出的是 uint8=48 类型是 byte，直接 int 转换就会得到一个 int=48；当[-''0']之后，相当是 utf8 编码的两个 48 相减，获得的是 uint8=0，int 转换之后就会得到一个 int 类型的 0。如果该位为 "1"，由于正好比"0"多1个编码位，所以得到的就是 uint8=1，int 转换即可得到 1。
         }
         if i < len(b) {
             carry = carry + int(b[len(b)-1-i] - '0')
         }
         result = strconv.Itoa(carry%2) + result
         // result = fmt.Sprintf("%b%s", carry%2, result)
         carry = carry / 2
     }
     if carry > 0 {
         result = "1" + result
     }
     return result
}
```
{{< /expand>}}

{{< expand "字符串相加" "...">}}

```go
func addStrings(num1 string, num2 string) string {
    carry, n := 0, 0
    result := ""
    if len(num1) > len(num2) {
        n = len(num1)
    } else {
        n = len(num2)
    }
    for i:=0; i<n; i ++ {
        if i < len(num1) {
            carry = carry + int(num1[len(num1)-1-i] - '0')
        }
        if i < len(num2) {
            carry = carry + int(num2[len(num2)-1-i] - '0')
        }
        result = strconv.Itoa(carry%10) + result
        carry = carry / 10
    }
    if carry>0 {
        result = strconv.Itoa(carry) + result
    }
    return result
}
```

{{< /expand>}}

{{< expand "验证回文串" "...">}}
```go
func isPalindrome(s string) bool {
    left, right := 0, len(s)-1
    for left <= right {
        for left < right && !isalnum(s[left]) {
            left = left + 1
        }
        for left < right && !isalnum(s[right]) {
            right = right - 1
        }
        if strings.ToLower(string(s[left])) != strings.ToLower(string(s[right])) {
            return false
        }
        left, right = left+1, right-1
    }
    return true
}

func isalnum(ch byte) bool {
    return (ch >= 'A' && ch <= 'Z') || (ch >= 'a' && ch <= 'z') || (ch >= '0' && ch <= '9')
}
```
{{< /expand>}}

{{< expand "无重复字符的最长子串" "...">}}

```go
// 双游标配合 map[字母]index 组成的滑动窗口
func lengthOfLongestSubstring(s string) int {
    result, sMap := 0, map[byte]int{}
    for left, right:=0, 0; right<len(s); right++ {
        if v, ok := sMap[s[right]]; ok {
            left = max(left, v) // 左指针只在最大的一方 "abba"
        }
        result = max(result, right-left+1)
        sMap[s[right]] = right + 1 
    }
    return result
}
func max(a, b int) int {
    if a > b {
        return a
    }
    return b
}
```

{{< /expand>}}

{{< expand "括号生成" "...">}}

```go
func generateParenthesis(n int) []string {
    result := new([]string)
    backtrack("", n, n, result)
    return *result
}

func backtrack(path string, left, right int, result *[]string) {
    if left == 0 && right == 0 {
        *result = append(*result, path)
        return
    }
    if left > 0 {
        backtrack(path+"(", left-1, right, result)
    }
    if right > left {
        backtrack(path+")", left, right-1, result)
    }
}
```

{{< /expand>}}

{{< expand "最长回文串" "...">}}

```go
func longestPalindrome(s string) int {
    sMap := map[byte]int{}
    for i:=0; i<len(s); i++ {
        if v, ok := sMap[s[i]]; ok {
            sMap[s[i]] = v + 1
        } else {
            sMap[s[i]] = 1
        }
    }
    result, less := 0, 0
    for _, v := range sMap {
        mod := v % 2
        result = result + v - mod
        less = less + mod
    }
    //fmt.Print(sMap, result, less)
    if less >0 {
        return result+1
    }
    return result

}
```
{{< /expand>}}

{{< expand "Z 字形变换" "...">}}

```go
func convert(s string, numRows int) string {
    if numRows <= 1 {return s}
    listS := make([]string, numRows)
    i, flag := 0, -1
    for _, v := range s {
        listS[i] = listS[i] + string(v)
        if i == numRows-1 || i == 0 {
            flag = -flag
        }
        i = i + flag
    }
    resutl := ""
    for _, v := range listS {
        resutl = resutl + v
    }
    return resutl
}
```
{{< /expand>}}
{{< expand "电话号码的字母组合" "...">}}
```go
func letterCombinations(digits string) []string {
    if len(digits) <= 0 {return nil}
    digitsMap := map[byte][]string{
        '2': []string{"a", "b", "c"},
        '3': []string{"d", "e", "f"},
        '4': []string{"g", "h", "i"},
        '5': []string{"j", "k", "l"},
        '6': []string{"m", "n", "o"},
        '7': []string{"p", "q", "r", "s"},
        '8': []string{"t", "u", "v"},
        '9': []string{"w", "x", "y", "z"},
    }
    path := ""
    result := []string{}
    backtrack(path, digits, &result, digitsMap)
    return result
}

func backtrack(path, digits string, result *[]string, digitsMap map[byte][]string) {
    if len(path) == len(digits) {
        *result = append(*result, path)
        return
    }
    i := len(path)
    for _, v := range digitsMap[digits[i]] {
        backtrack(path+v, digits, result, digitsMap)
    }
}
```
{{< /expand>}}