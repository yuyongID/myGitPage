---
title: "二分查找 binary search"
---

## 二分查找 binary search
{{< expand "二分查找" "...">}}
```go
func search(nums []int, target int) int {
    left, right := 0, len(nums)-1
    for left <= right {
        mid := left + (right-left)/2
        if nums[mid] == target {
            return mid
        }
        if nums[mid] > target {
            right = mid - 1
            continue
        }
        left = mid + 1
    }
    return -1
}
```
{{< /expand>}}