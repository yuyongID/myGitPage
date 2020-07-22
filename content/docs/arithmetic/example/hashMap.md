---
title: "哈希表 hash map"

---

## 哈希表 hash map

{{< expand "宝石与石头" "...">}}

```go
func numJewelsInStones(J string, S string) int {
    jewels := make(map[string]struct{})
    result := 0
    for i:=0;i<len(J);i++{
        jewels[string(J[i])] = struct{}{}
    }
    for i:=0;i<len(S);i++{
        if _, ok := jewels[string(S[i])];ok {
            result = result + 1
        }
    }
    return result
}
```

{{< /expand>}}

{{< expand "岛屿的周长" "...">}}

```go
// 强行遍历所有节点的四周，判断四周格子的类型来计算是否周长+1
func islandPerimeter(grid [][]int) int {
    perimeter := 0
    for i:=0;i<len(grid);i++{
        sum := 0
        for j:=0;j<len(grid[0]);j++{
            if grid[i][j] == 0{
                continue
            }
            if j-1<0 || grid[i][j-1] == 0 {sum++}
            if i-1<0 || grid[i-1][j] == 0 {sum++}
            if j+1>=len(grid[0]) || grid[i][j+1] == 0 {sum++}
            if i+1>=len(grid) || grid[i+1][j] == 0 {sum++}
        }
        perimeter = perimeter + sum
    }
    return perimeter
}
// DFS 递归遍历岛屿的格子，通过判断是否下一次进入的格子的类型和是否已经遍历过，来返回计入周长的边长是1还是0
func islandPerimeter(grid [][]int) int {
    for r:=0;r<len(grid);r++{
        for c:=0;c<len(grid[0]);c++{
            if grid[r][c] == 1 {
                return dfs(grid, r, c)
            }
        }
    }
    return 0
}
func dfs(grid [][]int, r int, c int) int {
    if !(0 <= r && r < len(grid) && 0 <= c && c < len(grid[0])) {
        return 1
    }
    if grid[r][c] == 0 {
        return 1
    }
    if grid[r][c] == 2 {
        return 0
    }
    grid[r][c] = 2
    return dfs(grid, r+1, c) + dfs(grid, r, c+1) + dfs(grid, r-1, c) + dfs(grid, r, c-1)
}
```

{{< /expand>}}

{{< expand "两个数组的交集" "...">}}

```go
func intersection(nums1 []int, nums2 []int) []int {
    result := []int{}
    setMap := make(map[int]bool)
    for _, v := range nums1 {
        setMap[v] = false
    }
    for _, v := range nums2 {
        if sight, exist := setMap[v]; !sight && exist {
            setMap[v] = true
            result = append(result, v)
        }
    }
    return result
}
```
{{< /expand>}}