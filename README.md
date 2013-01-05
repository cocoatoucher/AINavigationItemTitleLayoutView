#AINavigationItemTitleLayoutView

By subclassing AINavigationItemTitleLayoutView and setting it to your view controller navigationItem's titleView you can correctly do layout for its subviews. 
This way you don't have to write your custom UINavigationBar

#Requirements

Classes in this project supports both ARC and non-ARC projects

#Installation

Add the AINavigationItemTitleLayoutView folder to your project

#How to use it?

##Subclassing AINavigationItemTitleLayoutView

    //interface for your subclass
    #import "AINavigationItemTitleLayoutView.h"
    
    @interface CustomNavigationItemTitleView : AINavigationItemTitleLayoutView
    
    ...
    //implementation
    #import "AINavigationItemTitleLayoutView_Protected.h"
    
    @implementation AISampleNavItemLayoutView
    
    //override this method to apply predefined or custom layout methods to your subviews
    - (void)layoutTitleViews {
    
        //this horizontally centers subview1 to UINavigationBar or self depending on the given maxWidth
        [super layoutView:self.subview1 forMaxWidth:aMaxSubviewWidth];
        
        //this horizontally centers subview1 to UINavigationBar without changing the subview width
        [super layoutViewToCenter:self.subview2];
    }
    
![Screenshot](http://f.cl.ly/items/071h2K3G1o1a1p171p2k/Screen%20Shot%202013-01-04%20at%205.46.50%20PM.png)
