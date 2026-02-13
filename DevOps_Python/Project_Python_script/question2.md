✅ Hard Link

A hard link is another name for the same file.
It points to the same inode, so both files share the same data.

Same inode number

If one file is deleted, the other still works

Cannot cross file systems

Cannot link directories (normally)

✅ Soft Link (Symbolic Link)

A soft link is like a shortcut.
It points to the file path, not the actual data.

Different inode

If original file is deleted, link becomes broken

Can cross file systems

Can link directories

🔥 One-Line Difference (Best Interview Line)

A hard link points to the same inode (same data), while a soft link points to the file path (like a shortcut).