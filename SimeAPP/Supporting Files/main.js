require('UIView,UIColor,UIFont,UIButton,NSString,UIImageView');
defineClass('SMHomeViewController', {
            viewDidLoad: function() {
            self.super().viewDidLoad();

            //添加新类
            // Class cls = objc_allocateClassPair(superCls, "JPObject", 0);
            // objc_registerClassPair(cls);
            

            var backView = UIView.alloc().init();
            backView.setf
            backView.setFrame({x:120, y:120, width:200, height:200});
            backView.setBackgroundColor(UIColor.brownColor());
            self.view().addSubview(backView);
            
//            self.createView(UIColor.brownColor());
            var showButton = UIButton.alloc().init();
            showButton.setFrame({x:0, y:0, width:100, height:100});
            showButton.setTitle_forState("点击显示", 0);
            showButton.setBackgroundColor(UIColor.blueColor());
            showButton.setFont(UIFont.systemFontOfSize(12));
            backView.addSubview(showButton);
//            showButton.addTarget_action_forControlEvents(self, "actionWithShow", 1<<6);
            },
            
//            createView: function(color) {
//            backView().setBackgroundColor(UIColor.redColor());
//            
//            },
});