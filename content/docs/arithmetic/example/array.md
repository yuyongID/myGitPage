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

{{< expand "两数之和 II - 输入有序数组" "...">}}

初始时两个指针分别指向第一个元素位置和最后一个元素的位置。每次计算两个指针指向的两个元素之和，并和目标值比较。如果两个元素之和等于目标值，则发现了唯一解。如果两个元素之和小于目标值，则将左侧指针右移一位。如果两个元素之和大于目标值，则将右侧指针左移一位。移动指针之后，重复上述操作，直到找到答案。

```go
func twoSum(numbers []int, target int) []int {
    low, high := 0, len(numbers) - 1
    for low < high {
        sum := numbers[low] + numbers[high]
        if sum == target {
            return []int{low + 1, high + 1}
        } else if sum < target {
            low++
        } else {
            high--
        }
    }
    return []int{-1, -1}
}
```

{{< /expand>}}

{{< expand "二维数组中的查找" "...">}}

```
func findNumberIn2DArray(matrix [][]int, target int) bool {
    if len(matrix) == 0 || len(matrix[0]) == 0 {
        return false
    }
    r, c := 0, len(matrix[0])-1
    for r<len(matrix) && c>=0 {
        if matrix[r][c] == target {
            return true
        }
        if matrix[r][c] > target {
            c = c - 1
            continue
        }
        if matrix[r][c] < target {
            r = r + 1
            continue
        }
    }
    return false
}
```

{{< /expand>}}