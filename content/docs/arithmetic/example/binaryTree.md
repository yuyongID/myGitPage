---
title: "二叉树 binary tree"
---

## 二叉树 binary tree

{{< expand "反转二叉树" "...">}}

```go
/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func invertTree(root *TreeNode) *TreeNode {
    if root == nil {
        return nil
    }
    root.Right, root.Left = invertTree(root.Left), invertTree(root.Right)
    return root
}
```

{{< /expand>}}

{{< expand "二叉树的最大深度" "...">}}

```go
/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
// 递归方式
func maxDepth(root *TreeNode) int {
    if root == nil {
        return 0
    }
    if root.Right == nil && root.Left == nil {
      return 1
    }
    leftDepth := maxDepth(root.Left)
    rightDepth := maxDepth(root.Right)
    if leftDepth > rightDepth {
        return 1+leftDepth
    }
    return 1+rightDepth
}

// BFS 迭代方式
func maxDepth(root *TreeNode) int {
    if root == nil {
        return 0
    }
    queue := []*TreeNode{root,}
    depth := 0
    for len(queue) > 0{
        size := len(queue)
        for i:=0;i<size;i++{
            node := queue[0]
            queue = queue[1:]
            if node.Left != nil {
                queue = append(queue, node.Left)
            }
            if node.Right != nil {
                queue = append(queue, node.Right)
            }
        }
        depth = depth+1
    }
    return depth
}
```

{{< /expand>}}

{{< expand "合并二叉树" "...">}}

```go
/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func mergeTrees(t1 *TreeNode, t2 *TreeNode) *TreeNode {
    if t1 == nil {
        return t2
    }
    if t2 == nil {
        return t1
    }
    var nodeLeft *TreeNode
    var nodeRight *TreeNode
    if t1.Left == nil && t1.Right == nil {
        nodeLeft = t2.Left
        nodeRight = t2.Right
    }
    if t2.Left == nil && t2.Right == nil {
        nodeLeft = t1.Left
        nodeRight = t1.Right
    }
    if nodeLeft == nil {
        nodeLeft = mergeTrees(t1.Left, t2.Left)
    }
    if nodeRight == nil {
        nodeRight = mergeTrees(t1.Right, t2.Right)
    }
    node := TreeNode{
        Val: t1.Val+t2.Val,
        Left: nodeLeft,
        Right: nodeRight,
    }
    return &node
}
```

{{< /expand>}}

{{< expand "二叉树层次遍历2" "...">}}

```go
/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func levelOrderBottom(root *TreeNode) [][]int {
    if root == nil {
        return nil
    }
    queue := []*TreeNode{root}
    result := [][]int{}
    for len(queue) > 0 {
        levelVal := []int{}
        size := len(queue)
        for i:=0;i<size;i++ {
            levelVal = append(levelVal, queue[i].Val)
            if queue[i].Left != nil {
                queue = append(queue, queue[i].Left)
            }
            if queue[i].Right != nil {
                queue = append(queue, queue[i].Right)
            }
        }
        queue = queue[size:]
        result = append([][]int{levelVal}, result...)
    }
    return result
}
```

{{< /expand>}}

{{< expand "将有序数组转化为高度平衡二叉搜索树" "...">}}

```go
func sortedArrayToBST(nums []int) *TreeNode {
    if len(nums) <=0 {
        return nil
    }
    if len(nums) == 1 {
        return &TreeNode{Val:nums[0]}
    }
    mid := len(nums)/2
    return &TreeNode{
        Val: nums[mid],
        Left: sortedArrayToBST(nums[:mid]),
        Right: sortedArrayToBST(nums[mid+1:]),
    }
}
```

{{< /expand>}}