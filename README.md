# Pre-work - PowerTipCalculator

PowerTipCalculator is a tip calculator application for iOS.

Submitted by: Dmytro Tykhyi

Time spent: **15** hours spent in total

## User Stories

The following **required** functionality is complete:

* ✅ User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* ✅ Settings page to change the default tip percentage.

The following **optional** features are implemented:
* ✅ UI animations
* [ ] Remembering the bill amount across app restarts (if <10mins)
* ✅ Using locale-specific currency and currency thousands separators.
* ✅ Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- ✅ Implemented verification for the UITextField as follows:
  - User can input only one period for the floating point number
  - User can input only two digits after a floating point
- ✅ Implemented Layout

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

PowerTipCalculator Walkthrough & UI Animation Showcase

<img src='http://i.imgur.com/bXfN4H8.gif' title='PowerTipCalculator Walkthrough' width='300' alt='PowerTipCalculator Walkthrough' />
<img src='http://i.imgur.com/l9mmn8T.gif' title='Animation Showcase' width='300' alt='Animation Showcase' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Project Analysis

As part of your pre-work submission, please reflect on the app and answer the following questions below:

**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")

**Answer:** I like to use the iOS applications, they are perfectly designed in my opinion. With Apple's development kit and XCode, it's pretty easy to jump into the development. Thus, I like to improve my skills and write neat applications. The outlet is the variable that references to the object created on the storyboard. Using the outlets we can have access to the properties of the objects on the storyboard. The action is the link to the implementation when some object's 'event has appeared. 

Question 2: "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures? (There's a section explaining this concept in the link, how would you summarize as simply as possible?)"

**Answer:** If we create two strong references to the object in the closure, it will lead to the memory leak due to the fact that object will never be deallocated even if it's not used anymore. 


## License

  Copyright 2017 Dmytro Tykhyi

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
