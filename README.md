Answers to HW 2

Question: What issues prevent us from using storyboards in real projects?
Issues that can prevent the use of storyboards in real projects include difficulties in managing complex layouts, challenges with version control, and performance issues due to large storyboard files leading to merge conflicts and slower build times.

Question: What does the code on lines 25 and 29 do?
On line 25 we are telling the system not to automatically generate constraints based on the view's autoresizing mask.
Each UIView has an array of sub views, which defines the order of displaying on the screen. On line 29 we add title as a subview to our UIView to display it on the screen

Question: What is a safe area layout guide? 
A safe area layout guide is a way for iOS apps to see where you can place content on the screen without it being blocked by things like notches or status bars.

Question: What is [weak self] on line 23 and why it is important?
[weak self] creates a weak reference to self within the closure, preventing a strong reference cycle that could lead to memory leaks. This is important because if self is strongly retained by the closure, it may not be deallocated when expected, causing potential memory issues.

Question: What does clipsToBounds mean?
clipsToBounds is a property that restricts the drawing of a view's content to its bounds, meaning any subviews or content that extend beyond its edges will be hidden. 

Question: What is the valueChanged type? What is Void and what is Double?
var valueChanged: ((Double) -> Void)?
The type ((Double) -> Void)? means valueChanged is an optional closure that takes a Double as input and returns no value (Void). Here, Double represents the input value type (such as a slider's value), and Void indicates that the closure doesn’t return any result.
