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

// 迭代方式
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