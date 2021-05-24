#import "LevelOrderTraversal.h"
#import "Node.h"


int treeCounter = 0;

Node* arrayToTree(NSArray *tree, Node *root, int index)
{
  if(index < tree.count)
  {
      if([((NSNumber*)tree[index]) isKindOfClass:[NSNull class]]) return nil;
      
      Node *temp = [[Node alloc] initWithValue:tree[index]];
      root = temp;
      
      root.leftChild = arrayToTree(tree, root.leftChild, ++treeCounter);
      root.rightChild = arrayToTree(tree, root.rightChild, ++treeCounter);
  } 
    return root;
}


NSMutableArray *result;

NSMutableArray* treeToLevelOrderTraversal(NSMutableArray *array)
{
    
    NSMutableArray *nextLevel = [NSMutableArray array];
    NSMutableArray *currentLevel = [NSMutableArray array];
    
    for(Node *node in array)
    {
        if(node.leftChild)
        {
            [nextLevel addObject:node.leftChild];
        }
        if(node.rightChild)
        {
            [nextLevel addObject:node.rightChild];
        }
        [currentLevel addObject:node.value];
    }
    
    [result addObject: currentLevel];
    
    if (nextLevel.count != 0) {
        treeToLevelOrderTraversal(nextLevel);
    }
    
    return result;
}


NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    
    if(tree.count == 0) return @[];
    
    Node *root = arrayToTree(tree, [Node new], 0);
    treeCounter = 0;
    result = [NSMutableArray array];
    
    return root == nil ? @[]: treeToLevelOrderTraversal([NSMutableArray arrayWithObject:root]);
    
}
