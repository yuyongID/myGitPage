---
title: "数组 array"
---

## 数组 array

{{< expand "两数之和" "...">}}
```go
func twoSum(nums []int, target int) []int {
    result := map[int]int{}
    for i:=0;i<len(nums);i++{
	if k, exist := result[target-nums[i]];exist {
	    fmt.Println(k, i)
	    return []int{k, i}
	}
	result[nums[i]] = i
    }
    return nil
}
```
{{< /expand>}}


{{< expand "合并两个有序数组" "...">}}
1. 合并有序数列，不一定从小到大合并，也可以从大到小合并；
2. 第一个数组有空间余量，直接操作比创建新变量空间合适；
```go
func merge(nums1 []int, m int, nums2 []int, n int)  {
    p1 := m-1
    p2 := n-1
    p3 := m+n-1
    for ;p1>=0&&p2>=0;p3--{
        if nums1[p1] < nums2[p2] {
            nums1[p3] = nums2[p2]
            p2 = p2-1
            continue
        }
        nums1[p3] = nums1[p1]
        p1 = p1-1
    }
    for i:=0;i<p2+1;i++{
        nums1[i] = nums2[i]
    }

}
```
{{< /expand>}}