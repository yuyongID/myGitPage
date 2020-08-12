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
    return nums1
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

{{< expand "搜索旋转排序数组" "...">}}
```go
func search(nums []int, target int) int {
	left := 0
	right := len(nums) - 1

	for left <= right {
		mid := (left + right) / 2
		if nums[mid] == target {
			return mid
		}
		// 判断是否在前半部分查找
		if (nums[left] <= target && target <= nums[mid]) || (nums[mid] <= nums[right] && (target < nums[mid] || target > nums[right]))  {
			right = mid - 1
		} else {
			left = mid + 1
		}
	}
	return -1
}
```
{{< /expand>}}
{{< expand "二维数组中的查找" "...">}}

```go
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

{{< expand "快速排序" "...">}}

```go
func sortArray(nums []int) []int {
    if len(nums) < 2 {
        return nums
    }
    lessList, greatList := []int{}, []int{}
    for _, v := range nums[1:] {
        if v < nums[0] {
            lessList = append(lessList, v)
            continue
        }
        greatList = append(greatList, v)
    }
    result := append([]int{}, sortArray(lessList)...)
    result = append(result, nums[0])
    result = append(result, sortArray(greatList)...)
    return result
}
```

```go
// 冒泡排序
func sortArray(nums []int) []int {
    if len(nums) < 2 {
        return nums
    }
    for i:=0; i<len(nums); i++ {
        for j:=0; j<len(nums)-i; j++ {
            if nums[j] > nums[j+1] {
                nums[j], nums[j+1] = nums[j+1], nums[j]
            }
        }
    }
    return nums
}
```

{{< /expand>}}

{{< expand "三数之和" "...">}}

```go

func threeSum(nums []int) [][]int {
    n := len(nums)
    sort.Ints(nums)  // 先排序
    result := [][]int{}
    for i:=0; i<n; i++ {
        if i > 0 && nums[i] == nums[i-1] {  //固定位位游标去重
            continue
        }
        right := n-1
        for left:=i+1; left<n; left++ {  //迭代移动左游标，不停右移增加
            if left>i+1 && nums[left] == nums[left-1]{  //大于初始值的左游标去重
                continue
            }
            for left<right && nums[i]+nums[left]+nums[right]>0 {  //左右游标不能交叉
                right = right - 1  //三值和大于0，右游标不停往左移，值越来越少
            }
            if left == right {break}  //游标相遇，直接退出迭代
            if nums[i]+nums[left]+nums[right] == 0 {
                result = append(result, []int{nums[i], nums[left], nums[right]})
            }
        }
    }
    return result
}
```

{{< /expand>}}

{{< expand "岛屿的最大面积" "...">}}

```go
func maxAreaOfIsland(grid [][]int) int {
    result := 0
    for r:=0; r<len(grid); r++ {
        for c:=0; c<len(grid[0]); c++ {
            if grid[r][c] == 1 {
                value := helper(r, c, grid)
                if result < value {
                    result = value
                }
            }
        }
    }
    return result    
}

func helper(r, c int, grid [][]int) int {
    if r < 0 || r > len(grid) - 1 || c < 0 || c > len(grid[0]) - 1 {
        return 0
    }
    if grid[r][c] == 0 || grid[r][c] == 2 {
        return 0
    }
    grid[r][c] = 2
    return 1 + helper(r+1, c, grid) + helper(r-1, c, grid) + helper(r, c+1, grid) + helper(r, c-1, grid)
}
```

{{< /expand>}}

{{< expand "最长连续递增序列" "...">}}

```go
func findLengthOfLCIS(nums []int) int {
    if len(nums) <= 1 {
        return len(nums)
    }
    result, tmp := 1, 1
    for i:=0; i<len(nums)-1; i++ {
        if nums[i] < nums[i+1] {
            tmp = tmp + 1
        } else {
            tmp = 1
        }
        if tmp > result {
            result = tmp
        }   
    }
    return result
}
```

{{< /expand>}}
{{< expand "数组中的第k个最大元素" "...">}}
```go
// 快速选择算法
func findKthLargest(nums []int, k int) int {
    rand.Seed(time.Now().UnixNano())
    left, right := 0, len(nums)-1
    target := len(nums) - k
    cur := -1
    for cur != target {
        cur = partition(left, right, nums, target)
        if cur < target {
            left = cur + 1
        } else if cur > target {
            right = cur - 1
        }
    }
    return nums[cur]
}

func partition(left, right int, nums []int, target int) int{
    if left == right {
        return left
    }
    i := rand.Int() % (right - left + 1) + left
    n := nums[i]
    nums[i], nums[right] = nums[right], nums[i]
    l , r := left, right-1
    for l < r {
        for l < r && nums[l] <= n {
            l = l + 1
        }
        for l < r && n < nums[r] {
            r = r - 1
        }
        if l != r {
            nums[l], nums[r] = nums[r], nums[l]
        }
    }
    if nums[l] > n {
        nums[l], nums[right] = nums[right], nums[l]
        return l
    }
    return right
}
```
{{< /expand>}}

{{< expand "全排列" "...">}}

```go
func permute(nums []int) [][]int {
    result := [][]int{}
    path := []int{}
    used := make([]bool, len(nums))
    backtrack(path, nums, used, &result)
    return result
}

func backtrack(path, nums []int, used []bool, result *[][]int) {
    if len(path) == len(nums) {
        tmp := make([]int, len(path))
        copy(tmp, path)
        *result = append(*result, tmp)
        return
    }
    for i:=0; i<len(nums); i++ {
        if !used[i] {
            used[i] = true
            path = append(path, nums[i])
            backtrack(path, nums, used, result)
            path = path[:len(path)-1]
            used[i] = false
        }
    }
}
```

{{< /expand>}}
{{< expand "乘最多水的容器" "...">}}
```go
func maxArea(height []int) int {
    result, i, j := 0, 0, len(height)-1
    for i != j {
        area := (j-i) * min(height[i], height[j])
        if area > result {
            result = area
        }
        if height[i] < height[j] {
            i = i + 1
            continue
        }
        j = j - 1
    }
    return result
}

func min(i, j int) int {
    if i < j {return i}
    return j
}
```
{{< /expand>}}
{{< expand "最大子序和" "...">}}

```go
// 动态规划
func maxSubArray(nums []int) int {
    max := nums[0]
    for i:=1; i<len(nums); i++ {
        if nums[i-1] + nums[i] > nums[i] {
            nums[i] = nums[i-1] + nums[i]  // 通过对比，将当前 index 的最优解放到数组里，以方便下个迭代 index 对比调用。
        }
        if nums[i] > max {
            max = nums[i]
        }
    }
    return max
}
```
{{< /expand>}}

{{< expand "乘积最大子数组" "...">}}

```go
// 未考虑空间复杂度的动态规划
func maxProduct(nums []int) int {
    length := len(nums)
    if length == 0 {
        return 0
    }
    iMax, iMin := make([]int, length), make([]int, length)
    iMax[0], iMin[0] = nums[0], nums[0]
    for i:=1; i<length; i++ {
        if nums[i] >= 0 {
            iMin[i] = min(nums[i], nums[i]*iMin[i-1])
            iMax[i] = max(nums[i], nums[i]*iMax[i-1])
        } else {
            iMin[i] = min(nums[i], nums[i]*iMax[i-1])
            iMax[i] = max(nums[i], nums[i]*iMin[i-1])
        }
    }
    result := iMax[0]
    for i:=1; i<length; i++ {
        result = max(result, iMax[i])
    }
    return result
}
// 表格复用的动态规划
func maxProduct(nums []int) int {
    length := len(nums)
    if length == 0 {
        return 0
    }
    preMax, preMin, result := nums[0], nums[0], nums[0]
    var curMax, curMin int
    for i:=1; i<length; i++ {
        if nums[i] >= 0 {
            curMin = min(nums[i], nums[i]*preMin)
            curMax = max(nums[i], nums[i]*preMax)
        } else {
            curMin = min(nums[i], nums[i]*preMax)
            curMax = max(nums[i], nums[i]*preMin)
        }
        result = max(result, curMax)
        preMin, preMax = curMin, curMax
    }
    return result
}

func max(x, y int) int {
    if x >= y {
        return x
    }
    return y
}

func min(x,y int) int {
    if x <= y {
        return x
    }
    return y
}
```

{{< /expand>}}