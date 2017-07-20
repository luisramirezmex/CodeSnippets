#Code found at: https://stackoverflow.com/questions/17497667/how-to-copy-certain-files-w-o-folder-hierarchy-but-do-not-overwrite-existing
$srcdir = "C:\source\";
$destdir = "C:\destination\";
$files = (Get-ChildItem $srcdir -recurse -filter *.sql | where-object {-not ($_.PSIsContainer)});
$files|foreach($_){
    if (!([system.io.file]::Exists($destdir+$_.name))){
                cp $_.Fullname ($destdir+$_.name)
    };
}
