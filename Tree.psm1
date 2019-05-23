# UTF8 with BOM
# http://gnuwin32.sourceforge.net/packages/tree.htm
# https://linux.die.net/man/1/tree
# Get-ChildItemTree D:\Mount\AppsBasic\Console\Powershell\Root -a -I .git

[String]$defaultColor = [ConsoleColor]::darkGray
[String]$leafColor = [ConsoleColor]::DarkGray
[String]$directoryColor = [ConsoleColor]::White
[String]$directoryBackground = [ConsoleColor]::DarkRed

$extensionTypes = @{
    picture = @([ConsoleColor]::Green, @(".png", ".gif", ".jpg"))
    archive = @([ConsoleColor]::Yellow, @(".7z", ".gz", ".rar", ".tar", ".zip"))
    dll = @([ConsoleColor]::Darkgreen, @(".dll", ".pdb"))
    text = @([ConsoleColor]::Cyan, @(".csv", ".lg", "markdown", ".rst", ".txt", ".md"))
    config = @([ConsoleColor]::DarkYellow, @(".cfg", ".config", ".conf", ".ini", ".gitignore", ".yml"))
    executable = @([ConsoleColor]::Blue, @(".exe", ".exe*", ".bat", ".cmd", ".py", ".pl", ".ps1",
                     ".psm1", ".vbs", ".rb", ".reg", ".fsx", ".js"))
}

$nameTypes = @{
    text = @([ConsoleColor]::DarkYellow, @("LICENSE"))
}

function Get-ChildItemTree {

    $tree = tree.exe -F @args
    $tree = $tree -Replace '`-', '└─' -Replace '\|-', '├─' -Replace '\|', '│' -Replace '-', '─'

    cprint yellow . print cr

    foreach ($line in $tree)
    {
        if (-Not ($line -match '(?<leaf>^.*?─\s)(?<filename>.*?$)')) { continue }

        $color = $defaultColor

        if ($matches.filename[-1] -eq '/')
        {
            cprint $matches.leaf $leafColor print ($matches.filename -Replace '/', '') `
            $directoryColor on $directoryBackground print cr
            continue
        }

        foreach ($filesGroup in $extensionTypes.values)
        {
            if ($filesGroup[1].contains([IO.Path]::GetExtension($matches.filename)))
            {
                $color = $filesGroup[0]; break
            }
        }

        foreach ($filesGroup in $nameTypes.values)
        {
            if ($filesGroup[1] -eq $matches.filename) { $color = $filesGroup[0]; break }
        }

        cprint $matches.leaf $leafColor print $matches.filename $color print cr
    }
}

set-alias tree Get-ChildItemTree

export-modulemember -function Get-ChildItemTree -alias tree
