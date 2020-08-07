---
title: "位运算 bit operation"
---

## 位运算 bit operation

{{< expand "IP 到 CIDR" "...">}}

```python
#!/usr/bin/env python
# -*- coding: utf-8 -*-

def ipToCIDR(ip, range):
    """
    :type ip: str
    :type range: int
    :rtype: List[str]
    """
    ipInt = ipToInt(ip)
    ans = []
    x = 0
    while x < range:
        zeros = countZeros(ipInt + x)
        while x + (1<<zeros) > range:
            zeros -= 1
        ans.append(intToIp(ipInt + x) + "/" + str(32 - zeros))
        x += 1<<zeros
    return ans

def ipToInt(ip):
    ans = 0
    for idx, part in enumerate(ip.split('.')[::-1]):
        ans += int(part) << idx * 8
    return ans

def intToIp(ipInt):
    ans = []
    for x in xrange(4):
        ans.append((ipInt >> x * 8) & 255)
    return '.'.join(map(str, ans[::-1]))

def countZeros(ip):
    cnt = 0
    while ip:
        if ip & 1: break
        cnt += 1
        ip >>= 1
    return cnt

if __name__ == '__main__':
    print(ipToCIDR("255.0.0.7", 11))

```

{{< /expand>}}

{{< expand "只出现一次的数字" "...">}}

答案是使用位运算。对于这道题，可使用异或运算 ⊕。

```go
func singleNumber(nums []int) int {
    single := 0
    for _, num := range nums {
        single ^= num
    }
    return single
}
```

{{< /expand>}}

{{< expand "汉明距离" "...">}}
```go
// 标准库方法
func hammingDistance(x int, y int) int {
    return bits.OnesCount(uint(x) ^ uint(y))
}
// 通过位移计算异或结果的1的个数
func hammingDistance(x int, y int) int {
    distance := 0
    xor := x^y
    for xor>0 {
        if xor&1 == 1 {
            distance = distance + 1
        }
        xor = xor>>1
    }
    return distance
}
// 布赖恩·克尼根算法
// 当我们在 number 和 number-1 上做 AND 位运算时，原数字 number 的最右边等于 1 的比特会被移除。
func hammingDistance(x int, y int) int {
    distance := 0
    xor := x^y
    for xor>0 {
        distance = distance + 1
        xor = xor & (xor-1)
    }
    return distance
}
```
{{< /expand>}}

{{< expand "二进制手表" "...">}}

```go
// 暴力解法，直接遍历所有合法的时间组合，计算“1”的个数的和是否与输出 num 相等
func readBinaryWatch(num int) []string {
    ret := make([]string,0)
    for i:=0;i<12;i++{
        for j:=0;j<=59;j++{
            if bitNums(i)+bitNums(j) == num {
                ret  =append(ret,fmt.Sprintf("%d:%02d",i,j))
            }
        }
    }
    return ret
}

func bitNums(i int) int{
    num :=0
    for i>0{
        if i%2==1{
            num++
        }
        i=i>>1
    }
    return num
}
```

{{< /expand>}}