Const ForReading = 1
Const ForWriting = 2

strFileName = Wscript.Arguments(0)
strOldText = Wscript.Arguments(1)
strNewText = Wscript.Arguments(2)

Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.OpenTextFile(strFileName, ForReading)

strText = objFile.ReadAll
objFile.Close
strNewText = Replace(strText, strOldText, strNewText)
strNewText = Replace(strNewText, "'", "#1#")
strNewText = Replace(strNewText, "`", "#2#")
strNewText = Replace(strNewText, "<script>", "!script-start!")
strNewText = Replace(strNewText, "</script>", "!script-end!")
strNewText = Replace(strNewText, "{", "")
strNewText = Replace(strNewText, "}", "")

Set objFile = objFSO.OpenTextFile(strFileName, ForWriting)
objFile.Write strNewText
objFile.Close