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

答案是使用位运算。对于这道题，可使用异或运算 ⊕。异或运算有以下三个性质。

- 任何数和 0 做异或运算，结果仍然是原来的数，即 a⊕0=a。
- 任何数和其自身做异或运算，结果是 0，即 a⊕a=0。
- 异或运算满足交换律和结合律，即 a⊕b⊕a=b⊕a⊕a=b⊕(a⊕a)=b⊕0=b。

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

