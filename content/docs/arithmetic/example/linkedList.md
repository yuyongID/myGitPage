---
title: "链表 linked list"
---

## 链表 linked list

{{< expand "合并两个有序列表" "...">}}
```go
/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func mergeTwoLists(l1 *ListNode, l2 *ListNode) *ListNode {
    result := &ListNode{}
    preHead := result
    for (l1 != nil && l2 != nil){
        if l1.Val < l2.Val {
            preHead.Next = l1
            l1 = l1.Next
        } else {
            preHead.Next = l2
            l2 = l2.Next
        }
        preHead = preHead.Next
    }
    if l1 == nil{
        preHead.Next = l2
    }
    if l2 == nil {
        preHead.Next = l1
    }
    return result.Next
}
```
{{< /expand>}}

