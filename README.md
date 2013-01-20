CommoniOSTemplates
==================

A collection of templates used to create boilerplate iOS code

Why
---
Look, there are things you need to do in order to create proper view controllers in Cocoa.
These things include: 
1. Setting up your NSFetchedResultsController 
2. Implementing the very standard NSFetchedResultsController delegate methods
3. Setting up your NSPredicates 
4. Setting up your NSSortDescriptors
5. Creating the UITableViewDelegate and UITableViewDataSource methods
 
The aim of this project is to collect as many templates as possible that could speed up the
busy work so you can get to the fun stuff.

Assumptions
-----------
I should note at least the following assumptions:
1. You've already got your data model already set up
2. You already have UITableViewCells ready to use

How
---
First what you'll want to do is add these templates to your user templates. This should be as
easy as 

```
cd -p Library/Developer/Xcode/Templates/File\ Templates/
git clone git@github.com:rodericj/CommoniOSTemplates.git
```

Now, when you create a new file, you'll see a nice little template for an NSFetchedResultsController backed 
UITableViewController.
