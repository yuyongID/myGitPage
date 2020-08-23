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
    Node := &ListNode{}
    cur, p1, p2 := Node, l1, l2
    for p1 != nil && p2 != nil {
        if p1.Val < p2.Val {
            cur.Next, p1 = p1, p1.Next
        } else {
            cur.Next, p2 = p2, p2.Next
        }
        cur = cur.Next
    }
    if p1 == nil {
        cur.Next = p2
    } else {
        cur.Next = p1
    }
    return Node.Next

}
```
{{< /expand>}}

{{< expand "反转链表" "...">}}
```go
/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
 // 容易记忆写法
func reverseList(head *ListNode) *ListNode {
    if head == nil || head.Next == nil {
        return head
    }
    var pre, cur, next *ListNode
    pre, cur, next = nil, head, nil
    for cur != nil {
        next = cur.Next
        cur.Next = pre
        pre = cur
        cur = next
    }
    return pre
}
 // 省事写法
func reverseList(head *ListNode) *ListNode {
    if nil == head || head.Next == nil {
        return head
    }
    cur, next := head, head.Next
    for ; nil != next; cur, next, next.Next = next, next.Next, cur {
    }
    head.Next = nil
    return cur
}
```
{{< /expand>}}

{{< expand "删除链表中的节点" "...">}}
```go
/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func deleteNode(node *ListNode) {
    node.Val, node.Next= node.Next.Val, node.Next.Next
}
```
{{< /expand>}}