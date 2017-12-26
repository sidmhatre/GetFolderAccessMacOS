# GetFolderAccessMacOS

If you want to provide your sandboxed app with persistent access to file system resources (File / Folder) in all state of the app and use this access to file system resources to perform read, write and execute operations on file or folder.


### Enabling User-Selected File Access
Xcode provides a pop-up menu, in the Summary tab of the target editor, with choices to enable read-only or read/write access to files and folders that the user explicitly selects. When you enable user-selected file access, you gain programmatic access to files and folders that the user opens using an NSOpenPanel object, and files the user saves using an NSSavePanel object.
```sh
<key>com.apple.security.files.user-selected.read-write</key>
<true/>
```

### Enabling Security-Scoped Bookmark and URL Access

If you want to provide your sandboxed app with persistent access to file system resources, you must enable security-scoped bookmark and URL access. Security-scoped bookmarks are available starting in macOS v10.7.3.
```sh
<key>com.apple.security.files.bookmarks.app-scope</key>
<true/>
```


To use this code you must first call NSOpenPanel so the user can select which folders to give you access to. The NSOpenPanel must be stored as a bookmark and saved to disk.

```sh
let selectedURL = openFolderSelection()
saveBookmarksData()
```


When you restart the application you must call
```sh
loadBookmarks()
```


then your app will have the same level of access as it did when the user selected the folder.

