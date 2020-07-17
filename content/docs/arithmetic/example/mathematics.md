---
title: "数学 mathematics"

---

## 数学 mathematics

{{< expand "整数反转" "...">}

```
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



{{< expand "两数之和" "...">}}

```
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