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

