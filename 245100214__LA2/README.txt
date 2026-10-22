Apple Pie — Guided Project implementation
==========================================

Includes Parts One through Five and the wrap-up behavior shown in the supplied textbook pages:
- UIKit storyboard layout for iPad with tree image, QWERTY keyboard (10/9/7), revealed-word label, and score label.
- Tree 0 through Tree 7 vector PDF assets in Assets.xcassets.
- Game.swift stores the word, remaining incorrect moves, guessed letters, and computes formattedWord.
- ViewController.swift extracts each tapped button title, lowercases it, updates the Game, reveals the word with spaces, updates the tree image and score, handles wins/losses, starts the next round, re-enables buttons, and disables buttons when the word list is exhausted.
- Word list: buccaneer, swift, glorious, incandescent, bug, program.

The tree illustrations are locally created vector approximations in the same style as the book's examples; the original publisher resource PDFs were not included with the uploaded photos.
Open ApplePie.xcodeproj in Xcode on a Mac. The project has not been compiled in Xcode in this environment.

Project file repair:
- Rebuilt project.pbxproj file references/build phases so Main.storyboard, Swift files, and assets are included in the target.
- Centered the keyboard rows in the vertical stack to avoid row-width constraint conflicts.

Project Navigator cleanup:
- Removed the visible Frameworks and Products groups. The navigator focuses on the ApplePie app files only.

Crash-safety repair (2026-10-22):
- Replaced hand-written storyboard object IDs with unique Interface Builder-style IDs in Main.storyboard and LaunchScreen.storyboard; updated all references, constraints, outlets, and actions consistently.
- Restored the required Products PBXGroup referenced by the Xcode project while keeping it out of the visible Project Navigator.
- Validated storyboard XML, uniqueness of object IDs, internal scene/constraint/outlet references, and project group references. This environment cannot launch Xcode or an iPad simulator, so an actual macOS build remains to be confirmed.
